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

-- VHDL created from fp_sqrt_s5
-- VHDL created on Thu Mar  7 14:37:27 2013


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

entity fp_sqrt_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_sqrt_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid9_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid10_fpSqrtTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid11_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal sBias_uid25_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal sBiasM1_uid28_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal expRMux_uid33_fpSqrtTest_s : std_logic_vector (0 downto 0);
    signal expRMux_uid33_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal fracNaN_uid52_fpSqrtTest_q : std_logic_vector (22 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_a : std_logic_vector (11 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_pr : SIGNED (24 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_q : std_logic_vector (23 downto 0);
    signal prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_a : std_logic_vector (15 downto 0);
    signal prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (22 downto 0);
    signal prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_pr : SIGNED (39 downto 0);
    signal prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_q : std_logic_vector (38 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_fracSelIn_uid46_fpSqrtTest_0_to_fracSel_uid47_fpSqrtTest_0_q : std_logic_vector (3 downto 0);
    signal reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid61_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid62_sqrtPolynomialEvaluator_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid61_sqrtTableGenerator_lutmem_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_1_q : std_logic_vector (11 downto 0);
    signal reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid60_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid66_sqrtPolynomialEvaluator_0_q : std_logic_vector (20 downto 0);
    signal reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid64_uid67_sqrtPolynomialEvaluator_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_1_q : std_logic_vector (22 downto 0);
    signal reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid72_sqrtPolynomialEvaluator_0_q : std_logic_vector (28 downto 0);
    signal ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_q : std_logic_vector (22 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_q : std_logic_vector (1 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_q : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q : signal is true;
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_reset0 : std_logic;
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq : std_logic;
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal expX_uid6_fpSqrtTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpSqrtTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid7_fpSqrtTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid7_fpSqrtTest_b : std_logic_vector (22 downto 0);
    signal signX_uid8_fpSqrtTest_in : std_logic_vector (31 downto 0);
    signal signX_uid8_fpSqrtTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_a : std_logic_vector(8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_b : std_logic_vector(8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_o : std_logic_vector (8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_q : std_logic_vector (8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_a : std_logic_vector(8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_b : std_logic_vector(8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_o : std_logic_vector (8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_q : std_logic_vector (8 downto 0);
    signal minInf_uid43_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracSel_uid47_fpSqrtTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid51_fpSqrtTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid51_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal negZero_uid56_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal negZero_uid56_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal negZero_uid56_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid79_pT2_uid69_sqrtPolynomialEvaluator_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid79_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (23 downto 0);
    signal FracX15dto0_uid37_fpSqrtTest_in : std_logic_vector (15 downto 0);
    signal FracX15dto0_uid37_fpSqrtTest_b : std_logic_vector (15 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal expX0_uid31_fpSqrtTest_in : std_logic_vector (0 downto 0);
    signal expX0_uid31_fpSqrtTest_b : std_logic_vector (0 downto 0);
    signal fracXAddr_uid35_fpSqrtTest_in : std_logic_vector (22 downto 0);
    signal fracXAddr_uid35_fpSqrtTest_b : std_logic_vector (6 downto 0);
    signal InvSignX_uid40_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid40_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid23_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid23_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid19_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid19_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid22_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid22_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expREven_uid27_fpSqrtTest_in : std_logic_vector (8 downto 0);
    signal expREven_uid27_fpSqrtTest_b : std_logic_vector (7 downto 0);
    signal expROdd_uid30_fpSqrtTest_in : std_logic_vector (8 downto 0);
    signal expROdd_uid30_fpSqrtTest_b : std_logic_vector (7 downto 0);
    signal lowRangeB_uid64_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid64_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid65_sqrtPolynomialEvaluator_in : std_logic_vector (12 downto 0);
    signal highBBits_uid65_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid70_sqrtPolynomialEvaluator_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid70_sqrtPolynomialEvaluator_b : std_logic_vector (1 downto 0);
    signal highBBits_uid71_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal highBBits_uid71_sqrtPolynomialEvaluator_b : std_logic_vector (21 downto 0);
    signal yT1_uid62_sqrtPolynomialEvaluator_in : std_logic_vector (15 downto 0);
    signal yT1_uid62_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal expOddSelect_uid32_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal expOddSelect_uid32_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal addrTable_uid36_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal exc_N_uid20_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid20_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid20_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid66_sqrtPolynomialEvaluator_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid66_sqrtPolynomialEvaluator_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid66_sqrtPolynomialEvaluator_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid66_sqrtPolynomialEvaluator_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid72_sqrtPolynomialEvaluator_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid72_sqrtPolynomialEvaluator_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid72_sqrtPolynomialEvaluator_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid72_sqrtPolynomialEvaluator_q : std_logic_vector (29 downto 0);
    signal InvExc_N_uid21_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid21_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal s1_uid64_uid67_sqrtPolynomialEvaluator_q : std_logic_vector (22 downto 0);
    signal s2_uid70_uid73_sqrtPolynomialEvaluator_q : std_logic_vector (31 downto 0);
    signal exc_R_uid24_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracR_uid39_fpSqrtTest_in : std_logic_vector (28 downto 0);
    signal fracR_uid39_fpSqrtTest_b : std_logic_vector (22 downto 0);
    signal minReg_uid42_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal minReg_uid42_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal minReg_uid42_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid55_fpSqrtTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid55_fpSqrtTest_q : std_logic_vector (22 downto 0);
    signal excRNaN_uid44_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal RSqrt_uid57_fpSqrtTest_q : std_logic_vector (31 downto 0);
    signal join_uid45_fpSqrtTest_q : std_logic_vector (2 downto 0);
    signal fracSelIn_uid46_fpSqrtTest_q : std_logic_vector (3 downto 0);
begin


	--GND(CONSTANT,0)

	--xIn(GPIN,3)@0

	--signX_uid8_fpSqrtTest(BITSELECT,7)@0
    signX_uid8_fpSqrtTest_in <= a;
    signX_uid8_fpSqrtTest_b <= signX_uid8_fpSqrtTest_in(31 downto 31);

	--cstAllZWE_uid11_fpSqrtTest(CONSTANT,10)
    cstAllZWE_uid11_fpSqrtTest_q <= "00000000";

	--expX_uid6_fpSqrtTest(BITSELECT,5)@0
    expX_uid6_fpSqrtTest_in <= a(30 downto 0);
    expX_uid6_fpSqrtTest_b <= expX_uid6_fpSqrtTest_in(30 downto 23);

	--expXIsZero_uid13_fpSqrtTest(LOGICAL,12)@0
    expXIsZero_uid13_fpSqrtTest_a <= expX_uid6_fpSqrtTest_b;
    expXIsZero_uid13_fpSqrtTest_b <= cstAllZWE_uid11_fpSqrtTest_q;
    expXIsZero_uid13_fpSqrtTest_q <= "1" when expXIsZero_uid13_fpSqrtTest_a = expXIsZero_uid13_fpSqrtTest_b else "0";

	--negZero_uid56_fpSqrtTest(LOGICAL,55)@0
    negZero_uid56_fpSqrtTest_a <= expXIsZero_uid13_fpSqrtTest_q;
    negZero_uid56_fpSqrtTest_b <= signX_uid8_fpSqrtTest_b;
    negZero_uid56_fpSqrtTest_q <= negZero_uid56_fpSqrtTest_a and negZero_uid56_fpSqrtTest_b;

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c(DELAY,149)@0
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => negZero_uid56_fpSqrtTest_q, xout => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable(LOGICAL,192)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable_a <= en;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable_q <= not ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable_a;

	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor(LOGICAL,193)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_a <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_b <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_q <= not (ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_a or ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_b);

	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_mem_top(CONSTANT,189)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_mem_top_q <= "0111";

	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp(LOGICAL,190)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_a <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_mem_top_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_q);
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_q <= "1" when ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_a = ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_b else "0";

	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmpReg(REG,191)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmpReg_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena(REG,194)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd(LOGICAL,195)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_a <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_sticky_ena_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_a and ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_enaAnd_b;

	--cstAllOWE_uid9_fpSqrtTest(CONSTANT,8)
    cstAllOWE_uid9_fpSqrtTest_q <= "11111111";

	--sBiasM1_uid28_fpSqrtTest(CONSTANT,27)
    sBiasM1_uid28_fpSqrtTest_q <= "01111110";

	--expOddSig_uid29_fpSqrtTest(ADD,28)@0
    expOddSig_uid29_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expOddSig_uid29_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBiasM1_uid28_fpSqrtTest_q);
            expOddSig_uid29_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid29_fpSqrtTest_a) + UNSIGNED(expOddSig_uid29_fpSqrtTest_b));
    expOddSig_uid29_fpSqrtTest_q <= expOddSig_uid29_fpSqrtTest_o(8 downto 0);


	--expROdd_uid30_fpSqrtTest(BITSELECT,29)@0
    expROdd_uid30_fpSqrtTest_in <= expOddSig_uid29_fpSqrtTest_q;
    expROdd_uid30_fpSqrtTest_b <= expROdd_uid30_fpSqrtTest_in(8 downto 1);

	--sBias_uid25_fpSqrtTest(CONSTANT,24)
    sBias_uid25_fpSqrtTest_q <= "01111111";

	--expEvenSig_uid26_fpSqrtTest(ADD,25)@0
    expEvenSig_uid26_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expEvenSig_uid26_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBias_uid25_fpSqrtTest_q);
            expEvenSig_uid26_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid26_fpSqrtTest_a) + UNSIGNED(expEvenSig_uid26_fpSqrtTest_b));
    expEvenSig_uid26_fpSqrtTest_q <= expEvenSig_uid26_fpSqrtTest_o(8 downto 0);


	--expREven_uid27_fpSqrtTest(BITSELECT,26)@0
    expREven_uid27_fpSqrtTest_in <= expEvenSig_uid26_fpSqrtTest_q;
    expREven_uid27_fpSqrtTest_b <= expREven_uid27_fpSqrtTest_in(8 downto 1);

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


	--InvExc_N_uid21_fpSqrtTest(LOGICAL,20)@0
    InvExc_N_uid21_fpSqrtTest_a <= exc_N_uid20_fpSqrtTest_q;
    InvExc_N_uid21_fpSqrtTest_q <= not InvExc_N_uid21_fpSqrtTest_a;

	--cstAllZWF_uid10_fpSqrtTest(CONSTANT,9)
    cstAllZWF_uid10_fpSqrtTest_q <= "00000000000000000000000";

	--fracX_uid7_fpSqrtTest(BITSELECT,6)@0
    fracX_uid7_fpSqrtTest_in <= a(22 downto 0);
    fracX_uid7_fpSqrtTest_b <= fracX_uid7_fpSqrtTest_in(22 downto 0);

	--fracXIsZero_uid17_fpSqrtTest(LOGICAL,16)@0
    fracXIsZero_uid17_fpSqrtTest_a <= fracX_uid7_fpSqrtTest_b;
    fracXIsZero_uid17_fpSqrtTest_b <= cstAllZWF_uid10_fpSqrtTest_q;
    fracXIsZero_uid17_fpSqrtTest_q <= "1" when fracXIsZero_uid17_fpSqrtTest_a = fracXIsZero_uid17_fpSqrtTest_b else "0";

	--expXIsMax_uid15_fpSqrtTest(LOGICAL,14)@0
    expXIsMax_uid15_fpSqrtTest_a <= expX_uid6_fpSqrtTest_b;
    expXIsMax_uid15_fpSqrtTest_b <= cstAllOWE_uid9_fpSqrtTest_q;
    expXIsMax_uid15_fpSqrtTest_q <= "1" when expXIsMax_uid15_fpSqrtTest_a = expXIsMax_uid15_fpSqrtTest_b else "0";

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
    minReg_uid42_fpSqrtTest_q <= minReg_uid42_fpSqrtTest_a and minReg_uid42_fpSqrtTest_b;

	--minInf_uid43_fpSqrtTest(LOGICAL,42)@0
    minInf_uid43_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    minInf_uid43_fpSqrtTest_b <= signX_uid8_fpSqrtTest_b;
    minInf_uid43_fpSqrtTest_q <= minInf_uid43_fpSqrtTest_a and minInf_uid43_fpSqrtTest_b;

	--InvFracXIsZero_uid19_fpSqrtTest(LOGICAL,18)@0
    InvFracXIsZero_uid19_fpSqrtTest_a <= fracXIsZero_uid17_fpSqrtTest_q;
    InvFracXIsZero_uid19_fpSqrtTest_q <= not InvFracXIsZero_uid19_fpSqrtTest_a;

	--exc_N_uid20_fpSqrtTest(LOGICAL,19)@0
    exc_N_uid20_fpSqrtTest_a <= expXIsMax_uid15_fpSqrtTest_q;
    exc_N_uid20_fpSqrtTest_b <= InvFracXIsZero_uid19_fpSqrtTest_q;
    exc_N_uid20_fpSqrtTest_q <= exc_N_uid20_fpSqrtTest_a and exc_N_uid20_fpSqrtTest_b;

	--excRNaN_uid44_fpSqrtTest(LOGICAL,43)@0
    excRNaN_uid44_fpSqrtTest_a <= exc_N_uid20_fpSqrtTest_q;
    excRNaN_uid44_fpSqrtTest_b <= minInf_uid43_fpSqrtTest_q;
    excRNaN_uid44_fpSqrtTest_c <= minReg_uid42_fpSqrtTest_q;
    excRNaN_uid44_fpSqrtTest_q <= excRNaN_uid44_fpSqrtTest_a or excRNaN_uid44_fpSqrtTest_b or excRNaN_uid44_fpSqrtTest_c;

	--InvSignX_uid40_fpSqrtTest(LOGICAL,39)@0
    InvSignX_uid40_fpSqrtTest_a <= signX_uid8_fpSqrtTest_b;
    InvSignX_uid40_fpSqrtTest_q <= not InvSignX_uid40_fpSqrtTest_a;

	--inInfAndNotNeg_uid41_fpSqrtTest(LOGICAL,40)@0
    inInfAndNotNeg_uid41_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    inInfAndNotNeg_uid41_fpSqrtTest_b <= InvSignX_uid40_fpSqrtTest_q;
    inInfAndNotNeg_uid41_fpSqrtTest_q <= inInfAndNotNeg_uid41_fpSqrtTest_a and inInfAndNotNeg_uid41_fpSqrtTest_b;

	--join_uid45_fpSqrtTest(BITJOIN,44)@0
    join_uid45_fpSqrtTest_q <= excRNaN_uid44_fpSqrtTest_q & inInfAndNotNeg_uid41_fpSqrtTest_q & expXIsZero_uid13_fpSqrtTest_q;

	--fracSelIn_uid46_fpSqrtTest(BITJOIN,45)@0
    fracSelIn_uid46_fpSqrtTest_q <= signX_uid8_fpSqrtTest_b & join_uid45_fpSqrtTest_q;

	--reg_fracSelIn_uid46_fpSqrtTest_0_to_fracSel_uid47_fpSqrtTest_0(REG,83)@0
    reg_fracSelIn_uid46_fpSqrtTest_0_to_fracSel_uid47_fpSqrtTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracSelIn_uid46_fpSqrtTest_0_to_fracSel_uid47_fpSqrtTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracSelIn_uid46_fpSqrtTest_0_to_fracSel_uid47_fpSqrtTest_0_q <= fracSelIn_uid46_fpSqrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--fracSel_uid47_fpSqrtTest(LOOKUP,46)@1
    fracSel_uid47_fpSqrtTest: PROCESS (reg_fracSelIn_uid46_fpSqrtTest_0_to_fracSel_uid47_fpSqrtTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_fracSelIn_uid46_fpSqrtTest_0_to_fracSel_uid47_fpSqrtTest_0_q) IS
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
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid51_fpSqrtTest(MUX,50)@1
    expRPostExc_uid51_fpSqrtTest_s <= fracSel_uid47_fpSqrtTest_q;
    expRPostExc_uid51_fpSqrtTest: PROCESS (expRPostExc_uid51_fpSqrtTest_s, en, cstAllZWE_uid11_fpSqrtTest_q, expRMux_uid33_fpSqrtTest_q, cstAllOWE_uid9_fpSqrtTest_q, cstAllOWE_uid9_fpSqrtTest_q)
    BEGIN
            CASE expRPostExc_uid51_fpSqrtTest_s IS
                  WHEN "00" => expRPostExc_uid51_fpSqrtTest_q <= cstAllZWE_uid11_fpSqrtTest_q;
                  WHEN "01" => expRPostExc_uid51_fpSqrtTest_q <= expRMux_uid33_fpSqrtTest_q;
                  WHEN "10" => expRPostExc_uid51_fpSqrtTest_q <= cstAllOWE_uid9_fpSqrtTest_q;
                  WHEN "11" => expRPostExc_uid51_fpSqrtTest_q <= cstAllOWE_uid9_fpSqrtTest_q;
                  WHEN OTHERS => expRPostExc_uid51_fpSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg(DELAY,183)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid51_fpSqrtTest_q, xout => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt(COUNTER,185)
    -- every=1, low=0, high=7, step=1, init=1
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_i <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdreg(REG,186)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdreg_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux(MUX,187)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_s, ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdreg_q, ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem(DUALMEM,184)
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ia <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_inputreg_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_aa <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdreg_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_ab <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_rdmux_q;
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_dmem : altsyncram
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
        ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_q <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_iq(7 downto 0);

	--fracNaN_uid52_fpSqrtTest(CONSTANT,51)
    fracNaN_uid52_fpSqrtTest_q <= "00000000000000000000001";

	--fracXAddr_uid35_fpSqrtTest(BITSELECT,34)@0
    fracXAddr_uid35_fpSqrtTest_in <= fracX_uid7_fpSqrtTest_b;
    fracXAddr_uid35_fpSqrtTest_b <= fracXAddr_uid35_fpSqrtTest_in(22 downto 16);

	--addrTable_uid36_fpSqrtTest(BITJOIN,35)@0
    addrTable_uid36_fpSqrtTest_q <= expOddSelect_uid32_fpSqrtTest_q & fracXAddr_uid35_fpSqrtTest_b;

	--reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid61_sqrtTableGenerator_lutmem_0(REG,84)@0
    reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid61_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid61_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid61_sqrtTableGenerator_lutmem_0_q <= addrTable_uid36_fpSqrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid61_sqrtTableGenerator_lutmem(DUALMEM,82)@1
    memoryC2_uid61_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid61_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid61_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC2_uid61_sqrtTableGenerator_lutmem_0_q;
    memoryC2_uid61_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_sqrt_s5_memoryC2_uid61_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid61_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid61_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid61_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid61_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid61_sqrtTableGenerator_lutmem_ia
    );
    memoryC2_uid61_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC2_uid61_sqrtTableGenerator_lutmem_q <= memoryC2_uid61_sqrtTableGenerator_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid61_sqrtTableGenerator_lutmem_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_1(REG,86)@3
    reg_memoryC2_uid61_sqrtTableGenerator_lutmem_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid61_sqrtTableGenerator_lutmem_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid61_sqrtTableGenerator_lutmem_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_1_q <= memoryC2_uid61_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_inputreg(DELAY,182)
    ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid7_fpSqrtTest_b, xout => ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a(DELAY,123)@0
    ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_inputreg_q, xout => ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--FracX15dto0_uid37_fpSqrtTest(BITSELECT,36)@3
    FracX15dto0_uid37_fpSqrtTest_in <= ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_q(15 downto 0);
    FracX15dto0_uid37_fpSqrtTest_b <= FracX15dto0_uid37_fpSqrtTest_in(15 downto 0);

	--yT1_uid62_sqrtPolynomialEvaluator(BITSELECT,61)@3
    yT1_uid62_sqrtPolynomialEvaluator_in <= FracX15dto0_uid37_fpSqrtTest_b;
    yT1_uid62_sqrtPolynomialEvaluator_b <= yT1_uid62_sqrtPolynomialEvaluator_in(15 downto 4);

	--reg_yT1_uid62_sqrtPolynomialEvaluator_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_0(REG,85)@3
    reg_yT1_uid62_sqrtPolynomialEvaluator_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid62_sqrtPolynomialEvaluator_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid62_sqrtPolynomialEvaluator_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_0_q <= yT1_uid62_sqrtPolynomialEvaluator_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator(MULT,74)@4
    prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_a),13)) * SIGNED(prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_b);
    prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_a <= reg_yT1_uid62_sqrtPolynomialEvaluator_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_0_q;
                prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_b <= reg_memoryC2_uid61_sqrtTableGenerator_lutmem_0_to_prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_1_q;
                prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_q <= prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator(BITSELECT,75)@7
    prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_in <= prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_in(23 downto 11);

	--highBBits_uid65_sqrtPolynomialEvaluator(BITSELECT,64)@7
    highBBits_uid65_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_b;
    highBBits_uid65_sqrtPolynomialEvaluator_b <= highBBits_uid65_sqrtPolynomialEvaluator_in(12 downto 1);

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_a(DELAY,176)@0
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => addrTable_uid36_fpSqrtTest_q, xout => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0(REG,87)@3
    reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid60_sqrtTableGenerator_lutmem(DUALMEM,81)@4
    memoryC1_uid60_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid60_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid60_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC1_uid60_sqrtTableGenerator_lutmem_0_q;
    memoryC1_uid60_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_sqrt_s5_memoryC1_uid60_sqrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid60_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid60_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid60_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid60_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid60_sqrtTableGenerator_lutmem_ia
    );
    memoryC1_uid60_sqrtTableGenerator_lutmem_reset0 <= areset;
        memoryC1_uid60_sqrtTableGenerator_lutmem_q <= memoryC1_uid60_sqrtTableGenerator_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid60_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid66_sqrtPolynomialEvaluator_0(REG,88)@6
    reg_memoryC1_uid60_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid66_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid60_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid66_sqrtPolynomialEvaluator_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid60_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid66_sqrtPolynomialEvaluator_0_q <= memoryC1_uid60_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid66_sqrtPolynomialEvaluator(ADD,65)@7
    sumAHighB_uid66_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid60_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid66_sqrtPolynomialEvaluator_0_q(20)) & reg_memoryC1_uid60_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid66_sqrtPolynomialEvaluator_0_q);
    sumAHighB_uid66_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid65_sqrtPolynomialEvaluator_b(11)) & highBBits_uid65_sqrtPolynomialEvaluator_b);
            sumAHighB_uid66_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid66_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid66_sqrtPolynomialEvaluator_b));
    sumAHighB_uid66_sqrtPolynomialEvaluator_q <= sumAHighB_uid66_sqrtPolynomialEvaluator_o(21 downto 0);


	--lowRangeB_uid64_sqrtPolynomialEvaluator(BITSELECT,63)@7
    lowRangeB_uid64_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid64_sqrtPolynomialEvaluator_b <= lowRangeB_uid64_sqrtPolynomialEvaluator_in(0 downto 0);

	--s1_uid64_uid67_sqrtPolynomialEvaluator(BITJOIN,66)@7
    s1_uid64_uid67_sqrtPolynomialEvaluator_q <= sumAHighB_uid66_sqrtPolynomialEvaluator_q & lowRangeB_uid64_sqrtPolynomialEvaluator_b;

	--reg_s1_uid64_uid67_sqrtPolynomialEvaluator_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_1(REG,90)@7
    reg_s1_uid64_uid67_sqrtPolynomialEvaluator_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid64_uid67_sqrtPolynomialEvaluator_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid64_uid67_sqrtPolynomialEvaluator_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_1_q <= s1_uid64_uid67_sqrtPolynomialEvaluator_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor(LOGICAL,204)
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_a <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable_q;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_b <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_sticky_ena_q;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_q <= not (ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_a or ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_b);

	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_cmpReg(REG,202)
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_sticky_ena(REG,205)
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_nor_q = "1") THEN
                ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_sticky_ena_q <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd(LOGICAL,206)
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_a <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_sticky_ena_q;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_b <= en;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_q <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_a and ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_b;

	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_inputreg(DELAY,196)
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => FracX15dto0_uid37_fpSqrtTest_b, xout => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt(COUNTER,198)
    -- every=1, low=0, high=1, step=1, init=1
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_i,1));


	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdreg(REG,199)
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdreg_q <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux(MUX,200)
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_s <= en;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux: PROCESS (ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_s, ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdreg_q, ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
                  WHEN "1" => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem(DUALMEM,197)
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_ia <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_inputreg_q;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_aa <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdreg_q;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_ab <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_rdmux_q;
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_iq,
        address_a => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_aa,
        data_a => ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_ia
    );
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_reset0 <= areset;
        ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_q <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_iq(15 downto 0);

	--reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0(REG,89)@7
    reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_q <= ld_FracX15dto0_uid37_fpSqrtTest_b_to_reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator(MULT,77)@8
    prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_pr <= signed(resize(UNSIGNED(prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_a),17)) * SIGNED(prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_b);
    prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_a <= (others => '0');
            prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_b <= (others => '0');
            prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_a <= reg_FracX15dto0_uid37_fpSqrtTest_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_0_q;
                prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_b <= reg_s1_uid64_uid67_sqrtPolynomialEvaluator_0_to_prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_1_q;
                prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_q <= prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid79_pT2_uid69_sqrtPolynomialEvaluator(BITSELECT,78)@11
    prodXYTruncFR_uid79_pT2_uid69_sqrtPolynomialEvaluator_in <= prodXY_uid78_pT2_uid69_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid79_pT2_uid69_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid79_pT2_uid69_sqrtPolynomialEvaluator_in(38 downto 15);

	--highBBits_uid71_sqrtPolynomialEvaluator(BITSELECT,70)@11
    highBBits_uid71_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid79_pT2_uid69_sqrtPolynomialEvaluator_b;
    highBBits_uid71_sqrtPolynomialEvaluator_b <= highBBits_uid71_sqrtPolynomialEvaluator_in(23 downto 2);

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor(LOGICAL,217)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_a <= ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_notEnable_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_b <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_q <= not (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_a or ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_b);

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_mem_top(CONSTANT,213)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_mem_top_q <= "0100";

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp(LOGICAL,214)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_a <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_mem_top_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q);
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_q <= "1" when ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_a = ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_b else "0";

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmpReg(REG,215)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmpReg_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena(REG,218)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd(LOGICAL,219)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_a <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_a and ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_inputreg(DELAY,207)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addrTable_uid36_fpSqrtTest_q, xout => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt(COUNTER,209)
    -- every=1, low=0, high=4, step=1, init=1
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i = 3 THEN
                      ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_eq = '1') THEN
                        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_i,3));


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdreg(REG,210)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux(MUX,211)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s <= en;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux: PROCESS (ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s, ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q, ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q;
                  WHEN "1" => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem(DUALMEM,208)
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ia <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_inputreg_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_aa <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdreg_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_ab <= ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_rdmux_q;
    ld_addrTable_uid36_fpSqrtTest_q_to_reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
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

	--reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0(REG,91)@7
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


	--memoryC0_uid59_sqrtTableGenerator_lutmem(DUALMEM,80)@8
    memoryC0_uid59_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid59_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid59_sqrtTableGenerator_lutmem_ab <= reg_addrTable_uid36_fpSqrtTest_0_to_memoryC0_uid59_sqrtTableGenerator_lutmem_0_q;
    memoryC0_uid59_sqrtTableGenerator_lutmem_dmem : altsyncram
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
        init_file => "fp_sqrt_s5_memoryC0_uid59_sqrtTableGenerator_lutmem.hex",
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
        memoryC0_uid59_sqrtTableGenerator_lutmem_q <= memoryC0_uid59_sqrtTableGenerator_lutmem_iq(28 downto 0);

	--reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid72_sqrtPolynomialEvaluator_0(REG,92)@10
    reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid72_sqrtPolynomialEvaluator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid72_sqrtPolynomialEvaluator_0_q <= "00000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid72_sqrtPolynomialEvaluator_0_q <= memoryC0_uid59_sqrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid72_sqrtPolynomialEvaluator(ADD,71)@11
    sumAHighB_uid72_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((29 downto 29 => reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid72_sqrtPolynomialEvaluator_0_q(28)) & reg_memoryC0_uid59_sqrtTableGenerator_lutmem_0_to_sumAHighB_uid72_sqrtPolynomialEvaluator_0_q);
    sumAHighB_uid72_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid71_sqrtPolynomialEvaluator_b(21)) & highBBits_uid71_sqrtPolynomialEvaluator_b);
            sumAHighB_uid72_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid72_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid72_sqrtPolynomialEvaluator_b));
    sumAHighB_uid72_sqrtPolynomialEvaluator_q <= sumAHighB_uid72_sqrtPolynomialEvaluator_o(29 downto 0);


	--lowRangeB_uid70_sqrtPolynomialEvaluator(BITSELECT,69)@11
    lowRangeB_uid70_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid79_pT2_uid69_sqrtPolynomialEvaluator_b(1 downto 0);
    lowRangeB_uid70_sqrtPolynomialEvaluator_b <= lowRangeB_uid70_sqrtPolynomialEvaluator_in(1 downto 0);

	--s2_uid70_uid73_sqrtPolynomialEvaluator(BITJOIN,72)@11
    s2_uid70_uid73_sqrtPolynomialEvaluator_q <= sumAHighB_uid72_sqrtPolynomialEvaluator_q & lowRangeB_uid70_sqrtPolynomialEvaluator_b;

	--fracR_uid39_fpSqrtTest(BITSELECT,38)@11
    fracR_uid39_fpSqrtTest_in <= s2_uid70_uid73_sqrtPolynomialEvaluator_q(28 downto 0);
    fracR_uid39_fpSqrtTest_b <= fracR_uid39_fpSqrtTest_in(28 downto 6);

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b(DELAY,143)@1
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 10 )
    PORT MAP ( xin => fracSel_uid47_fpSqrtTest_q, xout => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid55_fpSqrtTest(MUX,54)@11
    fracRPostExc_uid55_fpSqrtTest_s <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_q;
    fracRPostExc_uid55_fpSqrtTest: PROCESS (fracRPostExc_uid55_fpSqrtTest_s, en, cstAllZWF_uid10_fpSqrtTest_q, fracR_uid39_fpSqrtTest_b, cstAllZWF_uid10_fpSqrtTest_q, fracNaN_uid52_fpSqrtTest_q)
    BEGIN
            CASE fracRPostExc_uid55_fpSqrtTest_s IS
                  WHEN "00" => fracRPostExc_uid55_fpSqrtTest_q <= cstAllZWF_uid10_fpSqrtTest_q;
                  WHEN "01" => fracRPostExc_uid55_fpSqrtTest_q <= fracR_uid39_fpSqrtTest_b;
                  WHEN "10" => fracRPostExc_uid55_fpSqrtTest_q <= cstAllZWF_uid10_fpSqrtTest_q;
                  WHEN "11" => fracRPostExc_uid55_fpSqrtTest_q <= fracNaN_uid52_fpSqrtTest_q;
                  WHEN OTHERS => fracRPostExc_uid55_fpSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RSqrt_uid57_fpSqrtTest(BITJOIN,56)@11
    RSqrt_uid57_fpSqrtTest_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_q & ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_replace_mem_q & fracRPostExc_uid55_fpSqrtTest_q;

	--xOut(GPOUT,4)@11
    q <= RSqrt_uid57_fpSqrtTest_q;


end normal;
