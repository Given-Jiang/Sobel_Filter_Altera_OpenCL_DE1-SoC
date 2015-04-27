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

-- VHDL created from fp_sqrt_double_s5
-- VHDL created on Tue Apr  9 15:17:30 2013


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

entity fp_sqrt_double_s5 is
    port (
        a : in std_logic_vector(63 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(63 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_sqrt_double_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid9_fpSqrtTest_q : std_logic_vector (10 downto 0);
    signal cstAllZWF_uid10_fpSqrtTest_q : std_logic_vector (51 downto 0);
    signal cstAllZWE_uid11_fpSqrtTest_q : std_logic_vector (10 downto 0);
    signal sBias_uid25_fpSqrtTest_q : std_logic_vector (10 downto 0);
    signal sBiasM1_uid28_fpSqrtTest_q : std_logic_vector (10 downto 0);
    signal expRMux_uid33_fpSqrtTest_s : std_logic_vector (0 downto 0);
    signal expRMux_uid33_fpSqrtTest_q : std_logic_vector (10 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_q_i : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal minReg_uid42_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal minReg_uid42_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal minReg_uid42_fpSqrtTest_q_i : std_logic_vector(0 downto 0);
    signal minReg_uid42_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_q_i : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracSel_uid47_fpSqrtTest_q : std_logic_vector(1 downto 0);
    signal fracNaN_uid52_fpSqrtTest_q : std_logic_vector (51 downto 0);
    signal negZero_uid56_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal negZero_uid56_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal negZero_uid56_fpSqrtTest_q_i : std_logic_vector(0 downto 0);
    signal negZero_uid56_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal rndBit_uid93_sqrtPolynomialEvaluator_q : std_logic_vector (1 downto 0);
    signal prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_a : std_logic_vector (16 downto 0);
    signal prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_b : std_logic_vector (16 downto 0);
    signal prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_s1 : std_logic_vector (33 downto 0);
    signal prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_pr : SIGNED (34 downto 0);
    signal prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_q : std_logic_vector (33 downto 0);
    signal prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a : std_logic_vector (23 downto 0);
    signal prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_b : std_logic_vector (25 downto 0);
    signal prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_s1 : std_logic_vector (49 downto 0);
    signal prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_pr : SIGNED (50 downto 0);
    signal prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_q : std_logic_vector (49 downto 0);
    signal prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_a : std_logic_vector (32 downto 0);
    signal prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_b : std_logic_vector (34 downto 0);
    signal prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_s1 : std_logic_vector (67 downto 0);
    signal prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_pr : SIGNED (68 downto 0);
    signal prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_q : std_logic_vector (67 downto 0);
    signal topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_a : std_logic_vector (26 downto 0);
    signal topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (26 downto 0);
    signal topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_pr : SIGNED (54 downto 0);
    signal topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_q : std_logic_vector (53 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_ia : std_logic_vector (39 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_iq : std_logic_vector (39 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_q : std_logic_vector (39 downto 0);
    signal memoryC0_uid60_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid60_sqrtTableGenerator_lutmem_ia : std_logic_vector (16 downto 0);
    signal memoryC0_uid60_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid60_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid60_sqrtTableGenerator_lutmem_iq : std_logic_vector (16 downto 0);
    signal memoryC0_uid60_sqrtTableGenerator_lutmem_q : std_logic_vector (16 downto 0);
    signal memoryC1_uid62_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid62_sqrtTableGenerator_lutmem_ia : std_logic_vector (39 downto 0);
    signal memoryC1_uid62_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid62_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid62_sqrtTableGenerator_lutmem_iq : std_logic_vector (39 downto 0);
    signal memoryC1_uid62_sqrtTableGenerator_lutmem_q : std_logic_vector (39 downto 0);
    signal memoryC1_uid63_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid63_sqrtTableGenerator_lutmem_ia : std_logic_vector (8 downto 0);
    signal memoryC1_uid63_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid63_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid63_sqrtTableGenerator_lutmem_iq : std_logic_vector (8 downto 0);
    signal memoryC1_uid63_sqrtTableGenerator_lutmem_q : std_logic_vector (8 downto 0);
    signal memoryC2_uid65_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid65_sqrtTableGenerator_lutmem_ia : std_logic_vector (39 downto 0);
    signal memoryC2_uid65_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid65_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid65_sqrtTableGenerator_lutmem_iq : std_logic_vector (39 downto 0);
    signal memoryC2_uid65_sqrtTableGenerator_lutmem_q : std_logic_vector (39 downto 0);
    signal memoryC3_uid67_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC3_uid67_sqrtTableGenerator_lutmem_ia : std_logic_vector (32 downto 0);
    signal memoryC3_uid67_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC3_uid67_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC3_uid67_sqrtTableGenerator_lutmem_iq : std_logic_vector (32 downto 0);
    signal memoryC3_uid67_sqrtTableGenerator_lutmem_q : std_logic_vector (32 downto 0);
    signal memoryC4_uid69_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC4_uid69_sqrtTableGenerator_lutmem_ia : std_logic_vector (23 downto 0);
    signal memoryC4_uid69_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC4_uid69_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC4_uid69_sqrtTableGenerator_lutmem_iq : std_logic_vector (23 downto 0);
    signal memoryC4_uid69_sqrtTableGenerator_lutmem_q : std_logic_vector (23 downto 0);
    signal memoryC5_uid71_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC5_uid71_sqrtTableGenerator_lutmem_ia : std_logic_vector (16 downto 0);
    signal memoryC5_uid71_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC5_uid71_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC5_uid71_sqrtTableGenerator_lutmem_iq : std_logic_vector (16 downto 0);
    signal memoryC5_uid71_sqrtTableGenerator_lutmem_q : std_logic_vector (16 downto 0);
    type multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a_type is array(0 to 1) of UNSIGNED(17 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a : multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a_type;
    attribute preserve : boolean;
    attribute preserve of multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a : signal is true;
    type multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c_type is array(0 to 1) of SIGNED(17 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c : multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c_type;
    attribute preserve of multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c : signal is true;
    type multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_l_type is array(0 to 1) of SIGNED(18 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_l : multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_l_type;
    type multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_p_type is array(0 to 1) of SIGNED(36 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_p : multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_p_type;
    type multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_w_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_w : multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_w_type;
    type multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_x_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_x : multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_x_type;
    type multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_y_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_y : multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_y_type;
    type multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_s_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_s : multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_s_type;
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_s0 : std_logic_vector(36 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_q : std_logic_vector (36 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_a : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_b : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_s1 : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_pr : UNSIGNED (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_q : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_a : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_b : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_s1 : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_pr : UNSIGNED (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_q : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_a : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_b : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_s1 : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_pr : SIGNED (54 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_q : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_a : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_b : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_s1 : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_pr : SIGNED (54 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_a : std_logic_vector(84 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_b : std_logic_vector(84 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_o : std_logic_vector (84 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_q : std_logic_vector (83 downto 0);
    signal reg_exc_N_uid20_fpSqrtTest_0_to_excRNaN_uid44_fpSqrtTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expXIsZero_uid13_fpSqrtTest_0_to_join_uid45_fpSqrtTest_0_q : std_logic_vector (0 downto 0);
    signal reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid62_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_0_q : std_logic_vector (39 downto 0);
    signal reg_memoryC1_uid63_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_1_q : std_logic_vector (8 downto 0);
    signal reg_addrTable_uid36_fpSqrtTest_0_to_memoryC5_uid71_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid73_sqrtPolynomialEvaluator_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_0_q : std_logic_vector (16 downto 0);
    signal reg_memoryC5_uid71_sqrtTableGenerator_lutmem_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_1_q : std_logic_vector (16 downto 0);
    signal reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC4_uid69_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid77_sqrtPolynomialEvaluator_0_q : std_logic_vector (23 downto 0);
    signal reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q : std_logic_vector (23 downto 0);
    signal reg_s1_uid75_uid78_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_1_q : std_logic_vector (25 downto 0);
    signal reg_memoryC3_uid67_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid83_sqrtPolynomialEvaluator_0_q : std_logic_vector (32 downto 0);
    signal reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_q : std_logic_vector (32 downto 0);
    signal reg_s2_uid81_uid84_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_1_q : std_logic_vector (34 downto 0);
    signal reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC2_uid65_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid89_sqrtPolynomialEvaluator_0_q : std_logic_vector (39 downto 0);
    signal reg_xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_4_q : std_logic_vector (17 downto 0);
    signal reg_pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_6_q : std_logic_vector (17 downto 0);
    signal reg_pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_7_q : std_logic_vector (16 downto 0);
    signal reg_yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_9_q : std_logic_vector (17 downto 0);
    signal reg_xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_0_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_1_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_0_q : std_logic_vector (50 downto 0);
    signal reg_R_uid129_pT4_uid92_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_1_q : std_logic_vector (42 downto 0);
    signal reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_1_q : std_logic_vector (26 downto 0);
    signal reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_0_q : std_logic_vector (53 downto 0);
    signal reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_0_q : std_logic_vector (39 downto 0);
    signal reg_memoryC0_uid60_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_1_q : std_logic_vector (16 downto 0);
    signal reg_os_uid61_sqrtTableGenerator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_0_q : std_logic_vector (56 downto 0);
    signal reg_highBBits_uid100_sqrtPolynomialEvaluator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_1_q : std_logic_vector (49 downto 0);
    signal reg_lowRangeB_uid99_sqrtPolynomialEvaluator_0_to_s5_uid99_uid102_sqrtPolynomialEvaluator_0_q : std_logic_vector (1 downto 0);
    signal reg_fracR_uid39_fpSqrtTest_0_to_fracRPostExc_uid55_fpSqrtTest_3_q : std_logic_vector (51 downto 0);
    signal ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a_q : std_logic_vector (51 downto 0);
    signal ld_signX_uid8_fpSqrtTest_b_to_fracSelIn_uid46_fpSqrtTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expRMux_uid33_fpSqrtTest_q_to_expRPostExc_uid51_fpSqrtTest_d_q : std_logic_vector (10 downto 0);
    signal ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_a_q : std_logic_vector (55 downto 0);
    signal ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_a_q : std_logic_vector (53 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a_inputreg_q : std_logic_vector (51 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_reset0 : std_logic;
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_eq : std_logic;
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_sticky_ena_q : signal is true;
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg_q : std_logic_vector (10 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q : signal is true;
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_reset0 : std_logic;
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_eq : std_logic;
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_sticky_ena_q : signal is true;
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_inputreg_q : std_logic_vector (44 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_reset0 : std_logic;
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_ia : std_logic_vector (44 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_iq : std_logic_vector (44 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_q : std_logic_vector (44 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_eq : std_logic;
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_sticky_ena_q : signal is true;
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_sticky_ena_q : signal is true;
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_sticky_ena_q : signal is true;
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_sticky_ena_q : signal is true;
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_reset0 : std_logic;
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_ia : std_logic_vector (44 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_iq : std_logic_vector (44 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_q : std_logic_vector (44 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_eq : std_logic;
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq : std_logic;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_inputreg_q : std_logic_vector (32 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_reset0 : std_logic;
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_ia : std_logic_vector (32 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_iq : std_logic_vector (32 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_q : std_logic_vector (32 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_eq : std_logic;
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq : std_logic;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_a : std_logic_vector(56 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_b : std_logic_vector(56 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_o : std_logic_vector (56 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_q : std_logic_vector (55 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal expX_uid6_fpSqrtTest_in : std_logic_vector (62 downto 0);
    signal expX_uid6_fpSqrtTest_b : std_logic_vector (10 downto 0);
    signal fracX_uid7_fpSqrtTest_in : std_logic_vector (51 downto 0);
    signal fracX_uid7_fpSqrtTest_b : std_logic_vector (51 downto 0);
    signal signX_uid8_fpSqrtTest_in : std_logic_vector (63 downto 0);
    signal signX_uid8_fpSqrtTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_a : std_logic_vector(10 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_b : std_logic_vector(10 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_a : std_logic_vector(10 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_b : std_logic_vector(10 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_a : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_b : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_a : std_logic_vector(11 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_b : std_logic_vector(11 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_o : std_logic_vector (11 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_q : std_logic_vector (11 downto 0);
    signal expOddSig_uid29_fpSqrtTest_a : std_logic_vector(11 downto 0);
    signal expOddSig_uid29_fpSqrtTest_b : std_logic_vector(11 downto 0);
    signal expOddSig_uid29_fpSqrtTest_o : std_logic_vector (11 downto 0);
    signal expOddSig_uid29_fpSqrtTest_q : std_logic_vector (11 downto 0);
    signal excRNaN_uid44_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expRPostExc_uid51_fpSqrtTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid51_fpSqrtTest_q : std_logic_vector (10 downto 0);
    signal fracRPostExc_uid55_fpSqrtTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid55_fpSqrtTest_q : std_logic_vector (51 downto 0);
    signal ts4_uid95_sqrtPolynomialEvaluator_a : std_logic_vector(51 downto 0);
    signal ts4_uid95_sqrtPolynomialEvaluator_b : std_logic_vector(51 downto 0);
    signal ts4_uid95_sqrtPolynomialEvaluator_o : std_logic_vector (51 downto 0);
    signal ts4_uid95_sqrtPolynomialEvaluator_q : std_logic_vector (51 downto 0);
    signal sumAHighB_uid101_sqrtPolynomialEvaluator_a : std_logic_vector(57 downto 0);
    signal sumAHighB_uid101_sqrtPolynomialEvaluator_b : std_logic_vector(57 downto 0);
    signal sumAHighB_uid101_sqrtPolynomialEvaluator_o : std_logic_vector (57 downto 0);
    signal sumAHighB_uid101_sqrtPolynomialEvaluator_q : std_logic_vector (57 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal join_uid45_fpSqrtTest_q : std_logic_vector (2 downto 0);
    signal prodXYTruncFR_uid105_pT1_uid74_sqrtPolynomialEvaluator_in : std_logic_vector (33 downto 0);
    signal prodXYTruncFR_uid105_pT1_uid74_sqrtPolynomialEvaluator_b : std_logic_vector (17 downto 0);
    signal prodXYTruncFR_uid108_pT2_uid80_sqrtPolynomialEvaluator_in : std_logic_vector (49 downto 0);
    signal prodXYTruncFR_uid108_pT2_uid80_sqrtPolynomialEvaluator_b : std_logic_vector (26 downto 0);
    signal prodXYTruncFR_uid111_pT3_uid86_sqrtPolynomialEvaluator_in : std_logic_vector (67 downto 0);
    signal prodXYTruncFR_uid111_pT3_uid86_sqrtPolynomialEvaluator_b : std_logic_vector (33 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (36 downto 0);
    signal multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (34 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_q_int : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_q : std_logic_vector (53 downto 0);
    signal os_uid64_sqrtTableGenerator_q : std_logic_vector (48 downto 0);
    signal os_uid61_sqrtTableGenerator_q : std_logic_vector (56 downto 0);
    signal s5_uid99_uid102_sqrtPolynomialEvaluator_q : std_logic_vector (59 downto 0);
    signal FracX44dto0_uid37_fpSqrtTest_in : std_logic_vector (44 downto 0);
    signal FracX44dto0_uid37_fpSqrtTest_b : std_logic_vector (44 downto 0);
    signal fracSelIn_uid46_fpSqrtTest_q : std_logic_vector (3 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_q_int : std_logic_vector (82 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_q : std_logic_vector (82 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_q_int : std_logic_vector (107 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_q : std_logic_vector (107 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_q : std_logic_vector(0 downto 0);
    signal RSqrt_uid57_fpSqrtTest_q : std_logic_vector (63 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_a : std_logic_vector(5 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_b : std_logic_vector(5 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_q : std_logic_vector(0 downto 0);
    signal yT4_uid91_sqrtPolynomialEvaluator_in : std_logic_vector (44 downto 0);
    signal yT4_uid91_sqrtPolynomialEvaluator_b : std_logic_vector (39 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_in : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_b : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_in : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_b : std_logic_vector (26 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal expX0_uid31_fpSqrtTest_in : std_logic_vector (0 downto 0);
    signal expX0_uid31_fpSqrtTest_b : std_logic_vector (0 downto 0);
    signal fracXAddr_uid35_fpSqrtTest_in : std_logic_vector (51 downto 0);
    signal fracXAddr_uid35_fpSqrtTest_b : std_logic_vector (6 downto 0);
    signal InvSignX_uid40_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid40_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid23_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid23_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid19_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid19_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid22_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid22_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expREven_uid27_fpSqrtTest_in : std_logic_vector (11 downto 0);
    signal expREven_uid27_fpSqrtTest_b : std_logic_vector (10 downto 0);
    signal expROdd_uid30_fpSqrtTest_in : std_logic_vector (11 downto 0);
    signal expROdd_uid30_fpSqrtTest_b : std_logic_vector (10 downto 0);
    signal s4_uid96_sqrtPolynomialEvaluator_in : std_logic_vector (51 downto 0);
    signal s4_uid96_sqrtPolynomialEvaluator_b : std_logic_vector (50 downto 0);
    signal lowRangeB_uid75_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid75_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid76_sqrtPolynomialEvaluator_in : std_logic_vector (17 downto 0);
    signal highBBits_uid76_sqrtPolynomialEvaluator_b : std_logic_vector (16 downto 0);
    signal lowRangeB_uid81_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid81_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid82_sqrtPolynomialEvaluator_in : std_logic_vector (26 downto 0);
    signal highBBits_uid82_sqrtPolynomialEvaluator_b : std_logic_vector (25 downto 0);
    signal lowRangeB_uid87_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid87_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid88_sqrtPolynomialEvaluator_in : std_logic_vector (33 downto 0);
    signal highBBits_uid88_sqrtPolynomialEvaluator_b : std_logic_vector (32 downto 0);
    signal lowRangeB_uid125_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (5 downto 0);
    signal lowRangeB_uid125_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (5 downto 0);
    signal highBBits_uid126_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (34 downto 0);
    signal highBBits_uid126_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (28 downto 0);
    signal cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_q : std_logic_vector (50 downto 0);
    signal fracR_uid39_fpSqrtTest_in : std_logic_vector (56 downto 0);
    signal fracR_uid39_fpSqrtTest_b : std_logic_vector (51 downto 0);
    signal yT1_uid73_sqrtPolynomialEvaluator_in : std_logic_vector (44 downto 0);
    signal yT1_uid73_sqrtPolynomialEvaluator_b : std_logic_vector (16 downto 0);
    signal yT2_uid79_sqrtPolynomialEvaluator_in : std_logic_vector (44 downto 0);
    signal yT2_uid79_sqrtPolynomialEvaluator_b : std_logic_vector (23 downto 0);
    signal yT3_uid85_sqrtPolynomialEvaluator_in : std_logic_vector (44 downto 0);
    signal yT3_uid85_sqrtPolynomialEvaluator_b : std_logic_vector (32 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_a : std_logic_vector(108 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_b : std_logic_vector(108 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_o : std_logic_vector (108 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_q : std_logic_vector (108 downto 0);
    signal xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (39 downto 0);
    signal xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (26 downto 0);
    signal xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (39 downto 0);
    signal xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (17 downto 0);
    signal xBottomBits_uid118_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (12 downto 0);
    signal xBottomBits_uid118_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (12 downto 0);
    signal expOddSelect_uid32_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal expOddSelect_uid32_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal addrTable_uid36_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal exc_N_uid20_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid20_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid20_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_in : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_b : std_logic_vector (26 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_in : std_logic_vector (53 downto 0);
    signal prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_b : std_logic_vector (26 downto 0);
    signal sumAHighB_uid77_sqrtPolynomialEvaluator_a : std_logic_vector(24 downto 0);
    signal sumAHighB_uid77_sqrtPolynomialEvaluator_b : std_logic_vector(24 downto 0);
    signal sumAHighB_uid77_sqrtPolynomialEvaluator_o : std_logic_vector (24 downto 0);
    signal sumAHighB_uid77_sqrtPolynomialEvaluator_q : std_logic_vector (24 downto 0);
    signal sumAHighB_uid83_sqrtPolynomialEvaluator_a : std_logic_vector(33 downto 0);
    signal sumAHighB_uid83_sqrtPolynomialEvaluator_b : std_logic_vector(33 downto 0);
    signal sumAHighB_uid83_sqrtPolynomialEvaluator_o : std_logic_vector (33 downto 0);
    signal sumAHighB_uid83_sqrtPolynomialEvaluator_q : std_logic_vector (33 downto 0);
    signal sumAHighB_uid89_sqrtPolynomialEvaluator_a : std_logic_vector(40 downto 0);
    signal sumAHighB_uid89_sqrtPolynomialEvaluator_b : std_logic_vector(40 downto 0);
    signal sumAHighB_uid89_sqrtPolynomialEvaluator_o : std_logic_vector (40 downto 0);
    signal sumAHighB_uid89_sqrtPolynomialEvaluator_q : std_logic_vector (40 downto 0);
    signal sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_q : std_logic_vector (54 downto 0);
    signal prodXYTruncFR_uid131_pT5_uid98_sqrtPolynomialEvaluator_in : std_logic_vector (95 downto 0);
    signal prodXYTruncFR_uid131_pT5_uid98_sqrtPolynomialEvaluator_b : std_logic_vector (51 downto 0);
    signal pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_q : std_logic_vector (16 downto 0);
    signal InvExc_N_uid21_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid21_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal s1_uid75_uid78_sqrtPolynomialEvaluator_q : std_logic_vector (25 downto 0);
    signal s2_uid81_uid84_sqrtPolynomialEvaluator_q : std_logic_vector (34 downto 0);
    signal s3_uid87_uid90_sqrtPolynomialEvaluator_q : std_logic_vector (41 downto 0);
    signal add0_uid125_uid128_pT4_uid92_sqrtPolynomialEvaluator_q : std_logic_vector (60 downto 0);
    signal lowRangeB_uid99_sqrtPolynomialEvaluator_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid99_sqrtPolynomialEvaluator_b : std_logic_vector (1 downto 0);
    signal highBBits_uid100_sqrtPolynomialEvaluator_in : std_logic_vector (51 downto 0);
    signal highBBits_uid100_sqrtPolynomialEvaluator_b : std_logic_vector (49 downto 0);
    signal exc_R_uid24_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (41 downto 0);
    signal yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid117_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (14 downto 0);
    signal yBottomBits_uid117_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (14 downto 0);
    signal yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (41 downto 0);
    signal yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (17 downto 0);
    signal R_uid129_pT4_uid92_sqrtPolynomialEvaluator_in : std_logic_vector (59 downto 0);
    signal R_uid129_pT4_uid92_sqrtPolynomialEvaluator_b : std_logic_vector (42 downto 0);
    signal spad_yBottomBits_uid117_uid120_pT4_uid92_sqrtPolynomialEvaluator_q : std_logic_vector (15 downto 0);
    signal pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_q : std_logic_vector (17 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable(LOGICAL,408)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_a <= en;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q <= not ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_a;

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor(LOGICAL,435)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_b <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_sticky_ena_q;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_q <= not (ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_a or ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_b);

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_mem_top(CONSTANT,431)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_mem_top_q <= "011000";

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp(LOGICAL,432)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_a <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_mem_top_q;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_q);
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_q <= "1" when ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_a = ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_b else "0";

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmpReg(REG,433)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmpReg_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_sticky_ena(REG,436)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_nor_q = "1") THEN
                ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_sticky_ena_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd(LOGICAL,437)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_a <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_sticky_ena_q;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_b <= en;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_a and ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_b;

	--signX_uid8_fpSqrtTest(BITSELECT,7)@0
    signX_uid8_fpSqrtTest_in <= a;
    signX_uid8_fpSqrtTest_b <= signX_uid8_fpSqrtTest_in(63 downto 63);

	--cstAllZWE_uid11_fpSqrtTest(CONSTANT,10)
    cstAllZWE_uid11_fpSqrtTest_q <= "00000000000";

	--expX_uid6_fpSqrtTest(BITSELECT,5)@0
    expX_uid6_fpSqrtTest_in <= a(62 downto 0);
    expX_uid6_fpSqrtTest_b <= expX_uid6_fpSqrtTest_in(62 downto 52);

	--expXIsZero_uid13_fpSqrtTest(LOGICAL,12)@0
    expXIsZero_uid13_fpSqrtTest_a <= expX_uid6_fpSqrtTest_b;
    expXIsZero_uid13_fpSqrtTest_b <= cstAllZWE_uid11_fpSqrtTest_q;
    expXIsZero_uid13_fpSqrtTest_q <= "1" when expXIsZero_uid13_fpSqrtTest_a = expXIsZero_uid13_fpSqrtTest_b else "0";

	--negZero_uid56_fpSqrtTest(LOGICAL,55)@0
    negZero_uid56_fpSqrtTest_a <= expXIsZero_uid13_fpSqrtTest_q;
    negZero_uid56_fpSqrtTest_b <= signX_uid8_fpSqrtTest_b;
    negZero_uid56_fpSqrtTest_q_i <= negZero_uid56_fpSqrtTest_a and negZero_uid56_fpSqrtTest_b;
    negZero_uid56_fpSqrtTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => negZero_uid56_fpSqrtTest_q, xin => negZero_uid56_fpSqrtTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_inputreg(DELAY,425)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => negZero_uid56_fpSqrtTest_q, xout => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt(COUNTER,427)
    -- every=1, low=0, high=24, step=1, init=1
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_i = 23 THEN
                      ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_eq = '1') THEN
                        ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_i <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_i - 24;
                    ELSE
                        ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_i <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_i,5));


	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdreg(REG,428)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdreg_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux(MUX,429)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_s <= en;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux: PROCESS (ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_s, ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdreg_q, ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdreg_q;
                  WHEN "1" => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem(DUALMEM,426)
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_ia <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_inputreg_q;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_aa <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdreg_q;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_ab <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_rdmux_q;
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 25,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 25,
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
        clocken1 => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_iq,
        address_a => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_aa,
        data_a => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_ia
    );
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_reset0 <= areset;
        ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_iq(0 downto 0);

	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor(LOGICAL,422)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_b <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_q <= not (ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_a or ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_b);

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_mem_top(CONSTANT,405)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_mem_top_q <= "010111";

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp(LOGICAL,406)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_mem_top_q;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_q);
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_q <= "1" when ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_a = ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_b else "0";

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmpReg(REG,407)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmpReg_q <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena(REG,423)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd(LOGICAL,424)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_a <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_a and ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_b;

	--cstAllOWE_uid9_fpSqrtTest(CONSTANT,8)
    cstAllOWE_uid9_fpSqrtTest_q <= "11111111111";

	--sBiasM1_uid28_fpSqrtTest(CONSTANT,27)
    sBiasM1_uid28_fpSqrtTest_q <= "01111111110";

	--expOddSig_uid29_fpSqrtTest(ADD,28)@0
    expOddSig_uid29_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expOddSig_uid29_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBiasM1_uid28_fpSqrtTest_q);
            expOddSig_uid29_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid29_fpSqrtTest_a) + UNSIGNED(expOddSig_uid29_fpSqrtTest_b));
    expOddSig_uid29_fpSqrtTest_q <= expOddSig_uid29_fpSqrtTest_o(11 downto 0);


	--expROdd_uid30_fpSqrtTest(BITSELECT,29)@0
    expROdd_uid30_fpSqrtTest_in <= expOddSig_uid29_fpSqrtTest_q;
    expROdd_uid30_fpSqrtTest_b <= expROdd_uid30_fpSqrtTest_in(11 downto 1);

	--sBias_uid25_fpSqrtTest(CONSTANT,24)
    sBias_uid25_fpSqrtTest_q <= "01111111111";

	--expEvenSig_uid26_fpSqrtTest(ADD,25)@0
    expEvenSig_uid26_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expEvenSig_uid26_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBias_uid25_fpSqrtTest_q);
            expEvenSig_uid26_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid26_fpSqrtTest_a) + UNSIGNED(expEvenSig_uid26_fpSqrtTest_b));
    expEvenSig_uid26_fpSqrtTest_q <= expEvenSig_uid26_fpSqrtTest_o(11 downto 0);


	--expREven_uid27_fpSqrtTest(BITSELECT,26)@0
    expREven_uid27_fpSqrtTest_in <= expEvenSig_uid26_fpSqrtTest_q;
    expREven_uid27_fpSqrtTest_b <= expREven_uid27_fpSqrtTest_in(11 downto 1);

	--expX0_uid31_fpSqrtTest(BITSELECT,30)@0
    expX0_uid31_fpSqrtTest_in <= expX_uid6_fpSqrtTest_b(0 downto 0);
    expX0_uid31_fpSqrtTest_b <= expX0_uid31_fpSqrtTest_in(0 downto 0);

	--expOddSelect_uid32_fpSqrtTest(LOGICAL,31)@0
    expOddSelect_uid32_fpSqrtTest_a <= expX0_uid31_fpSqrtTest_b;
    expOddSelect_uid32_fpSqrtTest_q <= not expOddSelect_uid32_fpSqrtTest_a;

	--expRMux_uid33_fpSqrtTest(MUX,32)@0
    expRMux_uid33_fpSqrtTest_s <= expOddSelect_uid32_fpSqrtTest_q;
    expRMux_uid33_fpSqrtTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRMux_uid33_fpSqrtTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRMux_uid33_fpSqrtTest_s IS
                      WHEN "0" => expRMux_uid33_fpSqrtTest_q <= expREven_uid27_fpSqrtTest_b;
                      WHEN "1" => expRMux_uid33_fpSqrtTest_q <= expROdd_uid30_fpSqrtTest_b;
                      WHEN OTHERS => expRMux_uid33_fpSqrtTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRMux_uid33_fpSqrtTest_q_to_expRPostExc_uid51_fpSqrtTest_d(DELAY,248)@1
    ld_expRMux_uid33_fpSqrtTest_q_to_expRPostExc_uid51_fpSqrtTest_d : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => expRMux_uid33_fpSqrtTest_q, xout => ld_expRMux_uid33_fpSqrtTest_q_to_expRPostExc_uid51_fpSqrtTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_signX_uid8_fpSqrtTest_b_to_fracSelIn_uid46_fpSqrtTest_b(DELAY,245)@0
    ld_signX_uid8_fpSqrtTest_b_to_fracSelIn_uid46_fpSqrtTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid8_fpSqrtTest_b, xout => ld_signX_uid8_fpSqrtTest_b_to_fracSelIn_uid46_fpSqrtTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllZWF_uid10_fpSqrtTest(CONSTANT,9)
    cstAllZWF_uid10_fpSqrtTest_q <= "0000000000000000000000000000000000000000000000000000";

	--fracX_uid7_fpSqrtTest(BITSELECT,6)@0
    fracX_uid7_fpSqrtTest_in <= a(51 downto 0);
    fracX_uid7_fpSqrtTest_b <= fracX_uid7_fpSqrtTest_in(51 downto 0);

	--fracXIsZero_uid17_fpSqrtTest(LOGICAL,16)@0
    fracXIsZero_uid17_fpSqrtTest_a <= fracX_uid7_fpSqrtTest_b;
    fracXIsZero_uid17_fpSqrtTest_b <= cstAllZWF_uid10_fpSqrtTest_q;
    fracXIsZero_uid17_fpSqrtTest_q <= "1" when fracXIsZero_uid17_fpSqrtTest_a = fracXIsZero_uid17_fpSqrtTest_b else "0";

	--InvFracXIsZero_uid19_fpSqrtTest(LOGICAL,18)@0
    InvFracXIsZero_uid19_fpSqrtTest_a <= fracXIsZero_uid17_fpSqrtTest_q;
    InvFracXIsZero_uid19_fpSqrtTest_q <= not InvFracXIsZero_uid19_fpSqrtTest_a;

	--expXIsMax_uid15_fpSqrtTest(LOGICAL,14)@0
    expXIsMax_uid15_fpSqrtTest_a <= expX_uid6_fpSqrtTest_b;
    expXIsMax_uid15_fpSqrtTest_b <= cstAllOWE_uid9_fpSqrtTest_q;
    expXIsMax_uid15_fpSqrtTest_q <= "1" when expXIsMax_uid15_fpSqrtTest_a = expXIsMax_uid15_fpSqrtTest_b else "0";

	--exc_N_uid20_fpSqrtTest(LOGICAL,19)@0
    exc_N_uid20_fpSqrtTest_a <= expXIsMax_uid15_fpSqrtTest_q;
    exc_N_uid20_fpSqrtTest_b <= InvFracXIsZero_uid19_fpSqrtTest_q;
    exc_N_uid20_fpSqrtTest_q <= exc_N_uid20_fpSqrtTest_a and exc_N_uid20_fpSqrtTest_b;

	--InvExc_N_uid21_fpSqrtTest(LOGICAL,20)@0
    InvExc_N_uid21_fpSqrtTest_a <= exc_N_uid20_fpSqrtTest_q;
    InvExc_N_uid21_fpSqrtTest_q <= not InvExc_N_uid21_fpSqrtTest_a;

	--exc_I_uid18_fpSqrtTest(LOGICAL,17)@0
    exc_I_uid18_fpSqrtTest_a <= expXIsMax_uid15_fpSqrtTest_q;
    exc_I_uid18_fpSqrtTest_b <= fracXIsZero_uid17_fpSqrtTest_q;
    exc_I_uid18_fpSqrtTest_q <= exc_I_uid18_fpSqrtTest_a and exc_I_uid18_fpSqrtTest_b;

	--InvExc_I_uid22_fpSqrtTest(LOGICAL,21)@0
    InvExc_I_uid22_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    InvExc_I_uid22_fpSqrtTest_q <= not InvExc_I_uid22_fpSqrtTest_a;

	--InvExpXIsZero_uid23_fpSqrtTest(LOGICAL,22)@0
    InvExpXIsZero_uid23_fpSqrtTest_a <= expXIsZero_uid13_fpSqrtTest_q;
    InvExpXIsZero_uid23_fpSqrtTest_q <= not InvExpXIsZero_uid23_fpSqrtTest_a;

	--exc_R_uid24_fpSqrtTest(LOGICAL,23)@0
    exc_R_uid24_fpSqrtTest_a <= InvExpXIsZero_uid23_fpSqrtTest_q;
    exc_R_uid24_fpSqrtTest_b <= InvExc_I_uid22_fpSqrtTest_q;
    exc_R_uid24_fpSqrtTest_c <= InvExc_N_uid21_fpSqrtTest_q;
    exc_R_uid24_fpSqrtTest_q <= exc_R_uid24_fpSqrtTest_a and exc_R_uid24_fpSqrtTest_b and exc_R_uid24_fpSqrtTest_c;

	--minReg_uid42_fpSqrtTest(LOGICAL,41)@0
    minReg_uid42_fpSqrtTest_a <= exc_R_uid24_fpSqrtTest_q;
    minReg_uid42_fpSqrtTest_b <= signX_uid8_fpSqrtTest_b;
    minReg_uid42_fpSqrtTest_q_i <= minReg_uid42_fpSqrtTest_a and minReg_uid42_fpSqrtTest_b;
    minReg_uid42_fpSqrtTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => minReg_uid42_fpSqrtTest_q, xin => minReg_uid42_fpSqrtTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--minInf_uid43_fpSqrtTest(LOGICAL,42)@0
    minInf_uid43_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    minInf_uid43_fpSqrtTest_b <= signX_uid8_fpSqrtTest_b;
    minInf_uid43_fpSqrtTest_q_i <= minInf_uid43_fpSqrtTest_a and minInf_uid43_fpSqrtTest_b;
    minInf_uid43_fpSqrtTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => minInf_uid43_fpSqrtTest_q, xin => minInf_uid43_fpSqrtTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--reg_exc_N_uid20_fpSqrtTest_0_to_excRNaN_uid44_fpSqrtTest_1(REG,155)@0
    reg_exc_N_uid20_fpSqrtTest_0_to_excRNaN_uid44_fpSqrtTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_N_uid20_fpSqrtTest_0_to_excRNaN_uid44_fpSqrtTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_N_uid20_fpSqrtTest_0_to_excRNaN_uid44_fpSqrtTest_1_q <= exc_N_uid20_fpSqrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excRNaN_uid44_fpSqrtTest(LOGICAL,43)@1
    excRNaN_uid44_fpSqrtTest_a <= reg_exc_N_uid20_fpSqrtTest_0_to_excRNaN_uid44_fpSqrtTest_1_q;
    excRNaN_uid44_fpSqrtTest_b <= minInf_uid43_fpSqrtTest_q;
    excRNaN_uid44_fpSqrtTest_c <= minReg_uid42_fpSqrtTest_q;
    excRNaN_uid44_fpSqrtTest_q <= excRNaN_uid44_fpSqrtTest_a or excRNaN_uid44_fpSqrtTest_b or excRNaN_uid44_fpSqrtTest_c;

	--InvSignX_uid40_fpSqrtTest(LOGICAL,39)@0
    InvSignX_uid40_fpSqrtTest_a <= signX_uid8_fpSqrtTest_b;
    InvSignX_uid40_fpSqrtTest_q <= not InvSignX_uid40_fpSqrtTest_a;

	--inInfAndNotNeg_uid41_fpSqrtTest(LOGICAL,40)@0
    inInfAndNotNeg_uid41_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    inInfAndNotNeg_uid41_fpSqrtTest_b <= InvSignX_uid40_fpSqrtTest_q;
    inInfAndNotNeg_uid41_fpSqrtTest_q_i <= inInfAndNotNeg_uid41_fpSqrtTest_a and inInfAndNotNeg_uid41_fpSqrtTest_b;
    inInfAndNotNeg_uid41_fpSqrtTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => inInfAndNotNeg_uid41_fpSqrtTest_q, xin => inInfAndNotNeg_uid41_fpSqrtTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--reg_expXIsZero_uid13_fpSqrtTest_0_to_join_uid45_fpSqrtTest_0(REG,156)@0
    reg_expXIsZero_uid13_fpSqrtTest_0_to_join_uid45_fpSqrtTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid13_fpSqrtTest_0_to_join_uid45_fpSqrtTest_0_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid13_fpSqrtTest_0_to_join_uid45_fpSqrtTest_0_q <= expXIsZero_uid13_fpSqrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--join_uid45_fpSqrtTest(BITJOIN,44)@1
    join_uid45_fpSqrtTest_q <= excRNaN_uid44_fpSqrtTest_q & inInfAndNotNeg_uid41_fpSqrtTest_q & reg_expXIsZero_uid13_fpSqrtTest_0_to_join_uid45_fpSqrtTest_0_q;

	--fracSelIn_uid46_fpSqrtTest(BITJOIN,45)@1
    fracSelIn_uid46_fpSqrtTest_q <= ld_signX_uid8_fpSqrtTest_b_to_fracSelIn_uid46_fpSqrtTest_b_q & join_uid45_fpSqrtTest_q;

	--fracSel_uid47_fpSqrtTest(LOOKUP,46)@1
    fracSel_uid47_fpSqrtTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracSel_uid47_fpSqrtTest_q <= "01";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (fracSelIn_uid46_fpSqrtTest_q) IS
                WHEN "0000" =>  fracSel_uid47_fpSqrtTest_q <= "01";
                WHEN "0001" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "0010" =>  fracSel_uid47_fpSqrtTest_q <= "10";
                WHEN "0011" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "0100" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "0101" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "0110" =>  fracSel_uid47_fpSqrtTest_q <= "10";
                WHEN "0111" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "1000" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1001" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "1010" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1011" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1100" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1101" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1110" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1111" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN OTHERS =>
                    fracSel_uid47_fpSqrtTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--expRPostExc_uid51_fpSqrtTest(MUX,50)@2
    expRPostExc_uid51_fpSqrtTest_s <= fracSel_uid47_fpSqrtTest_q;
    expRPostExc_uid51_fpSqrtTest: PROCESS (expRPostExc_uid51_fpSqrtTest_s, en, cstAllZWE_uid11_fpSqrtTest_q, ld_expRMux_uid33_fpSqrtTest_q_to_expRPostExc_uid51_fpSqrtTest_d_q, cstAllOWE_uid9_fpSqrtTest_q, cstAllOWE_uid9_fpSqrtTest_q)
    BEGIN
            CASE expRPostExc_uid51_fpSqrtTest_s IS
                  WHEN "00" => expRPostExc_uid51_fpSqrtTest_q <= cstAllZWE_uid11_fpSqrtTest_q;
                  WHEN "01" => expRPostExc_uid51_fpSqrtTest_q <= ld_expRMux_uid33_fpSqrtTest_q_to_expRPostExc_uid51_fpSqrtTest_d_q;
                  WHEN "10" => expRPostExc_uid51_fpSqrtTest_q <= cstAllOWE_uid9_fpSqrtTest_q;
                  WHEN "11" => expRPostExc_uid51_fpSqrtTest_q <= cstAllOWE_uid9_fpSqrtTest_q;
                  WHEN OTHERS => expRPostExc_uid51_fpSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg(DELAY,412)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid51_fpSqrtTest_q, xout => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt(COUNTER,401)
    -- every=1, low=0, high=23, step=1, init=1
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_i = 22 THEN
                      ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_eq = '1') THEN
                        ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_i <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_i - 23;
                    ELSE
                        ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_i <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_i,5));


	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg(REG,402)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg_q <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux(MUX,403)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_s <= en;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux: PROCESS (ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_s, ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg_q, ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_q <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg_q;
                  WHEN "1" => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_q <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem(DUALMEM,413)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ia <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_aa <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ab <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 5,
        numwords_a => 24,
        width_b => 11,
        widthad_b => 5,
        numwords_b => 24,
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
        clocken1 => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ia
    );
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_reset0 <= areset;
        ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_iq(10 downto 0);

	--fracNaN_uid52_fpSqrtTest(CONSTANT,51)
    fracNaN_uid52_fpSqrtTest_q <= "0000000000000000000000000000000000000000000000000001";

	--fracXAddr_uid35_fpSqrtTest(BITSELECT,34)@0
    fracXAddr_uid35_fpSqrtTest_in <= fracX_uid7_fpSqrtTest_b;
    fracXAddr_uid35_fpSqrtTest_b <= fracXAddr_uid35_fpSqrtTest_in(51 downto 45);

	--addrTable_uid36_fpSqrtTest(BITJOIN,35)@0
    addrTable_uid36_fpSqrtTest_q <= expOddSelect_uid32_fpSqrtTest_q & fracXAddr_uid35_fpSqrtTest_b;

	--reg_addrTable_uid36_fpSqrtTest_0_to_memoryC5_uid71_sqrtTableGenerator_lutmem_0(REG,161)@0
    reg_addrTable_uid36_fpSqrtTest_0_to_memoryC5_uid71_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid36_fpSqrtTest_0_to_memoryC5_uid71_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid36_fpSqrtTest_0_to_memoryC5_uid71_sqrtTableGenerator_lutmem_0_q <= addrTable_uid36_fpSqrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC5_uid71_sqrtTableGenerator_lutmem(DUALMEM,139)@1
    memoryC5_uid71_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC5_uid71_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC5_uid71_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC5_uid71_sqrtTableGenerator_lutmem_0_q;
    memoryC5_uid71_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 17,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 17,
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
        init_file => "fp_sqrt_double_s5_memoryC5_uid71_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC5_uid71_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC5_uid71_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC5_uid71_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC5_uid71_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC5_uid71_sqrtTableGenerator_lutmem_ia
    );
    memoryC5_uid71_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC5_uid71_sqrtTableGenerator_lutmem_q <= memoryC5_uid71_sqrtTableGenerator_lutmem_iq(16 downto 0);

	--reg_memoryC5_uid71_sqrtTableGenerator_lutmem_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_1(REG,163)@3
    reg_memoryC5_uid71_sqrtTableGenerator_lutmem_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC5_uid71_sqrtTableGenerator_lutmem_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_1_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC5_uid71_sqrtTableGenerator_lutmem_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_1_q <= memoryC5_uid71_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a_inputreg(DELAY,398)
    ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => fracX_uid7_fpSqrtTest_b, xout => ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a(DELAY,229)@0
    ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a : dspba_delay
    GENERIC MAP ( width => 52, depth => 2 )
    PORT MAP ( xin => ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a_inputreg_q, xout => ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--FracX44dto0_uid37_fpSqrtTest(BITSELECT,36)@3
    FracX44dto0_uid37_fpSqrtTest_in <= ld_fracX_uid7_fpSqrtTest_b_to_FracX44dto0_uid37_fpSqrtTest_a_q(44 downto 0);
    FracX44dto0_uid37_fpSqrtTest_b <= FracX44dto0_uid37_fpSqrtTest_in(44 downto 0);

	--yT1_uid73_sqrtPolynomialEvaluator(BITSELECT,72)@3
    yT1_uid73_sqrtPolynomialEvaluator_in <= FracX44dto0_uid37_fpSqrtTest_b;
    yT1_uid73_sqrtPolynomialEvaluator_b <= yT1_uid73_sqrtPolynomialEvaluator_in(44 downto 28);

	--reg_yT1_uid73_sqrtPolynomialEvaluator_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_0(REG,162)@3
    reg_yT1_uid73_sqrtPolynomialEvaluator_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid73_sqrtPolynomialEvaluator_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_0_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid73_sqrtPolynomialEvaluator_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_0_q <= yT1_uid73_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator(MULT,103)@4
    prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_a),18)) * SIGNED(prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_b);
    prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_a <= reg_yT1_uid73_sqrtPolynomialEvaluator_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_0_q;
                prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_b <= reg_memoryC5_uid71_sqrtTableGenerator_lutmem_0_to_prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_1_q;
                prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_pr,34));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_q <= prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid105_pT1_uid74_sqrtPolynomialEvaluator(BITSELECT,104)@7
    prodXYTruncFR_uid105_pT1_uid74_sqrtPolynomialEvaluator_in <= prodXY_uid104_pT1_uid74_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid105_pT1_uid74_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid105_pT1_uid74_sqrtPolynomialEvaluator_in(33 downto 16);

	--highBBits_uid76_sqrtPolynomialEvaluator(BITSELECT,75)@7
    highBBits_uid76_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid105_pT1_uid74_sqrtPolynomialEvaluator_b;
    highBBits_uid76_sqrtPolynomialEvaluator_b <= highBBits_uid76_sqrtPolynomialEvaluator_in(17 downto 1);

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_a(DELAY,363)@0
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => addrTable_uid36_fpSqrtTest_q, xout => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0(REG,164)@3
    reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC4_uid69_sqrtTableGenerator_lutmem(DUALMEM,138)@4
    memoryC4_uid69_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC4_uid69_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC4_uid69_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC4_uid69_sqrtTableGenerator_lutmem_0_q;
    memoryC4_uid69_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 24,
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
        init_file => "fp_sqrt_double_s5_memoryC4_uid69_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC4_uid69_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC4_uid69_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC4_uid69_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC4_uid69_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC4_uid69_sqrtTableGenerator_lutmem_ia
    );
    memoryC4_uid69_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC4_uid69_sqrtTableGenerator_lutmem_q <= memoryC4_uid69_sqrtTableGenerator_lutmem_iq(23 downto 0);

	--reg_memoryC4_uid69_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid77_sqrtPolynomialEvaluator_0(REG,165)@6
    reg_memoryC4_uid69_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid77_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC4_uid69_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid77_sqrtPolynomialEvaluator_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC4_uid69_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid77_sqrtPolynomialEvaluator_0_q <= memoryC4_uid69_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid77_sqrtPolynomialEvaluator(ADD,76)@7
    sumAHighB_uid77_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((24 downto 24 => reg_memoryC4_uid69_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid77_sqrtPolynomialEvaluator_0_q(23)) & reg_memoryC4_uid69_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid77_sqrtPolynomialEvaluator_0_q);
    sumAHighB_uid77_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((24 downto 17 => highBBits_uid76_sqrtPolynomialEvaluator_b(16)) & highBBits_uid76_sqrtPolynomialEvaluator_b);
            sumAHighB_uid77_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid77_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid77_sqrtPolynomialEvaluator_b));
    sumAHighB_uid77_sqrtPolynomialEvaluator_q <= sumAHighB_uid77_sqrtPolynomialEvaluator_o(24 downto 0);


	--lowRangeB_uid75_sqrtPolynomialEvaluator(BITSELECT,74)@7
    lowRangeB_uid75_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid105_pT1_uid74_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid75_sqrtPolynomialEvaluator_b <= lowRangeB_uid75_sqrtPolynomialEvaluator_in(0 downto 0);

	--s1_uid75_uid78_sqrtPolynomialEvaluator(BITJOIN,77)@7
    s1_uid75_uid78_sqrtPolynomialEvaluator_q <= sumAHighB_uid77_sqrtPolynomialEvaluator_q & lowRangeB_uid75_sqrtPolynomialEvaluator_b;

	--reg_s1_uid75_uid78_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_1(REG,167)@7
    reg_s1_uid75_uid78_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid75_uid78_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid75_uid78_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_1_q <= s1_uid75_uid78_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor(LOGICAL,459)
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_b <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_q <= not (ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_a or ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_b);

	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_cmpReg(REG,457)
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_sticky_ena(REG,460)
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_nor_q = "1") THEN
                ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_sticky_ena_q <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd(LOGICAL,461)
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_a <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_b <= en;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_q <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_a and ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_b;

	--yT2_uid79_sqrtPolynomialEvaluator(BITSELECT,78)@3
    yT2_uid79_sqrtPolynomialEvaluator_in <= FracX44dto0_uid37_fpSqrtTest_b;
    yT2_uid79_sqrtPolynomialEvaluator_b <= yT2_uid79_sqrtPolynomialEvaluator_in(44 downto 21);

	--reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0(REG,166)@3
    reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q <= yT2_uid79_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_inputreg(DELAY,451)
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q, xout => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt(COUNTER,453)
    -- every=1, low=0, high=1, step=1, init=1
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_i <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_i,1));


	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdreg(REG,454)
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdreg_q <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux(MUX,455)
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_s <= en;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux: PROCESS (ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_s, ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdreg_q, ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_q <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_q <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem(DUALMEM,452)
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_ia <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_inputreg_q;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_aa <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdreg_q;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_ab <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_rdmux_q;
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_iq,
        address_a => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_aa,
        data_a => ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_ia
    );
    ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_reset0 <= areset;
        ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_q <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_iq(23 downto 0);

	--prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator(MULT,106)@8
    prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a),25)) * SIGNED(prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_b);
    prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a <= ld_reg_yT2_uid79_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_0_q_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_a_replace_mem_q;
                prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_b <= reg_s1_uid75_uid78_sqrtPolynomialEvaluator_0_to_prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_1_q;
                prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_pr,50));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_q <= prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid108_pT2_uid80_sqrtPolynomialEvaluator(BITSELECT,107)@11
    prodXYTruncFR_uid108_pT2_uid80_sqrtPolynomialEvaluator_in <= prodXY_uid107_pT2_uid80_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid108_pT2_uid80_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid108_pT2_uid80_sqrtPolynomialEvaluator_in(49 downto 23);

	--highBBits_uid82_sqrtPolynomialEvaluator(BITSELECT,81)@11
    highBBits_uid82_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid108_pT2_uid80_sqrtPolynomialEvaluator_b;
    highBBits_uid82_sqrtPolynomialEvaluator_b <= highBBits_uid82_sqrtPolynomialEvaluator_in(26 downto 1);

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor(LOGICAL,485)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_b <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_sticky_ena_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_q <= not (ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_a or ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_b);

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_mem_top(CONSTANT,481)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_mem_top_q <= "0100";

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp(LOGICAL,482)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_a <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_mem_top_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_q);
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_q <= "1" when ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_a = ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_b else "0";

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmpReg(REG,483)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmpReg_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_sticky_ena(REG,486)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_nor_q = "1") THEN
                ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_sticky_ena_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd(LOGICAL,487)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_a <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_sticky_ena_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_b <= en;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_a and ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_b;

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_inputreg(DELAY,462)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_addrTable_uid36_fpSqrtTest_0_to_memoryC5_uid71_sqrtTableGenerator_lutmem_0_q, xout => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt(COUNTER,477)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_i = 3 THEN
                      ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_i,3));


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdreg(REG,478)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdreg_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux(MUX,479)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_s <= en;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux: PROCESS (ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_s, ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdreg_q, ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem(DUALMEM,476)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_ia <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_inputreg_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_aa <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_ab <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_iq,
        address_a => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_aa,
        data_a => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_ia
    );
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_iq(7 downto 0);

	--memoryC3_uid67_sqrtTableGenerator_lutmem(DUALMEM,137)@8
    memoryC3_uid67_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC3_uid67_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC3_uid67_sqrtTableGenerator_lutmem_ab <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC3_uid67_sqrtTableGenerator_lutmem_0_q_to_memoryC3_uid67_sqrtTableGenerator_lutmem_a_replace_mem_q;
    memoryC3_uid67_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 33,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 33,
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
        init_file => "fp_sqrt_double_s5_memoryC3_uid67_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC3_uid67_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC3_uid67_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC3_uid67_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC3_uid67_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC3_uid67_sqrtTableGenerator_lutmem_ia
    );
    memoryC3_uid67_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC3_uid67_sqrtTableGenerator_lutmem_q <= memoryC3_uid67_sqrtTableGenerator_lutmem_iq(32 downto 0);

	--reg_memoryC3_uid67_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid83_sqrtPolynomialEvaluator_0(REG,169)@10
    reg_memoryC3_uid67_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid83_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC3_uid67_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid83_sqrtPolynomialEvaluator_0_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC3_uid67_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid83_sqrtPolynomialEvaluator_0_q <= memoryC3_uid67_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid83_sqrtPolynomialEvaluator(ADD,82)@11
    sumAHighB_uid83_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((33 downto 33 => reg_memoryC3_uid67_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid83_sqrtPolynomialEvaluator_0_q(32)) & reg_memoryC3_uid67_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid83_sqrtPolynomialEvaluator_0_q);
    sumAHighB_uid83_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((33 downto 26 => highBBits_uid82_sqrtPolynomialEvaluator_b(25)) & highBBits_uid82_sqrtPolynomialEvaluator_b);
            sumAHighB_uid83_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid83_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid83_sqrtPolynomialEvaluator_b));
    sumAHighB_uid83_sqrtPolynomialEvaluator_q <= sumAHighB_uid83_sqrtPolynomialEvaluator_o(33 downto 0);


	--lowRangeB_uid81_sqrtPolynomialEvaluator(BITSELECT,80)@11
    lowRangeB_uid81_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid108_pT2_uid80_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid81_sqrtPolynomialEvaluator_b <= lowRangeB_uid81_sqrtPolynomialEvaluator_in(0 downto 0);

	--s2_uid81_uid84_sqrtPolynomialEvaluator(BITJOIN,83)@11
    s2_uid81_uid84_sqrtPolynomialEvaluator_q <= sumAHighB_uid83_sqrtPolynomialEvaluator_q & lowRangeB_uid81_sqrtPolynomialEvaluator_b;

	--reg_s2_uid81_uid84_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_1(REG,171)@11
    reg_s2_uid81_uid84_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s2_uid81_uid84_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s2_uid81_uid84_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_1_q <= s2_uid81_uid84_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor(LOGICAL,524)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_b <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_sticky_ena_q;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_q <= not (ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_a or ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_b);

	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_mem_top(CONSTANT,520)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_mem_top_q <= "0101";

	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp(LOGICAL,521)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_a <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_mem_top_q;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_q);
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_q <= "1" when ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_a = ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_b else "0";

	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmpReg(REG,522)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmpReg_q <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_sticky_ena(REG,525)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_nor_q = "1") THEN
                ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_sticky_ena_q <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd(LOGICAL,526)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_a <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_sticky_ena_q;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_b <= en;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_q <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_a and ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_b;

	--yT3_uid85_sqrtPolynomialEvaluator(BITSELECT,84)@3
    yT3_uid85_sqrtPolynomialEvaluator_in <= FracX44dto0_uid37_fpSqrtTest_b;
    yT3_uid85_sqrtPolynomialEvaluator_b <= yT3_uid85_sqrtPolynomialEvaluator_in(44 downto 12);

	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_inputreg(DELAY,514)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => yT3_uid85_sqrtPolynomialEvaluator_b, xout => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt(COUNTER,516)
    -- every=1, low=0, high=5, step=1, init=1
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i = 4 THEN
                      ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_eq = '1') THEN
                        ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i - 5;
                    ELSE
                        ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i,3));


	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdreg(REG,517)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdreg_q <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux(MUX,518)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_s <= en;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux: PROCESS (ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_s, ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdreg_q, ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
                  WHEN "1" => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem(DUALMEM,515)
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_ia <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_inputreg_q;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_aa <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_ab <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_rdmux_q;
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 33,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 33,
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
        clocken1 => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_iq,
        address_a => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_aa,
        data_a => ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_ia
    );
    ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_reset0 <= areset;
        ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_q <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_iq(32 downto 0);

	--reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0(REG,170)@11
    reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_q <= ld_yT3_uid85_sqrtPolynomialEvaluator_b_to_reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator(MULT,109)@12
    prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_a),34)) * SIGNED(prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_b);
    prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_a <= reg_yT3_uid85_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_0_q;
                prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_b <= reg_s2_uid81_uid84_sqrtPolynomialEvaluator_0_to_prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_1_q;
                prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_pr,68));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_q <= prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid111_pT3_uid86_sqrtPolynomialEvaluator(BITSELECT,110)@15
    prodXYTruncFR_uid111_pT3_uid86_sqrtPolynomialEvaluator_in <= prodXY_uid110_pT3_uid86_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid111_pT3_uid86_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid111_pT3_uid86_sqrtPolynomialEvaluator_in(67 downto 34);

	--highBBits_uid88_sqrtPolynomialEvaluator(BITSELECT,87)@15
    highBBits_uid88_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid111_pT3_uid86_sqrtPolynomialEvaluator_b;
    highBBits_uid88_sqrtPolynomialEvaluator_b <= highBBits_uid88_sqrtPolynomialEvaluator_in(33 downto 1);

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor(LOGICAL,537)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_b <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_q <= not (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_a or ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_b);

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_mem_top(CONSTANT,533)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_mem_top_q <= "01000";

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp(LOGICAL,534)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_a <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_mem_top_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q);
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_q <= "1" when ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_a = ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_b else "0";

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmpReg(REG,535)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmpReg_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_sticky_ena(REG,538)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd(LOGICAL,539)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_a <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_a and ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_inputreg(DELAY,501)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addrTable_uid36_fpSqrtTest_q, xout => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt(COUNTER,529)
    -- every=1, low=0, high=8, step=1, init=1
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i = 7 THEN
                      ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq = '1') THEN
                        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i - 8;
                    ELSE
                        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i,4));


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdreg(REG,530)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux(MUX,531)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s <= en;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux: PROCESS (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s, ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q, ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q;
                  WHEN "1" => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem(DUALMEM,528)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_ia <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_inputreg_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_aa <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_ab <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 8,
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
        clocken1 => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_ia
    );
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0(REG,172)@11
    reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid65_sqrtTableGenerator_lutmem(DUALMEM,136)@12
    memoryC2_uid65_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid65_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid65_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid65_sqrtTableGenerator_lutmem_0_q;
    memoryC2_uid65_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 40,
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
        init_file => "fp_sqrt_double_s5_memoryC2_uid65_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid65_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid65_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid65_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid65_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid65_sqrtTableGenerator_lutmem_ia
    );
    memoryC2_uid65_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC2_uid65_sqrtTableGenerator_lutmem_q <= memoryC2_uid65_sqrtTableGenerator_lutmem_iq(39 downto 0);

	--reg_memoryC2_uid65_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid89_sqrtPolynomialEvaluator_0(REG,173)@14
    reg_memoryC2_uid65_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid89_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid65_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid89_sqrtPolynomialEvaluator_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid65_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid89_sqrtPolynomialEvaluator_0_q <= memoryC2_uid65_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid89_sqrtPolynomialEvaluator(ADD,88)@15
    sumAHighB_uid89_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((40 downto 40 => reg_memoryC2_uid65_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid89_sqrtPolynomialEvaluator_0_q(39)) & reg_memoryC2_uid65_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid89_sqrtPolynomialEvaluator_0_q);
    sumAHighB_uid89_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((40 downto 33 => highBBits_uid88_sqrtPolynomialEvaluator_b(32)) & highBBits_uid88_sqrtPolynomialEvaluator_b);
            sumAHighB_uid89_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid89_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid89_sqrtPolynomialEvaluator_b));
    sumAHighB_uid89_sqrtPolynomialEvaluator_q <= sumAHighB_uid89_sqrtPolynomialEvaluator_o(40 downto 0);


	--lowRangeB_uid87_sqrtPolynomialEvaluator(BITSELECT,86)@15
    lowRangeB_uid87_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid111_pT3_uid86_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid87_sqrtPolynomialEvaluator_b <= lowRangeB_uid87_sqrtPolynomialEvaluator_in(0 downto 0);

	--s3_uid87_uid90_sqrtPolynomialEvaluator(BITJOIN,89)@15
    s3_uid87_uid90_sqrtPolynomialEvaluator_q <= sumAHighB_uid89_sqrtPolynomialEvaluator_q & lowRangeB_uid87_sqrtPolynomialEvaluator_b;

	--yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,118)@15
    yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_in <= s3_uid87_uid90_sqrtPolynomialEvaluator_q;
    yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_b <= yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_in(41 downto 24);

	--reg_yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_9(REG,177)@15
    reg_yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_9_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_9_q <= yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor(LOGICAL,448)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_b <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_q <= not (ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_a or ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_b);

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_mem_top(CONSTANT,444)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_mem_top_q <= "01001";

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp(LOGICAL,445)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_a <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_mem_top_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_q);
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_q <= "1" when ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_a = ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_b else "0";

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmpReg(REG,446)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmpReg_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_sticky_ena(REG,449)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_nor_q = "1") THEN
                ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_sticky_ena_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd(LOGICAL,450)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_a <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_sticky_ena_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_b <= en;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_a and ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_b;

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_inputreg(DELAY,438)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_inputreg : dspba_delay
    GENERIC MAP ( width => 45, depth => 1 )
    PORT MAP ( xin => FracX44dto0_uid37_fpSqrtTest_b, xout => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt(COUNTER,440)
    -- every=1, low=0, high=9, step=1, init=1
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_i = 8 THEN
                      ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_eq = '1') THEN
                        ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_i <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_i - 9;
                    ELSE
                        ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_i <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_i,4));


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdreg(REG,441)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdreg_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux(MUX,442)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_s <= en;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux: PROCESS (ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_s, ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdreg_q, ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_q)
    BEGIN
            CASE ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_s IS
                  WHEN "0" => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdreg_q;
                  WHEN "1" => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem(DUALMEM,439)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_ia <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_inputreg_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_aa <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdreg_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_ab <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_rdmux_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 45,
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
        clocken1 => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_iq,
        address_a => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_aa,
        data_a => ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_ia
    );
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_reset0 <= areset;
        ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_iq(44 downto 0);

	--yT4_uid91_sqrtPolynomialEvaluator(BITSELECT,90)@15
    yT4_uid91_sqrtPolynomialEvaluator_in <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_replace_mem_q;
    yT4_uid91_sqrtPolynomialEvaluator_b <= yT4_uid91_sqrtPolynomialEvaluator_in(44 downto 5);

	--xBottomBits_uid118_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,117)@15
    xBottomBits_uid118_pT4_uid92_sqrtPolynomialEvaluator_in <= yT4_uid91_sqrtPolynomialEvaluator_b(12 downto 0);
    xBottomBits_uid118_pT4_uid92_sqrtPolynomialEvaluator_b <= xBottomBits_uid118_pT4_uid92_sqrtPolynomialEvaluator_in(12 downto 0);

	--GND(CONSTANT,0)
    GND_q <= "0";

	--pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator(BITJOIN,120)@15
    pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_q <= xBottomBits_uid118_pT4_uid92_sqrtPolynomialEvaluator_b & STD_LOGIC_VECTOR((3 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_7(REG,176)@15
    reg_pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_7_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_7_q <= pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid117_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,116)@15
    yBottomBits_uid117_pT4_uid92_sqrtPolynomialEvaluator_in <= s3_uid87_uid90_sqrtPolynomialEvaluator_q(14 downto 0);
    yBottomBits_uid117_pT4_uid92_sqrtPolynomialEvaluator_b <= yBottomBits_uid117_pT4_uid92_sqrtPolynomialEvaluator_in(14 downto 0);

	--spad_yBottomBits_uid117_uid120_pT4_uid92_sqrtPolynomialEvaluator(BITJOIN,119)@15
    spad_yBottomBits_uid117_uid120_pT4_uid92_sqrtPolynomialEvaluator_q <= GND_q & yBottomBits_uid117_pT4_uid92_sqrtPolynomialEvaluator_b;

	--pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator(BITJOIN,121)@15
    pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_q <= spad_yBottomBits_uid117_uid120_pT4_uid92_sqrtPolynomialEvaluator_q & STD_LOGIC_VECTOR((1 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_6(REG,175)@15
    reg_pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_6_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_6_q <= pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,115)@15
    xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_in <= yT4_uid91_sqrtPolynomialEvaluator_b;
    xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_b <= xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_in(39 downto 22);

	--reg_xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_4(REG,174)@15
    reg_xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_4_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_4_q <= xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma(CHAINMULTADD,140)@16
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a(0),19));
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a(1),19));
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_p(0) <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_l(0) * multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c(0);
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_p(1) <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_l(1) * multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c(1);
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_w(0) <= RESIZE(multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_p(0),38) + RESIZE(multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_p(1),38);
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_x(0) <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_w(0);
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_y(0) <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_x(0);
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a <= (others => (others => '0'));
            multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c <= (others => (others => '0'));
            multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop18Bits_uid116_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_4_q),18);
            multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid118_uid121_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_7_q),18);
            multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid117_uid122_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_6_q),18);
            multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_c(1) <= RESIZE(SIGNED(reg_yTop18Bits_uid119_pT4_uid92_sqrtPolynomialEvaluator_0_to_multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_9_q),18);
            IF (en = "1") THEN
                multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_s(0) <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_delay : dspba_delay
    GENERIC MAP (width => 37, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_s(0)(36 downto 0)), xout => multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,123)@19
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_in <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_cma_q;
    multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_b <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_in(36 downto 2);

	--highBBits_uid126_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,125)@19
    highBBits_uid126_pT4_uid92_sqrtPolynomialEvaluator_in <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_b;
    highBBits_uid126_pT4_uid92_sqrtPolynomialEvaluator_b <= highBBits_uid126_pT4_uid92_sqrtPolynomialEvaluator_in(34 downto 6);

	--yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,113)@15
    yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_in <= s3_uid87_uid90_sqrtPolynomialEvaluator_q;
    yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_b <= yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_in(41 downto 15);

	--reg_yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_1(REG,179)@15
    reg_yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_1_q <= yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,112)@15
    xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_in <= yT4_uid91_sqrtPolynomialEvaluator_b;
    xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_b <= xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_in(39 downto 13);

	--reg_xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_0(REG,178)@15
    reg_xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_0_q <= xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator(MULT,114)@16
    topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_a),28)) * SIGNED(topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_b);
    topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_a <= (others => '0');
            topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_b <= (others => '0');
            topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_a <= reg_xTop27Bits_uid113_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_0_q;
                topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_b <= reg_yTop27Bits_uid114_pT4_uid92_sqrtPolynomialEvaluator_0_to_topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_1_q;
                topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_q <= topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator(ADD,126)@19
    sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_q(53)) & topProd_uid115_pT4_uid92_sqrtPolynomialEvaluator_q);
    sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid126_pT4_uid92_sqrtPolynomialEvaluator_b(28)) & highBBits_uid126_pT4_uid92_sqrtPolynomialEvaluator_b);
            sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_b));
    sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_q <= sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_o(54 downto 0);


	--lowRangeB_uid125_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,124)@19
    lowRangeB_uid125_pT4_uid92_sqrtPolynomialEvaluator_in <= multSumOfTwo18_uid120_pT4_uid92_sqrtPolynomialEvaluator_b(5 downto 0);
    lowRangeB_uid125_pT4_uid92_sqrtPolynomialEvaluator_b <= lowRangeB_uid125_pT4_uid92_sqrtPolynomialEvaluator_in(5 downto 0);

	--add0_uid125_uid128_pT4_uid92_sqrtPolynomialEvaluator(BITJOIN,127)@19
    add0_uid125_uid128_pT4_uid92_sqrtPolynomialEvaluator_q <= sumAHighB_uid127_pT4_uid92_sqrtPolynomialEvaluator_q & lowRangeB_uid125_pT4_uid92_sqrtPolynomialEvaluator_b;

	--R_uid129_pT4_uid92_sqrtPolynomialEvaluator(BITSELECT,128)@19
    R_uid129_pT4_uid92_sqrtPolynomialEvaluator_in <= add0_uid125_uid128_pT4_uid92_sqrtPolynomialEvaluator_q(59 downto 0);
    R_uid129_pT4_uid92_sqrtPolynomialEvaluator_b <= R_uid129_pT4_uid92_sqrtPolynomialEvaluator_in(59 downto 17);

	--reg_R_uid129_pT4_uid92_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_1(REG,181)@19
    reg_R_uid129_pT4_uid92_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid129_pT4_uid92_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_1_q <= "0000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid129_pT4_uid92_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_1_q <= R_uid129_pT4_uid92_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor(LOGICAL,511)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_b <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_q <= not (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_a or ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_b);

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_mem_top(CONSTANT,507)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_mem_top_q <= "01100";

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp(LOGICAL,508)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_a <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_mem_top_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q);
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_q <= "1" when ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_a = ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_b else "0";

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmpReg(REG,509)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmpReg_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_sticky_ena(REG,512)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd(LOGICAL,513)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_a <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_a and ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt(COUNTER,503)
    -- every=1, low=0, high=12, step=1, init=1
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i = 11 THEN
                      ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq = '1') THEN
                        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i - 12;
                    ELSE
                        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i,4));


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdreg(REG,504)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux(MUX,505)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s <= en;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux: PROCESS (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s, ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q, ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q;
                  WHEN "1" => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem(DUALMEM,502)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_ia <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_inputreg_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_aa <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_ab <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 8,
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
        clocken1 => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_ia
    );
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0(REG,157)@15
    reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid63_sqrtTableGenerator_lutmem(DUALMEM,135)@16
    memoryC1_uid63_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid63_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid63_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_q;
    memoryC1_uid63_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 9,
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
        init_file => "fp_sqrt_double_s5_memoryC1_uid63_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid63_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid63_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid63_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid63_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid63_sqrtTableGenerator_lutmem_ia
    );
    memoryC1_uid63_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC1_uid63_sqrtTableGenerator_lutmem_q <= memoryC1_uid63_sqrtTableGenerator_lutmem_iq(8 downto 0);

	--reg_memoryC1_uid63_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_1(REG,160)@18
    reg_memoryC1_uid63_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid63_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_1_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid63_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_1_q <= memoryC1_uid63_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid62_sqrtTableGenerator_lutmem(DUALMEM,134)@16
    memoryC1_uid62_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid62_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid62_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_q;
    memoryC1_uid62_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 40,
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
        init_file => "fp_sqrt_double_s5_memoryC1_uid62_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid62_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid62_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid62_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid62_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid62_sqrtTableGenerator_lutmem_ia
    );
    memoryC1_uid62_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC1_uid62_sqrtTableGenerator_lutmem_q <= memoryC1_uid62_sqrtTableGenerator_lutmem_iq(39 downto 0);

	--reg_memoryC1_uid62_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_0(REG,159)@18
    reg_memoryC1_uid62_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid62_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid62_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_0_q <= memoryC1_uid62_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid64_sqrtTableGenerator(BITJOIN,63)@19
    os_uid64_sqrtTableGenerator_q <= reg_memoryC1_uid63_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_1_q & reg_memoryC1_uid62_sqrtTableGenerator_lutmem_0_to_os_uid64_sqrtTableGenerator_0_q;

	--rndBit_uid93_sqrtPolynomialEvaluator(CONSTANT,92)
    rndBit_uid93_sqrtPolynomialEvaluator_q <= "01";

	--cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator(BITJOIN,93)@19
    cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_q <= os_uid64_sqrtTableGenerator_q & rndBit_uid93_sqrtPolynomialEvaluator_q;

	--reg_cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_0(REG,180)@19
    reg_cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_0_q <= "000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_0_q <= cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ts4_uid95_sqrtPolynomialEvaluator(ADD,94)@20
    ts4_uid95_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((51 downto 51 => reg_cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_0_q(50)) & reg_cIncludingRoundingBit_uid94_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_0_q);
    ts4_uid95_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((51 downto 43 => reg_R_uid129_pT4_uid92_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_1_q(42)) & reg_R_uid129_pT4_uid92_sqrtPolynomialEvaluator_0_to_ts4_uid95_sqrtPolynomialEvaluator_1_q);
            ts4_uid95_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(ts4_uid95_sqrtPolynomialEvaluator_a) + SIGNED(ts4_uid95_sqrtPolynomialEvaluator_b));
    ts4_uid95_sqrtPolynomialEvaluator_q <= ts4_uid95_sqrtPolynomialEvaluator_o(51 downto 0);


	--s4_uid96_sqrtPolynomialEvaluator(BITSELECT,95)@20
    s4_uid96_sqrtPolynomialEvaluator_in <= ts4_uid95_sqrtPolynomialEvaluator_q;
    s4_uid96_sqrtPolynomialEvaluator_b <= s4_uid96_sqrtPolynomialEvaluator_in(51 downto 1);

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1(BITSELECT,144)@20
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_in <= STD_LOGIC_VECTOR((53 downto 51 => s4_uid96_sqrtPolynomialEvaluator_b(50)) & s4_uid96_sqrtPolynomialEvaluator_b);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_b <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_in(53 downto 27);

	--reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_1(REG,187)@20
    reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_1_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor(LOGICAL,498)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_b <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_sticky_ena_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_q <= not (ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_a or ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_b);

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_mem_top(CONSTANT,494)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_mem_top_q <= "01110";

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp(LOGICAL,495)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_a <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_mem_top_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_q);
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_q <= "1" when ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_a = ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_b else "0";

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmpReg(REG,496)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmpReg_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_sticky_ena(REG,499)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_nor_q = "1") THEN
                ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_sticky_ena_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd(LOGICAL,500)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_a <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_sticky_ena_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_b <= en;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_a and ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_b;

	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt(COUNTER,490)
    -- every=1, low=0, high=14, step=1, init=1
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_i = 13 THEN
                      ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_eq = '1') THEN
                        ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_i <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_i - 14;
                    ELSE
                        ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_i <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_i,4));


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdreg(REG,491)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdreg_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux(MUX,492)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_s <= en;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux: PROCESS (ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_s, ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdreg_q, ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdreg_q;
                  WHEN "1" => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem(DUALMEM,489)
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_ia <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_yT4_uid91_sqrtPolynomialEvaluator_a_inputreg_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_aa <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdreg_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_ab <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_rdmux_q;
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 45,
        widthad_b => 4,
        numwords_b => 15,
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
        clocken1 => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_iq,
        address_a => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_aa,
        data_a => ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_ia
    );
    ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_reset0 <= areset;
        ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_q <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_iq(44 downto 0);

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1(BITSELECT,142)@20
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_in <= STD_LOGIC_VECTOR("000000000" & ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_q);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_b <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_in(53 downto 27);

	--reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_0(REG,184)@20
    reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1(MULT,148)@21
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_pr <= signed(resize(UNSIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_a),28)) * SIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_b);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_a <= (others => '0');
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_b <= (others => '0');
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_a <= reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_0_q;
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_b <= reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_1_q;
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_pr,54));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_a(DELAY,349)@24
    ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_a : dspba_delay
    GENERIC MAP ( width => 54, depth => 2 )
    PORT MAP ( xin => prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q, xout => ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2(BITSHIFT,152)@26
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_q_int <= ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b1_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_a_q & "000000000000000000000000000000000000000000000000000000";
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_q_int(107 downto 0);

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0(BITSELECT,141)@20
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_in <= ld_FracX44dto0_uid37_fpSqrtTest_b_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_a_replace_mem_q(26 downto 0);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_b <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_in(26 downto 0);

	--reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_0(REG,182)@20
    reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1(MULT,147)@21
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_pr <= signed(resize(UNSIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_a),28)) * SIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_b);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_a <= (others => '0');
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_b <= (others => '0');
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_a <= reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_0_q;
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_b <= reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_1_q;
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_pr,54));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0(BITSELECT,143)@20
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_in <= s4_uid96_sqrtPolynomialEvaluator_b(26 downto 0);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_b <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_in(26 downto 0);

	--reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_1(REG,183)@20
    reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_1_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0(MULT,146)@21
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_pr <= UNSIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_a) * UNSIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_b);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_a <= (others => '0');
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_b <= (others => '0');
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_a <= reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_1_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_0_q;
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_b <= reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_1_q;
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_s1 <= STD_LOGIC_VECTOR(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0(ADD,149)@24
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_a <= STD_LOGIC_VECTOR('0' & "00" & prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a1_b0_q);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_b <= STD_LOGIC_VECTOR((56 downto 54 => prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_q(53)) & prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b1_q);
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_a) + SIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_b));
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_o(55 downto 0);


	--ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_a(DELAY,348)@24
    ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_a : dspba_delay
    GENERIC MAP ( width => 56, depth => 1 )
    PORT MAP ( xin => prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_q, xout => ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1(BITSHIFT,151)@25
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_q_int <= ld_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_addcol_1_add_0_0_q_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_a_q & "000000000000000000000000000";
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_q_int(82 downto 0);

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0(MULT,145)@21
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_pr <= UNSIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_a) * UNSIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_b);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_a <= (others => '0');
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_b <= (others => '0');
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_a <= reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_0_q;
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_b <= reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_b_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_1_q;
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_s1 <= STD_LOGIC_VECTOR(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0(BITSHIFT,150)@24
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_q_int <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_a0_b0_q;
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_q_int(53 downto 0);

	--reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_0(REG,188)@24
    reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_0_q <= "000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0(ADD,153)@25
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_a <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000000" & reg_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_0_0_to_prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_0_q);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_b <= STD_LOGIC_VECTOR((84 downto 83 => prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_q(82)) & prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_1_q);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_a) + SIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_b));
        END IF;
    END PROCESS;
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_o(83 downto 0);


	--prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0(ADD,154)@26
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_a <= STD_LOGIC_VECTOR((108 downto 84 => prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_q(83)) & prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_0_0_q);
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_b <= STD_LOGIC_VECTOR((108 downto 108 => prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_q(107)) & prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_align_2_q);
            prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_a) + SIGNED(prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_b));
    prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_q <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_o(108 downto 0);


	--prodXYTruncFR_uid131_pT5_uid98_sqrtPolynomialEvaluator(BITSELECT,130)@26
    prodXYTruncFR_uid131_pT5_uid98_sqrtPolynomialEvaluator_in <= prodXY_uid130_pT5_uid98_sqrtPolynomialEvaluator_result_add_1_0_q(95 downto 0);
    prodXYTruncFR_uid131_pT5_uid98_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid131_pT5_uid98_sqrtPolynomialEvaluator_in(95 downto 44);

	--highBBits_uid100_sqrtPolynomialEvaluator(BITSELECT,99)@26
    highBBits_uid100_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid131_pT5_uid98_sqrtPolynomialEvaluator_b;
    highBBits_uid100_sqrtPolynomialEvaluator_b <= highBBits_uid100_sqrtPolynomialEvaluator_in(51 downto 2);

	--reg_highBBits_uid100_sqrtPolynomialEvaluator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_1(REG,196)@26
    reg_highBBits_uid100_sqrtPolynomialEvaluator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid100_sqrtPolynomialEvaluator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_highBBits_uid100_sqrtPolynomialEvaluator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_1_q <= highBBits_uid100_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor(LOGICAL,472)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_b <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_sticky_ena_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_q <= not (ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_a or ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_b);

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_mem_top(CONSTANT,468)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_mem_top_q <= "010011";

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp(LOGICAL,469)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_a <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_mem_top_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_q);
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_q <= "1" when ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_a = ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_b else "0";

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmpReg(REG,470)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmpReg_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_sticky_ena(REG,473)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_nor_q = "1") THEN
                ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_sticky_ena_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd(LOGICAL,474)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_a <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_sticky_ena_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_b <= en;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_a and ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_b;

	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt(COUNTER,464)
    -- every=1, low=0, high=19, step=1, init=1
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_i = 18 THEN
                      ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_i - 19;
                    ELSE
                        ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_i <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_i,5));


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg(REG,465)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux(MUX,466)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_s <= en;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux: PROCESS (ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_s, ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg_q, ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem(DUALMEM,463)
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_ia <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_inputreg_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_aa <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_ab <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 20,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 20,
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
        clocken1 => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_iq,
        address_a => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_aa,
        data_a => ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_ia
    );
    ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_iq(7 downto 0);

	--memoryC0_uid60_sqrtTableGenerator_lutmem(DUALMEM,133)@23
    memoryC0_uid60_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid60_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid60_sqrtTableGenerator_lutmem_ab <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_mem_q;
    memoryC0_uid60_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 17,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 17,
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
        init_file => "fp_sqrt_double_s5_memoryC0_uid60_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid60_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid60_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid60_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid60_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid60_sqrtTableGenerator_lutmem_ia
    );
    memoryC0_uid60_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC0_uid60_sqrtTableGenerator_lutmem_q <= memoryC0_uid60_sqrtTableGenerator_lutmem_iq(16 downto 0);

	--reg_memoryC0_uid60_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_1(REG,194)@25
    reg_memoryC0_uid60_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid60_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_1_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid60_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_1_q <= memoryC0_uid60_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor(LOGICAL,550)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_b <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_q <= not (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_a or ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_b);

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena(REG,551)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd(LOGICAL,552)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_a <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_a and ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem(DUALMEM,541)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ia <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid62_sqrtTableGenerator_lutmem_0_a_inputreg_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_aa <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdreg_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ab <= ld_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid60_sqrtTableGenerator_lutmem_0_q_to_memoryC0_uid60_sqrtTableGenerator_lutmem_a_replace_rdmux_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 20,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 20,
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
        clocken1 => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ia
    );
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0(REG,191)@22
    reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid59_sqrtTableGenerator_lutmem(DUALMEM,132)@23
    memoryC0_uid59_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid59_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid59_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_q;
    memoryC0_uid59_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 40,
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
        init_file => "fp_sqrt_double_s5_memoryC0_uid59_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid59_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid59_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid59_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid59_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid59_sqrtTableGenerator_lutmem_ia
    );
    memoryC0_uid59_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC0_uid59_sqrtTableGenerator_lutmem_q <= memoryC0_uid59_sqrtTableGenerator_lutmem_iq(39 downto 0);

	--reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_0(REG,193)@25
    reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_0_q <= memoryC0_uid59_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid61_sqrtTableGenerator(BITJOIN,60)@26
    os_uid61_sqrtTableGenerator_q <= reg_memoryC0_uid60_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_1_q & reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_os_uid61_sqrtTableGenerator_0_q;

	--reg_os_uid61_sqrtTableGenerator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_0(REG,195)@26
    reg_os_uid61_sqrtTableGenerator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_os_uid61_sqrtTableGenerator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_0_q <= "000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_os_uid61_sqrtTableGenerator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_0_q <= os_uid61_sqrtTableGenerator_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid101_sqrtPolynomialEvaluator(ADD,100)@27
    sumAHighB_uid101_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((57 downto 57 => reg_os_uid61_sqrtTableGenerator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_0_q(56)) & reg_os_uid61_sqrtTableGenerator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_0_q);
    sumAHighB_uid101_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((57 downto 50 => reg_highBBits_uid100_sqrtPolynomialEvaluator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_1_q(49)) & reg_highBBits_uid100_sqrtPolynomialEvaluator_0_to_sumAHighB_uid101_sqrtPolynomialEvaluator_1_q);
            sumAHighB_uid101_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid101_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid101_sqrtPolynomialEvaluator_b));
    sumAHighB_uid101_sqrtPolynomialEvaluator_q <= sumAHighB_uid101_sqrtPolynomialEvaluator_o(57 downto 0);


	--lowRangeB_uid99_sqrtPolynomialEvaluator(BITSELECT,98)@26
    lowRangeB_uid99_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid131_pT5_uid98_sqrtPolynomialEvaluator_b(1 downto 0);
    lowRangeB_uid99_sqrtPolynomialEvaluator_b <= lowRangeB_uid99_sqrtPolynomialEvaluator_in(1 downto 0);

	--reg_lowRangeB_uid99_sqrtPolynomialEvaluator_0_to_s5_uid99_uid102_sqrtPolynomialEvaluator_0(REG,197)@26
    reg_lowRangeB_uid99_sqrtPolynomialEvaluator_0_to_s5_uid99_uid102_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_lowRangeB_uid99_sqrtPolynomialEvaluator_0_to_s5_uid99_uid102_sqrtPolynomialEvaluator_0_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_lowRangeB_uid99_sqrtPolynomialEvaluator_0_to_s5_uid99_uid102_sqrtPolynomialEvaluator_0_q <= lowRangeB_uid99_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--s5_uid99_uid102_sqrtPolynomialEvaluator(BITJOIN,101)@27
    s5_uid99_uid102_sqrtPolynomialEvaluator_q <= sumAHighB_uid101_sqrtPolynomialEvaluator_q & reg_lowRangeB_uid99_sqrtPolynomialEvaluator_0_to_s5_uid99_uid102_sqrtPolynomialEvaluator_0_q;

	--fracR_uid39_fpSqrtTest(BITSELECT,38)@27
    fracR_uid39_fpSqrtTest_in <= s5_uid99_uid102_sqrtPolynomialEvaluator_q(56 downto 0);
    fracR_uid39_fpSqrtTest_b <= fracR_uid39_fpSqrtTest_in(56 downto 5);

	--reg_fracR_uid39_fpSqrtTest_0_to_fracRPostExc_uid55_fpSqrtTest_3(REG,198)@27
    reg_fracR_uid39_fpSqrtTest_0_to_fracRPostExc_uid55_fpSqrtTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracR_uid39_fpSqrtTest_0_to_fracRPostExc_uid55_fpSqrtTest_3_q <= "0000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracR_uid39_fpSqrtTest_0_to_fracRPostExc_uid55_fpSqrtTest_3_q <= fracR_uid39_fpSqrtTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor(LOGICAL,409)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_notEnable_q;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_b <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_sticky_ena_q;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_q <= not (ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_a or ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_b);

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_sticky_ena(REG,410)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_nor_q = "1") THEN
                ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_sticky_ena_q <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd(LOGICAL,411)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_a <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_sticky_ena_q;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_b <= en;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_q <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_a and ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_b;

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_inputreg(DELAY,399)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => fracSel_uid47_fpSqrtTest_q, xout => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem(DUALMEM,400)
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_ia <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_inputreg_q;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_aa <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdreg_q;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_ab <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_rdmux_q;
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 5,
        numwords_a => 24,
        width_b => 2,
        widthad_b => 5,
        numwords_b => 24,
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
        clocken1 => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_iq,
        address_a => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_aa,
        data_a => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_ia
    );
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_reset0 <= areset;
        ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_q <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_iq(1 downto 0);

	--fracRPostExc_uid55_fpSqrtTest(MUX,54)@28
    fracRPostExc_uid55_fpSqrtTest_s <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_replace_mem_q;
    fracRPostExc_uid55_fpSqrtTest: PROCESS (fracRPostExc_uid55_fpSqrtTest_s, en, cstAllZWF_uid10_fpSqrtTest_q, reg_fracR_uid39_fpSqrtTest_0_to_fracRPostExc_uid55_fpSqrtTest_3_q, cstAllZWF_uid10_fpSqrtTest_q, fracNaN_uid52_fpSqrtTest_q)
    BEGIN
            CASE fracRPostExc_uid55_fpSqrtTest_s IS
                  WHEN "00" => fracRPostExc_uid55_fpSqrtTest_q <= cstAllZWF_uid10_fpSqrtTest_q;
                  WHEN "01" => fracRPostExc_uid55_fpSqrtTest_q <= reg_fracR_uid39_fpSqrtTest_0_to_fracRPostExc_uid55_fpSqrtTest_3_q;
                  WHEN "10" => fracRPostExc_uid55_fpSqrtTest_q <= cstAllZWF_uid10_fpSqrtTest_q;
                  WHEN "11" => fracRPostExc_uid55_fpSqrtTest_q <= fracNaN_uid52_fpSqrtTest_q;
                  WHEN OTHERS => fracRPostExc_uid55_fpSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RSqrt_uid57_fpSqrtTest(BITJOIN,56)@28
    RSqrt_uid57_fpSqrtTest_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_replace_mem_q & ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_q & fracRPostExc_uid55_fpSqrtTest_q;

	--xOut(GPOUT,4)@28
    q <= RSqrt_uid57_fpSqrtTest_q;


end normal;
