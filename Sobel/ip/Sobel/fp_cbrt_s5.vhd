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

-- VHDL created from fp_cbrt_s5
-- VHDL created on Thu Mar  7 15:10:45 2013


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

entity fp_cbrt_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_cbrt_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid8_fpCbrtTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid9_fpCbrtTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid10_fpCbrtTest_q : std_logic_vector (7 downto 0);
    signal oneFracRPostExc2_uid34_fpCbrtTest_q : std_logic_vector (22 downto 0);
    signal prodXY_uid60_pT1_uid48_cbrtPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid60_pT1_uid48_cbrtPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid60_pT1_uid48_cbrtPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid60_pT1_uid48_cbrtPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid60_pT1_uid48_cbrtPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid63_pT2_uid54_cbrtPolyEval_a : std_logic_vector (15 downto 0);
    signal prodXY_uid63_pT2_uid54_cbrtPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid63_pT2_uid54_cbrtPolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid63_pT2_uid54_cbrtPolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid63_pT2_uid54_cbrtPolyEval_q : std_logic_vector (38 downto 0);
    signal divBy3Rem_uid24_fpCbrtTest_lutmem_reset0 : std_logic;
    signal divBy3Rem_uid24_fpCbrtTest_lutmem_ia : std_logic_vector (1 downto 0);
    signal divBy3Rem_uid24_fpCbrtTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal divBy3Rem_uid24_fpCbrtTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal divBy3Rem_uid24_fpCbrtTest_lutmem_iq : std_logic_vector (1 downto 0);
    signal divBy3Rem_uid24_fpCbrtTest_lutmem_q : std_logic_vector (1 downto 0);
    signal divBy3DivRes_uid25_fpCbrtTest_lutmem_reset0 : std_logic;
    signal divBy3DivRes_uid25_fpCbrtTest_lutmem_ia : std_logic_vector (7 downto 0);
    signal divBy3DivRes_uid25_fpCbrtTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal divBy3DivRes_uid25_fpCbrtTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal divBy3DivRes_uid25_fpCbrtTest_lutmem_iq : std_logic_vector (7 downto 0);
    signal divBy3DivRes_uid25_fpCbrtTest_lutmem_q : std_logic_vector (7 downto 0);
    signal memoryC0_uid44_cbrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid44_cbrtTableGenerator_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid44_cbrtTableGenerator_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC0_uid44_cbrtTableGenerator_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC0_uid44_cbrtTableGenerator_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid44_cbrtTableGenerator_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid45_cbrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid45_cbrtTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid45_cbrtTableGenerator_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC1_uid45_cbrtTableGenerator_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC1_uid45_cbrtTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid45_cbrtTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid46_cbrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid46_cbrtTableGenerator_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid46_cbrtTableGenerator_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC2_uid46_cbrtTableGenerator_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC2_uid46_cbrtTableGenerator_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid46_cbrtTableGenerator_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q : std_logic_vector (2 downto 0);
    signal reg_expX_uid6_fpCbrtTest_0_to_divBy3Rem_uid24_fpCbrtTest_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_q : std_logic_vector (6 downto 0);
    signal reg_divBy3Rem_uid24_fpCbrtTest_lutmem_0_to_addrTable_uid28_fpCbrtTest_1_q : std_logic_vector (1 downto 0);
    signal reg_addrTable_uid28_fpCbrtTest_0_to_memoryC2_uid46_cbrtTableGenerator_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid46_cbrtTableGenerator_lutmem_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_memoryC1_uid45_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid51_cbrtPolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid49_uid52_cbrtPolyEval_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_memoryC0_uid44_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid57_cbrtPolyEval_0_q : std_logic_vector (28 downto 0);
    signal reg_excREnc_uid33_fpCbrtTest_0_to_expRPostExc_uid41_fpCbrtTest_1_q : std_logic_vector (1 downto 0);
    signal reg_divBy3DivRes_uid25_fpCbrtTest_lutmem_0_to_expRPostExc_uid41_fpCbrtTest_3_q : std_logic_vector (7 downto 0);
    signal ld_reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q_to_excREnc_uid33_fpCbrtTest_a_q : std_logic_vector (2 downto 0);
    signal ld_signX_uid7_fpCbrtTest_b_to_RCbrt_uid42_fpCbrtTest_c_q : std_logic_vector (0 downto 0);
    signal ld_fracXAddr_uid27_fpCbrtTest_b_to_reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_a_q : std_logic_vector (6 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_a_q : std_logic_vector (8 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_reset0 : std_logic;
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_eq : std_logic;
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_sticky_ena_q : signal is true;
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_eq : std_logic;
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_sticky_ena_q : signal is true;
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_ia : std_logic_vector (11 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_iq : std_logic_vector (11 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_q : std_logic_vector (11 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_sticky_ena_q : signal is true;
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal expX_uid6_fpCbrtTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpCbrtTest_b : std_logic_vector (7 downto 0);
    signal signX_uid7_fpCbrtTest_in : std_logic_vector (31 downto 0);
    signal signX_uid7_fpCbrtTest_b : std_logic_vector (0 downto 0);
    signal frac_uid15_fpCbrtTest_in : std_logic_vector (22 downto 0);
    signal frac_uid15_fpCbrtTest_b : std_logic_vector (22 downto 0);
    signal fracXAddr_uid27_fpCbrtTest_in : std_logic_vector (22 downto 0);
    signal fracXAddr_uid27_fpCbrtTest_b : std_logic_vector (6 downto 0);
    signal X15dto0_uid29_fpCbrtTest_in : std_logic_vector (15 downto 0);
    signal X15dto0_uid29_fpCbrtTest_b : std_logic_vector (15 downto 0);
    signal expXIsZero_uid12_fpCbrtTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid12_fpCbrtTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid12_fpCbrtTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid14_fpCbrtTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid14_fpCbrtTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid14_fpCbrtTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid16_fpCbrtTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid16_fpCbrtTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid16_fpCbrtTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid17_fpCbrtTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid17_fpCbrtTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid17_fpCbrtTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid33_fpCbrtTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid41_fpCbrtTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid41_fpCbrtTest_q : std_logic_vector (7 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal prodXYTruncFR_uid61_pT1_uid48_cbrtPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid61_pT1_uid48_cbrtPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid64_pT2_uid54_cbrtPolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid64_pT2_uid54_cbrtPolyEval_b : std_logic_vector (23 downto 0);
    signal addrTable_uid28_fpCbrtTest_q : std_logic_vector (8 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal yT1_uid47_cbrtPolyEval_in : std_logic_vector (15 downto 0);
    signal yT1_uid47_cbrtPolyEval_b : std_logic_vector (11 downto 0);
    signal InvFracXIsZero_uid18_fpCbrtTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid18_fpCbrtTest_q : std_logic_vector(0 downto 0);
    signal lowRangeB_uid49_cbrtPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid49_cbrtPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid50_cbrtPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid50_cbrtPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid55_cbrtPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid55_cbrtPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid56_cbrtPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid56_cbrtPolyEval_b : std_logic_vector (21 downto 0);
    signal exc_N_uid19_fpCbrtTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid19_fpCbrtTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid19_fpCbrtTest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid51_cbrtPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid51_cbrtPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid51_cbrtPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid51_cbrtPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid57_cbrtPolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid57_cbrtPolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid57_cbrtPolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid57_cbrtPolyEval_q : std_logic_vector (29 downto 0);
    signal concExc_uid32_fpCbrtTest_q : std_logic_vector (2 downto 0);
    signal s1_uid49_uid52_cbrtPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid55_uid58_cbrtPolyEval_q : std_logic_vector (31 downto 0);
    signal fracR_uid31_fpCbrtTest_in : std_logic_vector (28 downto 0);
    signal fracR_uid31_fpCbrtTest_b : std_logic_vector (22 downto 0);
    signal fracRPostExc_uid37_fpCbrtTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid37_fpCbrtTest_q : std_logic_vector (22 downto 0);
    signal RCbrt_uid42_fpCbrtTest_q : std_logic_vector (31 downto 0);
begin


	--GND(CONSTANT,0)

	--xIn(GPIN,3)@0

	--signX_uid7_fpCbrtTest(BITSELECT,6)@0
    signX_uid7_fpCbrtTest_in <= a;
    signX_uid7_fpCbrtTest_b <= signX_uid7_fpCbrtTest_in(31 downto 31);

	--ld_signX_uid7_fpCbrtTest_b_to_RCbrt_uid42_fpCbrtTest_c(DELAY,113)@0
    ld_signX_uid7_fpCbrtTest_b_to_RCbrt_uid42_fpCbrtTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => signX_uid7_fpCbrtTest_b, xout => ld_signX_uid7_fpCbrtTest_b_to_RCbrt_uid42_fpCbrtTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable(LOGICAL,163)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_a <= en;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_q <= not ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_a;

	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor(LOGICAL,177)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_a <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_q;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_b <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_sticky_ena_q;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_q <= not (ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_a or ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_b);

	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_mem_top(CONSTANT,173)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_mem_top_q <= "01000";

	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp(LOGICAL,174)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_a <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_mem_top_q;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_q);
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_q <= "1" when ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_a = ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_b else "0";

	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmpReg(REG,175)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmpReg_q <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_sticky_ena(REG,178)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_sticky_ena_q <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd(LOGICAL,179)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_a <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_sticky_ena_q;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_q <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_a and ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_b;

	--cstAllOWE_uid8_fpCbrtTest(CONSTANT,7)
    cstAllOWE_uid8_fpCbrtTest_q <= "11111111";

	--expX_uid6_fpCbrtTest(BITSELECT,5)@0
    expX_uid6_fpCbrtTest_in <= a(30 downto 0);
    expX_uid6_fpCbrtTest_b <= expX_uid6_fpCbrtTest_in(30 downto 23);

	--reg_expX_uid6_fpCbrtTest_0_to_divBy3Rem_uid24_fpCbrtTest_lutmem_0(REG,71)@0
    reg_expX_uid6_fpCbrtTest_0_to_divBy3Rem_uid24_fpCbrtTest_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid6_fpCbrtTest_0_to_divBy3Rem_uid24_fpCbrtTest_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid6_fpCbrtTest_0_to_divBy3Rem_uid24_fpCbrtTest_lutmem_0_q <= expX_uid6_fpCbrtTest_b;
            END IF;
        END IF;
    END PROCESS;


	--divBy3DivRes_uid25_fpCbrtTest_lutmem(DUALMEM,66)@1
    divBy3DivRes_uid25_fpCbrtTest_lutmem_ia <= (others => '0');
    divBy3DivRes_uid25_fpCbrtTest_lutmem_aa <= (others => '0');
    divBy3DivRes_uid25_fpCbrtTest_lutmem_ab <= reg_expX_uid6_fpCbrtTest_0_to_divBy3Rem_uid24_fpCbrtTest_lutmem_0_q;
    divBy3DivRes_uid25_fpCbrtTest_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 255,
        width_b => 8,
        widthad_b => 8,
        numwords_b => 255,
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
        init_file => "fp_cbrt_s5_divBy3DivRes_uid25_fpCbrtTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => divBy3DivRes_uid25_fpCbrtTest_lutmem_reset0,
        clock0 => clk,
        address_b => divBy3DivRes_uid25_fpCbrtTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => divBy3DivRes_uid25_fpCbrtTest_lutmem_iq,
        address_a => divBy3DivRes_uid25_fpCbrtTest_lutmem_aa,
        data_a => divBy3DivRes_uid25_fpCbrtTest_lutmem_ia
    );
    divBy3DivRes_uid25_fpCbrtTest_lutmem_reset0 <= areset;
        divBy3DivRes_uid25_fpCbrtTest_lutmem_q <= divBy3DivRes_uid25_fpCbrtTest_lutmem_iq(7 downto 0);

	--reg_divBy3DivRes_uid25_fpCbrtTest_lutmem_0_to_expRPostExc_uid41_fpCbrtTest_3(REG,85)@3
    reg_divBy3DivRes_uid25_fpCbrtTest_lutmem_0_to_expRPostExc_uid41_fpCbrtTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_divBy3DivRes_uid25_fpCbrtTest_lutmem_0_to_expRPostExc_uid41_fpCbrtTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_divBy3DivRes_uid25_fpCbrtTest_lutmem_0_to_expRPostExc_uid41_fpCbrtTest_3_q <= divBy3DivRes_uid25_fpCbrtTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--cstAllZWE_uid10_fpCbrtTest(CONSTANT,9)
    cstAllZWE_uid10_fpCbrtTest_q <= "00000000";

	--cstAllZWF_uid9_fpCbrtTest(CONSTANT,8)
    cstAllZWF_uid9_fpCbrtTest_q <= "00000000000000000000000";

	--frac_uid15_fpCbrtTest(BITSELECT,14)@0
    frac_uid15_fpCbrtTest_in <= a(22 downto 0);
    frac_uid15_fpCbrtTest_b <= frac_uid15_fpCbrtTest_in(22 downto 0);

	--fracXIsZero_uid16_fpCbrtTest(LOGICAL,15)@0
    fracXIsZero_uid16_fpCbrtTest_a <= frac_uid15_fpCbrtTest_b;
    fracXIsZero_uid16_fpCbrtTest_b <= cstAllZWF_uid9_fpCbrtTest_q;
    fracXIsZero_uid16_fpCbrtTest_q <= "1" when fracXIsZero_uid16_fpCbrtTest_a = fracXIsZero_uid16_fpCbrtTest_b else "0";

	--InvFracXIsZero_uid18_fpCbrtTest(LOGICAL,17)@0
    InvFracXIsZero_uid18_fpCbrtTest_a <= fracXIsZero_uid16_fpCbrtTest_q;
    InvFracXIsZero_uid18_fpCbrtTest_q <= not InvFracXIsZero_uid18_fpCbrtTest_a;

	--expXIsMax_uid14_fpCbrtTest(LOGICAL,13)@0
    expXIsMax_uid14_fpCbrtTest_a <= expX_uid6_fpCbrtTest_b;
    expXIsMax_uid14_fpCbrtTest_b <= cstAllOWE_uid8_fpCbrtTest_q;
    expXIsMax_uid14_fpCbrtTest_q <= "1" when expXIsMax_uid14_fpCbrtTest_a = expXIsMax_uid14_fpCbrtTest_b else "0";

	--exc_N_uid19_fpCbrtTest(LOGICAL,18)@0
    exc_N_uid19_fpCbrtTest_a <= expXIsMax_uid14_fpCbrtTest_q;
    exc_N_uid19_fpCbrtTest_b <= InvFracXIsZero_uid18_fpCbrtTest_q;
    exc_N_uid19_fpCbrtTest_q <= exc_N_uid19_fpCbrtTest_a and exc_N_uid19_fpCbrtTest_b;

	--exc_I_uid17_fpCbrtTest(LOGICAL,16)@0
    exc_I_uid17_fpCbrtTest_a <= expXIsMax_uid14_fpCbrtTest_q;
    exc_I_uid17_fpCbrtTest_b <= fracXIsZero_uid16_fpCbrtTest_q;
    exc_I_uid17_fpCbrtTest_q <= exc_I_uid17_fpCbrtTest_a and exc_I_uid17_fpCbrtTest_b;

	--expXIsZero_uid12_fpCbrtTest(LOGICAL,11)@0
    expXIsZero_uid12_fpCbrtTest_a <= expX_uid6_fpCbrtTest_b;
    expXIsZero_uid12_fpCbrtTest_b <= cstAllZWE_uid10_fpCbrtTest_q;
    expXIsZero_uid12_fpCbrtTest_q <= "1" when expXIsZero_uid12_fpCbrtTest_a = expXIsZero_uid12_fpCbrtTest_b else "0";

	--concExc_uid32_fpCbrtTest(BITJOIN,31)@0
    concExc_uid32_fpCbrtTest_q <= exc_N_uid19_fpCbrtTest_q & exc_I_uid17_fpCbrtTest_q & expXIsZero_uid12_fpCbrtTest_q;

	--reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0(REG,70)@0
    reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q <= concExc_uid32_fpCbrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q_to_excREnc_uid33_fpCbrtTest_a(DELAY,106)@1
    ld_reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q_to_excREnc_uid33_fpCbrtTest_a : dspba_delay
    GENERIC MAP ( width => 3, depth => 2 )
    PORT MAP ( xin => reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q, xout => ld_reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q_to_excREnc_uid33_fpCbrtTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excREnc_uid33_fpCbrtTest(LOOKUP,32)@3
    excREnc_uid33_fpCbrtTest: PROCESS (ld_reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q_to_excREnc_uid33_fpCbrtTest_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_concExc_uid32_fpCbrtTest_0_to_excREnc_uid33_fpCbrtTest_0_q_to_excREnc_uid33_fpCbrtTest_a_q) IS
                WHEN "000" =>  excREnc_uid33_fpCbrtTest_q <= "01";
                WHEN "001" =>  excREnc_uid33_fpCbrtTest_q <= "00";
                WHEN "010" =>  excREnc_uid33_fpCbrtTest_q <= "10";
                WHEN "011" =>  excREnc_uid33_fpCbrtTest_q <= "00";
                WHEN "100" =>  excREnc_uid33_fpCbrtTest_q <= "11";
                WHEN "101" =>  excREnc_uid33_fpCbrtTest_q <= "00";
                WHEN "110" =>  excREnc_uid33_fpCbrtTest_q <= "00";
                WHEN "111" =>  excREnc_uid33_fpCbrtTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid33_fpCbrtTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--reg_excREnc_uid33_fpCbrtTest_0_to_expRPostExc_uid41_fpCbrtTest_1(REG,84)@3
    reg_excREnc_uid33_fpCbrtTest_0_to_expRPostExc_uid41_fpCbrtTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excREnc_uid33_fpCbrtTest_0_to_expRPostExc_uid41_fpCbrtTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excREnc_uid33_fpCbrtTest_0_to_expRPostExc_uid41_fpCbrtTest_1_q <= excREnc_uid33_fpCbrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expRPostExc_uid41_fpCbrtTest(MUX,40)@4
    expRPostExc_uid41_fpCbrtTest_s <= reg_excREnc_uid33_fpCbrtTest_0_to_expRPostExc_uid41_fpCbrtTest_1_q;
    expRPostExc_uid41_fpCbrtTest: PROCESS (expRPostExc_uid41_fpCbrtTest_s, en, cstAllZWE_uid10_fpCbrtTest_q, reg_divBy3DivRes_uid25_fpCbrtTest_lutmem_0_to_expRPostExc_uid41_fpCbrtTest_3_q, cstAllOWE_uid8_fpCbrtTest_q, cstAllOWE_uid8_fpCbrtTest_q)
    BEGIN
            CASE expRPostExc_uid41_fpCbrtTest_s IS
                  WHEN "00" => expRPostExc_uid41_fpCbrtTest_q <= cstAllZWE_uid10_fpCbrtTest_q;
                  WHEN "01" => expRPostExc_uid41_fpCbrtTest_q <= reg_divBy3DivRes_uid25_fpCbrtTest_lutmem_0_to_expRPostExc_uid41_fpCbrtTest_3_q;
                  WHEN "10" => expRPostExc_uid41_fpCbrtTest_q <= cstAllOWE_uid8_fpCbrtTest_q;
                  WHEN "11" => expRPostExc_uid41_fpCbrtTest_q <= cstAllOWE_uid8_fpCbrtTest_q;
                  WHEN OTHERS => expRPostExc_uid41_fpCbrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_inputreg(DELAY,167)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid41_fpCbrtTest_q, xout => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt(COUNTER,169)
    -- every=1, low=0, high=8, step=1, init=1
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_i = 7 THEN
                      ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_eq = '1') THEN
                        ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_i <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_i - 8;
                    ELSE
                        ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_i <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_i,4));


	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg(REG,170)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg_q <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux(MUX,171)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_s, ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg_q, ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_q <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_q <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem(DUALMEM,168)
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_ia <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_inputreg_q;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_aa <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg_q;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_ab <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_q;
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_ia
    );
    ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_reset0 <= areset;
        ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_q <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_iq(7 downto 0);

	--oneFracRPostExc2_uid34_fpCbrtTest(CONSTANT,33)
    oneFracRPostExc2_uid34_fpCbrtTest_q <= "00000000000000000000001";

	--divBy3Rem_uid24_fpCbrtTest_lutmem(DUALMEM,65)@1
    divBy3Rem_uid24_fpCbrtTest_lutmem_ia <= (others => '0');
    divBy3Rem_uid24_fpCbrtTest_lutmem_aa <= (others => '0');
    divBy3Rem_uid24_fpCbrtTest_lutmem_ab <= reg_expX_uid6_fpCbrtTest_0_to_divBy3Rem_uid24_fpCbrtTest_lutmem_0_q;
    divBy3Rem_uid24_fpCbrtTest_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 8,
        numwords_a => 255,
        width_b => 2,
        widthad_b => 8,
        numwords_b => 255,
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
        init_file => "fp_cbrt_s5_divBy3Rem_uid24_fpCbrtTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => divBy3Rem_uid24_fpCbrtTest_lutmem_reset0,
        clock0 => clk,
        address_b => divBy3Rem_uid24_fpCbrtTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => divBy3Rem_uid24_fpCbrtTest_lutmem_iq,
        address_a => divBy3Rem_uid24_fpCbrtTest_lutmem_aa,
        data_a => divBy3Rem_uid24_fpCbrtTest_lutmem_ia
    );
    divBy3Rem_uid24_fpCbrtTest_lutmem_reset0 <= areset;
        divBy3Rem_uid24_fpCbrtTest_lutmem_q <= divBy3Rem_uid24_fpCbrtTest_lutmem_iq(1 downto 0);

	--reg_divBy3Rem_uid24_fpCbrtTest_lutmem_0_to_addrTable_uid28_fpCbrtTest_1(REG,73)@3
    reg_divBy3Rem_uid24_fpCbrtTest_lutmem_0_to_addrTable_uid28_fpCbrtTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_divBy3Rem_uid24_fpCbrtTest_lutmem_0_to_addrTable_uid28_fpCbrtTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_divBy3Rem_uid24_fpCbrtTest_lutmem_0_to_addrTable_uid28_fpCbrtTest_1_q <= divBy3Rem_uid24_fpCbrtTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--fracXAddr_uid27_fpCbrtTest(BITSELECT,26)@0
    fracXAddr_uid27_fpCbrtTest_in <= a(22 downto 0);
    fracXAddr_uid27_fpCbrtTest_b <= fracXAddr_uid27_fpCbrtTest_in(22 downto 16);

	--ld_fracXAddr_uid27_fpCbrtTest_b_to_reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_a(DELAY,140)@0
    ld_fracXAddr_uid27_fpCbrtTest_b_to_reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => fracXAddr_uid27_fpCbrtTest_b, xout => ld_fracXAddr_uid27_fpCbrtTest_b_to_reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0(REG,72)@3
    reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_q <= ld_fracXAddr_uid27_fpCbrtTest_b_to_reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--addrTable_uid28_fpCbrtTest(BITJOIN,27)@4
    addrTable_uid28_fpCbrtTest_q <= reg_divBy3Rem_uid24_fpCbrtTest_lutmem_0_to_addrTable_uid28_fpCbrtTest_1_q & reg_fracXAddr_uid27_fpCbrtTest_0_to_addrTable_uid28_fpCbrtTest_0_q;

	--reg_addrTable_uid28_fpCbrtTest_0_to_memoryC2_uid46_cbrtTableGenerator_lutmem_0(REG,74)@4
    reg_addrTable_uid28_fpCbrtTest_0_to_memoryC2_uid46_cbrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid28_fpCbrtTest_0_to_memoryC2_uid46_cbrtTableGenerator_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid28_fpCbrtTest_0_to_memoryC2_uid46_cbrtTableGenerator_lutmem_0_q <= addrTable_uid28_fpCbrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid46_cbrtTableGenerator_lutmem(DUALMEM,69)@5
    memoryC2_uid46_cbrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid46_cbrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid46_cbrtTableGenerator_lutmem_ab <= reg_addrTable_uid28_fpCbrtTest_0_to_memoryC2_uid46_cbrtTableGenerator_lutmem_0_q;
    memoryC2_uid46_cbrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 9,
        numwords_a => 384,
        width_b => 12,
        widthad_b => 9,
        numwords_b => 384,
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
        init_file => "fp_cbrt_s5_memoryC2_uid46_cbrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid46_cbrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid46_cbrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid46_cbrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid46_cbrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid46_cbrtTableGenerator_lutmem_ia
    );
    memoryC2_uid46_cbrtTableGenerator_lutmem_reset0 <= areset;
        memoryC2_uid46_cbrtTableGenerator_lutmem_q <= memoryC2_uid46_cbrtTableGenerator_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid46_cbrtTableGenerator_lutmem_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_1(REG,76)@7
    reg_memoryC2_uid46_cbrtTableGenerator_lutmem_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid46_cbrtTableGenerator_lutmem_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid46_cbrtTableGenerator_lutmem_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_1_q <= memoryC2_uid46_cbrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor(LOGICAL,190)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_a <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_q;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_b <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_sticky_ena_q;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_q <= not (ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_a or ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_b);

	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_mem_top(CONSTANT,186)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_mem_top_q <= "0100";

	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp(LOGICAL,187)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_a <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_mem_top_q;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_q);
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_q <= "1" when ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_a = ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_b else "0";

	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmpReg(REG,188)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmpReg_q <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_sticky_ena(REG,191)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_nor_q = "1") THEN
                ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_sticky_ena_q <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd(LOGICAL,192)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_a <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_sticky_ena_q;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_b <= en;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_q <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_a and ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_b;

	--X15dto0_uid29_fpCbrtTest(BITSELECT,28)@0
    X15dto0_uid29_fpCbrtTest_in <= a(15 downto 0);
    X15dto0_uid29_fpCbrtTest_b <= X15dto0_uid29_fpCbrtTest_in(15 downto 0);

	--yT1_uid47_cbrtPolyEval(BITSELECT,46)@0
    yT1_uid47_cbrtPolyEval_in <= X15dto0_uid29_fpCbrtTest_b;
    yT1_uid47_cbrtPolyEval_b <= yT1_uid47_cbrtPolyEval_in(15 downto 4);

	--reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0(REG,75)@0
    reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q <= yT1_uid47_cbrtPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_inputreg(DELAY,180)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q, xout => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt(COUNTER,182)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_i = 3 THEN
                      ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_i <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_i <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_i,3));


	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg(REG,183)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg_q <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux(MUX,184)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_s <= en;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux: PROCESS (ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_s, ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg_q, ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_q <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_q <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem(DUALMEM,181)
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_ia <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_inputreg_q;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_aa <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg_q;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_ab <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_q;
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 12,
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
        clocken1 => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_iq,
        address_a => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_aa,
        data_a => ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_ia
    );
    ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_q <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_iq(11 downto 0);

	--prodXY_uid60_pT1_uid48_cbrtPolyEval(MULT,59)@8
    prodXY_uid60_pT1_uid48_cbrtPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid60_pT1_uid48_cbrtPolyEval_a),13)) * SIGNED(prodXY_uid60_pT1_uid48_cbrtPolyEval_b);
    prodXY_uid60_pT1_uid48_cbrtPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid60_pT1_uid48_cbrtPolyEval_a <= (others => '0');
            prodXY_uid60_pT1_uid48_cbrtPolyEval_b <= (others => '0');
            prodXY_uid60_pT1_uid48_cbrtPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid60_pT1_uid48_cbrtPolyEval_a <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_mem_q;
                prodXY_uid60_pT1_uid48_cbrtPolyEval_b <= reg_memoryC2_uid46_cbrtTableGenerator_lutmem_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_1_q;
                prodXY_uid60_pT1_uid48_cbrtPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid60_pT1_uid48_cbrtPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid60_pT1_uid48_cbrtPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid60_pT1_uid48_cbrtPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid60_pT1_uid48_cbrtPolyEval_q <= prodXY_uid60_pT1_uid48_cbrtPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid61_pT1_uid48_cbrtPolyEval(BITSELECT,60)@11
    prodXYTruncFR_uid61_pT1_uid48_cbrtPolyEval_in <= prodXY_uid60_pT1_uid48_cbrtPolyEval_q;
    prodXYTruncFR_uid61_pT1_uid48_cbrtPolyEval_b <= prodXYTruncFR_uid61_pT1_uid48_cbrtPolyEval_in(23 downto 11);

	--highBBits_uid50_cbrtPolyEval(BITSELECT,49)@11
    highBBits_uid50_cbrtPolyEval_in <= prodXYTruncFR_uid61_pT1_uid48_cbrtPolyEval_b;
    highBBits_uid50_cbrtPolyEval_b <= highBBits_uid50_cbrtPolyEval_in(12 downto 1);

	--ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_a(DELAY,145)@4
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 3 )
    PORT MAP ( xin => addrTable_uid28_fpCbrtTest_q, xout => ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0(REG,77)@7
    reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_q <= ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid45_cbrtTableGenerator_lutmem(DUALMEM,68)@8
    memoryC1_uid45_cbrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid45_cbrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid45_cbrtTableGenerator_lutmem_ab <= reg_addrTable_uid28_fpCbrtTest_0_to_memoryC1_uid45_cbrtTableGenerator_lutmem_0_q;
    memoryC1_uid45_cbrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 21,
        widthad_a => 9,
        numwords_a => 384,
        width_b => 21,
        widthad_b => 9,
        numwords_b => 384,
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
        init_file => "fp_cbrt_s5_memoryC1_uid45_cbrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid45_cbrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid45_cbrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid45_cbrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid45_cbrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid45_cbrtTableGenerator_lutmem_ia
    );
    memoryC1_uid45_cbrtTableGenerator_lutmem_reset0 <= areset;
        memoryC1_uid45_cbrtTableGenerator_lutmem_q <= memoryC1_uid45_cbrtTableGenerator_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid45_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid51_cbrtPolyEval_0(REG,78)@10
    reg_memoryC1_uid45_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid51_cbrtPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid45_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid51_cbrtPolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid45_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid51_cbrtPolyEval_0_q <= memoryC1_uid45_cbrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid51_cbrtPolyEval(ADD,50)@11
    sumAHighB_uid51_cbrtPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid45_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid51_cbrtPolyEval_0_q(20)) & reg_memoryC1_uid45_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid51_cbrtPolyEval_0_q);
    sumAHighB_uid51_cbrtPolyEval_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid50_cbrtPolyEval_b(11)) & highBBits_uid50_cbrtPolyEval_b);
            sumAHighB_uid51_cbrtPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid51_cbrtPolyEval_a) + SIGNED(sumAHighB_uid51_cbrtPolyEval_b));
    sumAHighB_uid51_cbrtPolyEval_q <= sumAHighB_uid51_cbrtPolyEval_o(21 downto 0);


	--lowRangeB_uid49_cbrtPolyEval(BITSELECT,48)@11
    lowRangeB_uid49_cbrtPolyEval_in <= prodXYTruncFR_uid61_pT1_uid48_cbrtPolyEval_b(0 downto 0);
    lowRangeB_uid49_cbrtPolyEval_b <= lowRangeB_uid49_cbrtPolyEval_in(0 downto 0);

	--s1_uid49_uid52_cbrtPolyEval(BITJOIN,51)@11
    s1_uid49_uid52_cbrtPolyEval_q <= sumAHighB_uid51_cbrtPolyEval_q & lowRangeB_uid49_cbrtPolyEval_b;

	--reg_s1_uid49_uid52_cbrtPolyEval_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_1(REG,80)@11
    reg_s1_uid49_uid52_cbrtPolyEval_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid49_uid52_cbrtPolyEval_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid49_uid52_cbrtPolyEval_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_1_q <= s1_uid49_uid52_cbrtPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor(LOGICAL,203)
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_a <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_q;
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_b <= ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_sticky_ena_q;
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_q <= not (ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_a or ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_b);

	--ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_sticky_ena(REG,204)
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_nor_q = "1") THEN
                ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_sticky_ena_q <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd(LOGICAL,205)
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_a <= ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_sticky_ena_q;
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_b <= en;
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_q <= ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_a and ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_b;

	--reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0(REG,79)@0
    reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q <= X15dto0_uid29_fpCbrtTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_inputreg(DELAY,193)
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q, xout => ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem(DUALMEM,194)
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_ia <= ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_inputreg_q;
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_aa <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdreg_q;
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_ab <= ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_rdmux_q;
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 16,
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
        clocken1 => ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_iq,
        address_a => ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_aa,
        data_a => ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_ia
    );
    ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_q <= ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_iq(15 downto 0);

	--prodXY_uid63_pT2_uid54_cbrtPolyEval(MULT,62)@12
    prodXY_uid63_pT2_uid54_cbrtPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid63_pT2_uid54_cbrtPolyEval_a),17)) * SIGNED(prodXY_uid63_pT2_uid54_cbrtPolyEval_b);
    prodXY_uid63_pT2_uid54_cbrtPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid63_pT2_uid54_cbrtPolyEval_a <= (others => '0');
            prodXY_uid63_pT2_uid54_cbrtPolyEval_b <= (others => '0');
            prodXY_uid63_pT2_uid54_cbrtPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid63_pT2_uid54_cbrtPolyEval_a <= ld_reg_X15dto0_uid29_fpCbrtTest_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_0_q_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_a_replace_mem_q;
                prodXY_uid63_pT2_uid54_cbrtPolyEval_b <= reg_s1_uid49_uid52_cbrtPolyEval_0_to_prodXY_uid63_pT2_uid54_cbrtPolyEval_1_q;
                prodXY_uid63_pT2_uid54_cbrtPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid63_pT2_uid54_cbrtPolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid63_pT2_uid54_cbrtPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid63_pT2_uid54_cbrtPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid63_pT2_uid54_cbrtPolyEval_q <= prodXY_uid63_pT2_uid54_cbrtPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid64_pT2_uid54_cbrtPolyEval(BITSELECT,63)@15
    prodXYTruncFR_uid64_pT2_uid54_cbrtPolyEval_in <= prodXY_uid63_pT2_uid54_cbrtPolyEval_q;
    prodXYTruncFR_uid64_pT2_uid54_cbrtPolyEval_b <= prodXYTruncFR_uid64_pT2_uid54_cbrtPolyEval_in(38 downto 15);

	--highBBits_uid56_cbrtPolyEval(BITSELECT,55)@15
    highBBits_uid56_cbrtPolyEval_in <= prodXYTruncFR_uid64_pT2_uid54_cbrtPolyEval_b;
    highBBits_uid56_cbrtPolyEval_b <= highBBits_uid56_cbrtPolyEval_in(23 downto 2);

	--ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor(LOGICAL,216)
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_a <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_q;
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_b <= ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_q <= not (ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_a or ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_b);

	--ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_sticky_ena(REG,217)
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_nor_q = "1") THEN
                ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_sticky_ena_q <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd(LOGICAL,218)
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_a <= ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_sticky_ena_q;
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_b <= en;
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_q <= ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_a and ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_b;

	--ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_inputreg(DELAY,206)
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => addrTable_uid28_fpCbrtTest_q, xout => ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem(DUALMEM,207)
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_ia <= ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_inputreg_q;
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_aa <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdreg_q;
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_ab <= ld_reg_yT1_uid47_cbrtPolyEval_0_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_0_q_to_prodXY_uid60_pT1_uid48_cbrtPolyEval_a_replace_rdmux_q;
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 9,
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
        clocken1 => ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_iq,
        address_a => ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_aa,
        data_a => ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_ia
    );
    ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_q <= ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_iq(8 downto 0);

	--reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0(REG,81)@11
    reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_q <= ld_addrTable_uid28_fpCbrtTest_q_to_reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid44_cbrtTableGenerator_lutmem(DUALMEM,67)@12
    memoryC0_uid44_cbrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid44_cbrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid44_cbrtTableGenerator_lutmem_ab <= reg_addrTable_uid28_fpCbrtTest_0_to_memoryC0_uid44_cbrtTableGenerator_lutmem_0_q;
    memoryC0_uid44_cbrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 29,
        widthad_a => 9,
        numwords_a => 384,
        width_b => 29,
        widthad_b => 9,
        numwords_b => 384,
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
        init_file => "fp_cbrt_s5_memoryC0_uid44_cbrtTableGenerator_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid44_cbrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid44_cbrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid44_cbrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid44_cbrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid44_cbrtTableGenerator_lutmem_ia
    );
    memoryC0_uid44_cbrtTableGenerator_lutmem_reset0 <= areset;
        memoryC0_uid44_cbrtTableGenerator_lutmem_q <= memoryC0_uid44_cbrtTableGenerator_lutmem_iq(28 downto 0);

	--reg_memoryC0_uid44_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid57_cbrtPolyEval_0(REG,82)@14
    reg_memoryC0_uid44_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid57_cbrtPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid44_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid57_cbrtPolyEval_0_q <= "00000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid44_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid57_cbrtPolyEval_0_q <= memoryC0_uid44_cbrtTableGenerator_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid57_cbrtPolyEval(ADD,56)@15
    sumAHighB_uid57_cbrtPolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => reg_memoryC0_uid44_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid57_cbrtPolyEval_0_q(28)) & reg_memoryC0_uid44_cbrtTableGenerator_lutmem_0_to_sumAHighB_uid57_cbrtPolyEval_0_q);
    sumAHighB_uid57_cbrtPolyEval_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid56_cbrtPolyEval_b(21)) & highBBits_uid56_cbrtPolyEval_b);
            sumAHighB_uid57_cbrtPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid57_cbrtPolyEval_a) + SIGNED(sumAHighB_uid57_cbrtPolyEval_b));
    sumAHighB_uid57_cbrtPolyEval_q <= sumAHighB_uid57_cbrtPolyEval_o(29 downto 0);


	--lowRangeB_uid55_cbrtPolyEval(BITSELECT,54)@15
    lowRangeB_uid55_cbrtPolyEval_in <= prodXYTruncFR_uid64_pT2_uid54_cbrtPolyEval_b(1 downto 0);
    lowRangeB_uid55_cbrtPolyEval_b <= lowRangeB_uid55_cbrtPolyEval_in(1 downto 0);

	--s2_uid55_uid58_cbrtPolyEval(BITJOIN,57)@15
    s2_uid55_uid58_cbrtPolyEval_q <= sumAHighB_uid57_cbrtPolyEval_q & lowRangeB_uid55_cbrtPolyEval_b;

	--fracR_uid31_fpCbrtTest(BITSELECT,30)@15
    fracR_uid31_fpCbrtTest_in <= s2_uid55_uid58_cbrtPolyEval_q(28 downto 0);
    fracR_uid31_fpCbrtTest_b <= fracR_uid31_fpCbrtTest_in(28 downto 6);

	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor(LOGICAL,164)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_a <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_notEnable_q;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_b <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_sticky_ena_q;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_q <= not (ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_a or ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_b);

	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_mem_top(CONSTANT,160)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_mem_top_q <= "01001";

	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp(LOGICAL,161)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_a <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_mem_top_q;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_q);
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_q <= "1" when ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_a = ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_b else "0";

	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmpReg(REG,162)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmpReg_q <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_sticky_ena(REG,165)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_nor_q = "1") THEN
                ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_sticky_ena_q <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd(LOGICAL,166)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_a <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_sticky_ena_q;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_b <= en;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_q <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_a and ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_b;

	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_inputreg(DELAY,154)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => excREnc_uid33_fpCbrtTest_q, xout => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt(COUNTER,156)
    -- every=1, low=0, high=9, step=1, init=1
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_i = 8 THEN
                      ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_eq = '1') THEN
                        ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_i <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_i - 9;
                    ELSE
                        ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_i <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_i,4));


	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdreg(REG,157)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdreg_q <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux(MUX,158)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_s <= en;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux: PROCESS (ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_s, ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdreg_q, ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_q <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdreg_q;
                  WHEN "1" => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_q <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem(DUALMEM,155)
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_ia <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_inputreg_q;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_aa <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdreg_q;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_ab <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_rdmux_q;
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 2,
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
        clocken1 => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_iq,
        address_a => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_aa,
        data_a => ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_ia
    );
    ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_reset0 <= areset;
        ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_q <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_iq(1 downto 0);

	--fracRPostExc_uid37_fpCbrtTest(MUX,36)@15
    fracRPostExc_uid37_fpCbrtTest_s <= ld_excREnc_uid33_fpCbrtTest_q_to_fracRPostExc_uid37_fpCbrtTest_b_replace_mem_q;
    fracRPostExc_uid37_fpCbrtTest: PROCESS (fracRPostExc_uid37_fpCbrtTest_s, en, cstAllZWF_uid9_fpCbrtTest_q, fracR_uid31_fpCbrtTest_b, cstAllZWF_uid9_fpCbrtTest_q, oneFracRPostExc2_uid34_fpCbrtTest_q)
    BEGIN
            CASE fracRPostExc_uid37_fpCbrtTest_s IS
                  WHEN "00" => fracRPostExc_uid37_fpCbrtTest_q <= cstAllZWF_uid9_fpCbrtTest_q;
                  WHEN "01" => fracRPostExc_uid37_fpCbrtTest_q <= fracR_uid31_fpCbrtTest_b;
                  WHEN "10" => fracRPostExc_uid37_fpCbrtTest_q <= cstAllZWF_uid9_fpCbrtTest_q;
                  WHEN "11" => fracRPostExc_uid37_fpCbrtTest_q <= oneFracRPostExc2_uid34_fpCbrtTest_q;
                  WHEN OTHERS => fracRPostExc_uid37_fpCbrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RCbrt_uid42_fpCbrtTest(BITJOIN,41)@15
    RCbrt_uid42_fpCbrtTest_q <= ld_signX_uid7_fpCbrtTest_b_to_RCbrt_uid42_fpCbrtTest_c_q & ld_expRPostExc_uid41_fpCbrtTest_q_to_RCbrt_uid42_fpCbrtTest_b_replace_mem_q & fracRPostExc_uid37_fpCbrtTest_q;

	--xOut(GPOUT,4)@15
    q <= RCbrt_uid42_fpCbrtTest_q;


end normal;
