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

-- VHDL created from fp_rsqrt_s5
-- VHDL created on Mon Mar 11 11:49:52 2013


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

entity fp_rsqrt_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_rsqrt_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid6_fpInvSqrtTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid7_fpInvSqrtTest_q : std_logic_vector (22 downto 0);
    signal cstNaNWF_uid8_fpInvSqrtTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid9_fpInvSqrtTest_q : std_logic_vector (7 downto 0);
    signal cst3BiasM1o2M1_uid10_fpInvSqrtTest_q : std_logic_vector (7 downto 0);
    signal cst3BiasP1o2M1_uid11_fpInvSqrtTest_q : std_logic_vector (7 downto 0);
    signal cstSel_uid42_fpInvSqrtTest_s : std_logic_vector (1 downto 0);
    signal cstSel_uid42_fpInvSqrtTest_q : std_logic_vector (7 downto 0);
    signal prodXY_uid75_pT1_uid63_invSqrtPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid75_pT1_uid63_invSqrtPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid75_pT1_uid63_invSqrtPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid75_pT1_uid63_invSqrtPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid75_pT1_uid63_invSqrtPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid78_pT2_uid69_invSqrtPolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid78_pT2_uid69_invSqrtPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid78_pT2_uid69_invSqrtPolyEval_s1 : std_logic_vector (37 downto 0);
    signal prodXY_uid78_pT2_uid69_invSqrtPolyEval_pr : SIGNED (38 downto 0);
    signal prodXY_uid78_pT2_uid69_invSqrtPolyEval_q : std_logic_vector (37 downto 0);
    signal memoryC0_uid59_invSqrtTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid59_invSqrtTabGen_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid59_invSqrtTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC0_uid59_invSqrtTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC0_uid59_invSqrtTabGen_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid59_invSqrtTabGen_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid60_invSqrtTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid60_invSqrtTabGen_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid60_invSqrtTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC1_uid60_invSqrtTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC1_uid60_invSqrtTabGen_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid60_invSqrtTabGen_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid61_invSqrtTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid61_invSqrtTabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid61_invSqrtTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC2_uid61_invSqrtTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC2_uid61_invSqrtTabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid61_invSqrtTabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_excRConc_uid52_fpInvSqrtTest_0_to_outMuxSelEnc_uid53_fpInvSqrtTest_0_q : std_logic_vector (2 downto 0);
    signal reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC2_uid61_invSqrtTabGen_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_yT1_uid62_invSqrtPolyEval_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid61_invSqrtTabGen_lutmem_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_memoryC1_uid60_invSqrtTabGen_lutmem_0_to_sumAHighB_uid66_invSqrtPolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid64_uid67_invSqrtPolyEval_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_memoryC0_uid59_invSqrtTabGen_lutmem_0_to_sumAHighB_uid72_invSqrtPolyEval_0_q : std_logic_vector (29 downto 0);
    signal ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a_q : std_logic_vector (22 downto 0);
    signal ld_expRExt_uid43_fpInvSqrtTest_b_to_expRExt_uid44_fpInvSqrtTest_b_q : std_logic_vector (6 downto 0);
    signal ld_outMuxSelEnc_uid53_fpInvSqrtTest_q_to_fracRPostExc_uid54_fpInvSqrtTest_b_q : std_logic_vector (1 downto 0);
    signal ld_signR_uid56_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC1_uid60_invSqrtTabGen_lutmem_0_q_to_memoryC1_uid60_invSqrtTabGen_lutmem_a_q : std_logic_vector (8 downto 0);
    signal ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_sticky_ena_q : signal is true;
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal exp_uid16_fpInvSqrtTest_in : std_logic_vector (30 downto 0);
    signal exp_uid16_fpInvSqrtTest_b : std_logic_vector (7 downto 0);
    signal frac_uid20_fpInvSqrtTest_in : std_logic_vector (22 downto 0);
    signal frac_uid20_fpInvSqrtTest_b : std_logic_vector (22 downto 0);
    signal signX_uid31_fpInvSqrtTest_in : std_logic_vector (31 downto 0);
    signal signX_uid31_fpInvSqrtTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid17_fpInvSqrtTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid17_fpInvSqrtTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid17_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid19_fpInvSqrtTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid19_fpInvSqrtTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid19_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid21_fpInvSqrtTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid21_fpInvSqrtTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid21_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid22_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid22_fpInvSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid22_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal expRExt_uid44_fpInvSqrtTest_a : std_logic_vector(8 downto 0);
    signal expRExt_uid44_fpInvSqrtTest_b : std_logic_vector(8 downto 0);
    signal expRExt_uid44_fpInvSqrtTest_o : std_logic_vector (8 downto 0);
    signal expRExt_uid44_fpInvSqrtTest_q : std_logic_vector (8 downto 0);
    signal outMuxSelEnc_uid53_fpInvSqrtTest_q : std_logic_vector(1 downto 0);
    signal signR_uid56_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal signR_uid56_fpInvSqrtTest_b : std_logic_vector(0 downto 0);
    signal signR_uid56_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal prodXYTruncFR_uid76_pT1_uid63_invSqrtPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid76_pT1_uid63_invSqrtPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid79_pT2_uid69_invSqrtPolyEval_in : std_logic_vector (37 downto 0);
    signal prodXYTruncFR_uid79_pT2_uid69_invSqrtPolyEval_b : std_logic_vector (23 downto 0);
    signal yPPolyEval_uid37_fpInvSqrtTest_in : std_logic_vector (14 downto 0);
    signal yPPolyEval_uid37_fpInvSqrtTest_b : std_logic_vector (14 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal evenOddExp_uid33_fpInvSqrtTest_in : std_logic_vector (0 downto 0);
    signal evenOddExp_uid33_fpInvSqrtTest_b : std_logic_vector (0 downto 0);
    signal expRExt_uid43_fpInvSqrtTest_in : std_logic_vector (7 downto 0);
    signal expRExt_uid43_fpInvSqrtTest_b : std_logic_vector (6 downto 0);
    signal yAddr_uid35_fpInvSqrtTest_in : std_logic_vector (22 downto 0);
    signal yAddr_uid35_fpInvSqrtTest_b : std_logic_vector (7 downto 0);
    signal InvSignX_uid47_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid47_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid49_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid49_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid23_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid23_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal join_uid41_fpInvSqrtTest_q : std_logic_vector (1 downto 0);
    signal excRZero_uid48_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid48_fpInvSqrtTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid48_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal expR_uid45_fpInvSqrtTest_in : std_logic_vector (7 downto 0);
    signal expR_uid45_fpInvSqrtTest_b : std_logic_vector (7 downto 0);
    signal expRPostExc_uid55_fpInvSqrtTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid55_fpInvSqrtTest_q : std_logic_vector (7 downto 0);
    signal lowRangeB_uid64_invSqrtPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid64_invSqrtPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid65_invSqrtPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid65_invSqrtPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid70_invSqrtPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid70_invSqrtPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid71_invSqrtPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid71_invSqrtPolyEval_b : std_logic_vector (21 downto 0);
    signal yT1_uid62_invSqrtPolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid62_invSqrtPolyEval_b : std_logic_vector (11 downto 0);
    signal yAddrPEvenOdd_uid36_fpInvSqrtTest_q : std_logic_vector (8 downto 0);
    signal xRegNeg_uid50_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal xRegNeg_uid50_fpInvSqrtTest_b : std_logic_vector(0 downto 0);
    signal xRegNeg_uid50_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid24_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid24_fpInvSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid24_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid66_invSqrtPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid66_invSqrtPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid66_invSqrtPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid66_invSqrtPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid72_invSqrtPolyEval_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid72_invSqrtPolyEval_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid72_invSqrtPolyEval_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid72_invSqrtPolyEval_q : std_logic_vector (30 downto 0);
    signal xNOxRNeg_uid51_fpInvSqrtTest_a : std_logic_vector(0 downto 0);
    signal xNOxRNeg_uid51_fpInvSqrtTest_b : std_logic_vector(0 downto 0);
    signal xNOxRNeg_uid51_fpInvSqrtTest_q : std_logic_vector(0 downto 0);
    signal s1_uid64_uid67_invSqrtPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid70_uid73_invSqrtPolyEval_q : std_logic_vector (32 downto 0);
    signal excRConc_uid52_fpInvSqrtTest_q : std_logic_vector (2 downto 0);
    signal fxpInvSqrtRes_uid39_fpInvSqrtTest_in : std_logic_vector (29 downto 0);
    signal fxpInvSqrtRes_uid39_fpInvSqrtTest_b : std_logic_vector (23 downto 0);
    signal fxpInverseResFrac_uid46_fpInvSqrtTest_in : std_logic_vector (22 downto 0);
    signal fxpInverseResFrac_uid46_fpInvSqrtTest_b : std_logic_vector (22 downto 0);
    signal fracRPostExc_uid54_fpInvSqrtTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid54_fpInvSqrtTest_q : std_logic_vector (22 downto 0);
    signal R_uid57_fpInvSqrtTest_q : std_logic_vector (31 downto 0);
begin


	--GND(CONSTANT,0)

	--xIn(GPIN,3)@0

	--signX_uid31_fpInvSqrtTest(BITSELECT,30)@0
    signX_uid31_fpInvSqrtTest_in <= a;
    signX_uid31_fpInvSqrtTest_b <= signX_uid31_fpInvSqrtTest_in(31 downto 31);

	--cstAllZWE_uid9_fpInvSqrtTest(CONSTANT,8)
    cstAllZWE_uid9_fpInvSqrtTest_q <= "00000000";

	--exp_uid16_fpInvSqrtTest(BITSELECT,15)@0
    exp_uid16_fpInvSqrtTest_in <= a(30 downto 0);
    exp_uid16_fpInvSqrtTest_b <= exp_uid16_fpInvSqrtTest_in(30 downto 23);

	--expXIsZero_uid17_fpInvSqrtTest(LOGICAL,16)@0
    expXIsZero_uid17_fpInvSqrtTest_a <= exp_uid16_fpInvSqrtTest_b;
    expXIsZero_uid17_fpInvSqrtTest_b <= cstAllZWE_uid9_fpInvSqrtTest_q;
    expXIsZero_uid17_fpInvSqrtTest_q <= "1" when expXIsZero_uid17_fpInvSqrtTest_a = expXIsZero_uid17_fpInvSqrtTest_b else "0";

	--signR_uid56_fpInvSqrtTest(LOGICAL,55)@0
    signR_uid56_fpInvSqrtTest_a <= expXIsZero_uid17_fpInvSqrtTest_q;
    signR_uid56_fpInvSqrtTest_b <= signX_uid31_fpInvSqrtTest_b;
    signR_uid56_fpInvSqrtTest_q <= signR_uid56_fpInvSqrtTest_a and signR_uid56_fpInvSqrtTest_b;

	--ld_signR_uid56_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_c(DELAY,139)@0
    ld_signR_uid56_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => signR_uid56_fpInvSqrtTest_q, xout => ld_signR_uid56_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable(LOGICAL,182)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable_a <= en;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable_q <= not ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable_a;

	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor(LOGICAL,183)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_a <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable_q;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_b <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_sticky_ena_q;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_q <= not (ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_a or ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_b);

	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_mem_top(CONSTANT,179)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_mem_top_q <= "0111";

	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp(LOGICAL,180)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_a <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_mem_top_q;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_q);
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_q <= "1" when ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_a = ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_b else "0";

	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmpReg(REG,181)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmpReg_q <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_sticky_ena(REG,184)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_sticky_ena_q <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd(LOGICAL,185)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_a <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_sticky_ena_q;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_q <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_a and ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_b;

	--cstAllOWE_uid6_fpInvSqrtTest(CONSTANT,5)
    cstAllOWE_uid6_fpInvSqrtTest_q <= "11111111";

	--expRExt_uid43_fpInvSqrtTest(BITSELECT,42)@0
    expRExt_uid43_fpInvSqrtTest_in <= exp_uid16_fpInvSqrtTest_b;
    expRExt_uid43_fpInvSqrtTest_b <= expRExt_uid43_fpInvSqrtTest_in(7 downto 1);

	--ld_expRExt_uid43_fpInvSqrtTest_b_to_expRExt_uid44_fpInvSqrtTest_b(DELAY,116)@0
    ld_expRExt_uid43_fpInvSqrtTest_b_to_expRExt_uid44_fpInvSqrtTest_b : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => expRExt_uid43_fpInvSqrtTest_b, xout => ld_expRExt_uid43_fpInvSqrtTest_b_to_expRExt_uid44_fpInvSqrtTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cst3BiasM1o2M1_uid10_fpInvSqrtTest(CONSTANT,9)
    cst3BiasM1o2M1_uid10_fpInvSqrtTest_q <= "10111101";

	--cst3BiasP1o2M1_uid11_fpInvSqrtTest(CONSTANT,10)
    cst3BiasP1o2M1_uid11_fpInvSqrtTest_q <= "10111110";

	--cstAllZWF_uid7_fpInvSqrtTest(CONSTANT,6)
    cstAllZWF_uid7_fpInvSqrtTest_q <= "00000000000000000000000";

	--frac_uid20_fpInvSqrtTest(BITSELECT,19)@0
    frac_uid20_fpInvSqrtTest_in <= a(22 downto 0);
    frac_uid20_fpInvSqrtTest_b <= frac_uid20_fpInvSqrtTest_in(22 downto 0);

	--fracXIsZero_uid21_fpInvSqrtTest(LOGICAL,20)@0
    fracXIsZero_uid21_fpInvSqrtTest_a <= frac_uid20_fpInvSqrtTest_b;
    fracXIsZero_uid21_fpInvSqrtTest_b <= cstAllZWF_uid7_fpInvSqrtTest_q;
    fracXIsZero_uid21_fpInvSqrtTest_q <= "1" when fracXIsZero_uid21_fpInvSqrtTest_a = fracXIsZero_uid21_fpInvSqrtTest_b else "0";

	--evenOddExp_uid33_fpInvSqrtTest(BITSELECT,32)@0
    evenOddExp_uid33_fpInvSqrtTest_in <= exp_uid16_fpInvSqrtTest_b(0 downto 0);
    evenOddExp_uid33_fpInvSqrtTest_b <= evenOddExp_uid33_fpInvSqrtTest_in(0 downto 0);

	--join_uid41_fpInvSqrtTest(BITJOIN,40)@0
    join_uid41_fpInvSqrtTest_q <= fracXIsZero_uid21_fpInvSqrtTest_q & evenOddExp_uid33_fpInvSqrtTest_b;

	--cstSel_uid42_fpInvSqrtTest(MUX,41)@0
    cstSel_uid42_fpInvSqrtTest_s <= join_uid41_fpInvSqrtTest_q;
    cstSel_uid42_fpInvSqrtTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            cstSel_uid42_fpInvSqrtTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE cstSel_uid42_fpInvSqrtTest_s IS
                      WHEN "00" => cstSel_uid42_fpInvSqrtTest_q <= cst3BiasP1o2M1_uid11_fpInvSqrtTest_q;
                      WHEN "01" => cstSel_uid42_fpInvSqrtTest_q <= cst3BiasM1o2M1_uid10_fpInvSqrtTest_q;
                      WHEN "10" => cstSel_uid42_fpInvSqrtTest_q <= cst3BiasP1o2M1_uid11_fpInvSqrtTest_q;
                      WHEN "11" => cstSel_uid42_fpInvSqrtTest_q <= cst3BiasP1o2M1_uid11_fpInvSqrtTest_q;
                      WHEN OTHERS => cstSel_uid42_fpInvSqrtTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--expRExt_uid44_fpInvSqrtTest(SUB,43)@1
    expRExt_uid44_fpInvSqrtTest_a <= STD_LOGIC_VECTOR("0" & cstSel_uid42_fpInvSqrtTest_q);
    expRExt_uid44_fpInvSqrtTest_b <= STD_LOGIC_VECTOR("00" & ld_expRExt_uid43_fpInvSqrtTest_b_to_expRExt_uid44_fpInvSqrtTest_b_q);
            expRExt_uid44_fpInvSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt_uid44_fpInvSqrtTest_a) - UNSIGNED(expRExt_uid44_fpInvSqrtTest_b));
    expRExt_uid44_fpInvSqrtTest_q <= expRExt_uid44_fpInvSqrtTest_o(8 downto 0);


	--expR_uid45_fpInvSqrtTest(BITSELECT,44)@1
    expR_uid45_fpInvSqrtTest_in <= expRExt_uid44_fpInvSqrtTest_q(7 downto 0);
    expR_uid45_fpInvSqrtTest_b <= expR_uid45_fpInvSqrtTest_in(7 downto 0);

	--InvExpXIsZero_uid49_fpInvSqrtTest(LOGICAL,48)@0
    InvExpXIsZero_uid49_fpInvSqrtTest_a <= expXIsZero_uid17_fpInvSqrtTest_q;
    InvExpXIsZero_uid49_fpInvSqrtTest_q <= not InvExpXIsZero_uid49_fpInvSqrtTest_a;

	--xRegNeg_uid50_fpInvSqrtTest(LOGICAL,49)@0
    xRegNeg_uid50_fpInvSqrtTest_a <= InvExpXIsZero_uid49_fpInvSqrtTest_q;
    xRegNeg_uid50_fpInvSqrtTest_b <= signX_uid31_fpInvSqrtTest_b;
    xRegNeg_uid50_fpInvSqrtTest_q <= xRegNeg_uid50_fpInvSqrtTest_a and xRegNeg_uid50_fpInvSqrtTest_b;

	--InvFracXIsZero_uid23_fpInvSqrtTest(LOGICAL,22)@0
    InvFracXIsZero_uid23_fpInvSqrtTest_a <= fracXIsZero_uid21_fpInvSqrtTest_q;
    InvFracXIsZero_uid23_fpInvSqrtTest_q <= not InvFracXIsZero_uid23_fpInvSqrtTest_a;

	--expXIsMax_uid19_fpInvSqrtTest(LOGICAL,18)@0
    expXIsMax_uid19_fpInvSqrtTest_a <= exp_uid16_fpInvSqrtTest_b;
    expXIsMax_uid19_fpInvSqrtTest_b <= cstAllOWE_uid6_fpInvSqrtTest_q;
    expXIsMax_uid19_fpInvSqrtTest_q <= "1" when expXIsMax_uid19_fpInvSqrtTest_a = expXIsMax_uid19_fpInvSqrtTest_b else "0";

	--exc_N_uid24_fpInvSqrtTest(LOGICAL,23)@0
    exc_N_uid24_fpInvSqrtTest_a <= expXIsMax_uid19_fpInvSqrtTest_q;
    exc_N_uid24_fpInvSqrtTest_b <= InvFracXIsZero_uid23_fpInvSqrtTest_q;
    exc_N_uid24_fpInvSqrtTest_q <= exc_N_uid24_fpInvSqrtTest_a and exc_N_uid24_fpInvSqrtTest_b;

	--xNOxRNeg_uid51_fpInvSqrtTest(LOGICAL,50)@0
    xNOxRNeg_uid51_fpInvSqrtTest_a <= exc_N_uid24_fpInvSqrtTest_q;
    xNOxRNeg_uid51_fpInvSqrtTest_b <= xRegNeg_uid50_fpInvSqrtTest_q;
    xNOxRNeg_uid51_fpInvSqrtTest_q <= xNOxRNeg_uid51_fpInvSqrtTest_a or xNOxRNeg_uid51_fpInvSqrtTest_b;

	--exc_I_uid22_fpInvSqrtTest(LOGICAL,21)@0
    exc_I_uid22_fpInvSqrtTest_a <= expXIsMax_uid19_fpInvSqrtTest_q;
    exc_I_uid22_fpInvSqrtTest_b <= fracXIsZero_uid21_fpInvSqrtTest_q;
    exc_I_uid22_fpInvSqrtTest_q <= exc_I_uid22_fpInvSqrtTest_a and exc_I_uid22_fpInvSqrtTest_b;

	--InvSignX_uid47_fpInvSqrtTest(LOGICAL,46)@0
    InvSignX_uid47_fpInvSqrtTest_a <= signX_uid31_fpInvSqrtTest_b;
    InvSignX_uid47_fpInvSqrtTest_q <= not InvSignX_uid47_fpInvSqrtTest_a;

	--excRZero_uid48_fpInvSqrtTest(LOGICAL,47)@0
    excRZero_uid48_fpInvSqrtTest_a <= InvSignX_uid47_fpInvSqrtTest_q;
    excRZero_uid48_fpInvSqrtTest_b <= exc_I_uid22_fpInvSqrtTest_q;
    excRZero_uid48_fpInvSqrtTest_q <= excRZero_uid48_fpInvSqrtTest_a and excRZero_uid48_fpInvSqrtTest_b;

	--excRConc_uid52_fpInvSqrtTest(BITJOIN,51)@0
    excRConc_uid52_fpInvSqrtTest_q <= xNOxRNeg_uid51_fpInvSqrtTest_q & expXIsZero_uid17_fpInvSqrtTest_q & excRZero_uid48_fpInvSqrtTest_q;

	--reg_excRConc_uid52_fpInvSqrtTest_0_to_outMuxSelEnc_uid53_fpInvSqrtTest_0(REG,83)@0
    reg_excRConc_uid52_fpInvSqrtTest_0_to_outMuxSelEnc_uid53_fpInvSqrtTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRConc_uid52_fpInvSqrtTest_0_to_outMuxSelEnc_uid53_fpInvSqrtTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRConc_uid52_fpInvSqrtTest_0_to_outMuxSelEnc_uid53_fpInvSqrtTest_0_q <= excRConc_uid52_fpInvSqrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid53_fpInvSqrtTest(LOOKUP,52)@1
    outMuxSelEnc_uid53_fpInvSqrtTest: PROCESS (reg_excRConc_uid52_fpInvSqrtTest_0_to_outMuxSelEnc_uid53_fpInvSqrtTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excRConc_uid52_fpInvSqrtTest_0_to_outMuxSelEnc_uid53_fpInvSqrtTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid53_fpInvSqrtTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid53_fpInvSqrtTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid53_fpInvSqrtTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid53_fpInvSqrtTest_q <= "00";
                WHEN "100" =>  outMuxSelEnc_uid53_fpInvSqrtTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid53_fpInvSqrtTest_q <= "00";
                WHEN "110" =>  outMuxSelEnc_uid53_fpInvSqrtTest_q <= "10";
                WHEN "111" =>  outMuxSelEnc_uid53_fpInvSqrtTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid53_fpInvSqrtTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid55_fpInvSqrtTest(MUX,54)@1
    expRPostExc_uid55_fpInvSqrtTest_s <= outMuxSelEnc_uid53_fpInvSqrtTest_q;
    expRPostExc_uid55_fpInvSqrtTest: PROCESS (expRPostExc_uid55_fpInvSqrtTest_s, en, cstAllZWE_uid9_fpInvSqrtTest_q, expR_uid45_fpInvSqrtTest_b, cstAllOWE_uid6_fpInvSqrtTest_q, cstAllOWE_uid6_fpInvSqrtTest_q)
    BEGIN
            CASE expRPostExc_uid55_fpInvSqrtTest_s IS
                  WHEN "00" => expRPostExc_uid55_fpInvSqrtTest_q <= cstAllZWE_uid9_fpInvSqrtTest_q;
                  WHEN "01" => expRPostExc_uid55_fpInvSqrtTest_q <= expR_uid45_fpInvSqrtTest_b;
                  WHEN "10" => expRPostExc_uid55_fpInvSqrtTest_q <= cstAllOWE_uid6_fpInvSqrtTest_q;
                  WHEN "11" => expRPostExc_uid55_fpInvSqrtTest_q <= cstAllOWE_uid6_fpInvSqrtTest_q;
                  WHEN OTHERS => expRPostExc_uid55_fpInvSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_inputreg(DELAY,173)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid55_fpInvSqrtTest_q, xout => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt(COUNTER,175)
    -- every=1, low=0, high=7, step=1, init=1
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_i <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdreg(REG,176)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdreg_q <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux(MUX,177)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_s, ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdreg_q, ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_q <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_q <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem(DUALMEM,174)
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_ia <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_inputreg_q;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_aa <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdreg_q;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_ab <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_rdmux_q;
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_ia
    );
    ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_reset0 <= areset;
        ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_q <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_iq(7 downto 0);

	--cstNaNWF_uid8_fpInvSqrtTest(CONSTANT,7)
    cstNaNWF_uid8_fpInvSqrtTest_q <= "00000000000000000000001";

	--yAddr_uid35_fpInvSqrtTest(BITSELECT,34)@0
    yAddr_uid35_fpInvSqrtTest_in <= frac_uid20_fpInvSqrtTest_b;
    yAddr_uid35_fpInvSqrtTest_b <= yAddr_uid35_fpInvSqrtTest_in(22 downto 15);

	--yAddrPEvenOdd_uid36_fpInvSqrtTest(BITJOIN,35)@0
    yAddrPEvenOdd_uid36_fpInvSqrtTest_q <= evenOddExp_uid33_fpInvSqrtTest_b & yAddr_uid35_fpInvSqrtTest_b;

	--reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC2_uid61_invSqrtTabGen_lutmem_0(REG,84)@0
    reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC2_uid61_invSqrtTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC2_uid61_invSqrtTabGen_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC2_uid61_invSqrtTabGen_lutmem_0_q <= yAddrPEvenOdd_uid36_fpInvSqrtTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid61_invSqrtTabGen_lutmem(DUALMEM,82)@1
    memoryC2_uid61_invSqrtTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid61_invSqrtTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid61_invSqrtTabGen_lutmem_ab <= reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC2_uid61_invSqrtTabGen_lutmem_0_q;
    memoryC2_uid61_invSqrtTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 12,
        widthad_b => 9,
        numwords_b => 512,
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
        init_file => "fp_rsqrt_s5_memoryC2_uid61_invSqrtTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid61_invSqrtTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid61_invSqrtTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid61_invSqrtTabGen_lutmem_iq,
        address_a => memoryC2_uid61_invSqrtTabGen_lutmem_aa,
        data_a => memoryC2_uid61_invSqrtTabGen_lutmem_ia
    );
    memoryC2_uid61_invSqrtTabGen_lutmem_reset0 <= areset;
        memoryC2_uid61_invSqrtTabGen_lutmem_q <= memoryC2_uid61_invSqrtTabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid61_invSqrtTabGen_lutmem_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_1(REG,86)@3
    reg_memoryC2_uid61_invSqrtTabGen_lutmem_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid61_invSqrtTabGen_lutmem_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid61_invSqrtTabGen_lutmem_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_1_q <= memoryC2_uid61_invSqrtTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a_inputreg(DELAY,172)
    ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => frac_uid20_fpInvSqrtTest_b, xout => ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a(DELAY,109)@0
    ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a_inputreg_q, xout => ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid37_fpInvSqrtTest(BITSELECT,36)@3
    yPPolyEval_uid37_fpInvSqrtTest_in <= ld_frac_uid20_fpInvSqrtTest_b_to_yPPolyEval_uid37_fpInvSqrtTest_a_q(14 downto 0);
    yPPolyEval_uid37_fpInvSqrtTest_b <= yPPolyEval_uid37_fpInvSqrtTest_in(14 downto 0);

	--yT1_uid62_invSqrtPolyEval(BITSELECT,61)@3
    yT1_uid62_invSqrtPolyEval_in <= yPPolyEval_uid37_fpInvSqrtTest_b;
    yT1_uid62_invSqrtPolyEval_b <= yT1_uid62_invSqrtPolyEval_in(14 downto 3);

	--reg_yT1_uid62_invSqrtPolyEval_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_0(REG,85)@3
    reg_yT1_uid62_invSqrtPolyEval_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid62_invSqrtPolyEval_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid62_invSqrtPolyEval_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_0_q <= yT1_uid62_invSqrtPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid75_pT1_uid63_invSqrtPolyEval(MULT,74)@4
    prodXY_uid75_pT1_uid63_invSqrtPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid75_pT1_uid63_invSqrtPolyEval_a),13)) * SIGNED(prodXY_uid75_pT1_uid63_invSqrtPolyEval_b);
    prodXY_uid75_pT1_uid63_invSqrtPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid75_pT1_uid63_invSqrtPolyEval_a <= (others => '0');
            prodXY_uid75_pT1_uid63_invSqrtPolyEval_b <= (others => '0');
            prodXY_uid75_pT1_uid63_invSqrtPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid75_pT1_uid63_invSqrtPolyEval_a <= reg_yT1_uid62_invSqrtPolyEval_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_0_q;
                prodXY_uid75_pT1_uid63_invSqrtPolyEval_b <= reg_memoryC2_uid61_invSqrtTabGen_lutmem_0_to_prodXY_uid75_pT1_uid63_invSqrtPolyEval_1_q;
                prodXY_uid75_pT1_uid63_invSqrtPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid75_pT1_uid63_invSqrtPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid75_pT1_uid63_invSqrtPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid75_pT1_uid63_invSqrtPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid75_pT1_uid63_invSqrtPolyEval_q <= prodXY_uid75_pT1_uid63_invSqrtPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid76_pT1_uid63_invSqrtPolyEval(BITSELECT,75)@7
    prodXYTruncFR_uid76_pT1_uid63_invSqrtPolyEval_in <= prodXY_uid75_pT1_uid63_invSqrtPolyEval_q;
    prodXYTruncFR_uid76_pT1_uid63_invSqrtPolyEval_b <= prodXYTruncFR_uid76_pT1_uid63_invSqrtPolyEval_in(23 downto 11);

	--highBBits_uid65_invSqrtPolyEval(BITSELECT,64)@7
    highBBits_uid65_invSqrtPolyEval_in <= prodXYTruncFR_uid76_pT1_uid63_invSqrtPolyEval_b;
    highBBits_uid65_invSqrtPolyEval_b <= highBBits_uid65_invSqrtPolyEval_in(12 downto 1);

	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC1_uid60_invSqrtTabGen_lutmem_0_q_to_memoryC1_uid60_invSqrtTabGen_lutmem_a(DELAY,160)@1
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC1_uid60_invSqrtTabGen_lutmem_0_q_to_memoryC1_uid60_invSqrtTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 3 )
    PORT MAP ( xin => reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC2_uid61_invSqrtTabGen_lutmem_0_q, xout => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC1_uid60_invSqrtTabGen_lutmem_0_q_to_memoryC1_uid60_invSqrtTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid60_invSqrtTabGen_lutmem(DUALMEM,81)@4
    memoryC1_uid60_invSqrtTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid60_invSqrtTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid60_invSqrtTabGen_lutmem_ab <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC1_uid60_invSqrtTabGen_lutmem_0_q_to_memoryC1_uid60_invSqrtTabGen_lutmem_a_q;
    memoryC1_uid60_invSqrtTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 21,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 21,
        widthad_b => 9,
        numwords_b => 512,
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
        init_file => "fp_rsqrt_s5_memoryC1_uid60_invSqrtTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid60_invSqrtTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid60_invSqrtTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid60_invSqrtTabGen_lutmem_iq,
        address_a => memoryC1_uid60_invSqrtTabGen_lutmem_aa,
        data_a => memoryC1_uid60_invSqrtTabGen_lutmem_ia
    );
    memoryC1_uid60_invSqrtTabGen_lutmem_reset0 <= areset;
        memoryC1_uid60_invSqrtTabGen_lutmem_q <= memoryC1_uid60_invSqrtTabGen_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid60_invSqrtTabGen_lutmem_0_to_sumAHighB_uid66_invSqrtPolyEval_0(REG,88)@6
    reg_memoryC1_uid60_invSqrtTabGen_lutmem_0_to_sumAHighB_uid66_invSqrtPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid60_invSqrtTabGen_lutmem_0_to_sumAHighB_uid66_invSqrtPolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid60_invSqrtTabGen_lutmem_0_to_sumAHighB_uid66_invSqrtPolyEval_0_q <= memoryC1_uid60_invSqrtTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid66_invSqrtPolyEval(ADD,65)@7
    sumAHighB_uid66_invSqrtPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid60_invSqrtTabGen_lutmem_0_to_sumAHighB_uid66_invSqrtPolyEval_0_q(20)) & reg_memoryC1_uid60_invSqrtTabGen_lutmem_0_to_sumAHighB_uid66_invSqrtPolyEval_0_q);
    sumAHighB_uid66_invSqrtPolyEval_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid65_invSqrtPolyEval_b(11)) & highBBits_uid65_invSqrtPolyEval_b);
            sumAHighB_uid66_invSqrtPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid66_invSqrtPolyEval_a) + SIGNED(sumAHighB_uid66_invSqrtPolyEval_b));
    sumAHighB_uid66_invSqrtPolyEval_q <= sumAHighB_uid66_invSqrtPolyEval_o(21 downto 0);


	--lowRangeB_uid64_invSqrtPolyEval(BITSELECT,63)@7
    lowRangeB_uid64_invSqrtPolyEval_in <= prodXYTruncFR_uid76_pT1_uid63_invSqrtPolyEval_b(0 downto 0);
    lowRangeB_uid64_invSqrtPolyEval_b <= lowRangeB_uid64_invSqrtPolyEval_in(0 downto 0);

	--s1_uid64_uid67_invSqrtPolyEval(BITJOIN,66)@7
    s1_uid64_uid67_invSqrtPolyEval_q <= sumAHighB_uid66_invSqrtPolyEval_q & lowRangeB_uid64_invSqrtPolyEval_b;

	--reg_s1_uid64_uid67_invSqrtPolyEval_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_1(REG,90)@7
    reg_s1_uid64_uid67_invSqrtPolyEval_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid64_uid67_invSqrtPolyEval_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid64_uid67_invSqrtPolyEval_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_1_q <= s1_uid64_uid67_invSqrtPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor(LOGICAL,207)
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_a <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable_q;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_b <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_q <= not (ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_a or ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_b);

	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_cmpReg(REG,205)
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_sticky_ena(REG,208)
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_nor_q = "1") THEN
                ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_sticky_ena_q <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd(LOGICAL,209)
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_a <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_b <= en;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_q <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_a and ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_b;

	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_inputreg(DELAY,199)
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => yPPolyEval_uid37_fpInvSqrtTest_b, xout => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt(COUNTER,201)
    -- every=1, low=0, high=1, step=1, init=1
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_i <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_i,1));


	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdreg(REG,202)
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdreg_q <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux(MUX,203)
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_s <= en;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux: PROCESS (ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_s, ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdreg_q, ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_q <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdreg_q;
                  WHEN "1" => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_q <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem(DUALMEM,200)
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_ia <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_inputreg_q;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_aa <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdreg_q;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_ab <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_rdmux_q;
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_ia
    );
    ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_q <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_iq(14 downto 0);

	--reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0(REG,89)@7
    reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_q <= ld_yPPolyEval_uid37_fpInvSqrtTest_b_to_reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid78_pT2_uid69_invSqrtPolyEval(MULT,77)@8
    prodXY_uid78_pT2_uid69_invSqrtPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid78_pT2_uid69_invSqrtPolyEval_a),16)) * SIGNED(prodXY_uid78_pT2_uid69_invSqrtPolyEval_b);
    prodXY_uid78_pT2_uid69_invSqrtPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid78_pT2_uid69_invSqrtPolyEval_a <= (others => '0');
            prodXY_uid78_pT2_uid69_invSqrtPolyEval_b <= (others => '0');
            prodXY_uid78_pT2_uid69_invSqrtPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid78_pT2_uid69_invSqrtPolyEval_a <= reg_yPPolyEval_uid37_fpInvSqrtTest_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_0_q;
                prodXY_uid78_pT2_uid69_invSqrtPolyEval_b <= reg_s1_uid64_uid67_invSqrtPolyEval_0_to_prodXY_uid78_pT2_uid69_invSqrtPolyEval_1_q;
                prodXY_uid78_pT2_uid69_invSqrtPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid78_pT2_uid69_invSqrtPolyEval_pr,38));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid78_pT2_uid69_invSqrtPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid78_pT2_uid69_invSqrtPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid78_pT2_uid69_invSqrtPolyEval_q <= prodXY_uid78_pT2_uid69_invSqrtPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid79_pT2_uid69_invSqrtPolyEval(BITSELECT,78)@11
    prodXYTruncFR_uid79_pT2_uid69_invSqrtPolyEval_in <= prodXY_uid78_pT2_uid69_invSqrtPolyEval_q;
    prodXYTruncFR_uid79_pT2_uid69_invSqrtPolyEval_b <= prodXYTruncFR_uid79_pT2_uid69_invSqrtPolyEval_in(37 downto 14);

	--highBBits_uid71_invSqrtPolyEval(BITSELECT,70)@11
    highBBits_uid71_invSqrtPolyEval_in <= prodXYTruncFR_uid79_pT2_uid69_invSqrtPolyEval_b;
    highBBits_uid71_invSqrtPolyEval_b <= highBBits_uid71_invSqrtPolyEval_in(23 downto 2);

	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor(LOGICAL,196)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_a <= ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_notEnable_q;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_b <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_q <= not (ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_a or ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_b);

	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_mem_top(CONSTANT,192)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_mem_top_q <= "0100";

	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp(LOGICAL,193)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_a <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_mem_top_q;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_q);
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_q <= "1" when ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_a = ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_b else "0";

	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmpReg(REG,194)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmpReg_q <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_sticky_ena(REG,197)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_sticky_ena_q <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd(LOGICAL,198)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_a <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_q <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_a and ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_b;

	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_inputreg(DELAY,186)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC2_uid61_invSqrtTabGen_lutmem_0_q, xout => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt(COUNTER,188)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_i = 3 THEN
                      ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_i <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_i <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_i,3));


	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdreg(REG,189)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdreg_q <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux(MUX,190)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_s <= en;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux: PROCESS (ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_s, ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdreg_q, ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_q <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_q <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem(DUALMEM,187)
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_ia <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_inputreg_q;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_aa <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdreg_q;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_ab <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_rdmux_q;
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_ia
    );
    ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_q <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_iq(8 downto 0);

	--memoryC0_uid59_invSqrtTabGen_lutmem(DUALMEM,80)@8
    memoryC0_uid59_invSqrtTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid59_invSqrtTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid59_invSqrtTabGen_lutmem_ab <= ld_reg_yAddrPEvenOdd_uid36_fpInvSqrtTest_0_to_memoryC0_uid59_invSqrtTabGen_lutmem_0_q_to_memoryC0_uid59_invSqrtTabGen_lutmem_a_replace_mem_q;
    memoryC0_uid59_invSqrtTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 30,
        widthad_b => 9,
        numwords_b => 512,
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
        init_file => "fp_rsqrt_s5_memoryC0_uid59_invSqrtTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid59_invSqrtTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid59_invSqrtTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid59_invSqrtTabGen_lutmem_iq,
        address_a => memoryC0_uid59_invSqrtTabGen_lutmem_aa,
        data_a => memoryC0_uid59_invSqrtTabGen_lutmem_ia
    );
    memoryC0_uid59_invSqrtTabGen_lutmem_reset0 <= areset;
        memoryC0_uid59_invSqrtTabGen_lutmem_q <= memoryC0_uid59_invSqrtTabGen_lutmem_iq(29 downto 0);

	--reg_memoryC0_uid59_invSqrtTabGen_lutmem_0_to_sumAHighB_uid72_invSqrtPolyEval_0(REG,92)@10
    reg_memoryC0_uid59_invSqrtTabGen_lutmem_0_to_sumAHighB_uid72_invSqrtPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid59_invSqrtTabGen_lutmem_0_to_sumAHighB_uid72_invSqrtPolyEval_0_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid59_invSqrtTabGen_lutmem_0_to_sumAHighB_uid72_invSqrtPolyEval_0_q <= memoryC0_uid59_invSqrtTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid72_invSqrtPolyEval(ADD,71)@11
    sumAHighB_uid72_invSqrtPolyEval_a <= STD_LOGIC_VECTOR((30 downto 30 => reg_memoryC0_uid59_invSqrtTabGen_lutmem_0_to_sumAHighB_uid72_invSqrtPolyEval_0_q(29)) & reg_memoryC0_uid59_invSqrtTabGen_lutmem_0_to_sumAHighB_uid72_invSqrtPolyEval_0_q);
    sumAHighB_uid72_invSqrtPolyEval_b <= STD_LOGIC_VECTOR((30 downto 22 => highBBits_uid71_invSqrtPolyEval_b(21)) & highBBits_uid71_invSqrtPolyEval_b);
            sumAHighB_uid72_invSqrtPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid72_invSqrtPolyEval_a) + SIGNED(sumAHighB_uid72_invSqrtPolyEval_b));
    sumAHighB_uid72_invSqrtPolyEval_q <= sumAHighB_uid72_invSqrtPolyEval_o(30 downto 0);


	--lowRangeB_uid70_invSqrtPolyEval(BITSELECT,69)@11
    lowRangeB_uid70_invSqrtPolyEval_in <= prodXYTruncFR_uid79_pT2_uid69_invSqrtPolyEval_b(1 downto 0);
    lowRangeB_uid70_invSqrtPolyEval_b <= lowRangeB_uid70_invSqrtPolyEval_in(1 downto 0);

	--s2_uid70_uid73_invSqrtPolyEval(BITJOIN,72)@11
    s2_uid70_uid73_invSqrtPolyEval_q <= sumAHighB_uid72_invSqrtPolyEval_q & lowRangeB_uid70_invSqrtPolyEval_b;

	--fxpInvSqrtRes_uid39_fpInvSqrtTest(BITSELECT,38)@11
    fxpInvSqrtRes_uid39_fpInvSqrtTest_in <= s2_uid70_uid73_invSqrtPolyEval_q(29 downto 0);
    fxpInvSqrtRes_uid39_fpInvSqrtTest_b <= fxpInvSqrtRes_uid39_fpInvSqrtTest_in(29 downto 6);

	--fxpInverseResFrac_uid46_fpInvSqrtTest(BITSELECT,45)@11
    fxpInverseResFrac_uid46_fpInvSqrtTest_in <= fxpInvSqrtRes_uid39_fpInvSqrtTest_b(22 downto 0);
    fxpInverseResFrac_uid46_fpInvSqrtTest_b <= fxpInverseResFrac_uid46_fpInvSqrtTest_in(22 downto 0);

	--ld_outMuxSelEnc_uid53_fpInvSqrtTest_q_to_fracRPostExc_uid54_fpInvSqrtTest_b(DELAY,131)@1
    ld_outMuxSelEnc_uid53_fpInvSqrtTest_q_to_fracRPostExc_uid54_fpInvSqrtTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 10 )
    PORT MAP ( xin => outMuxSelEnc_uid53_fpInvSqrtTest_q, xout => ld_outMuxSelEnc_uid53_fpInvSqrtTest_q_to_fracRPostExc_uid54_fpInvSqrtTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid54_fpInvSqrtTest(MUX,53)@11
    fracRPostExc_uid54_fpInvSqrtTest_s <= ld_outMuxSelEnc_uid53_fpInvSqrtTest_q_to_fracRPostExc_uid54_fpInvSqrtTest_b_q;
    fracRPostExc_uid54_fpInvSqrtTest: PROCESS (fracRPostExc_uid54_fpInvSqrtTest_s, en, cstAllZWF_uid7_fpInvSqrtTest_q, fxpInverseResFrac_uid46_fpInvSqrtTest_b, cstAllZWF_uid7_fpInvSqrtTest_q, cstNaNWF_uid8_fpInvSqrtTest_q)
    BEGIN
            CASE fracRPostExc_uid54_fpInvSqrtTest_s IS
                  WHEN "00" => fracRPostExc_uid54_fpInvSqrtTest_q <= cstAllZWF_uid7_fpInvSqrtTest_q;
                  WHEN "01" => fracRPostExc_uid54_fpInvSqrtTest_q <= fxpInverseResFrac_uid46_fpInvSqrtTest_b;
                  WHEN "10" => fracRPostExc_uid54_fpInvSqrtTest_q <= cstAllZWF_uid7_fpInvSqrtTest_q;
                  WHEN "11" => fracRPostExc_uid54_fpInvSqrtTest_q <= cstNaNWF_uid8_fpInvSqrtTest_q;
                  WHEN OTHERS => fracRPostExc_uid54_fpInvSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid57_fpInvSqrtTest(BITJOIN,56)@11
    R_uid57_fpInvSqrtTest_q <= ld_signR_uid56_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_c_q & ld_expRPostExc_uid55_fpInvSqrtTest_q_to_R_uid57_fpInvSqrtTest_b_replace_mem_q & fracRPostExc_uid54_fpInvSqrtTest_q;

	--xOut(GPOUT,4)@11
    q <= R_uid57_fpInvSqrtTest_q;


end normal;
