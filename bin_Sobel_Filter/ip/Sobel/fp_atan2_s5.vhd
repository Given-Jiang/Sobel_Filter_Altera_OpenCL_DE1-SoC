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

-- VHDL created from fp_atan2_s5
-- VHDL created on Fri Apr 12 10:15:03 2013


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

entity fp_atan2_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_atan2_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid6_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid7_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal zwEwF_uid40_fpArctan2Test_q : std_logic_vector (30 downto 0);
    signal cstNaNWF_uid55_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid56_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal cstBias_uid57_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid58_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal cstBiasMWF_uid59_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal cstBiasP1_uid60_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal cstWFP1_uid61_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal cstWFP2_uid62_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal piO2_uid83_fpArctan2Test_q : std_logic_vector (25 downto 0);
    signal piO4_uid84_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal arctanIsConst_uid93_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal arctanIsConst_uid93_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal arctanIsConst_uid93_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal arctanIsConst_uid93_fpArctan2Test_q_i : std_logic_vector(0 downto 0);
    signal arctanIsConst_uid93_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal biasMwShift_uid100_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal shiftBias_uid102_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal zS_uid105_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal cst01pWShift_uid107_fpArctan2Test_q : std_logic_vector (12 downto 0);
    signal mulXAtanXOXRes_uid117_fpArctan2Test_a : std_logic_vector (23 downto 0);
    signal mulXAtanXOXRes_uid117_fpArctan2Test_b : std_logic_vector (26 downto 0);
    signal mulXAtanXOXRes_uid117_fpArctan2Test_s1 : std_logic_vector (50 downto 0);
    signal mulXAtanXOXRes_uid117_fpArctan2Test_pr : UNSIGNED (50 downto 0);
    signal mulXAtanXOXRes_uid117_fpArctan2Test_q : std_logic_vector (50 downto 0);
    signal fracOutMuxSelEnc_uid148_fpArctan2Test_q : std_logic_vector(1 downto 0);
    signal cstPi_uid153_fpArctan2Test_q : std_logic_vector (46 downto 0);
    signal padConst_uid161_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal xInIsLTEZero_uid171_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal xInIsLTEZero_uid171_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal xInIsLTEZero_uid171_fpArctan2Test_q_i : std_logic_vector(0 downto 0);
    signal xInIsLTEZero_uid171_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excRZero2_uid175_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excRZero2_uid175_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excRZero2_uid175_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal excRZero2_uid175_fpArctan2Test_q_i : std_logic_vector(0 downto 0);
    signal excRZero2_uid175_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal expXmY_uid232_div_uid49_fpArctan2Test_a : std_logic_vector(8 downto 0);
    signal expXmY_uid232_div_uid49_fpArctan2Test_b : std_logic_vector(8 downto 0);
    signal expXmY_uid232_div_uid49_fpArctan2Test_o : std_logic_vector (8 downto 0);
    signal expXmY_uid232_div_uid49_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal expR_uid233_div_uid49_fpArctan2Test_a : std_logic_vector(10 downto 0);
    signal expR_uid233_div_uid49_fpArctan2Test_b : std_logic_vector(10 downto 0);
    signal expR_uid233_div_uid49_fpArctan2Test_o : std_logic_vector (10 downto 0);
    signal expR_uid233_div_uid49_fpArctan2Test_q : std_logic_vector (9 downto 0);
    signal fracYPostZ_uid240_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal fracYPostZ_uid240_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal fracYPostZ_uid240_div_uid49_fpArctan2Test_q_i : std_logic_vector(0 downto 0);
    signal fracYPostZ_uid240_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal z_uid243_div_uid49_fpArctan2Test_q : std_logic_vector (1 downto 0);
    signal sRPostExc_uid287_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal sRPostExc_uid287_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal sRPostExc_uid287_div_uid49_fpArctan2Test_q_i : std_logic_vector(0 downto 0);
    signal sRPostExc_uid287_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal cst2BiasM1_uid297_z_uid95_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal cst2Bias_uid298_z_uid95_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal fracRCalc_uid330_z_uid95_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal fracRCalc_uid330_z_uid95_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal expRCalc_uid331_z_uid95_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal expRCalc_uid331_z_uid95_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal expRPostExc_uid337_z_uid95_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid337_z_uid95_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal signR_uid339_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal signR_uid339_z_uid95_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal signR_uid339_z_uid95_fpArctan2Test_q_i : std_logic_vector(0 downto 0);
    signal signR_uid339_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1Pad4_uid343_fxpU_uid110_fpArctan2Test_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid349_fxpU_uid110_fpArctan2Test_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx3Pad3_uid360_fxpU_uid110_fpArctan2Test_q : std_logic_vector (2 downto 0);
    signal rightShiftStage0Idx2Pad16_uid390_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (15 downto 0);
    signal rightShiftStage1Idx3Pad6_uid404_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (5 downto 0);
    signal rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_a : std_logic_vector (25 downto 0);
    signal prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_s1 : std_logic_vector (49 downto 0);
    signal prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_pr : UNSIGNED (49 downto 0);
    signal prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_q : std_logic_vector (49 downto 0);
    signal prodXY_uid484_pT1_uid373_atanXOXPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid484_pT1_uid373_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid484_pT1_uid373_atanXOXPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid484_pT1_uid373_atanXOXPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid484_pT1_uid373_atanXOXPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid487_pT2_uid379_atanXOXPolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid487_pT2_uid379_atanXOXPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid487_pT2_uid379_atanXOXPolyEval_s1 : std_logic_vector (40 downto 0);
    signal prodXY_uid487_pT2_uid379_atanXOXPolyEval_pr : SIGNED (41 downto 0);
    signal prodXY_uid487_pT2_uid379_atanXOXPolyEval_q : std_logic_vector (40 downto 0);
    signal prodXY_uid490_pT1_uid450_invPE_a : std_logic_vector (11 downto 0);
    signal prodXY_uid490_pT1_uid450_invPE_b : std_logic_vector (11 downto 0);
    signal prodXY_uid490_pT1_uid450_invPE_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid490_pT1_uid450_invPE_pr : SIGNED (24 downto 0);
    signal prodXY_uid490_pT1_uid450_invPE_q : std_logic_vector (23 downto 0);
    signal prodXY_uid493_pT2_uid456_invPE_a : std_logic_vector (13 downto 0);
    signal prodXY_uid493_pT2_uid456_invPE_b : std_logic_vector (22 downto 0);
    signal prodXY_uid493_pT2_uid456_invPE_s1 : std_logic_vector (36 downto 0);
    signal prodXY_uid493_pT2_uid456_invPE_pr : SIGNED (37 downto 0);
    signal prodXY_uid493_pT2_uid456_invPE_q : std_logic_vector (36 downto 0);
    signal prodXY_uid496_pT1_uid472_invPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid496_pT1_uid472_invPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid496_pT1_uid472_invPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid496_pT1_uid472_invPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid496_pT1_uid472_invPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid499_pT2_uid478_invPolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid499_pT2_uid478_invPolyEval_b : std_logic_vector (21 downto 0);
    signal prodXY_uid499_pT2_uid478_invPolyEval_s1 : std_logic_vector (36 downto 0);
    signal prodXY_uid499_pT2_uid478_invPolyEval_pr : SIGNED (37 downto 0);
    signal prodXY_uid499_pT2_uid478_invPolyEval_q : std_logic_vector (36 downto 0);
    signal memoryC0_uid366_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid366_atanXOXTabGen_lutmem_ia : std_logic_vector (30 downto 0);
    signal memoryC0_uid366_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid366_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid366_atanXOXTabGen_lutmem_iq : std_logic_vector (30 downto 0);
    signal memoryC0_uid366_atanXOXTabGen_lutmem_q : std_logic_vector (30 downto 0);
    signal memoryC1_uid368_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid368_atanXOXTabGen_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid368_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid368_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid368_atanXOXTabGen_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid368_atanXOXTabGen_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid370_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid370_atanXOXTabGen_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid370_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid370_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid370_atanXOXTabGen_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid370_atanXOXTabGen_lutmem_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid443_invTab_lutmem_reset0 : std_logic;
    signal memoryC0_uid443_invTab_lutmem_ia : std_logic_vector (30 downto 0);
    signal memoryC0_uid443_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC0_uid443_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC0_uid443_invTab_lutmem_iq : std_logic_vector (30 downto 0);
    signal memoryC0_uid443_invTab_lutmem_q : std_logic_vector (30 downto 0);
    signal memoryC1_uid445_invTab_lutmem_reset0 : std_logic;
    signal memoryC1_uid445_invTab_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid445_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC1_uid445_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC1_uid445_invTab_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid445_invTab_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid447_invTab_lutmem_reset0 : std_logic;
    signal memoryC2_uid447_invTab_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid447_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC2_uid447_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC2_uid447_invTab_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid447_invTab_lutmem_q : std_logic_vector (11 downto 0);
    signal memoryC0_uid465_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid465_invTabGen_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid465_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid465_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid465_invTabGen_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid465_invTabGen_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid467_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid467_invTabGen_lutmem_ia : std_logic_vector (19 downto 0);
    signal memoryC1_uid467_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid467_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid467_invTabGen_lutmem_iq : std_logic_vector (19 downto 0);
    signal memoryC1_uid467_invTabGen_lutmem_q : std_logic_vector (19 downto 0);
    signal memoryC2_uid469_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid469_invTabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid469_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid469_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid469_invTabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid469_invTabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC2_uid447_invTab_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid447_invTab_lutmem_0_to_prodXY_uid490_pT1_uid450_invPE_1_q : std_logic_vector (11 downto 0);
    signal reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_memoryC1_uid445_invTab_lutmem_0_to_sumAHighB_uid453_invPE_0_q : std_logic_vector (20 downto 0);
    signal reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_q : std_logic_vector (13 downto 0);
    signal reg_s1_uid451_uid454_invPE_0_to_prodXY_uid493_pT2_uid456_invPE_1_q : std_logic_vector (22 downto 0);
    signal reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_memoryC0_uid443_invTab_lutmem_0_to_sumAHighB_uid459_invPE_0_q : std_logic_vector (30 downto 0);
    signal reg_invY_uid238_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_0_q : std_logic_vector (25 downto 0);
    signal reg_lOAdded_uid241_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_1_q : std_logic_vector (23 downto 0);
    signal reg_expFracRnd_uid251_div_uid49_fpArctan2Test_0_to_expFracPostRnd_uid254_div_uid49_fpArctan2Test_0_q : std_logic_vector (33 downto 0);
    signal reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1_q : std_logic_vector (10 downto 0);
    signal reg_concExc_uid276_div_uid49_fpArctan2Test_0_to_excREnc_uid277_div_uid49_fpArctan2Test_0_q : std_logic_vector (2 downto 0);
    signal reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q : std_logic_vector (7 downto 0);
    signal reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_q : std_logic_vector (0 downto 0);
    signal reg_excSelBits_uid181_fpArctan2Test_0_to_outMuxSelEnc_uid182_fpArctan2Test_0_q : std_logic_vector (2 downto 0);
    signal reg_fracX_uid51_fpArctan2Test_0_to_fracXIsZero_uid72_fpArctan2Test_1_q : std_logic_vector (22 downto 0);
    signal reg_excSelBits_uid334_z_uid95_fpArctan2Test_0_to_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_q : std_logic_vector (2 downto 0);
    signal reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC2_uid469_invTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid471_invPolyEval_0_to_prodXY_uid496_pT1_uid472_invPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid469_invTabGen_lutmem_0_to_prodXY_uid496_pT1_uid472_invPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid467_invTabGen_lutmem_0_to_sumAHighB_uid475_invPolyEval_0_q : std_logic_vector (19 downto 0);
    signal reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid473_uid476_invPolyEval_0_to_prodXY_uid499_pT2_uid478_invPolyEval_1_q : std_logic_vector (21 downto 0);
    signal reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid465_invTabGen_lutmem_0_to_sumAHighB_uid481_invPolyEval_0_q : std_logic_vector (28 downto 0);
    signal reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_singX_uid52_fpArctan2Test_0_to_signR_uid339_z_uid95_fpArctan2Test_1_q : std_logic_vector (0 downto 0);
    signal reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q : std_logic_vector (0 downto 0);
    signal reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q : std_logic_vector (31 downto 0);
    signal reg_expU_uid97_fpArctan2Test_0_to_atanUIsU_uid101_fpArctan2Test_1_q : std_logic_vector (7 downto 0);
    signal reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_q : std_logic_vector (2 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracUExt_uid108_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_2_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_3_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_4_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_5_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_2_q : std_logic_vector (36 downto 0);
    signal reg_yAddr_uid113_fpArctan2Test_0_to_memoryC2_uid370_atanXOXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid370_atanXOXTabGen_lutmem_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid368_atanXOXTabGen_lutmem_0_to_sumAHighB_uid376_atanXOXPolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_s1_uid374_uid377_atanXOXPolyEval_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_memoryC0_uid366_atanXOXTabGen_lutmem_0_to_sumAHighB_uid382_atanXOXPolyEval_0_q : std_logic_vector (30 downto 0);
    signal reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_q : std_logic_vector (23 downto 0);
    signal reg_fxpAtanXOXRes_uid116_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_1_q : std_logic_vector (26 downto 0);
    signal reg_expRPath3PreRnd_uid124_fpArctan2Test_0_to_shiftValPath2PreSub_uid129_fpArctan2Test_1_q : std_logic_vector (7 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_2_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_q : std_logic_vector (0 downto 0);
    signal reg_pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_0_to_path2Diff_uid136_fpArctan2Test_1_q : std_logic_vector (25 downto 0);
    signal reg_expFracConc_uid143_uid143_fpArctan2Test_0_to_expFracRPath2PostRnd_uid144_fpArctan2Test_0_q : std_logic_vector (31 downto 0);
    signal reg_expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_0_to_fracRPath3PostRnd_uid126_fpArctan2Test_0_q : std_logic_vector (31 downto 0);
    signal reg_fpPiO4C_uid89_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_2_q : std_logic_vector (31 downto 0);
    signal reg_fpPiO2C_uid86_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_3_q : std_logic_vector (31 downto 0);
    signal reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_q : std_logic_vector (22 downto 0);
    signal reg_fracRPath2_uid145_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_3_q : std_logic_vector (22 downto 0);
    signal reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q : std_logic_vector (22 downto 0);
    signal reg_fracOutCst_uid149_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_5_q : std_logic_vector (22 downto 0);
    signal reg_expRPath2_uid146_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_3_q : std_logic_vector (7 downto 0);
    signal reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_q : std_logic_vector (7 downto 0);
    signal reg_expOutCst_uid151_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_5_q : std_logic_vector (7 downto 0);
    signal reg_expRCalc_uid152_fpArctan2Test_0_to_sOutAlignRes_uid155_fpArctan2Test_0_q : std_logic_vector (7 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_2_q : std_logic_vector (47 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q : std_logic_vector (0 downto 0);
    signal reg_pad_cstPi_uid153_uid164_fpArctan2Test_0_to_subRes_uid164_fpArctan2Test_0_q : std_logic_vector (48 downto 0);
    signal reg_subResNormBit_uid166_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_1_q : std_logic_vector (0 downto 0);
    signal reg_subResLow_uid168_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_2_q : std_logic_vector (22 downto 0);
    signal reg_subResHigh_uid167_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_3_q : std_logic_vector (22 downto 0);
    signal ld_xyInInf_uid92_fpArctan2Test_q_to_arctanIsConst_uid93_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q_to_u_uid96_fpArctan2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_fracU_uid98_fpArctan2Test_b_to_oFracU_uid99_uid99_fpArctan2Test_a_q : std_logic_vector (22 downto 0);
    signal ld_shiftOut_uid130_fpArctan2Test_c_to_sValPostSOut_uid132_fpArctan2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_fracRPath3Pre_uid121_fpArctan2Test_q_to_oFracRPath2_uid133_uid133_fpArctan2Test_a_q : std_logic_vector (23 downto 0);
    signal ld_path2_uid94_fpArctan2Test_n_to_pathSelBits_uid147_fpArctan2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_arctanIsConst_uid93_fpArctan2Test_q_to_pathSelBits_uid147_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_oFracRCalc_uid160_uid160_fpArctan2Test_a_q : std_logic_vector (22 downto 0);
    signal ld_yInSign_uid38_fpArctan2Test_b_to_InvYInSign_uid177_fpArctan2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_InvXInSign_uid174_fpArctan2Test_q_to_excRZero1_uid178_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_excRZero2_uid175_fpArctan2Test_q_to_excRZero_uid179_fpArctan2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_fracYZero_uid198_div_uid49_fpArctan2Test_q_to_fracYPostZ_uid240_div_uid49_fpArctan2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_fracYPostZ_uid240_div_uid49_fpArctan2Test_q_to_divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_norm_uid247_div_uid49_fpArctan2Test_b_to_rndOp_uid253_div_uid49_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid214_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid230_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_zeroOverReg_uid263_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_excXRYZ_uid268_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_a_q : std_logic_vector (0 downto 0);
    signal ld_excXIYZ_uid270_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_excXIYR_uid271_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_d_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid275_div_uid49_fpArctan2Test_q_to_concExc_uid276_div_uid49_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_fracRPreExc_uid256_div_uid49_fpArctan2Test_b_to_fracRPostExc_uid281_div_uid49_fpArctan2Test_d_q : std_logic_vector (22 downto 0);
    signal ld_excRPreExc_uid257_div_uid49_fpArctan2Test_b_to_expRPostExc_uid285_div_uid49_fpArctan2Test_d_q : std_logic_vector (7 downto 0);
    signal ld_sRPostExc_uid287_div_uid49_fpArctan2Test_q_to_divR_uid288_div_uid49_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a_q : std_logic_vector (22 downto 0);
    signal ld_fracXIsZero_uid317_z_uid95_fpArctan2Test_q_to_fracRCalc_uid330_z_uid95_fpArctan2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_b_q : std_logic_vector (1 downto 0);
    signal ld_signR_uid339_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_c_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_b_q : std_logic_vector (35 downto 0);
    signal ld_LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_b_q : std_logic_vector (34 downto 0);
    signal ld_LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_b_q : std_logic_vector (33 downto 0);
    signal ld_reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_b_q : std_logic_vector (1 downto 0);
    signal ld_RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_a_q : std_logic_vector (22 downto 0);
    signal ld_RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_a_q : std_logic_vector (20 downto 0);
    signal ld_RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_a_q : std_logic_vector (18 downto 0);
    signal ld_RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_a_q : std_logic_vector (45 downto 0);
    signal ld_RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_a_q : std_logic_vector (43 downto 0);
    signal ld_RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_a_q : std_logic_vector (41 downto 0);
    signal ld_reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a_q : std_logic_vector (12 downto 0);
    signal ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a_q : std_logic_vector (11 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_a_q : std_logic_vector (8 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid113_fpArctan2Test_b_to_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_a_q : std_logic_vector (0 downto 0);
    signal ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a_q : std_logic_vector (7 downto 0);
    signal ld_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_a_q : std_logic_vector (1 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_reset0 : std_logic;
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_sticky_ena_q : signal is true;
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_reset0 : std_logic;
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_sticky_ena_q : signal is true;
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_reset0 : std_logic;
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_eq : std_logic;
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_sticky_ena_q : signal is true;
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_reset0 : std_logic;
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_sticky_ena_q : signal is true;
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_reset0 : std_logic;
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_sticky_ena_q : signal is true;
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_reset0 : std_logic;
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_eq : std_logic;
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_sticky_ena_q : signal is true;
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_reset0 : std_logic;
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_eq : std_logic;
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_sticky_ena_q : signal is true;
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_reset0 : std_logic;
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_eq : std_logic;
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_sticky_ena_q : signal is true;
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_reset0 : std_logic;
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_eq : std_logic;
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_sticky_ena_q : signal is true;
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_reset0 : std_logic;
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_sticky_ena_q : signal is true;
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_reset0 : std_logic;
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_eq : std_logic;
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_sticky_ena_q : signal is true;
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_reset0 : std_logic;
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_eq : std_logic;
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_sticky_ena_q : signal is true;
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_reset0 : std_logic;
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_eq : std_logic;
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_sticky_ena_q : signal is true;
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_reset0 : std_logic;
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_sticky_ena_q : signal is true;
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_reset0 : std_logic;
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_sticky_ena_q : signal is true;
    signal ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_eq : std_logic;
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_sticky_ena_q : signal is true;
    signal ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_inputreg_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_inputreg_q : std_logic_vector (13 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_reset0 : std_logic;
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_ia : std_logic_vector (13 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_iq : std_logic_vector (13 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_q : std_logic_vector (13 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_sticky_ena_q : signal is true;
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_reset0 : std_logic;
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_eq : std_logic;
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_sticky_ena_q : signal is true;
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_reset0 : std_logic;
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_eq : std_logic;
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_sticky_ena_q : signal is true;
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_reset0 : std_logic;
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_sticky_ena_q : signal is true;
    signal ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a_inputreg_q : std_logic_vector (7 downto 0);
    signal path2_uid94_fpArctan2Test_a : std_logic_vector(10 downto 0);
    signal path2_uid94_fpArctan2Test_b : std_logic_vector(10 downto 0);
    signal path2_uid94_fpArctan2Test_o : std_logic_vector (10 downto 0);
    signal path2_uid94_fpArctan2Test_cin : std_logic_vector (0 downto 0);
    signal path2_uid94_fpArctan2Test_n : std_logic_vector (0 downto 0);
    signal atanUIsU_uid101_fpArctan2Test_a : std_logic_vector(10 downto 0);
    signal atanUIsU_uid101_fpArctan2Test_b : std_logic_vector(10 downto 0);
    signal atanUIsU_uid101_fpArctan2Test_o : std_logic_vector (10 downto 0);
    signal atanUIsU_uid101_fpArctan2Test_cin : std_logic_vector (0 downto 0);
    signal atanUIsU_uid101_fpArctan2Test_n : std_logic_vector (0 downto 0);
    signal shiftOut_uid130_fpArctan2Test_a : std_logic_vector(10 downto 0);
    signal shiftOut_uid130_fpArctan2Test_b : std_logic_vector(10 downto 0);
    signal shiftOut_uid130_fpArctan2Test_o : std_logic_vector (10 downto 0);
    signal shiftOut_uid130_fpArctan2Test_cin : std_logic_vector (0 downto 0);
    signal shiftOut_uid130_fpArctan2Test_c : std_logic_vector (0 downto 0);
    signal sOutAlignRes_uid155_fpArctan2Test_a : std_logic_vector(10 downto 0);
    signal sOutAlignRes_uid155_fpArctan2Test_b : std_logic_vector(10 downto 0);
    signal sOutAlignRes_uid155_fpArctan2Test_o : std_logic_vector (10 downto 0);
    signal sOutAlignRes_uid155_fpArctan2Test_cin : std_logic_vector (0 downto 0);
    signal sOutAlignRes_uid155_fpArctan2Test_c : std_logic_vector (0 downto 0);
    signal pad_cstPi_uid153_uid164_fpArctan2Test_q : std_logic_vector (48 downto 0);
    signal excSelBits_uid181_fpArctan2Test_q : std_logic_vector (2 downto 0);
    signal expUdf_uid259_div_uid49_fpArctan2Test_a : std_logic_vector(13 downto 0);
    signal expUdf_uid259_div_uid49_fpArctan2Test_b : std_logic_vector(13 downto 0);
    signal expUdf_uid259_div_uid49_fpArctan2Test_o : std_logic_vector (13 downto 0);
    signal expUdf_uid259_div_uid49_fpArctan2Test_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid259_div_uid49_fpArctan2Test_n : std_logic_vector (0 downto 0);
    signal expOvf_uid262_div_uid49_fpArctan2Test_a : std_logic_vector(13 downto 0);
    signal expOvf_uid262_div_uid49_fpArctan2Test_b : std_logic_vector(13 downto 0);
    signal expOvf_uid262_div_uid49_fpArctan2Test_o : std_logic_vector (13 downto 0);
    signal expOvf_uid262_div_uid49_fpArctan2Test_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid262_div_uid49_fpArctan2Test_n : std_logic_vector (0 downto 0);
    signal fracXIsZero_uid317_z_uid95_fpArctan2Test_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid317_z_uid95_fpArctan2Test_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid317_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal fracRPath3PostRnd_uid126_fpArctan2Test_a : std_logic_vector(32 downto 0);
    signal fracRPath3PostRnd_uid126_fpArctan2Test_b : std_logic_vector(32 downto 0);
    signal fracRPath3PostRnd_uid126_fpArctan2Test_o : std_logic_vector (32 downto 0);
    signal fracRPath3PostRnd_uid126_fpArctan2Test_q : std_logic_vector (32 downto 0);
    signal expFracRPath2PostRnd_uid144_fpArctan2Test_a : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid144_fpArctan2Test_b : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid144_fpArctan2Test_o : std_logic_vector (32 downto 0);
    signal expFracRPath2PostRnd_uid144_fpArctan2Test_q : std_logic_vector (32 downto 0);
    signal InvYInSign_uid177_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvYInSign_uid177_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal lOAdded_uid241_div_uid49_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal rndOp_uid253_div_uid49_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal oFracU_uid99_uid99_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal oFracRPath2_uid133_uid133_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal oFracRCalc_uid160_uid160_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal exp_uid27_fpArctan2Test_in : std_logic_vector (30 downto 0);
    signal exp_uid27_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal frac_uid29_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal frac_uid29_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal yInSign_uid38_fpArctan2Test_in : std_logic_vector (31 downto 0);
    signal yInSign_uid38_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal exp_uid11_fpArctan2Test_in : std_logic_vector (30 downto 0);
    signal exp_uid11_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal frac_uid13_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal frac_uid13_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal xInSign_uid39_fpArctan2Test_in : std_logic_vector (31 downto 0);
    signal xInSign_uid39_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal fracYAddr_uid235_div_uid49_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal fracYAddr_uid235_div_uid49_fpArctan2Test_b : std_logic_vector (8 downto 0);
    signal yPE_uid236_div_uid49_fpArctan2Test_in : std_logic_vector (13 downto 0);
    signal yPE_uid236_div_uid49_fpArctan2Test_b : std_logic_vector (13 downto 0);
    signal expXIsMax_uid12_fpArctan2Test_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpArctan2Test_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid14_fpArctan2Test_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpArctan2Test_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid28_fpArctan2Test_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid28_fpArctan2Test_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid28_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid30_fpArctan2Test_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid30_fpArctan2Test_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid30_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_I_uid31_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_I_uid31_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_I_uid31_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid68_fpArctan2Test_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid68_fpArctan2Test_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid68_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid70_fpArctan2Test_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid70_fpArctan2Test_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid70_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid72_fpArctan2Test_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid72_fpArctan2Test_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid72_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_I_uid73_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_I_uid73_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_I_uid73_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal expXIsBias_uid81_fpArctan2Test_a : std_logic_vector(7 downto 0);
    signal expXIsBias_uid81_fpArctan2Test_b : std_logic_vector(7 downto 0);
    signal expXIsBias_uid81_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal inIsOne_uid82_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal inIsOne_uid82_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal inIsOne_uid82_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal constOut_uid91_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal constOut_uid91_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal xyInInf_uid92_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal xyInInf_uid92_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal xyInInf_uid92_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal shiftValue_uid103_fpArctan2Test_a : std_logic_vector(8 downto 0);
    signal shiftValue_uid103_fpArctan2Test_b : std_logic_vector(8 downto 0);
    signal shiftValue_uid103_fpArctan2Test_o : std_logic_vector (8 downto 0);
    signal shiftValue_uid103_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal shiftValPath2PreSub_uid129_fpArctan2Test_a : std_logic_vector(8 downto 0);
    signal shiftValPath2PreSub_uid129_fpArctan2Test_b : std_logic_vector(8 downto 0);
    signal shiftValPath2PreSub_uid129_fpArctan2Test_o : std_logic_vector (8 downto 0);
    signal shiftValPath2PreSub_uid129_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal path2Diff_uid136_fpArctan2Test_a : std_logic_vector(26 downto 0);
    signal path2Diff_uid136_fpArctan2Test_b : std_logic_vector(26 downto 0);
    signal path2Diff_uid136_fpArctan2Test_o : std_logic_vector (26 downto 0);
    signal path2Diff_uid136_fpArctan2Test_q : std_logic_vector (26 downto 0);
    signal fracRCalc_uid150_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal fracRCalc_uid150_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal expRCalc_uid152_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal expRCalc_uid152_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal sValAlignRes_uid154_fpArctan2Test_a : std_logic_vector(8 downto 0);
    signal sValAlignRes_uid154_fpArctan2Test_b : std_logic_vector(8 downto 0);
    signal sValAlignRes_uid154_fpArctan2Test_o : std_logic_vector (8 downto 0);
    signal sValAlignRes_uid154_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal yInZOrsOutAlignRes_uid156_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal yInZOrsOutAlignRes_uid156_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal yInZOrsOutAlignRes_uid156_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal subRes_uid164_fpArctan2Test_a : std_logic_vector(49 downto 0);
    signal subRes_uid164_fpArctan2Test_b : std_logic_vector(49 downto 0);
    signal subRes_uid164_fpArctan2Test_o : std_logic_vector (49 downto 0);
    signal subRes_uid164_fpArctan2Test_q : std_logic_vector (49 downto 0);
    signal fracRSub_uid169_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal fracRSub_uid169_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal expRSub_uid170_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal expRSub_uid170_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal fracRFinal_uid172_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal fracRFinal_uid172_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal expRFinal_uid173_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal expRFinal_uid173_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal excRZero1_uid178_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excRZero1_uid178_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excRZero1_uid178_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal excRZero1_uid178_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excRZero_uid179_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excRZero_uid179_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excRZero_uid179_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal outMuxSelEnc_uid182_fpArctan2Test_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid183_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid183_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid184_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid184_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal fracYZero_uid198_div_uid49_fpArctan2Test_a : std_logic_vector(22 downto 0);
    signal fracYZero_uid198_div_uid49_fpArctan2Test_b : std_logic_vector(22 downto 0);
    signal fracYZero_uid198_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid203_div_uid49_fpArctan2Test_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid203_div_uid49_fpArctan2Test_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid203_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid219_div_uid49_fpArctan2Test_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid219_div_uid49_fpArctan2Test_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid219_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal signR_uid231_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal signR_uid231_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal signR_uid231_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal expFracPostRnd_uid254_div_uid49_fpArctan2Test_a : std_logic_vector(35 downto 0);
    signal expFracPostRnd_uid254_div_uid49_fpArctan2Test_b : std_logic_vector(35 downto 0);
    signal expFracPostRnd_uid254_div_uid49_fpArctan2Test_o : std_logic_vector (35 downto 0);
    signal expFracPostRnd_uid254_div_uid49_fpArctan2Test_q : std_logic_vector (34 downto 0);
    signal regOverRegWithUf_uid264_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid264_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excRZero_uid267_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excRZero_uid267_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excRZero_uid267_div_uid49_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal excRZero_uid267_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid269_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid269_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid269_div_uid49_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid269_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excXIYZ_uid270_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excXIYZ_uid270_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excXIYZ_uid270_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excRInf_uid272_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excRInf_uid272_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excRInf_uid272_div_uid49_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal excRInf_uid272_div_uid49_fpArctan2Test_d : std_logic_vector(0 downto 0);
    signal excRInf_uid272_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excXZYZ_uid273_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excXZYZ_uid273_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excXZYZ_uid273_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excXIYI_uid274_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excXIYI_uid274_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excXIYI_uid274_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excREnc_uid277_div_uid49_fpArctan2Test_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid281_div_uid49_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid281_div_uid49_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid285_div_uid49_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid285_div_uid49_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal expRCompExt_uid324_z_uid95_fpArctan2Test_a : std_logic_vector(8 downto 0);
    signal expRCompExt_uid324_z_uid95_fpArctan2Test_b : std_logic_vector(8 downto 0);
    signal expRCompExt_uid324_z_uid95_fpArctan2Test_o : std_logic_vector (8 downto 0);
    signal expRCompExt_uid324_z_uid95_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_a : std_logic_vector(8 downto 0);
    signal expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_b : std_logic_vector(8 downto 0);
    signal expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_o : std_logic_vector (8 downto 0);
    signal expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid336_z_uid95_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid336_z_uid95_fpArctan2Test_q : std_logic_vector (22 downto 0);
    signal leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal cstPiO2_uid85_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal cstPiO2_uid85_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal cstPiO4_uid88_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal cstPiO4_uid88_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal oFracUExt_uid108_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal normBit_uid118_fpArctan2Test_in : std_logic_vector (49 downto 0);
    signal normBit_uid118_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal fracRPath3High_uid119_fpArctan2Test_in : std_logic_vector (48 downto 0);
    signal fracRPath3High_uid119_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal fracRPath3Low_uid120_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal fracRPath3Low_uid120_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal rightPaddedIn_uid162_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal oFracXExt_uid244_div_uid49_fpArctan2Test_q : std_logic_vector (25 downto 0);
    signal leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal prodXYTruncFR_uid463_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_in : std_logic_vector (49 downto 0);
    signal prodXYTruncFR_uid463_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_b : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid485_pT1_uid373_atanXOXPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid485_pT1_uid373_atanXOXPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid488_pT2_uid379_atanXOXPolyEval_in : std_logic_vector (40 downto 0);
    signal prodXYTruncFR_uid488_pT2_uid379_atanXOXPolyEval_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid491_pT1_uid450_invPE_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid491_pT1_uid450_invPE_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid494_pT2_uid456_invPE_in : std_logic_vector (36 downto 0);
    signal prodXYTruncFR_uid494_pT2_uid456_invPE_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid497_pT1_uid472_invPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid497_pT1_uid472_invPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid500_pT2_uid478_invPolyEval_in : std_logic_vector (36 downto 0);
    signal prodXYTruncFR_uid500_pT2_uid478_invPolyEval_b : std_logic_vector (22 downto 0);
    signal leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal pathSelBits_uid147_fpArctan2Test_q : std_logic_vector (2 downto 0);
    signal divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_q : std_logic_vector (25 downto 0);
    signal concExc_uid276_div_uid49_fpArctan2Test_q : std_logic_vector (2 downto 0);
    signal divR_uid288_div_uid49_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal yPPolyEval_uid321_z_uid95_fpArctan2Test_in : std_logic_vector (14 downto 0);
    signal yPPolyEval_uid321_z_uid95_fpArctan2Test_b : std_logic_vector (14 downto 0);
    signal R_uid340_z_uid95_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal fpPiO2C_uid86_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal fpPiO4C_uid89_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_a : std_logic_vector(5 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_b : std_logic_vector(5 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_q : std_logic_vector(0 downto 0);
    signal u_uid96_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal u_uid96_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_a : std_logic_vector(6 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_b : std_logic_vector(6 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_a : std_logic_vector(6 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_b : std_logic_vector(6 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_a : std_logic_vector(2 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_b : std_logic_vector(2 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_q : std_logic_vector(0 downto 0);
    signal R_uid187_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_a : std_logic_vector(6 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_b : std_logic_vector(6 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_q : std_logic_vector(0 downto 0);
    signal fracRPath3_uid127_fpArctan2Test_in : std_logic_vector (23 downto 0);
    signal fracRPath3_uid127_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal expRPath3_uid128_fpArctan2Test_in : std_logic_vector (31 downto 0);
    signal expRPath3_uid128_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal fracRPath2_uid145_fpArctan2Test_in : std_logic_vector (23 downto 0);
    signal fracRPath2_uid145_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal expRPath2_uid146_fpArctan2Test_in : std_logic_vector (31 downto 0);
    signal expRPath2_uid146_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal X24dto8_uid386_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal X24dto8_uid386_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (16 downto 0);
    signal X24dto16_uid389_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal X24dto16_uid389_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (8 downto 0);
    signal X24dto24_uid392_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal X24dto24_uid392_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal join_uid43_fpArctan2Test_q : std_logic_vector (30 downto 0);
    signal join_uid47_fpArctan2Test_q : std_logic_vector (30 downto 0);
    signal InvXInSign_uid174_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvXInSign_uid174_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal yT1_uid449_invPE_in : std_logic_vector (13 downto 0);
    signal yT1_uid449_invPE_b : std_logic_vector (11 downto 0);
    signal InvFracXIsZero_uid16_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid16_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid228_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid228_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid32_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid32_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid212_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid212_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid314_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid314_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid310_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid310_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid313_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid313_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal fracOutCst_uid149_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal fracOutCst_uid149_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal expOutCst_uid151_fpArctan2Test_in : std_logic_vector (30 downto 0);
    signal expOutCst_uid151_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal ShiftValue8_uid104_fpArctan2Test_in : std_logic_vector (8 downto 0);
    signal ShiftValue8_uid104_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal shiftValuePostNeg_uid106_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal shiftValuePostNeg_uid106_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal shiftValPath2PreSubR_uid131_fpArctan2Test_in : std_logic_vector (7 downto 0);
    signal shiftValPath2PreSubR_uid131_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal normBitPath2Diff_uid138_fpArctan2Test_in : std_logic_vector (25 downto 0);
    signal normBitPath2Diff_uid138_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal path2DiffHigh_uid139_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal path2DiffHigh_uid139_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal path2DiffLow_uid140_fpArctan2Test_in : std_logic_vector (23 downto 0);
    signal path2DiffLow_uid140_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal sValAlignResRange_uid157_fpArctan2Test_in : std_logic_vector (7 downto 0);
    signal sValAlignResRange_uid157_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal sValPostSAlignOut_uid158_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal sValPostSAlignOut_uid158_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal subResNormBit_uid166_fpArctan2Test_in : std_logic_vector (48 downto 0);
    signal subResNormBit_uid166_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal subResHigh_uid167_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal subResHigh_uid167_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal subResLow_uid168_fpArctan2Test_in : std_logic_vector (46 downto 0);
    signal subResLow_uid168_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal InvExpXIsZero_uid213_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid213_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid229_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid229_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal fracRPreExc_uid256_div_uid49_fpArctan2Test_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid256_div_uid49_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal excRPreExc_uid257_div_uid49_fpArctan2Test_in : std_logic_vector (31 downto 0);
    signal excRPreExc_uid257_div_uid49_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal expRExt_uid258_div_uid49_fpArctan2Test_in : std_logic_vector (34 downto 0);
    signal expRExt_uid258_div_uid49_fpArctan2Test_b : std_logic_vector (10 downto 0);
    signal expRComp_uid325_z_uid95_fpArctan2Test_in : std_logic_vector (7 downto 0);
    signal expRComp_uid325_z_uid95_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal udf_uid326_z_uid95_fpArctan2Test_in : std_logic_vector (9 downto 0);
    signal udf_uid326_z_uid95_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal expRCompYIsOne_uid328_z_uid95_fpArctan2Test_in : std_logic_vector (7 downto 0);
    signal expRCompYIsOne_uid328_z_uid95_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_in : std_logic_vector (35 downto 0);
    signal LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_in : std_logic_vector (34 downto 0);
    signal LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_b : std_logic_vector (34 downto 0);
    signal LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_b : std_logic_vector (33 downto 0);
    signal X32dto0_uid344_fxpU_uid110_fpArctan2Test_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid344_fxpU_uid110_fpArctan2Test_b : std_logic_vector (32 downto 0);
    signal X28dto0_uid347_fxpU_uid110_fpArctan2Test_in : std_logic_vector (28 downto 0);
    signal X28dto0_uid347_fxpU_uid110_fpArctan2Test_b : std_logic_vector (28 downto 0);
    signal X24dto0_uid350_fxpU_uid110_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal X24dto0_uid350_fxpU_uid110_fpArctan2Test_b : std_logic_vector (24 downto 0);
    signal fracRPath3Pre_uid121_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal fracRPath3Pre_uid121_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal InvNormBit_uid122_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvNormBit_uid122_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal X47dto8_uid415_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal X47dto8_uid415_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (39 downto 0);
    signal X47dto16_uid418_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal X47dto16_uid418_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (31 downto 0);
    signal X47dto24_uid421_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal X47dto24_uid421_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal lowRangeB_uid374_atanXOXPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid374_atanXOXPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid375_atanXOXPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid375_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid380_atanXOXPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid380_atanXOXPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid381_atanXOXPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid381_atanXOXPolyEval_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid451_invPE_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid451_invPE_b : std_logic_vector (0 downto 0);
    signal highBBits_uid452_invPE_in : std_logic_vector (12 downto 0);
    signal highBBits_uid452_invPE_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid457_invPE_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid457_invPE_b : std_logic_vector (1 downto 0);
    signal highBBits_uid458_invPE_in : std_logic_vector (23 downto 0);
    signal highBBits_uid458_invPE_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid473_invPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid473_invPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid474_invPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid474_invPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid479_invPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid479_invPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid480_invPolyEval_in : std_logic_vector (22 downto 0);
    signal highBBits_uid480_invPolyEval_b : std_logic_vector (20 downto 0);
    signal y_uid111_fpArctan2Test_in : std_logic_vector (35 downto 0);
    signal y_uid111_fpArctan2Test_b : std_logic_vector (34 downto 0);
    signal RightShiftStage124dto1_uid408_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal RightShiftStage124dto1_uid408_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal RightShiftStage147dto1_uid437_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal RightShiftStage147dto1_uid437_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (46 downto 0);
    signal norm_uid247_div_uid49_fpArctan2Test_in : std_logic_vector (25 downto 0);
    signal norm_uid247_div_uid49_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal divValPreNormHigh_uid248_div_uid49_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal divValPreNormHigh_uid248_div_uid49_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal divValPreNormLow_uid249_div_uid49_fpArctan2Test_in : std_logic_vector (23 downto 0);
    signal divValPreNormLow_uid249_div_uid49_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal expX_uid50_fpArctan2Test_in : std_logic_vector (30 downto 0);
    signal expX_uid50_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal fracX_uid51_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal fracX_uid51_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal singX_uid52_fpArctan2Test_in : std_logic_vector (31 downto 0);
    signal singX_uid52_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal yT1_uid471_invPolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid471_invPolyEval_b : std_logic_vector (11 downto 0);
    signal expU_uid97_fpArctan2Test_in : std_logic_vector (30 downto 0);
    signal expU_uid97_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal fracU_uid98_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal fracU_uid98_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal rightShiftStage0Idx1_uid388_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx2_uid391_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx3_uid394_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal yInZero_uid44_fpArctan2Test_a : std_logic_vector(30 downto 0);
    signal yInZero_uid44_fpArctan2Test_b : std_logic_vector(30 downto 0);
    signal yInZero_uid44_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal xInZero_uid48_fpArctan2Test_a : std_logic_vector(30 downto 0);
    signal xInZero_uid48_fpArctan2Test_b : std_logic_vector(30 downto 0);
    signal xInZero_uid48_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_N_uid33_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_N_uid33_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_N_uid33_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_N_uid311_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_N_uid311_z_uid95_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_N_uid311_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid109_fpArctan2Test_in : std_logic_vector (3 downto 0);
    signal fxpShifterBits_uid109_fpArctan2Test_b : std_logic_vector (3 downto 0);
    signal sValPostSOut_uid132_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal sValPostSOut_uid132_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal fracRPath2_uid141_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal fracRPath2_uid141_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal expRPath2_uid142_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal expRPath2_uid142_fpArctan2Test_q : std_logic_vector (7 downto 0);
    signal sValPostSOutRange_uid159_fpArctan2Test_in : std_logic_vector (4 downto 0);
    signal sValPostSOutRange_uid159_fpArctan2Test_b : std_logic_vector (4 downto 0);
    signal leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_q : std_logic_vector (36 downto 0);
    signal expRPath3Ext_uid123_fpArctan2Test_a : std_logic_vector(8 downto 0);
    signal expRPath3Ext_uid123_fpArctan2Test_b : std_logic_vector(8 downto 0);
    signal expRPath3Ext_uid123_fpArctan2Test_o : std_logic_vector (8 downto 0);
    signal expRPath3Ext_uid123_fpArctan2Test_q : std_logic_vector (8 downto 0);
    signal rightShiftStage0Idx1_uid417_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal rightShiftStage0Idx2_uid420_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal rightShiftStage0Idx3_uid423_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal sumAHighB_uid376_atanXOXPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid376_atanXOXPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid376_atanXOXPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid376_atanXOXPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid382_atanXOXPolyEval_a : std_logic_vector(31 downto 0);
    signal sumAHighB_uid382_atanXOXPolyEval_b : std_logic_vector(31 downto 0);
    signal sumAHighB_uid382_atanXOXPolyEval_o : std_logic_vector (31 downto 0);
    signal sumAHighB_uid382_atanXOXPolyEval_q : std_logic_vector (31 downto 0);
    signal sumAHighB_uid453_invPE_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid453_invPE_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid453_invPE_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid453_invPE_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid459_invPE_a : std_logic_vector(31 downto 0);
    signal sumAHighB_uid459_invPE_b : std_logic_vector(31 downto 0);
    signal sumAHighB_uid459_invPE_o : std_logic_vector (31 downto 0);
    signal sumAHighB_uid459_invPE_q : std_logic_vector (31 downto 0);
    signal sumAHighB_uid475_invPolyEval_a : std_logic_vector(20 downto 0);
    signal sumAHighB_uid475_invPolyEval_b : std_logic_vector(20 downto 0);
    signal sumAHighB_uid475_invPolyEval_o : std_logic_vector (20 downto 0);
    signal sumAHighB_uid475_invPolyEval_q : std_logic_vector (20 downto 0);
    signal sumAHighB_uid481_invPolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid481_invPolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid481_invPolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid481_invPolyEval_q : std_logic_vector (29 downto 0);
    signal yAddr_uid113_fpArctan2Test_in : std_logic_vector (34 downto 0);
    signal yAddr_uid113_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal yPPolyEval_uid114_fpArctan2Test_in : std_logic_vector (26 downto 0);
    signal yPPolyEval_uid114_fpArctan2Test_b : std_logic_vector (17 downto 0);
    signal rightShiftStage2Idx1_uid410_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal rightShiftStage2Idx1_uid439_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal normFracRnd_uid250_div_uid49_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal normFracRnd_uid250_div_uid49_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal oFracX_uid316_uid316_z_uid95_fpArctan2Test_q : std_logic_vector (23 downto 0);
    signal rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal excRNaN_uid180_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid180_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid180_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid227_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid227_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid275_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid275_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid275_div_uid49_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid275_div_uid49_fpArctan2Test_d : std_logic_vector(0 downto 0);
    signal excRNaN_uid275_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid211_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid211_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid312_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid312_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_b : std_logic_vector (1 downto 0);
    signal sValPostSOutR_uid134_fpArctan2Test_in : std_logic_vector (4 downto 0);
    signal sValPostSOutR_uid134_fpArctan2Test_b : std_logic_vector (4 downto 0);
    signal expFracConc_uid143_uid143_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal expRPath3PreRnd_uid124_fpArctan2Test_in : std_logic_vector (7 downto 0);
    signal expRPath3PreRnd_uid124_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q : std_logic_vector (47 downto 0);
    signal s1_uid374_uid377_atanXOXPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid380_uid383_atanXOXPolyEval_q : std_logic_vector (33 downto 0);
    signal s1_uid451_uid454_invPE_q : std_logic_vector (22 downto 0);
    signal s2_uid457_uid460_invPE_q : std_logic_vector (33 downto 0);
    signal s1_uid473_uid476_invPolyEval_q : std_logic_vector (21 downto 0);
    signal s2_uid479_uid482_invPolyEval_q : std_logic_vector (31 downto 0);
    signal yT1_uid372_atanXOXPolyEval_in : std_logic_vector (17 downto 0);
    signal yT1_uid372_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_q : std_logic_vector (24 downto 0);
    signal expFracRnd_uid251_div_uid49_fpArctan2Test_q : std_logic_vector (33 downto 0);
    signal y_uid318_z_uid95_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal y_uid318_z_uid95_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (20 downto 0);
    signal RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (18 downto 0);
    signal InvExcRNaN_uid185_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid185_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_R_uid230_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_R_uid230_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_R_uid230_div_uid49_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal exc_R_uid230_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid286_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid286_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_R_uid214_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_R_uid214_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_R_uid214_div_uid49_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal exc_R_uid214_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal exc_R_uid315_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal exc_R_uid315_z_uid95_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal exc_R_uid315_z_uid95_fpArctan2Test_c : std_logic_vector(0 downto 0);
    signal exc_R_uid315_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_q : std_logic_vector (31 downto 0);
    signal RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (45 downto 0);
    signal RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (43 downto 0);
    signal RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_in : std_logic_vector (47 downto 0);
    signal RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_b : std_logic_vector (41 downto 0);
    signal fxpAtanXOXRes_uid116_fpArctan2Test_in : std_logic_vector (31 downto 0);
    signal fxpAtanXOXRes_uid116_fpArctan2Test_b : std_logic_vector (26 downto 0);
    signal invY_uid238_div_uid49_fpArctan2Test_in : std_logic_vector (30 downto 0);
    signal invY_uid238_div_uid49_fpArctan2Test_b : std_logic_vector (25 downto 0);
    signal invYO_uid239_div_uid49_fpArctan2Test_in : std_logic_vector (31 downto 0);
    signal invYO_uid239_div_uid49_fpArctan2Test_b : std_logic_vector (0 downto 0);
    signal fxpInverseRes_uid323_z_uid95_fpArctan2Test_in : std_logic_vector (28 downto 0);
    signal fxpInverseRes_uid323_z_uid95_fpArctan2Test_b : std_logic_vector (23 downto 0);
    signal pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_q : std_logic_vector (25 downto 0);
    signal yAddr_uid320_z_uid95_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal yAddr_uid320_z_uid95_fpArctan2Test_b : std_logic_vector (7 downto 0);
    signal signR_uid186_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal signR_uid186_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal signR_uid186_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal zeroOverReg_uid263_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal zeroOverReg_uid263_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal zeroOverReg_uid263_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excXIYR_uid271_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excXIYR_uid271_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excXIYR_uid271_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid265_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid265_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid265_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excXRYZ_uid268_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal excXRYZ_uid268_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal excXRYZ_uid268_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid332_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid332_z_uid95_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid332_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal fxpInverseResFrac_uid329_z_uid95_fpArctan2Test_in : std_logic_vector (22 downto 0);
    signal fxpInverseResFrac_uid329_z_uid95_fpArctan2Test_b : std_logic_vector (22 downto 0);
    signal regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal xIOrXRUdf_uid333_z_uid95_fpArctan2Test_a : std_logic_vector(0 downto 0);
    signal xIOrXRUdf_uid333_z_uid95_fpArctan2Test_b : std_logic_vector(0 downto 0);
    signal xIOrXRUdf_uid333_z_uid95_fpArctan2Test_q : std_logic_vector(0 downto 0);
    signal excSelBits_uid334_z_uid95_fpArctan2Test_q : std_logic_vector (2 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable(LOGICAL,1163)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_a <= en;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q <= not ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_a;

	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor(LOGICAL,1305)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_b <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_sticky_ena_q;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_q <= not (ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_a or ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_b);

	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_mem_top(CONSTANT,1301)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_mem_top_q <= "0111000";

	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp(LOGICAL,1302)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_a <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_mem_top_q;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_q);
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_q <= "1" when ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_a = ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_b else "0";

	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmpReg(REG,1303)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmpReg_q <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_sticky_ena(REG,1306)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_nor_q = "1") THEN
                ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_sticky_ena_q <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd(LOGICAL,1307)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_a <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_sticky_ena_q;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_b <= en;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_q <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_a and ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_b;

	--cstAllZWF_uid7_fpArctan2Test(CONSTANT,6)
    cstAllZWF_uid7_fpArctan2Test_q <= "00000000000000000000000";

	--frac_uid29_fpArctan2Test(BITSELECT,28)@0
    frac_uid29_fpArctan2Test_in <= a(22 downto 0);
    frac_uid29_fpArctan2Test_b <= frac_uid29_fpArctan2Test_in(22 downto 0);

	--fracXIsZero_uid30_fpArctan2Test(LOGICAL,29)@0
    fracXIsZero_uid30_fpArctan2Test_a <= frac_uid29_fpArctan2Test_b;
    fracXIsZero_uid30_fpArctan2Test_b <= cstAllZWF_uid7_fpArctan2Test_q;
    fracXIsZero_uid30_fpArctan2Test_q <= "1" when fracXIsZero_uid30_fpArctan2Test_a = fracXIsZero_uid30_fpArctan2Test_b else "0";

	--InvFracXIsZero_uid32_fpArctan2Test(LOGICAL,31)@0
    InvFracXIsZero_uid32_fpArctan2Test_a <= fracXIsZero_uid30_fpArctan2Test_q;
    InvFracXIsZero_uid32_fpArctan2Test_q <= not InvFracXIsZero_uid32_fpArctan2Test_a;

	--cstAllOWE_uid6_fpArctan2Test(CONSTANT,5)
    cstAllOWE_uid6_fpArctan2Test_q <= "11111111";

	--exp_uid27_fpArctan2Test(BITSELECT,26)@0
    exp_uid27_fpArctan2Test_in <= a(30 downto 0);
    exp_uid27_fpArctan2Test_b <= exp_uid27_fpArctan2Test_in(30 downto 23);

	--expXIsMax_uid28_fpArctan2Test(LOGICAL,27)@0
    expXIsMax_uid28_fpArctan2Test_a <= exp_uid27_fpArctan2Test_b;
    expXIsMax_uid28_fpArctan2Test_b <= cstAllOWE_uid6_fpArctan2Test_q;
    expXIsMax_uid28_fpArctan2Test_q <= "1" when expXIsMax_uid28_fpArctan2Test_a = expXIsMax_uid28_fpArctan2Test_b else "0";

	--exc_N_uid33_fpArctan2Test(LOGICAL,32)@0
    exc_N_uid33_fpArctan2Test_a <= expXIsMax_uid28_fpArctan2Test_q;
    exc_N_uid33_fpArctan2Test_b <= InvFracXIsZero_uid32_fpArctan2Test_q;
    exc_N_uid33_fpArctan2Test_q <= exc_N_uid33_fpArctan2Test_a and exc_N_uid33_fpArctan2Test_b;

	--frac_uid13_fpArctan2Test(BITSELECT,12)@0
    frac_uid13_fpArctan2Test_in <= b(22 downto 0);
    frac_uid13_fpArctan2Test_b <= frac_uid13_fpArctan2Test_in(22 downto 0);

	--fracXIsZero_uid14_fpArctan2Test(LOGICAL,13)@0
    fracXIsZero_uid14_fpArctan2Test_a <= frac_uid13_fpArctan2Test_b;
    fracXIsZero_uid14_fpArctan2Test_b <= cstAllZWF_uid7_fpArctan2Test_q;
    fracXIsZero_uid14_fpArctan2Test_q <= "1" when fracXIsZero_uid14_fpArctan2Test_a = fracXIsZero_uid14_fpArctan2Test_b else "0";

	--InvFracXIsZero_uid16_fpArctan2Test(LOGICAL,15)@0
    InvFracXIsZero_uid16_fpArctan2Test_a <= fracXIsZero_uid14_fpArctan2Test_q;
    InvFracXIsZero_uid16_fpArctan2Test_q <= not InvFracXIsZero_uid16_fpArctan2Test_a;

	--exp_uid11_fpArctan2Test(BITSELECT,10)@0
    exp_uid11_fpArctan2Test_in <= b(30 downto 0);
    exp_uid11_fpArctan2Test_b <= exp_uid11_fpArctan2Test_in(30 downto 23);

	--expXIsMax_uid12_fpArctan2Test(LOGICAL,11)@0
    expXIsMax_uid12_fpArctan2Test_a <= exp_uid11_fpArctan2Test_b;
    expXIsMax_uid12_fpArctan2Test_b <= cstAllOWE_uid6_fpArctan2Test_q;
    expXIsMax_uid12_fpArctan2Test_q <= "1" when expXIsMax_uid12_fpArctan2Test_a = expXIsMax_uid12_fpArctan2Test_b else "0";

	--exc_N_uid17_fpArctan2Test(LOGICAL,16)@0
    exc_N_uid17_fpArctan2Test_a <= expXIsMax_uid12_fpArctan2Test_q;
    exc_N_uid17_fpArctan2Test_b <= InvFracXIsZero_uid16_fpArctan2Test_q;
    exc_N_uid17_fpArctan2Test_q <= exc_N_uid17_fpArctan2Test_a and exc_N_uid17_fpArctan2Test_b;

	--excRNaN_uid180_fpArctan2Test(LOGICAL,179)@0
    excRNaN_uid180_fpArctan2Test_a <= exc_N_uid17_fpArctan2Test_q;
    excRNaN_uid180_fpArctan2Test_b <= exc_N_uid33_fpArctan2Test_q;
    excRNaN_uid180_fpArctan2Test_q <= excRNaN_uid180_fpArctan2Test_a or excRNaN_uid180_fpArctan2Test_b;

	--InvExcRNaN_uid185_fpArctan2Test(LOGICAL,184)@0
    InvExcRNaN_uid185_fpArctan2Test_a <= excRNaN_uid180_fpArctan2Test_q;
    InvExcRNaN_uid185_fpArctan2Test_q <= not InvExcRNaN_uid185_fpArctan2Test_a;

	--yInSign_uid38_fpArctan2Test(BITSELECT,37)@0
    yInSign_uid38_fpArctan2Test_in <= a;
    yInSign_uid38_fpArctan2Test_b <= yInSign_uid38_fpArctan2Test_in(31 downto 31);

	--signR_uid186_fpArctan2Test(LOGICAL,185)@0
    signR_uid186_fpArctan2Test_a <= yInSign_uid38_fpArctan2Test_b;
    signR_uid186_fpArctan2Test_b <= InvExcRNaN_uid185_fpArctan2Test_q;
    signR_uid186_fpArctan2Test_q <= signR_uid186_fpArctan2Test_a and signR_uid186_fpArctan2Test_b;

	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_inputreg(DELAY,1295)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signR_uid186_fpArctan2Test_q, xout => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt(COUNTER,1297)
    -- every=1, low=0, high=56, step=1, init=1
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_i = 55 THEN
                      ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_eq = '1') THEN
                        ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_i <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_i - 56;
                    ELSE
                        ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_i <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_i,6));


	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdreg(REG,1298)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdreg_q <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux(MUX,1299)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_s <= en;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux: PROCESS (ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_s, ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdreg_q, ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_q)
    BEGIN
            CASE ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_s IS
                  WHEN "0" => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_q <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdreg_q;
                  WHEN "1" => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_q <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem(DUALMEM,1296)
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_ia <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_inputreg_q;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_aa <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdreg_q;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_ab <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_rdmux_q;
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 57,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 57,
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
        clocken1 => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_iq,
        address_a => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_aa,
        data_a => ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_ia
    );
    ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_reset0 <= areset;
        ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_q <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_iq(0 downto 0);

	--cstBiasP1_uid60_fpArctan2Test(CONSTANT,59)
    cstBiasP1_uid60_fpArctan2Test_q <= "10000000";

	--cstBias_uid57_fpArctan2Test(CONSTANT,56)
    cstBias_uid57_fpArctan2Test_q <= "01111111";

	--GND(CONSTANT,0)
    GND_q <= "0";

	--RightShiftStage147dto1_uid437_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,436)@57
    RightShiftStage147dto1_uid437_fxpAlignedRes_uid161_fpArctan2Test_in <= rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_q;
    RightShiftStage147dto1_uid437_fxpAlignedRes_uid161_fpArctan2Test_b <= RightShiftStage147dto1_uid437_fxpAlignedRes_uid161_fpArctan2Test_in(47 downto 1);

	--rightShiftStage2Idx1_uid439_fxpAlignedRes_uid161_fpArctan2Test(BITJOIN,438)@57
    rightShiftStage2Idx1_uid439_fxpAlignedRes_uid161_fpArctan2Test_q <= GND_q & RightShiftStage147dto1_uid437_fxpAlignedRes_uid161_fpArctan2Test_b;

	--rightShiftStage1Idx3Pad6_uid404_fxpOp2Path2_uid135_fpArctan2Test(CONSTANT,403)
    rightShiftStage1Idx3Pad6_uid404_fxpOp2Path2_uid135_fpArctan2Test_q <= "000000";

	--padConst_uid161_fpArctan2Test(CONSTANT,160)
    padConst_uid161_fpArctan2Test_q <= "000000000000000000000000";

	--X47dto24_uid421_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,420)@56
    X47dto24_uid421_fxpAlignedRes_uid161_fpArctan2Test_in <= rightPaddedIn_uid162_fpArctan2Test_q;
    X47dto24_uid421_fxpAlignedRes_uid161_fpArctan2Test_b <= X47dto24_uid421_fxpAlignedRes_uid161_fpArctan2Test_in(47 downto 24);

	--rightShiftStage0Idx3_uid423_fxpAlignedRes_uid161_fpArctan2Test(BITJOIN,422)@56
    rightShiftStage0Idx3_uid423_fxpAlignedRes_uid161_fpArctan2Test_q <= padConst_uid161_fpArctan2Test_q & X47dto24_uid421_fxpAlignedRes_uid161_fpArctan2Test_b;

	--rightShiftStage0Idx2Pad16_uid390_fxpOp2Path2_uid135_fpArctan2Test(CONSTANT,389)
    rightShiftStage0Idx2Pad16_uid390_fxpOp2Path2_uid135_fpArctan2Test_q <= "0000000000000000";

	--X47dto16_uid418_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,417)@56
    X47dto16_uid418_fxpAlignedRes_uid161_fpArctan2Test_in <= rightPaddedIn_uid162_fpArctan2Test_q;
    X47dto16_uid418_fxpAlignedRes_uid161_fpArctan2Test_b <= X47dto16_uid418_fxpAlignedRes_uid161_fpArctan2Test_in(47 downto 16);

	--rightShiftStage0Idx2_uid420_fxpAlignedRes_uid161_fpArctan2Test(BITJOIN,419)@56
    rightShiftStage0Idx2_uid420_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage0Idx2Pad16_uid390_fxpOp2Path2_uid135_fpArctan2Test_q & X47dto16_uid418_fxpAlignedRes_uid161_fpArctan2Test_b;

	--X47dto8_uid415_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,414)@56
    X47dto8_uid415_fxpAlignedRes_uid161_fpArctan2Test_in <= rightPaddedIn_uid162_fpArctan2Test_q;
    X47dto8_uid415_fxpAlignedRes_uid161_fpArctan2Test_b <= X47dto8_uid415_fxpAlignedRes_uid161_fpArctan2Test_in(47 downto 8);

	--rightShiftStage0Idx1_uid417_fxpAlignedRes_uid161_fpArctan2Test(BITJOIN,416)@56
    rightShiftStage0Idx1_uid417_fxpAlignedRes_uid161_fpArctan2Test_q <= cstAllZWE_uid56_fpArctan2Test_q & X47dto8_uid415_fxpAlignedRes_uid161_fpArctan2Test_b;

	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor(LOGICAL,1164)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_b <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_sticky_ena_q;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_q <= not (ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_a or ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_b);

	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_mem_top(CONSTANT,1160)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_mem_top_q <= "011111";

	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp(LOGICAL,1161)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_mem_top_q;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_q);
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_q <= "1" when ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_a = ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_b else "0";

	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmpReg(REG,1162)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmpReg_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_sticky_ena(REG,1165)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_nor_q = "1") THEN
                ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_sticky_ena_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd(LOGICAL,1166)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_sticky_ena_q;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_b <= en;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_a and ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_b;

	--exc_I_uid15_fpArctan2Test(LOGICAL,14)@0
    exc_I_uid15_fpArctan2Test_a <= expXIsMax_uid12_fpArctan2Test_q;
    exc_I_uid15_fpArctan2Test_b <= fracXIsZero_uid14_fpArctan2Test_q;
    exc_I_uid15_fpArctan2Test_q <= exc_I_uid15_fpArctan2Test_a and exc_I_uid15_fpArctan2Test_b;

	--exc_I_uid31_fpArctan2Test(LOGICAL,30)@0
    exc_I_uid31_fpArctan2Test_a <= expXIsMax_uid28_fpArctan2Test_q;
    exc_I_uid31_fpArctan2Test_b <= fracXIsZero_uid30_fpArctan2Test_q;
    exc_I_uid31_fpArctan2Test_q <= exc_I_uid31_fpArctan2Test_a and exc_I_uid31_fpArctan2Test_b;

	--excXIYI_uid274_div_uid49_fpArctan2Test(LOGICAL,273)@0
    excXIYI_uid274_div_uid49_fpArctan2Test_a <= exc_I_uid31_fpArctan2Test_q;
    excXIYI_uid274_div_uid49_fpArctan2Test_b <= exc_I_uid15_fpArctan2Test_q;
    excXIYI_uid274_div_uid49_fpArctan2Test_q <= excXIYI_uid274_div_uid49_fpArctan2Test_a and excXIYI_uid274_div_uid49_fpArctan2Test_b;

	--expXIsZero_uid219_div_uid49_fpArctan2Test(LOGICAL,218)@0
    expXIsZero_uid219_div_uid49_fpArctan2Test_a <= exp_uid11_fpArctan2Test_b;
    expXIsZero_uid219_div_uid49_fpArctan2Test_b <= cstAllZWE_uid56_fpArctan2Test_q;
    expXIsZero_uid219_div_uid49_fpArctan2Test_q <= "1" when expXIsZero_uid219_div_uid49_fpArctan2Test_a = expXIsZero_uid219_div_uid49_fpArctan2Test_b else "0";

	--expXIsZero_uid203_div_uid49_fpArctan2Test(LOGICAL,202)@0
    expXIsZero_uid203_div_uid49_fpArctan2Test_a <= exp_uid27_fpArctan2Test_b;
    expXIsZero_uid203_div_uid49_fpArctan2Test_b <= cstAllZWE_uid56_fpArctan2Test_q;
    expXIsZero_uid203_div_uid49_fpArctan2Test_q <= "1" when expXIsZero_uid203_div_uid49_fpArctan2Test_a = expXIsZero_uid203_div_uid49_fpArctan2Test_b else "0";

	--excXZYZ_uid273_div_uid49_fpArctan2Test(LOGICAL,272)@0
    excXZYZ_uid273_div_uid49_fpArctan2Test_a <= expXIsZero_uid203_div_uid49_fpArctan2Test_q;
    excXZYZ_uid273_div_uid49_fpArctan2Test_b <= expXIsZero_uid219_div_uid49_fpArctan2Test_q;
    excXZYZ_uid273_div_uid49_fpArctan2Test_q <= excXZYZ_uid273_div_uid49_fpArctan2Test_a and excXZYZ_uid273_div_uid49_fpArctan2Test_b;

	--excRNaN_uid275_div_uid49_fpArctan2Test(LOGICAL,274)@0
    excRNaN_uid275_div_uid49_fpArctan2Test_a <= excXZYZ_uid273_div_uid49_fpArctan2Test_q;
    excRNaN_uid275_div_uid49_fpArctan2Test_b <= exc_N_uid33_fpArctan2Test_q;
    excRNaN_uid275_div_uid49_fpArctan2Test_c <= exc_N_uid17_fpArctan2Test_q;
    excRNaN_uid275_div_uid49_fpArctan2Test_d <= excXIYI_uid274_div_uid49_fpArctan2Test_q;
    excRNaN_uid275_div_uid49_fpArctan2Test_q <= excRNaN_uid275_div_uid49_fpArctan2Test_a or excRNaN_uid275_div_uid49_fpArctan2Test_b or excRNaN_uid275_div_uid49_fpArctan2Test_c or excRNaN_uid275_div_uid49_fpArctan2Test_d;

	--InvExcRNaN_uid286_div_uid49_fpArctan2Test(LOGICAL,285)@0
    InvExcRNaN_uid286_div_uid49_fpArctan2Test_a <= excRNaN_uid275_div_uid49_fpArctan2Test_q;
    InvExcRNaN_uid286_div_uid49_fpArctan2Test_q <= not InvExcRNaN_uid286_div_uid49_fpArctan2Test_a;

	--xInSign_uid39_fpArctan2Test(BITSELECT,38)@0
    xInSign_uid39_fpArctan2Test_in <= b;
    xInSign_uid39_fpArctan2Test_b <= xInSign_uid39_fpArctan2Test_in(31 downto 31);

	--signR_uid231_div_uid49_fpArctan2Test(LOGICAL,230)@0
    signR_uid231_div_uid49_fpArctan2Test_a <= yInSign_uid38_fpArctan2Test_b;
    signR_uid231_div_uid49_fpArctan2Test_b <= xInSign_uid39_fpArctan2Test_b;
    signR_uid231_div_uid49_fpArctan2Test_q <= signR_uid231_div_uid49_fpArctan2Test_a xor signR_uid231_div_uid49_fpArctan2Test_b;

	--sRPostExc_uid287_div_uid49_fpArctan2Test(LOGICAL,286)@0
    sRPostExc_uid287_div_uid49_fpArctan2Test_a <= signR_uid231_div_uid49_fpArctan2Test_q;
    sRPostExc_uid287_div_uid49_fpArctan2Test_b <= InvExcRNaN_uid286_div_uid49_fpArctan2Test_q;
    sRPostExc_uid287_div_uid49_fpArctan2Test_q_i <= sRPostExc_uid287_div_uid49_fpArctan2Test_a and sRPostExc_uid287_div_uid49_fpArctan2Test_b;
    sRPostExc_uid287_div_uid49_fpArctan2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => sRPostExc_uid287_div_uid49_fpArctan2Test_q, xin => sRPostExc_uid287_div_uid49_fpArctan2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_sRPostExc_uid287_div_uid49_fpArctan2Test_q_to_divR_uid288_div_uid49_fpArctan2Test_c(DELAY,867)@1
    ld_sRPostExc_uid287_div_uid49_fpArctan2Test_q_to_divR_uid288_div_uid49_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => sRPostExc_uid287_div_uid49_fpArctan2Test_q, xout => ld_sRPostExc_uid287_div_uid49_fpArctan2Test_q_to_divR_uid288_div_uid49_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor(LOGICAL,1342)
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_b <= ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_sticky_ena_q;
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_q <= not (ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_a or ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_b);

	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_cmpReg(REG,1212)
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_sticky_ena(REG,1343)
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_nor_q = "1") THEN
                ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_sticky_ena_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd(LOGICAL,1344)
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_a <= ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_sticky_ena_q;
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_b <= en;
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_q <= ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_a and ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_b;

	--ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor(LOGICAL,1331)
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_b <= ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_sticky_ena_q;
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_q <= not (ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_a or ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_b);

	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_mem_top(CONSTANT,1186)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_mem_top_q <= "01000";

	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp(LOGICAL,1187)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_a <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_mem_top_q;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_q);
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_q <= "1" when ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_a = ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_b else "0";

	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmpReg(REG,1188)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmpReg_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_sticky_ena(REG,1332)
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_nor_q = "1") THEN
                ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_sticky_ena_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd(LOGICAL,1333)
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_a <= ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_sticky_ena_q;
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_b <= en;
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_q <= ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_a and ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_b;

	--ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_inputreg(DELAY,1321)
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => frac_uid29_fpArctan2Test_b, xout => ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt(COUNTER,1182)
    -- every=1, low=0, high=8, step=1, init=1
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_i = 7 THEN
                      ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_eq = '1') THEN
                        ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_i <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_i - 8;
                    ELSE
                        ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_i <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_i,4));


	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg(REG,1183)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux(MUX,1184)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_s <= en;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux: PROCESS (ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_s, ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg_q, ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_s IS
                  WHEN "0" => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg_q;
                  WHEN "1" => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem(DUALMEM,1322)
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_ia <= ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_inputreg_q;
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_aa <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg_q;
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_ab <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_q;
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 23,
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
        clocken1 => ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_iq,
        address_a => ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_aa,
        data_a => ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_ia
    );
    ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_reset0 <= areset;
        ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_q <= ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_iq(22 downto 0);

	--lOAdded_uid241_div_uid49_fpArctan2Test(BITJOIN,240)@11
    lOAdded_uid241_div_uid49_fpArctan2Test_q <= VCC_q & ld_frac_uid29_fpArctan2Test_b_to_lOAdded_uid241_div_uid49_fpArctan2Test_a_replace_mem_q;

	--ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_inputreg(DELAY,1334)
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => lOAdded_uid241_div_uid49_fpArctan2Test_q, xout => ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt(COUNTER,1208)
    -- every=1, low=0, high=1, step=1, init=1
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_i <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_i,1));


	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg(REG,1209)
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux(MUX,1210)
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_s <= en;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux: PROCESS (ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_s, ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg_q, ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_s IS
                  WHEN "0" => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg_q;
                  WHEN "1" => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem(DUALMEM,1335)
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_ia <= ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_inputreg_q;
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_aa <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg_q;
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_ab <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_q;
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_iq,
        address_a => ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_aa,
        data_a => ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_ia
    );
    ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_reset0 <= areset;
        ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_q <= ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_iq(23 downto 0);

	--z_uid243_div_uid49_fpArctan2Test(CONSTANT,242)
    z_uid243_div_uid49_fpArctan2Test_q <= "00";

	--oFracXExt_uid244_div_uid49_fpArctan2Test(BITJOIN,243)@15
    oFracXExt_uid244_div_uid49_fpArctan2Test_q <= ld_lOAdded_uid241_div_uid49_fpArctan2Test_q_to_oFracXExt_uid244_div_uid49_fpArctan2Test_b_replace_mem_q & z_uid243_div_uid49_fpArctan2Test_q;

	--reg_lOAdded_uid241_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_1(REG,520)@11
    reg_lOAdded_uid241_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_lOAdded_uid241_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_lOAdded_uid241_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_1_q <= lOAdded_uid241_div_uid49_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--fracYAddr_uid235_div_uid49_fpArctan2Test(BITSELECT,234)@0
    fracYAddr_uid235_div_uid49_fpArctan2Test_in <= b(22 downto 0);
    fracYAddr_uid235_div_uid49_fpArctan2Test_b <= fracYAddr_uid235_div_uid49_fpArctan2Test_in(22 downto 14);

	--reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC2_uid447_invTab_lutmem_0(REG,510)@0
    reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC2_uid447_invTab_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC2_uid447_invTab_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC2_uid447_invTab_lutmem_0_q <= fracYAddr_uid235_div_uid49_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid447_invTab_lutmem(DUALMEM,506)@1
    memoryC2_uid447_invTab_lutmem_ia <= (others => '0');
    memoryC2_uid447_invTab_lutmem_aa <= (others => '0');
    memoryC2_uid447_invTab_lutmem_ab <= reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC2_uid447_invTab_lutmem_0_q;
    memoryC2_uid447_invTab_lutmem_dmem : altsyncram
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
        init_file => "fp_atan2_s5_memoryC2_uid447_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid447_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid447_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid447_invTab_lutmem_iq,
        address_a => memoryC2_uid447_invTab_lutmem_aa,
        data_a => memoryC2_uid447_invTab_lutmem_ia
    );
    memoryC2_uid447_invTab_lutmem_reset0 <= areset;
        memoryC2_uid447_invTab_lutmem_q <= memoryC2_uid447_invTab_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid447_invTab_lutmem_0_to_prodXY_uid490_pT1_uid450_invPE_1(REG,512)@3
    reg_memoryC2_uid447_invTab_lutmem_0_to_prodXY_uid490_pT1_uid450_invPE_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid447_invTab_lutmem_0_to_prodXY_uid490_pT1_uid450_invPE_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid447_invTab_lutmem_0_to_prodXY_uid490_pT1_uid450_invPE_1_q <= memoryC2_uid447_invTab_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--yPE_uid236_div_uid49_fpArctan2Test(BITSELECT,235)@0
    yPE_uid236_div_uid49_fpArctan2Test_in <= b(13 downto 0);
    yPE_uid236_div_uid49_fpArctan2Test_b <= yPE_uid236_div_uid49_fpArctan2Test_in(13 downto 0);

	--yT1_uid449_invPE(BITSELECT,448)@0
    yT1_uid449_invPE_in <= yPE_uid236_div_uid49_fpArctan2Test_b;
    yT1_uid449_invPE_b <= yT1_uid449_invPE_in(13 downto 2);

	--reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0(REG,511)@0
    reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q <= yT1_uid449_invPE_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a_inputreg(DELAY,1373)
    ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q, xout => ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a(DELAY,1043)@1
    ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a : dspba_delay
    GENERIC MAP ( width => 12, depth => 2 )
    PORT MAP ( xin => ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a_inputreg_q, xout => ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid490_pT1_uid450_invPE(MULT,489)@4
    prodXY_uid490_pT1_uid450_invPE_pr <= signed(resize(UNSIGNED(prodXY_uid490_pT1_uid450_invPE_a),13)) * SIGNED(prodXY_uid490_pT1_uid450_invPE_b);
    prodXY_uid490_pT1_uid450_invPE_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid490_pT1_uid450_invPE_a <= (others => '0');
            prodXY_uid490_pT1_uid450_invPE_b <= (others => '0');
            prodXY_uid490_pT1_uid450_invPE_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid490_pT1_uid450_invPE_a <= ld_reg_yT1_uid449_invPE_0_to_prodXY_uid490_pT1_uid450_invPE_0_q_to_prodXY_uid490_pT1_uid450_invPE_a_q;
                prodXY_uid490_pT1_uid450_invPE_b <= reg_memoryC2_uid447_invTab_lutmem_0_to_prodXY_uid490_pT1_uid450_invPE_1_q;
                prodXY_uid490_pT1_uid450_invPE_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid490_pT1_uid450_invPE_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid490_pT1_uid450_invPE: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid490_pT1_uid450_invPE_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid490_pT1_uid450_invPE_q <= prodXY_uid490_pT1_uid450_invPE_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid491_pT1_uid450_invPE(BITSELECT,490)@7
    prodXYTruncFR_uid491_pT1_uid450_invPE_in <= prodXY_uid490_pT1_uid450_invPE_q;
    prodXYTruncFR_uid491_pT1_uid450_invPE_b <= prodXYTruncFR_uid491_pT1_uid450_invPE_in(23 downto 11);

	--highBBits_uid452_invPE(BITSELECT,451)@7
    highBBits_uid452_invPE_in <= prodXYTruncFR_uid491_pT1_uid450_invPE_b;
    highBBits_uid452_invPE_b <= highBBits_uid452_invPE_in(12 downto 1);

	--ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_a(DELAY,1067)@0
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 3 )
    PORT MAP ( xin => fracYAddr_uid235_div_uid49_fpArctan2Test_b, xout => ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0(REG,513)@3
    reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_q <= ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid445_invTab_lutmem(DUALMEM,505)@4
    memoryC1_uid445_invTab_lutmem_ia <= (others => '0');
    memoryC1_uid445_invTab_lutmem_aa <= (others => '0');
    memoryC1_uid445_invTab_lutmem_ab <= reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC1_uid445_invTab_lutmem_0_q;
    memoryC1_uid445_invTab_lutmem_dmem : altsyncram
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
        init_file => "fp_atan2_s5_memoryC1_uid445_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid445_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid445_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid445_invTab_lutmem_iq,
        address_a => memoryC1_uid445_invTab_lutmem_aa,
        data_a => memoryC1_uid445_invTab_lutmem_ia
    );
    memoryC1_uid445_invTab_lutmem_reset0 <= areset;
        memoryC1_uid445_invTab_lutmem_q <= memoryC1_uid445_invTab_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid445_invTab_lutmem_0_to_sumAHighB_uid453_invPE_0(REG,514)@6
    reg_memoryC1_uid445_invTab_lutmem_0_to_sumAHighB_uid453_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid445_invTab_lutmem_0_to_sumAHighB_uid453_invPE_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid445_invTab_lutmem_0_to_sumAHighB_uid453_invPE_0_q <= memoryC1_uid445_invTab_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid453_invPE(ADD,452)@7
    sumAHighB_uid453_invPE_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid445_invTab_lutmem_0_to_sumAHighB_uid453_invPE_0_q(20)) & reg_memoryC1_uid445_invTab_lutmem_0_to_sumAHighB_uid453_invPE_0_q);
    sumAHighB_uid453_invPE_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid452_invPE_b(11)) & highBBits_uid452_invPE_b);
            sumAHighB_uid453_invPE_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid453_invPE_a) + SIGNED(sumAHighB_uid453_invPE_b));
    sumAHighB_uid453_invPE_q <= sumAHighB_uid453_invPE_o(21 downto 0);


	--lowRangeB_uid451_invPE(BITSELECT,450)@7
    lowRangeB_uid451_invPE_in <= prodXYTruncFR_uid491_pT1_uid450_invPE_b(0 downto 0);
    lowRangeB_uid451_invPE_b <= lowRangeB_uid451_invPE_in(0 downto 0);

	--s1_uid451_uid454_invPE(BITJOIN,453)@7
    s1_uid451_uid454_invPE_q <= sumAHighB_uid453_invPE_q & lowRangeB_uid451_invPE_b;

	--reg_s1_uid451_uid454_invPE_0_to_prodXY_uid493_pT2_uid456_invPE_1(REG,516)@7
    reg_s1_uid451_uid454_invPE_0_to_prodXY_uid493_pT2_uid456_invPE_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid451_uid454_invPE_0_to_prodXY_uid493_pT2_uid456_invPE_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid451_uid454_invPE_0_to_prodXY_uid493_pT2_uid456_invPE_1_q <= s1_uid451_uid454_invPE_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor(LOGICAL,1408)
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_b <= ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_sticky_ena_q;
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_q <= not (ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_a or ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_b);

	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_mem_top(CONSTANT,1366)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_mem_top_q <= "0100";

	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp(LOGICAL,1367)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_a <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_mem_top_q;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q);
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_q <= "1" when ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_a = ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_b else "0";

	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg(REG,1368)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_sticky_ena(REG,1409)
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_nor_q = "1") THEN
                ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_sticky_ena_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd(LOGICAL,1410)
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_a <= ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_sticky_ena_q;
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_b <= en;
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_q <= ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_a and ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_b;

	--ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_inputreg(DELAY,1398)
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => yPE_uid236_div_uid49_fpArctan2Test_b, xout => ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt(COUNTER,1362)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_i = 3 THEN
                      ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_i,3));


	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg(REG,1363)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux(MUX,1364)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_s <= en;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux: PROCESS (ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_s, ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q, ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem(DUALMEM,1399)
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_ia <= ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_inputreg_q;
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_aa <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q;
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_ab <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q;
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 14,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 14,
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
        clocken1 => ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_iq,
        address_a => ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_aa,
        data_a => ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_ia
    );
    ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_reset0 <= areset;
        ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_q <= ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_iq(13 downto 0);

	--reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0(REG,515)@7
    reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_q <= ld_yPE_uid236_div_uid49_fpArctan2Test_b_to_reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid493_pT2_uid456_invPE(MULT,492)@8
    prodXY_uid493_pT2_uid456_invPE_pr <= signed(resize(UNSIGNED(prodXY_uid493_pT2_uid456_invPE_a),15)) * SIGNED(prodXY_uid493_pT2_uid456_invPE_b);
    prodXY_uid493_pT2_uid456_invPE_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid493_pT2_uid456_invPE_a <= (others => '0');
            prodXY_uid493_pT2_uid456_invPE_b <= (others => '0');
            prodXY_uid493_pT2_uid456_invPE_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid493_pT2_uid456_invPE_a <= reg_yPE_uid236_div_uid49_fpArctan2Test_0_to_prodXY_uid493_pT2_uid456_invPE_0_q;
                prodXY_uid493_pT2_uid456_invPE_b <= reg_s1_uid451_uid454_invPE_0_to_prodXY_uid493_pT2_uid456_invPE_1_q;
                prodXY_uid493_pT2_uid456_invPE_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid493_pT2_uid456_invPE_pr,37));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid493_pT2_uid456_invPE: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid493_pT2_uid456_invPE_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid493_pT2_uid456_invPE_q <= prodXY_uid493_pT2_uid456_invPE_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid494_pT2_uid456_invPE(BITSELECT,493)@11
    prodXYTruncFR_uid494_pT2_uid456_invPE_in <= prodXY_uid493_pT2_uid456_invPE_q;
    prodXYTruncFR_uid494_pT2_uid456_invPE_b <= prodXYTruncFR_uid494_pT2_uid456_invPE_in(36 downto 13);

	--highBBits_uid458_invPE(BITSELECT,457)@11
    highBBits_uid458_invPE_in <= prodXYTruncFR_uid494_pT2_uid456_invPE_b;
    highBBits_uid458_invPE_b <= highBBits_uid458_invPE_in(23 downto 2);

	--ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor(LOGICAL,1421)
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_b <= ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_sticky_ena_q;
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_q <= not (ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_a or ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_b);

	--ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_sticky_ena(REG,1422)
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_nor_q = "1") THEN
                ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_sticky_ena_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd(LOGICAL,1423)
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_a <= ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_sticky_ena_q;
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_b <= en;
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_q <= ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_a and ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_b;

	--ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_inputreg(DELAY,1411)
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => fracYAddr_uid235_div_uid49_fpArctan2Test_b, xout => ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem(DUALMEM,1412)
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_ia <= ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_inputreg_q;
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_aa <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q;
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_ab <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q;
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_iq,
        address_a => ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_aa,
        data_a => ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_ia
    );
    ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_q <= ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_iq(8 downto 0);

	--reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0(REG,517)@7
    reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_q <= ld_fracYAddr_uid235_div_uid49_fpArctan2Test_b_to_reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid443_invTab_lutmem(DUALMEM,504)@8
    memoryC0_uid443_invTab_lutmem_ia <= (others => '0');
    memoryC0_uid443_invTab_lutmem_aa <= (others => '0');
    memoryC0_uid443_invTab_lutmem_ab <= reg_fracYAddr_uid235_div_uid49_fpArctan2Test_0_to_memoryC0_uid443_invTab_lutmem_0_q;
    memoryC0_uid443_invTab_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 31,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 31,
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
        init_file => "fp_atan2_s5_memoryC0_uid443_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid443_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid443_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid443_invTab_lutmem_iq,
        address_a => memoryC0_uid443_invTab_lutmem_aa,
        data_a => memoryC0_uid443_invTab_lutmem_ia
    );
    memoryC0_uid443_invTab_lutmem_reset0 <= areset;
        memoryC0_uid443_invTab_lutmem_q <= memoryC0_uid443_invTab_lutmem_iq(30 downto 0);

	--reg_memoryC0_uid443_invTab_lutmem_0_to_sumAHighB_uid459_invPE_0(REG,518)@10
    reg_memoryC0_uid443_invTab_lutmem_0_to_sumAHighB_uid459_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid443_invTab_lutmem_0_to_sumAHighB_uid459_invPE_0_q <= "0000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid443_invTab_lutmem_0_to_sumAHighB_uid459_invPE_0_q <= memoryC0_uid443_invTab_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid459_invPE(ADD,458)@11
    sumAHighB_uid459_invPE_a <= STD_LOGIC_VECTOR((31 downto 31 => reg_memoryC0_uid443_invTab_lutmem_0_to_sumAHighB_uid459_invPE_0_q(30)) & reg_memoryC0_uid443_invTab_lutmem_0_to_sumAHighB_uid459_invPE_0_q);
    sumAHighB_uid459_invPE_b <= STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid458_invPE_b(21)) & highBBits_uid458_invPE_b);
            sumAHighB_uid459_invPE_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid459_invPE_a) + SIGNED(sumAHighB_uid459_invPE_b));
    sumAHighB_uid459_invPE_q <= sumAHighB_uid459_invPE_o(31 downto 0);


	--lowRangeB_uid457_invPE(BITSELECT,456)@11
    lowRangeB_uid457_invPE_in <= prodXYTruncFR_uid494_pT2_uid456_invPE_b(1 downto 0);
    lowRangeB_uid457_invPE_b <= lowRangeB_uid457_invPE_in(1 downto 0);

	--s2_uid457_uid460_invPE(BITJOIN,459)@11
    s2_uid457_uid460_invPE_q <= sumAHighB_uid459_invPE_q & lowRangeB_uid457_invPE_b;

	--invY_uid238_div_uid49_fpArctan2Test(BITSELECT,237)@11
    invY_uid238_div_uid49_fpArctan2Test_in <= s2_uid457_uid460_invPE_q(30 downto 0);
    invY_uid238_div_uid49_fpArctan2Test_b <= invY_uid238_div_uid49_fpArctan2Test_in(30 downto 5);

	--reg_invY_uid238_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_0(REG,519)@11
    reg_invY_uid238_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_invY_uid238_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_0_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_invY_uid238_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_0_q <= invY_uid238_div_uid49_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test(MULT,461)@12
    prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_pr <= UNSIGNED(prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_a) * UNSIGNED(prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_b);
    prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_a <= (others => '0');
            prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_b <= (others => '0');
            prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_a <= reg_invY_uid238_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_0_q;
                prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_b <= reg_lOAdded_uid241_div_uid49_fpArctan2Test_0_to_prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_1_q;
                prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_s1 <= STD_LOGIC_VECTOR(prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_pr);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_q <= prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid463_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test(BITSELECT,462)@15
    prodXYTruncFR_uid463_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_in <= prodXY_uid462_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_q;
    prodXYTruncFR_uid463_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_b <= prodXYTruncFR_uid463_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_in(49 downto 24);

	--invYO_uid239_div_uid49_fpArctan2Test(BITSELECT,238)@11
    invYO_uid239_div_uid49_fpArctan2Test_in <= s2_uid457_uid460_invPE_q(31 downto 0);
    invYO_uid239_div_uid49_fpArctan2Test_b <= invYO_uid239_div_uid49_fpArctan2Test_in(31 downto 31);

	--fracYZero_uid198_div_uid49_fpArctan2Test(LOGICAL,197)@0
    fracYZero_uid198_div_uid49_fpArctan2Test_a <= frac_uid13_fpArctan2Test_b;
    fracYZero_uid198_div_uid49_fpArctan2Test_b <= STD_LOGIC_VECTOR("0000000000000000000000" & GND_q);
    fracYZero_uid198_div_uid49_fpArctan2Test_q <= "1" when fracYZero_uid198_div_uid49_fpArctan2Test_a = fracYZero_uid198_div_uid49_fpArctan2Test_b else "0";

	--ld_fracYZero_uid198_div_uid49_fpArctan2Test_q_to_fracYPostZ_uid240_div_uid49_fpArctan2Test_a(DELAY,798)@0
    ld_fracYZero_uid198_div_uid49_fpArctan2Test_q_to_fracYPostZ_uid240_div_uid49_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => fracYZero_uid198_div_uid49_fpArctan2Test_q, xout => ld_fracYZero_uid198_div_uid49_fpArctan2Test_q_to_fracYPostZ_uid240_div_uid49_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--fracYPostZ_uid240_div_uid49_fpArctan2Test(LOGICAL,239)@11
    fracYPostZ_uid240_div_uid49_fpArctan2Test_a <= ld_fracYZero_uid198_div_uid49_fpArctan2Test_q_to_fracYPostZ_uid240_div_uid49_fpArctan2Test_a_q;
    fracYPostZ_uid240_div_uid49_fpArctan2Test_b <= invYO_uid239_div_uid49_fpArctan2Test_b;
    fracYPostZ_uid240_div_uid49_fpArctan2Test_q_i <= fracYPostZ_uid240_div_uid49_fpArctan2Test_a or fracYPostZ_uid240_div_uid49_fpArctan2Test_b;
    fracYPostZ_uid240_div_uid49_fpArctan2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => fracYPostZ_uid240_div_uid49_fpArctan2Test_q, xin => fracYPostZ_uid240_div_uid49_fpArctan2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_fracYPostZ_uid240_div_uid49_fpArctan2Test_q_to_divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_b(DELAY,802)@12
    ld_fracYPostZ_uid240_div_uid49_fpArctan2Test_q_to_divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => fracYPostZ_uid240_div_uid49_fpArctan2Test_q, xout => ld_fracYPostZ_uid240_div_uid49_fpArctan2Test_q_to_divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--divValPreNormTrunc_uid246_div_uid49_fpArctan2Test(MUX,245)@15
    divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_s <= ld_fracYPostZ_uid240_div_uid49_fpArctan2Test_q_to_divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_b_q;
    divValPreNormTrunc_uid246_div_uid49_fpArctan2Test: PROCESS (divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_s, en, prodXYTruncFR_uid463_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_b, oFracXExt_uid244_div_uid49_fpArctan2Test_q)
    BEGIN
            CASE divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_s IS
                  WHEN "0" => divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_q <= prodXYTruncFR_uid463_prodDivPreNormProd_uid242_div_uid49_fpArctan2Test_b;
                  WHEN "1" => divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_q <= oFracXExt_uid244_div_uid49_fpArctan2Test_q;
                  WHEN OTHERS => divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--norm_uid247_div_uid49_fpArctan2Test(BITSELECT,246)@15
    norm_uid247_div_uid49_fpArctan2Test_in <= divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_q;
    norm_uid247_div_uid49_fpArctan2Test_b <= norm_uid247_div_uid49_fpArctan2Test_in(25 downto 25);

	--ld_norm_uid247_div_uid49_fpArctan2Test_b_to_rndOp_uid253_div_uid49_fpArctan2Test_c(DELAY,813)@15
    ld_norm_uid247_div_uid49_fpArctan2Test_b_to_rndOp_uid253_div_uid49_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => norm_uid247_div_uid49_fpArctan2Test_b, xout => ld_norm_uid247_div_uid49_fpArctan2Test_b_to_rndOp_uid253_div_uid49_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--rndOp_uid253_div_uid49_fpArctan2Test(BITJOIN,252)@16
    rndOp_uid253_div_uid49_fpArctan2Test_q <= ld_norm_uid247_div_uid49_fpArctan2Test_b_to_rndOp_uid253_div_uid49_fpArctan2Test_c_q & cstAllZWF_uid7_fpArctan2Test_q & VCC_q;

	--cstBiasM1_uid58_fpArctan2Test(CONSTANT,57)
    cstBiasM1_uid58_fpArctan2Test_q <= "01111110";

	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor(LOGICAL,1318)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_b <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_sticky_ena_q;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_q <= not (ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_a or ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_b);

	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_mem_top(CONSTANT,1314)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_mem_top_q <= "01010";

	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp(LOGICAL,1315)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_a <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_mem_top_q;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_q);
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_q <= "1" when ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_a = ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_b else "0";

	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmpReg(REG,1316)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmpReg_q <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_sticky_ena(REG,1319)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_nor_q = "1") THEN
                ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_sticky_ena_q <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd(LOGICAL,1320)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_a <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_sticky_ena_q;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_b <= en;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_q <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_a and ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_b;

	--expXmY_uid232_div_uid49_fpArctan2Test(SUB,231)@0
    expXmY_uid232_div_uid49_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & exp_uid27_fpArctan2Test_b);
    expXmY_uid232_div_uid49_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & exp_uid11_fpArctan2Test_b);
    expXmY_uid232_div_uid49_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid232_div_uid49_fpArctan2Test_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expXmY_uid232_div_uid49_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid232_div_uid49_fpArctan2Test_a) - UNSIGNED(expXmY_uid232_div_uid49_fpArctan2Test_b));
            END IF;
        END IF;
    END PROCESS;
    expXmY_uid232_div_uid49_fpArctan2Test_q <= expXmY_uid232_div_uid49_fpArctan2Test_o(8 downto 0);


	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_inputreg(DELAY,1308)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expXmY_uid232_div_uid49_fpArctan2Test_q, xout => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt(COUNTER,1310)
    -- every=1, low=0, high=10, step=1, init=1
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_i = 9 THEN
                      ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_eq = '1') THEN
                        ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_i <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_i - 10;
                    ELSE
                        ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_i <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_i,4));


	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg(REG,1311)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg_q <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux(MUX,1312)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_s <= en;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux: PROCESS (ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_s, ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg_q, ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_q <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg_q;
                  WHEN "1" => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_q <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem(DUALMEM,1309)
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_ia <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_inputreg_q;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_aa <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg_q;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_ab <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_q;
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 9,
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
        clocken1 => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_iq,
        address_a => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_aa,
        data_a => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_ia
    );
    ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_reset0 <= areset;
        ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_q <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_iq(8 downto 0);

	--expR_uid233_div_uid49_fpArctan2Test(ADD,232)@14
    expR_uid233_div_uid49_fpArctan2Test_a <= STD_LOGIC_VECTOR((10 downto 9 => ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_q(8)) & ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_mem_q);
    expR_uid233_div_uid49_fpArctan2Test_b <= STD_LOGIC_VECTOR('0' & "00" & cstBiasM1_uid58_fpArctan2Test_q);
    expR_uid233_div_uid49_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expR_uid233_div_uid49_fpArctan2Test_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expR_uid233_div_uid49_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid233_div_uid49_fpArctan2Test_a) + SIGNED(expR_uid233_div_uid49_fpArctan2Test_b));
            END IF;
        END IF;
    END PROCESS;
    expR_uid233_div_uid49_fpArctan2Test_q <= expR_uid233_div_uid49_fpArctan2Test_o(9 downto 0);


	--divValPreNormHigh_uid248_div_uid49_fpArctan2Test(BITSELECT,247)@15
    divValPreNormHigh_uid248_div_uid49_fpArctan2Test_in <= divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_q(24 downto 0);
    divValPreNormHigh_uid248_div_uid49_fpArctan2Test_b <= divValPreNormHigh_uid248_div_uid49_fpArctan2Test_in(24 downto 1);

	--divValPreNormLow_uid249_div_uid49_fpArctan2Test(BITSELECT,248)@15
    divValPreNormLow_uid249_div_uid49_fpArctan2Test_in <= divValPreNormTrunc_uid246_div_uid49_fpArctan2Test_q(23 downto 0);
    divValPreNormLow_uid249_div_uid49_fpArctan2Test_b <= divValPreNormLow_uid249_div_uid49_fpArctan2Test_in(23 downto 0);

	--normFracRnd_uid250_div_uid49_fpArctan2Test(MUX,249)@15
    normFracRnd_uid250_div_uid49_fpArctan2Test_s <= norm_uid247_div_uid49_fpArctan2Test_b;
    normFracRnd_uid250_div_uid49_fpArctan2Test: PROCESS (normFracRnd_uid250_div_uid49_fpArctan2Test_s, en, divValPreNormLow_uid249_div_uid49_fpArctan2Test_b, divValPreNormHigh_uid248_div_uid49_fpArctan2Test_b)
    BEGIN
            CASE normFracRnd_uid250_div_uid49_fpArctan2Test_s IS
                  WHEN "0" => normFracRnd_uid250_div_uid49_fpArctan2Test_q <= divValPreNormLow_uid249_div_uid49_fpArctan2Test_b;
                  WHEN "1" => normFracRnd_uid250_div_uid49_fpArctan2Test_q <= divValPreNormHigh_uid248_div_uid49_fpArctan2Test_b;
                  WHEN OTHERS => normFracRnd_uid250_div_uid49_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRnd_uid251_div_uid49_fpArctan2Test(BITJOIN,250)@15
    expFracRnd_uid251_div_uid49_fpArctan2Test_q <= expR_uid233_div_uid49_fpArctan2Test_q & normFracRnd_uid250_div_uid49_fpArctan2Test_q;

	--reg_expFracRnd_uid251_div_uid49_fpArctan2Test_0_to_expFracPostRnd_uid254_div_uid49_fpArctan2Test_0(REG,521)@15
    reg_expFracRnd_uid251_div_uid49_fpArctan2Test_0_to_expFracPostRnd_uid254_div_uid49_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracRnd_uid251_div_uid49_fpArctan2Test_0_to_expFracPostRnd_uid254_div_uid49_fpArctan2Test_0_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracRnd_uid251_div_uid49_fpArctan2Test_0_to_expFracPostRnd_uid254_div_uid49_fpArctan2Test_0_q <= expFracRnd_uid251_div_uid49_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracPostRnd_uid254_div_uid49_fpArctan2Test(ADD,253)@16
    expFracPostRnd_uid254_div_uid49_fpArctan2Test_a <= STD_LOGIC_VECTOR((35 downto 34 => reg_expFracRnd_uid251_div_uid49_fpArctan2Test_0_to_expFracPostRnd_uid254_div_uid49_fpArctan2Test_0_q(33)) & reg_expFracRnd_uid251_div_uid49_fpArctan2Test_0_to_expFracPostRnd_uid254_div_uid49_fpArctan2Test_0_q);
    expFracPostRnd_uid254_div_uid49_fpArctan2Test_b <= STD_LOGIC_VECTOR('0' & "0000000000" & rndOp_uid253_div_uid49_fpArctan2Test_q);
            expFracPostRnd_uid254_div_uid49_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid254_div_uid49_fpArctan2Test_a) + SIGNED(expFracPostRnd_uid254_div_uid49_fpArctan2Test_b));
    expFracPostRnd_uid254_div_uid49_fpArctan2Test_q <= expFracPostRnd_uid254_div_uid49_fpArctan2Test_o(34 downto 0);


	--excRPreExc_uid257_div_uid49_fpArctan2Test(BITSELECT,256)@16
    excRPreExc_uid257_div_uid49_fpArctan2Test_in <= expFracPostRnd_uid254_div_uid49_fpArctan2Test_q(31 downto 0);
    excRPreExc_uid257_div_uid49_fpArctan2Test_b <= excRPreExc_uid257_div_uid49_fpArctan2Test_in(31 downto 24);

	--ld_excRPreExc_uid257_div_uid49_fpArctan2Test_b_to_expRPostExc_uid285_div_uid49_fpArctan2Test_d(DELAY,861)@16
    ld_excRPreExc_uid257_div_uid49_fpArctan2Test_b_to_expRPostExc_uid285_div_uid49_fpArctan2Test_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => excRPreExc_uid257_div_uid49_fpArctan2Test_b, xout => ld_excRPreExc_uid257_div_uid49_fpArctan2Test_b_to_expRPostExc_uid285_div_uid49_fpArctan2Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid275_div_uid49_fpArctan2Test_q_to_concExc_uid276_div_uid49_fpArctan2Test_c(DELAY,856)@0
    ld_excRNaN_uid275_div_uid49_fpArctan2Test_q_to_concExc_uid276_div_uid49_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => excRNaN_uid275_div_uid49_fpArctan2Test_q, xout => ld_excRNaN_uid275_div_uid49_fpArctan2Test_q_to_concExc_uid276_div_uid49_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid227_div_uid49_fpArctan2Test(LOGICAL,226)@0
    InvExc_N_uid227_div_uid49_fpArctan2Test_a <= exc_N_uid17_fpArctan2Test_q;
    InvExc_N_uid227_div_uid49_fpArctan2Test_q <= not InvExc_N_uid227_div_uid49_fpArctan2Test_a;

	--InvExc_I_uid228_div_uid49_fpArctan2Test(LOGICAL,227)@0
    InvExc_I_uid228_div_uid49_fpArctan2Test_a <= exc_I_uid15_fpArctan2Test_q;
    InvExc_I_uid228_div_uid49_fpArctan2Test_q <= not InvExc_I_uid228_div_uid49_fpArctan2Test_a;

	--InvExpXIsZero_uid229_div_uid49_fpArctan2Test(LOGICAL,228)@0
    InvExpXIsZero_uid229_div_uid49_fpArctan2Test_a <= expXIsZero_uid219_div_uid49_fpArctan2Test_q;
    InvExpXIsZero_uid229_div_uid49_fpArctan2Test_q <= not InvExpXIsZero_uid229_div_uid49_fpArctan2Test_a;

	--exc_R_uid230_div_uid49_fpArctan2Test(LOGICAL,229)@0
    exc_R_uid230_div_uid49_fpArctan2Test_a <= InvExpXIsZero_uid229_div_uid49_fpArctan2Test_q;
    exc_R_uid230_div_uid49_fpArctan2Test_b <= InvExc_I_uid228_div_uid49_fpArctan2Test_q;
    exc_R_uid230_div_uid49_fpArctan2Test_c <= InvExc_N_uid227_div_uid49_fpArctan2Test_q;
    exc_R_uid230_div_uid49_fpArctan2Test_q <= exc_R_uid230_div_uid49_fpArctan2Test_a and exc_R_uid230_div_uid49_fpArctan2Test_b and exc_R_uid230_div_uid49_fpArctan2Test_c;

	--excXIYR_uid271_div_uid49_fpArctan2Test(LOGICAL,270)@0
    excXIYR_uid271_div_uid49_fpArctan2Test_a <= exc_I_uid31_fpArctan2Test_q;
    excXIYR_uid271_div_uid49_fpArctan2Test_b <= exc_R_uid230_div_uid49_fpArctan2Test_q;
    excXIYR_uid271_div_uid49_fpArctan2Test_q <= excXIYR_uid271_div_uid49_fpArctan2Test_a and excXIYR_uid271_div_uid49_fpArctan2Test_b;

	--ld_excXIYR_uid271_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_d(DELAY,845)@0
    ld_excXIYR_uid271_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => excXIYR_uid271_div_uid49_fpArctan2Test_q, xout => ld_excXIYR_uid271_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--excXIYZ_uid270_div_uid49_fpArctan2Test(LOGICAL,269)@0
    excXIYZ_uid270_div_uid49_fpArctan2Test_a <= exc_I_uid31_fpArctan2Test_q;
    excXIYZ_uid270_div_uid49_fpArctan2Test_b <= expXIsZero_uid219_div_uid49_fpArctan2Test_q;
    excXIYZ_uid270_div_uid49_fpArctan2Test_q <= excXIYZ_uid270_div_uid49_fpArctan2Test_a and excXIYZ_uid270_div_uid49_fpArctan2Test_b;

	--ld_excXIYZ_uid270_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_c(DELAY,844)@0
    ld_excXIYZ_uid270_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => excXIYZ_uid270_div_uid49_fpArctan2Test_q, xout => ld_excXIYZ_uid270_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--expRExt_uid258_div_uid49_fpArctan2Test(BITSELECT,257)@16
    expRExt_uid258_div_uid49_fpArctan2Test_in <= expFracPostRnd_uid254_div_uid49_fpArctan2Test_q;
    expRExt_uid258_div_uid49_fpArctan2Test_b <= expRExt_uid258_div_uid49_fpArctan2Test_in(34 downto 24);

	--reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1(REG,522)@16
    reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1_q <= expRExt_uid258_div_uid49_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid262_div_uid49_fpArctan2Test(COMPARE,261)@17
    expOvf_uid262_div_uid49_fpArctan2Test_cin <= GND_q;
    expOvf_uid262_div_uid49_fpArctan2Test_a <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1_q(10)) & reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1_q) & '0';
    expOvf_uid262_div_uid49_fpArctan2Test_b <= STD_LOGIC_VECTOR('0' & "0000" & cstAllOWE_uid6_fpArctan2Test_q) & expOvf_uid262_div_uid49_fpArctan2Test_cin(0);
            expOvf_uid262_div_uid49_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid262_div_uid49_fpArctan2Test_a) - SIGNED(expOvf_uid262_div_uid49_fpArctan2Test_b));
    expOvf_uid262_div_uid49_fpArctan2Test_n(0) <= not expOvf_uid262_div_uid49_fpArctan2Test_o(13);


	--ld_exc_R_uid230_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c(DELAY,825)@0
    ld_exc_R_uid230_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => exc_R_uid230_div_uid49_fpArctan2Test_q, xout => ld_exc_R_uid230_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid211_div_uid49_fpArctan2Test(LOGICAL,210)@0
    InvExc_N_uid211_div_uid49_fpArctan2Test_a <= exc_N_uid33_fpArctan2Test_q;
    InvExc_N_uid211_div_uid49_fpArctan2Test_q <= not InvExc_N_uid211_div_uid49_fpArctan2Test_a;

	--InvExc_I_uid212_div_uid49_fpArctan2Test(LOGICAL,211)@0
    InvExc_I_uid212_div_uid49_fpArctan2Test_a <= exc_I_uid31_fpArctan2Test_q;
    InvExc_I_uid212_div_uid49_fpArctan2Test_q <= not InvExc_I_uid212_div_uid49_fpArctan2Test_a;

	--InvExpXIsZero_uid213_div_uid49_fpArctan2Test(LOGICAL,212)@0
    InvExpXIsZero_uid213_div_uid49_fpArctan2Test_a <= expXIsZero_uid203_div_uid49_fpArctan2Test_q;
    InvExpXIsZero_uid213_div_uid49_fpArctan2Test_q <= not InvExpXIsZero_uid213_div_uid49_fpArctan2Test_a;

	--exc_R_uid214_div_uid49_fpArctan2Test(LOGICAL,213)@0
    exc_R_uid214_div_uid49_fpArctan2Test_a <= InvExpXIsZero_uid213_div_uid49_fpArctan2Test_q;
    exc_R_uid214_div_uid49_fpArctan2Test_b <= InvExc_I_uid212_div_uid49_fpArctan2Test_q;
    exc_R_uid214_div_uid49_fpArctan2Test_c <= InvExc_N_uid211_div_uid49_fpArctan2Test_q;
    exc_R_uid214_div_uid49_fpArctan2Test_q <= exc_R_uid214_div_uid49_fpArctan2Test_a and exc_R_uid214_div_uid49_fpArctan2Test_b and exc_R_uid214_div_uid49_fpArctan2Test_c;

	--ld_exc_R_uid214_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b(DELAY,824)@0
    ld_exc_R_uid214_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => exc_R_uid214_div_uid49_fpArctan2Test_q, xout => ld_exc_R_uid214_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXRYROvf_uid269_div_uid49_fpArctan2Test(LOGICAL,268)@17
    excXRYROvf_uid269_div_uid49_fpArctan2Test_a <= ld_exc_R_uid214_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b_q;
    excXRYROvf_uid269_div_uid49_fpArctan2Test_b <= ld_exc_R_uid230_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c_q;
    excXRYROvf_uid269_div_uid49_fpArctan2Test_c <= expOvf_uid262_div_uid49_fpArctan2Test_n;
    excXRYROvf_uid269_div_uid49_fpArctan2Test_q <= excXRYROvf_uid269_div_uid49_fpArctan2Test_a and excXRYROvf_uid269_div_uid49_fpArctan2Test_b and excXRYROvf_uid269_div_uid49_fpArctan2Test_c;

	--excXRYZ_uid268_div_uid49_fpArctan2Test(LOGICAL,267)@0
    excXRYZ_uid268_div_uid49_fpArctan2Test_a <= exc_R_uid214_div_uid49_fpArctan2Test_q;
    excXRYZ_uid268_div_uid49_fpArctan2Test_b <= expXIsZero_uid219_div_uid49_fpArctan2Test_q;
    excXRYZ_uid268_div_uid49_fpArctan2Test_q <= excXRYZ_uid268_div_uid49_fpArctan2Test_a and excXRYZ_uid268_div_uid49_fpArctan2Test_b;

	--ld_excXRYZ_uid268_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_a(DELAY,842)@0
    ld_excXRYZ_uid268_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => excXRYZ_uid268_div_uid49_fpArctan2Test_q, xout => ld_excXRYZ_uid268_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid272_div_uid49_fpArctan2Test(LOGICAL,271)@17
    excRInf_uid272_div_uid49_fpArctan2Test_a <= ld_excXRYZ_uid268_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_a_q;
    excRInf_uid272_div_uid49_fpArctan2Test_b <= excXRYROvf_uid269_div_uid49_fpArctan2Test_q;
    excRInf_uid272_div_uid49_fpArctan2Test_c <= ld_excXIYZ_uid270_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_c_q;
    excRInf_uid272_div_uid49_fpArctan2Test_d <= ld_excXIYR_uid271_div_uid49_fpArctan2Test_q_to_excRInf_uid272_div_uid49_fpArctan2Test_d_q;
    excRInf_uid272_div_uid49_fpArctan2Test_q <= excRInf_uid272_div_uid49_fpArctan2Test_a or excRInf_uid272_div_uid49_fpArctan2Test_b or excRInf_uid272_div_uid49_fpArctan2Test_c or excRInf_uid272_div_uid49_fpArctan2Test_d;

	--xRegOrZero_uid265_div_uid49_fpArctan2Test(LOGICAL,264)@0
    xRegOrZero_uid265_div_uid49_fpArctan2Test_a <= exc_R_uid214_div_uid49_fpArctan2Test_q;
    xRegOrZero_uid265_div_uid49_fpArctan2Test_b <= expXIsZero_uid203_div_uid49_fpArctan2Test_q;
    xRegOrZero_uid265_div_uid49_fpArctan2Test_q <= xRegOrZero_uid265_div_uid49_fpArctan2Test_a or xRegOrZero_uid265_div_uid49_fpArctan2Test_b;

	--regOrZeroOverInf_uid266_div_uid49_fpArctan2Test(LOGICAL,265)@0
    regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_a <= xRegOrZero_uid265_div_uid49_fpArctan2Test_q;
    regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_b <= exc_I_uid15_fpArctan2Test_q;
    regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_q <= regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_a and regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_b;

	--ld_regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_c(DELAY,832)@0
    ld_regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_q, xout => ld_regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--expUdf_uid259_div_uid49_fpArctan2Test(COMPARE,258)@17
    expUdf_uid259_div_uid49_fpArctan2Test_cin <= GND_q;
    expUdf_uid259_div_uid49_fpArctan2Test_a <= STD_LOGIC_VECTOR('0' & "00000000000" & GND_q) & '0';
    expUdf_uid259_div_uid49_fpArctan2Test_b <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1_q(10)) & reg_expRExt_uid258_div_uid49_fpArctan2Test_0_to_expUdf_uid259_div_uid49_fpArctan2Test_1_q) & expUdf_uid259_div_uid49_fpArctan2Test_cin(0);
            expUdf_uid259_div_uid49_fpArctan2Test_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid259_div_uid49_fpArctan2Test_a) - SIGNED(expUdf_uid259_div_uid49_fpArctan2Test_b));
    expUdf_uid259_div_uid49_fpArctan2Test_n(0) <= not expUdf_uid259_div_uid49_fpArctan2Test_o(13);


	--regOverRegWithUf_uid264_div_uid49_fpArctan2Test(LOGICAL,263)@17
    regOverRegWithUf_uid264_div_uid49_fpArctan2Test_a <= expUdf_uid259_div_uid49_fpArctan2Test_n;
    regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b <= ld_exc_R_uid214_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b_q;
    regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c <= ld_exc_R_uid230_div_uid49_fpArctan2Test_q_to_regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c_q;
    regOverRegWithUf_uid264_div_uid49_fpArctan2Test_q <= regOverRegWithUf_uid264_div_uid49_fpArctan2Test_a and regOverRegWithUf_uid264_div_uid49_fpArctan2Test_b and regOverRegWithUf_uid264_div_uid49_fpArctan2Test_c;

	--zeroOverReg_uid263_div_uid49_fpArctan2Test(LOGICAL,262)@0
    zeroOverReg_uid263_div_uid49_fpArctan2Test_a <= expXIsZero_uid203_div_uid49_fpArctan2Test_q;
    zeroOverReg_uid263_div_uid49_fpArctan2Test_b <= exc_R_uid230_div_uid49_fpArctan2Test_q;
    zeroOverReg_uid263_div_uid49_fpArctan2Test_q <= zeroOverReg_uid263_div_uid49_fpArctan2Test_a and zeroOverReg_uid263_div_uid49_fpArctan2Test_b;

	--ld_zeroOverReg_uid263_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_a(DELAY,830)@0
    ld_zeroOverReg_uid263_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => zeroOverReg_uid263_div_uid49_fpArctan2Test_q, xout => ld_zeroOverReg_uid263_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRZero_uid267_div_uid49_fpArctan2Test(LOGICAL,266)@17
    excRZero_uid267_div_uid49_fpArctan2Test_a <= ld_zeroOverReg_uid263_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_a_q;
    excRZero_uid267_div_uid49_fpArctan2Test_b <= regOverRegWithUf_uid264_div_uid49_fpArctan2Test_q;
    excRZero_uid267_div_uid49_fpArctan2Test_c <= ld_regOrZeroOverInf_uid266_div_uid49_fpArctan2Test_q_to_excRZero_uid267_div_uid49_fpArctan2Test_c_q;
    excRZero_uid267_div_uid49_fpArctan2Test_q <= excRZero_uid267_div_uid49_fpArctan2Test_a or excRZero_uid267_div_uid49_fpArctan2Test_b or excRZero_uid267_div_uid49_fpArctan2Test_c;

	--concExc_uid276_div_uid49_fpArctan2Test(BITJOIN,275)@17
    concExc_uid276_div_uid49_fpArctan2Test_q <= ld_excRNaN_uid275_div_uid49_fpArctan2Test_q_to_concExc_uid276_div_uid49_fpArctan2Test_c_q & excRInf_uid272_div_uid49_fpArctan2Test_q & excRZero_uid267_div_uid49_fpArctan2Test_q;

	--reg_concExc_uid276_div_uid49_fpArctan2Test_0_to_excREnc_uid277_div_uid49_fpArctan2Test_0(REG,524)@17
    reg_concExc_uid276_div_uid49_fpArctan2Test_0_to_excREnc_uid277_div_uid49_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid276_div_uid49_fpArctan2Test_0_to_excREnc_uid277_div_uid49_fpArctan2Test_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid276_div_uid49_fpArctan2Test_0_to_excREnc_uid277_div_uid49_fpArctan2Test_0_q <= concExc_uid276_div_uid49_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid277_div_uid49_fpArctan2Test(LOOKUP,276)@18
    excREnc_uid277_div_uid49_fpArctan2Test: PROCESS (reg_concExc_uid276_div_uid49_fpArctan2Test_0_to_excREnc_uid277_div_uid49_fpArctan2Test_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid276_div_uid49_fpArctan2Test_0_to_excREnc_uid277_div_uid49_fpArctan2Test_0_q) IS
                WHEN "000" =>  excREnc_uid277_div_uid49_fpArctan2Test_q <= "01";
                WHEN "001" =>  excREnc_uid277_div_uid49_fpArctan2Test_q <= "00";
                WHEN "010" =>  excREnc_uid277_div_uid49_fpArctan2Test_q <= "10";
                WHEN "011" =>  excREnc_uid277_div_uid49_fpArctan2Test_q <= "00";
                WHEN "100" =>  excREnc_uid277_div_uid49_fpArctan2Test_q <= "11";
                WHEN "101" =>  excREnc_uid277_div_uid49_fpArctan2Test_q <= "00";
                WHEN "110" =>  excREnc_uid277_div_uid49_fpArctan2Test_q <= "00";
                WHEN "111" =>  excREnc_uid277_div_uid49_fpArctan2Test_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid277_div_uid49_fpArctan2Test_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid285_div_uid49_fpArctan2Test(MUX,284)@18
    expRPostExc_uid285_div_uid49_fpArctan2Test_s <= excREnc_uid277_div_uid49_fpArctan2Test_q;
    expRPostExc_uid285_div_uid49_fpArctan2Test: PROCESS (expRPostExc_uid285_div_uid49_fpArctan2Test_s, en, cstAllZWE_uid56_fpArctan2Test_q, ld_excRPreExc_uid257_div_uid49_fpArctan2Test_b_to_expRPostExc_uid285_div_uid49_fpArctan2Test_d_q, cstAllOWE_uid6_fpArctan2Test_q, cstAllOWE_uid6_fpArctan2Test_q)
    BEGIN
            CASE expRPostExc_uid285_div_uid49_fpArctan2Test_s IS
                  WHEN "00" => expRPostExc_uid285_div_uid49_fpArctan2Test_q <= cstAllZWE_uid56_fpArctan2Test_q;
                  WHEN "01" => expRPostExc_uid285_div_uid49_fpArctan2Test_q <= ld_excRPreExc_uid257_div_uid49_fpArctan2Test_b_to_expRPostExc_uid285_div_uid49_fpArctan2Test_d_q;
                  WHEN "10" => expRPostExc_uid285_div_uid49_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
                  WHEN "11" => expRPostExc_uid285_div_uid49_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
                  WHEN OTHERS => expRPostExc_uid285_div_uid49_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstNaNWF_uid55_fpArctan2Test(CONSTANT,54)
    cstNaNWF_uid55_fpArctan2Test_q <= "00000000000000000000001";

	--fracRPreExc_uid256_div_uid49_fpArctan2Test(BITSELECT,255)@16
    fracRPreExc_uid256_div_uid49_fpArctan2Test_in <= expFracPostRnd_uid254_div_uid49_fpArctan2Test_q(23 downto 0);
    fracRPreExc_uid256_div_uid49_fpArctan2Test_b <= fracRPreExc_uid256_div_uid49_fpArctan2Test_in(23 downto 1);

	--ld_fracRPreExc_uid256_div_uid49_fpArctan2Test_b_to_fracRPostExc_uid281_div_uid49_fpArctan2Test_d(DELAY,859)@16
    ld_fracRPreExc_uid256_div_uid49_fpArctan2Test_b_to_fracRPostExc_uid281_div_uid49_fpArctan2Test_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => fracRPreExc_uid256_div_uid49_fpArctan2Test_b, xout => ld_fracRPreExc_uid256_div_uid49_fpArctan2Test_b_to_fracRPostExc_uid281_div_uid49_fpArctan2Test_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid281_div_uid49_fpArctan2Test(MUX,280)@18
    fracRPostExc_uid281_div_uid49_fpArctan2Test_s <= excREnc_uid277_div_uid49_fpArctan2Test_q;
    fracRPostExc_uid281_div_uid49_fpArctan2Test: PROCESS (fracRPostExc_uid281_div_uid49_fpArctan2Test_s, en, cstAllZWF_uid7_fpArctan2Test_q, ld_fracRPreExc_uid256_div_uid49_fpArctan2Test_b_to_fracRPostExc_uid281_div_uid49_fpArctan2Test_d_q, cstAllZWF_uid7_fpArctan2Test_q, cstNaNWF_uid55_fpArctan2Test_q)
    BEGIN
            CASE fracRPostExc_uid281_div_uid49_fpArctan2Test_s IS
                  WHEN "00" => fracRPostExc_uid281_div_uid49_fpArctan2Test_q <= cstAllZWF_uid7_fpArctan2Test_q;
                  WHEN "01" => fracRPostExc_uid281_div_uid49_fpArctan2Test_q <= ld_fracRPreExc_uid256_div_uid49_fpArctan2Test_b_to_fracRPostExc_uid281_div_uid49_fpArctan2Test_d_q;
                  WHEN "10" => fracRPostExc_uid281_div_uid49_fpArctan2Test_q <= cstAllZWF_uid7_fpArctan2Test_q;
                  WHEN "11" => fracRPostExc_uid281_div_uid49_fpArctan2Test_q <= cstNaNWF_uid55_fpArctan2Test_q;
                  WHEN OTHERS => fracRPostExc_uid281_div_uid49_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--divR_uid288_div_uid49_fpArctan2Test(BITJOIN,287)@18
    divR_uid288_div_uid49_fpArctan2Test_q <= ld_sRPostExc_uid287_div_uid49_fpArctan2Test_q_to_divR_uid288_div_uid49_fpArctan2Test_c_q & expRPostExc_uid285_div_uid49_fpArctan2Test_q & fracRPostExc_uid281_div_uid49_fpArctan2Test_q;

	--singX_uid52_fpArctan2Test(BITSELECT,51)@18
    singX_uid52_fpArctan2Test_in <= divR_uid288_div_uid49_fpArctan2Test_q;
    singX_uid52_fpArctan2Test_b <= singX_uid52_fpArctan2Test_in(31 downto 31);

	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_inputreg(DELAY,1154)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => singX_uid52_fpArctan2Test_b, xout => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt(COUNTER,1156)
    -- every=1, low=0, high=31, step=1, init=1
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_i <= TO_UNSIGNED(1,5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_i <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_i,5));


	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg(REG,1157)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux(MUX,1158)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_s <= en;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux: PROCESS (ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_s, ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg_q, ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_q)
    BEGIN
            CASE ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_s IS
                  WHEN "0" => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg_q;
                  WHEN "1" => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem(DUALMEM,1155)
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_ia <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_inputreg_q;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_aa <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg_q;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_ab <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_q;
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_iq,
        address_a => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_aa,
        data_a => ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_ia
    );
    ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_reset0 <= areset;
        ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_iq(0 downto 0);

	--piO2_uid83_fpArctan2Test(CONSTANT,82)
    piO2_uid83_fpArctan2Test_q <= "11001001000011111101101011";

	--cstPiO2_uid85_fpArctan2Test(BITSELECT,84)@52
    cstPiO2_uid85_fpArctan2Test_in <= piO2_uid83_fpArctan2Test_q(24 downto 0);
    cstPiO2_uid85_fpArctan2Test_b <= cstPiO2_uid85_fpArctan2Test_in(24 downto 2);

	--fpPiO2C_uid86_fpArctan2Test(BITJOIN,85)@52
    fpPiO2C_uid86_fpArctan2Test_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_q & cstBias_uid57_fpArctan2Test_q & cstPiO2_uid85_fpArctan2Test_b;

	--reg_fpPiO2C_uid86_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_3(REG,580)@52
    reg_fpPiO2C_uid86_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fpPiO2C_uid86_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fpPiO2C_uid86_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_3_q <= fpPiO2C_uid86_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--piO4_uid84_fpArctan2Test(CONSTANT,83)
    piO4_uid84_fpArctan2Test_q <= "110010010000111111011011";

	--cstPiO4_uid88_fpArctan2Test(BITSELECT,87)@52
    cstPiO4_uid88_fpArctan2Test_in <= piO4_uid84_fpArctan2Test_q(22 downto 0);
    cstPiO4_uid88_fpArctan2Test_b <= cstPiO4_uid88_fpArctan2Test_in(22 downto 0);

	--fpPiO4C_uid89_fpArctan2Test(BITJOIN,88)@52
    fpPiO4C_uid89_fpArctan2Test_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_mem_q & cstBiasM1_uid58_fpArctan2Test_q & cstPiO4_uid88_fpArctan2Test_b;

	--reg_fpPiO4C_uid89_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_2(REG,579)@52
    reg_fpPiO4C_uid89_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fpPiO4C_uid89_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_2_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fpPiO4C_uid89_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_2_q <= fpPiO4C_uid89_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor(LOGICAL,1177)
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_b <= ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_sticky_ena_q;
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_q <= not (ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_a or ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_b);

	--ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_sticky_ena(REG,1178)
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_nor_q = "1") THEN
                ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_sticky_ena_q <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd(LOGICAL,1179)
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_a <= ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_sticky_ena_q;
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_b <= en;
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_q <= ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_a and ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_b;

	--fracX_uid51_fpArctan2Test(BITSELECT,50)@18
    fracX_uid51_fpArctan2Test_in <= divR_uid288_div_uid49_fpArctan2Test_q(22 downto 0);
    fracX_uid51_fpArctan2Test_b <= fracX_uid51_fpArctan2Test_in(22 downto 0);

	--reg_fracX_uid51_fpArctan2Test_0_to_fracXIsZero_uid72_fpArctan2Test_1(REG,530)@18
    reg_fracX_uid51_fpArctan2Test_0_to_fracXIsZero_uid72_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid51_fpArctan2Test_0_to_fracXIsZero_uid72_fpArctan2Test_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid51_fpArctan2Test_0_to_fracXIsZero_uid72_fpArctan2Test_1_q <= fracX_uid51_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid72_fpArctan2Test(LOGICAL,71)@19
    fracXIsZero_uid72_fpArctan2Test_a <= reg_fracX_uid51_fpArctan2Test_0_to_fracXIsZero_uid72_fpArctan2Test_1_q;
    fracXIsZero_uid72_fpArctan2Test_b <= cstAllZWF_uid7_fpArctan2Test_q;
    fracXIsZero_uid72_fpArctan2Test_q <= "1" when fracXIsZero_uid72_fpArctan2Test_a = fracXIsZero_uid72_fpArctan2Test_b else "0";

	--expX_uid50_fpArctan2Test(BITSELECT,49)@18
    expX_uid50_fpArctan2Test_in <= divR_uid288_div_uid49_fpArctan2Test_q(30 downto 0);
    expX_uid50_fpArctan2Test_b <= expX_uid50_fpArctan2Test_in(30 downto 23);

	--reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1(REG,525)@18
    reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q <= expX_uid50_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--expXIsMax_uid70_fpArctan2Test(LOGICAL,69)@19
    expXIsMax_uid70_fpArctan2Test_a <= reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q;
    expXIsMax_uid70_fpArctan2Test_b <= cstAllOWE_uid6_fpArctan2Test_q;
    expXIsMax_uid70_fpArctan2Test_q <= "1" when expXIsMax_uid70_fpArctan2Test_a = expXIsMax_uid70_fpArctan2Test_b else "0";

	--exc_I_uid73_fpArctan2Test(LOGICAL,72)@19
    exc_I_uid73_fpArctan2Test_a <= expXIsMax_uid70_fpArctan2Test_q;
    exc_I_uid73_fpArctan2Test_b <= fracXIsZero_uid72_fpArctan2Test_q;
    exc_I_uid73_fpArctan2Test_q <= exc_I_uid73_fpArctan2Test_a and exc_I_uid73_fpArctan2Test_b;

	--ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_inputreg(DELAY,1167)
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid73_fpArctan2Test_q, xout => ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem(DUALMEM,1168)
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_ia <= ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_inputreg_q;
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_aa <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdreg_q;
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_ab <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_replace_rdmux_q;
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_iq,
        address_a => ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_aa,
        data_a => ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_ia
    );
    ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_reset0 <= areset;
        ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_q <= ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_iq(0 downto 0);

	--constOut_uid91_fpArctan2Test(MUX,90)@53
    constOut_uid91_fpArctan2Test_s <= ld_exc_I_uid73_fpArctan2Test_q_to_constOut_uid91_fpArctan2Test_b_replace_mem_q;
    constOut_uid91_fpArctan2Test: PROCESS (constOut_uid91_fpArctan2Test_s, en, reg_fpPiO4C_uid89_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_2_q, reg_fpPiO2C_uid86_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_3_q)
    BEGIN
            CASE constOut_uid91_fpArctan2Test_s IS
                  WHEN "0" => constOut_uid91_fpArctan2Test_q <= reg_fpPiO4C_uid89_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_2_q;
                  WHEN "1" => constOut_uid91_fpArctan2Test_q <= reg_fpPiO2C_uid86_fpArctan2Test_0_to_constOut_uid91_fpArctan2Test_3_q;
                  WHEN OTHERS => constOut_uid91_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracOutCst_uid149_fpArctan2Test(BITSELECT,148)@53
    fracOutCst_uid149_fpArctan2Test_in <= constOut_uid91_fpArctan2Test_q(22 downto 0);
    fracOutCst_uid149_fpArctan2Test_b <= fracOutCst_uid149_fpArctan2Test_in(22 downto 0);

	--reg_fracOutCst_uid149_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_5(REG,584)@53
    reg_fracOutCst_uid149_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracOutCst_uid149_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_5_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracOutCst_uid149_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_5_q <= fracOutCst_uid149_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor(LOGICAL,1214)
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_b <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_sticky_ena_q;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_q <= not (ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_a or ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_b);

	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_sticky_ena(REG,1215)
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_nor_q = "1") THEN
                ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_sticky_ena_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd(LOGICAL,1216)
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_a <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_sticky_ena_q;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_b <= en;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_a and ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_b;

	--cst01pWShift_uid107_fpArctan2Test(CONSTANT,106)
    cst01pWShift_uid107_fpArctan2Test_q <= "0000000000000";

	--InvFracXIsZero_uid310_z_uid95_fpArctan2Test(LOGICAL,309)@19
    InvFracXIsZero_uid310_z_uid95_fpArctan2Test_a <= fracXIsZero_uid72_fpArctan2Test_q;
    InvFracXIsZero_uid310_z_uid95_fpArctan2Test_q <= not InvFracXIsZero_uid310_z_uid95_fpArctan2Test_a;

	--exc_N_uid311_z_uid95_fpArctan2Test(LOGICAL,310)@19
    exc_N_uid311_z_uid95_fpArctan2Test_a <= expXIsMax_uid70_fpArctan2Test_q;
    exc_N_uid311_z_uid95_fpArctan2Test_b <= InvFracXIsZero_uid310_z_uid95_fpArctan2Test_q;
    exc_N_uid311_z_uid95_fpArctan2Test_q <= exc_N_uid311_z_uid95_fpArctan2Test_a and exc_N_uid311_z_uid95_fpArctan2Test_b;

	--InvExc_N_uid312_z_uid95_fpArctan2Test(LOGICAL,311)@19
    InvExc_N_uid312_z_uid95_fpArctan2Test_a <= exc_N_uid311_z_uid95_fpArctan2Test_q;
    InvExc_N_uid312_z_uid95_fpArctan2Test_q <= not InvExc_N_uid312_z_uid95_fpArctan2Test_a;

	--reg_singX_uid52_fpArctan2Test_0_to_signR_uid339_z_uid95_fpArctan2Test_1(REG,545)@18
    reg_singX_uid52_fpArctan2Test_0_to_signR_uid339_z_uid95_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_singX_uid52_fpArctan2Test_0_to_signR_uid339_z_uid95_fpArctan2Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_singX_uid52_fpArctan2Test_0_to_signR_uid339_z_uid95_fpArctan2Test_1_q <= singX_uid52_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--signR_uid339_z_uid95_fpArctan2Test(LOGICAL,338)@19
    signR_uid339_z_uid95_fpArctan2Test_a <= reg_singX_uid52_fpArctan2Test_0_to_signR_uid339_z_uid95_fpArctan2Test_1_q;
    signR_uid339_z_uid95_fpArctan2Test_b <= InvExc_N_uid312_z_uid95_fpArctan2Test_q;
    signR_uid339_z_uid95_fpArctan2Test_q_i <= signR_uid339_z_uid95_fpArctan2Test_a and signR_uid339_z_uid95_fpArctan2Test_b;
    signR_uid339_z_uid95_fpArctan2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => signR_uid339_z_uid95_fpArctan2Test_q, xin => signR_uid339_z_uid95_fpArctan2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_signR_uid339_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_c(DELAY,910)@20
    ld_signR_uid339_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => signR_uid339_z_uid95_fpArctan2Test_q, xout => ld_signR_uid339_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor(LOGICAL,1356)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_b <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_sticky_ena_q;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_q <= not (ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_a or ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_b);

	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_mem_top(CONSTANT,1352)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_mem_top_q <= "0110";

	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp(LOGICAL,1353)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_a <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_mem_top_q;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_q);
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_q <= "1" when ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_a = ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_b else "0";

	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmpReg(REG,1354)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmpReg_q <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_sticky_ena(REG,1357)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_nor_q = "1") THEN
                ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_sticky_ena_q <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd(LOGICAL,1358)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_a <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_sticky_ena_q;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_b <= en;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_q <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_a and ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_b;

	--cst2Bias_uid298_z_uid95_fpArctan2Test(CONSTANT,297)
    cst2Bias_uid298_z_uid95_fpArctan2Test_q <= "11111110";

	--expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test(SUB,326)@19
    expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid298_z_uid95_fpArctan2Test_q);
    expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q);
            expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_a) - UNSIGNED(expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_b));
    expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_q <= expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_o(8 downto 0);


	--expRCompYIsOne_uid328_z_uid95_fpArctan2Test(BITSELECT,327)@19
    expRCompYIsOne_uid328_z_uid95_fpArctan2Test_in <= expRCompYIsOneExt_uid327_z_uid95_fpArctan2Test_q(7 downto 0);
    expRCompYIsOne_uid328_z_uid95_fpArctan2Test_b <= expRCompYIsOne_uid328_z_uid95_fpArctan2Test_in(7 downto 0);

	--cst2BiasM1_uid297_z_uid95_fpArctan2Test(CONSTANT,296)
    cst2BiasM1_uid297_z_uid95_fpArctan2Test_q <= "11111101";

	--expRCompExt_uid324_z_uid95_fpArctan2Test(SUB,323)@19
    expRCompExt_uid324_z_uid95_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid297_z_uid95_fpArctan2Test_q);
    expRCompExt_uid324_z_uid95_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q);
            expRCompExt_uid324_z_uid95_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid324_z_uid95_fpArctan2Test_a) - UNSIGNED(expRCompExt_uid324_z_uid95_fpArctan2Test_b));
    expRCompExt_uid324_z_uid95_fpArctan2Test_q <= expRCompExt_uid324_z_uid95_fpArctan2Test_o(8 downto 0);


	--expRComp_uid325_z_uid95_fpArctan2Test(BITSELECT,324)@19
    expRComp_uid325_z_uid95_fpArctan2Test_in <= expRCompExt_uid324_z_uid95_fpArctan2Test_q(7 downto 0);
    expRComp_uid325_z_uid95_fpArctan2Test_b <= expRComp_uid325_z_uid95_fpArctan2Test_in(7 downto 0);

	--fracXIsZero_uid317_z_uid95_fpArctan2Test(LOGICAL,316)@19
    fracXIsZero_uid317_z_uid95_fpArctan2Test_a <= reg_fracX_uid51_fpArctan2Test_0_to_fracXIsZero_uid72_fpArctan2Test_1_q;
    fracXIsZero_uid317_z_uid95_fpArctan2Test_b <= STD_LOGIC_VECTOR("0000000000000000000000" & GND_q);
    fracXIsZero_uid317_z_uid95_fpArctan2Test_q <= "1" when fracXIsZero_uid317_z_uid95_fpArctan2Test_a = fracXIsZero_uid317_z_uid95_fpArctan2Test_b else "0";

	--expRCalc_uid331_z_uid95_fpArctan2Test(MUX,330)@19
    expRCalc_uid331_z_uid95_fpArctan2Test_s <= fracXIsZero_uid317_z_uid95_fpArctan2Test_q;
    expRCalc_uid331_z_uid95_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid331_z_uid95_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRCalc_uid331_z_uid95_fpArctan2Test_s IS
                      WHEN "0" => expRCalc_uid331_z_uid95_fpArctan2Test_q <= expRComp_uid325_z_uid95_fpArctan2Test_b;
                      WHEN "1" => expRCalc_uid331_z_uid95_fpArctan2Test_q <= expRCompYIsOne_uid328_z_uid95_fpArctan2Test_b;
                      WHEN OTHERS => expRCalc_uid331_z_uid95_fpArctan2Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--expXIsZero_uid68_fpArctan2Test(LOGICAL,67)@19
    expXIsZero_uid68_fpArctan2Test_a <= reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q;
    expXIsZero_uid68_fpArctan2Test_b <= cstAllZWE_uid56_fpArctan2Test_q;
    expXIsZero_uid68_fpArctan2Test_q <= "1" when expXIsZero_uid68_fpArctan2Test_a = expXIsZero_uid68_fpArctan2Test_b else "0";

	--udf_uid326_z_uid95_fpArctan2Test(BITSELECT,325)@19
    udf_uid326_z_uid95_fpArctan2Test_in <= STD_LOGIC_VECTOR((9 downto 9 => expRCompExt_uid324_z_uid95_fpArctan2Test_q(8)) & expRCompExt_uid324_z_uid95_fpArctan2Test_q);
    udf_uid326_z_uid95_fpArctan2Test_b <= udf_uid326_z_uid95_fpArctan2Test_in(9 downto 9);

	--InvExc_I_uid313_z_uid95_fpArctan2Test(LOGICAL,312)@19
    InvExc_I_uid313_z_uid95_fpArctan2Test_a <= exc_I_uid73_fpArctan2Test_q;
    InvExc_I_uid313_z_uid95_fpArctan2Test_q <= not InvExc_I_uid313_z_uid95_fpArctan2Test_a;

	--InvExpXIsZero_uid314_z_uid95_fpArctan2Test(LOGICAL,313)@19
    InvExpXIsZero_uid314_z_uid95_fpArctan2Test_a <= expXIsZero_uid68_fpArctan2Test_q;
    InvExpXIsZero_uid314_z_uid95_fpArctan2Test_q <= not InvExpXIsZero_uid314_z_uid95_fpArctan2Test_a;

	--exc_R_uid315_z_uid95_fpArctan2Test(LOGICAL,314)@19
    exc_R_uid315_z_uid95_fpArctan2Test_a <= InvExpXIsZero_uid314_z_uid95_fpArctan2Test_q;
    exc_R_uid315_z_uid95_fpArctan2Test_b <= InvExc_I_uid313_z_uid95_fpArctan2Test_q;
    exc_R_uid315_z_uid95_fpArctan2Test_c <= InvExc_N_uid312_z_uid95_fpArctan2Test_q;
    exc_R_uid315_z_uid95_fpArctan2Test_q <= exc_R_uid315_z_uid95_fpArctan2Test_a and exc_R_uid315_z_uid95_fpArctan2Test_b and exc_R_uid315_z_uid95_fpArctan2Test_c;

	--xRegAndUdf_uid332_z_uid95_fpArctan2Test(LOGICAL,331)@19
    xRegAndUdf_uid332_z_uid95_fpArctan2Test_a <= exc_R_uid315_z_uid95_fpArctan2Test_q;
    xRegAndUdf_uid332_z_uid95_fpArctan2Test_b <= udf_uid326_z_uid95_fpArctan2Test_b;
    xRegAndUdf_uid332_z_uid95_fpArctan2Test_q <= xRegAndUdf_uid332_z_uid95_fpArctan2Test_a and xRegAndUdf_uid332_z_uid95_fpArctan2Test_b;

	--xIOrXRUdf_uid333_z_uid95_fpArctan2Test(LOGICAL,332)@19
    xIOrXRUdf_uid333_z_uid95_fpArctan2Test_a <= exc_I_uid73_fpArctan2Test_q;
    xIOrXRUdf_uid333_z_uid95_fpArctan2Test_b <= xRegAndUdf_uid332_z_uid95_fpArctan2Test_q;
    xIOrXRUdf_uid333_z_uid95_fpArctan2Test_q <= xIOrXRUdf_uid333_z_uid95_fpArctan2Test_a or xIOrXRUdf_uid333_z_uid95_fpArctan2Test_b;

	--excSelBits_uid334_z_uid95_fpArctan2Test(BITJOIN,333)@19
    excSelBits_uid334_z_uid95_fpArctan2Test_q <= exc_N_uid311_z_uid95_fpArctan2Test_q & expXIsZero_uid68_fpArctan2Test_q & xIOrXRUdf_uid333_z_uid95_fpArctan2Test_q;

	--reg_excSelBits_uid334_z_uid95_fpArctan2Test_0_to_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0(REG,532)@19
    reg_excSelBits_uid334_z_uid95_fpArctan2Test_0_to_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid334_z_uid95_fpArctan2Test_0_to_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid334_z_uid95_fpArctan2Test_0_to_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_q <= excSelBits_uid334_z_uid95_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid335_z_uid95_fpArctan2Test(LOOKUP,334)@20
    outMuxSelEnc_uid335_z_uid95_fpArctan2Test: PROCESS (reg_excSelBits_uid334_z_uid95_fpArctan2Test_0_to_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid334_z_uid95_fpArctan2Test_0_to_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid337_z_uid95_fpArctan2Test(MUX,336)@20
    expRPostExc_uid337_z_uid95_fpArctan2Test_s <= outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q;
    expRPostExc_uid337_z_uid95_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid337_z_uid95_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRPostExc_uid337_z_uid95_fpArctan2Test_s IS
                      WHEN "00" => expRPostExc_uid337_z_uid95_fpArctan2Test_q <= cstAllZWE_uid56_fpArctan2Test_q;
                      WHEN "01" => expRPostExc_uid337_z_uid95_fpArctan2Test_q <= expRCalc_uid331_z_uid95_fpArctan2Test_q;
                      WHEN "10" => expRPostExc_uid337_z_uid95_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
                      WHEN "11" => expRPostExc_uid337_z_uid95_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
                      WHEN OTHERS => expRPostExc_uid337_z_uid95_fpArctan2Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_inputreg(DELAY,1346)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid337_z_uid95_fpArctan2Test_q, xout => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt(COUNTER,1348)
    -- every=1, low=0, high=6, step=1, init=1
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_i = 5 THEN
                      ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_eq = '1') THEN
                        ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_i <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_i <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdreg(REG,1349)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdreg_q <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux(MUX,1350)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux: PROCESS (ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_s, ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdreg_q, ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_q <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_q <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem(DUALMEM,1347)
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_ia <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_inputreg_q;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_aa <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdreg_q;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_ab <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_rdmux_q;
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 8,
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
        clocken1 => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_ia
    );
    ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_reset0 <= areset;
        ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_q <= ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_iq(7 downto 0);

	--oFracX_uid316_uid316_z_uid95_fpArctan2Test(BITJOIN,315)@18
    oFracX_uid316_uid316_z_uid95_fpArctan2Test_q <= VCC_q & fracX_uid51_fpArctan2Test_b;

	--y_uid318_z_uid95_fpArctan2Test(BITSELECT,317)@18
    y_uid318_z_uid95_fpArctan2Test_in <= oFracX_uid316_uid316_z_uid95_fpArctan2Test_q(22 downto 0);
    y_uid318_z_uid95_fpArctan2Test_b <= y_uid318_z_uid95_fpArctan2Test_in(22 downto 0);

	--yAddr_uid320_z_uid95_fpArctan2Test(BITSELECT,319)@18
    yAddr_uid320_z_uid95_fpArctan2Test_in <= y_uid318_z_uid95_fpArctan2Test_b;
    yAddr_uid320_z_uid95_fpArctan2Test_b <= yAddr_uid320_z_uid95_fpArctan2Test_in(22 downto 15);

	--reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC2_uid469_invTabGen_lutmem_0(REG,534)@18
    reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC2_uid469_invTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC2_uid469_invTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC2_uid469_invTabGen_lutmem_0_q <= yAddr_uid320_z_uid95_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid469_invTabGen_lutmem(DUALMEM,509)@19
    memoryC2_uid469_invTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid469_invTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid469_invTabGen_lutmem_ab <= reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC2_uid469_invTabGen_lutmem_0_q;
    memoryC2_uid469_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan2_s5_memoryC2_uid469_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid469_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid469_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid469_invTabGen_lutmem_iq,
        address_a => memoryC2_uid469_invTabGen_lutmem_aa,
        data_a => memoryC2_uid469_invTabGen_lutmem_ia
    );
    memoryC2_uid469_invTabGen_lutmem_reset0 <= areset;
        memoryC2_uid469_invTabGen_lutmem_q <= memoryC2_uid469_invTabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid469_invTabGen_lutmem_0_to_prodXY_uid496_pT1_uid472_invPolyEval_1(REG,536)@21
    reg_memoryC2_uid469_invTabGen_lutmem_0_to_prodXY_uid496_pT1_uid472_invPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid469_invTabGen_lutmem_0_to_prodXY_uid496_pT1_uid472_invPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid469_invTabGen_lutmem_0_to_prodXY_uid496_pT1_uid472_invPolyEval_1_q <= memoryC2_uid469_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a_inputreg(DELAY,1345)
    ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => y_uid318_z_uid95_fpArctan2Test_b, xout => ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a(DELAY,881)@18
    ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a_inputreg_q, xout => ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid321_z_uid95_fpArctan2Test(BITSELECT,320)@21
    yPPolyEval_uid321_z_uid95_fpArctan2Test_in <= ld_y_uid318_z_uid95_fpArctan2Test_b_to_yPPolyEval_uid321_z_uid95_fpArctan2Test_a_q(14 downto 0);
    yPPolyEval_uid321_z_uid95_fpArctan2Test_b <= yPPolyEval_uid321_z_uid95_fpArctan2Test_in(14 downto 0);

	--yT1_uid471_invPolyEval(BITSELECT,470)@21
    yT1_uid471_invPolyEval_in <= yPPolyEval_uid321_z_uid95_fpArctan2Test_b;
    yT1_uid471_invPolyEval_b <= yT1_uid471_invPolyEval_in(14 downto 3);

	--reg_yT1_uid471_invPolyEval_0_to_prodXY_uid496_pT1_uid472_invPolyEval_0(REG,535)@21
    reg_yT1_uid471_invPolyEval_0_to_prodXY_uid496_pT1_uid472_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid471_invPolyEval_0_to_prodXY_uid496_pT1_uid472_invPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid471_invPolyEval_0_to_prodXY_uid496_pT1_uid472_invPolyEval_0_q <= yT1_uid471_invPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid496_pT1_uid472_invPolyEval(MULT,495)@22
    prodXY_uid496_pT1_uid472_invPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid496_pT1_uid472_invPolyEval_a),13)) * SIGNED(prodXY_uid496_pT1_uid472_invPolyEval_b);
    prodXY_uid496_pT1_uid472_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid496_pT1_uid472_invPolyEval_a <= (others => '0');
            prodXY_uid496_pT1_uid472_invPolyEval_b <= (others => '0');
            prodXY_uid496_pT1_uid472_invPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid496_pT1_uid472_invPolyEval_a <= reg_yT1_uid471_invPolyEval_0_to_prodXY_uid496_pT1_uid472_invPolyEval_0_q;
                prodXY_uid496_pT1_uid472_invPolyEval_b <= reg_memoryC2_uid469_invTabGen_lutmem_0_to_prodXY_uid496_pT1_uid472_invPolyEval_1_q;
                prodXY_uid496_pT1_uid472_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid496_pT1_uid472_invPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid496_pT1_uid472_invPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid496_pT1_uid472_invPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid496_pT1_uid472_invPolyEval_q <= prodXY_uid496_pT1_uid472_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid497_pT1_uid472_invPolyEval(BITSELECT,496)@25
    prodXYTruncFR_uid497_pT1_uid472_invPolyEval_in <= prodXY_uid496_pT1_uid472_invPolyEval_q;
    prodXYTruncFR_uid497_pT1_uid472_invPolyEval_b <= prodXYTruncFR_uid497_pT1_uid472_invPolyEval_in(23 downto 11);

	--highBBits_uid474_invPolyEval(BITSELECT,473)@25
    highBBits_uid474_invPolyEval_in <= prodXYTruncFR_uid497_pT1_uid472_invPolyEval_b;
    highBBits_uid474_invPolyEval_b <= highBBits_uid474_invPolyEval_in(12 downto 1);

	--ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_a(DELAY,1091)@18
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => yAddr_uid320_z_uid95_fpArctan2Test_b, xout => ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0(REG,537)@21
    reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_q <= ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid467_invTabGen_lutmem(DUALMEM,508)@22
    memoryC1_uid467_invTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid467_invTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid467_invTabGen_lutmem_ab <= reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC1_uid467_invTabGen_lutmem_0_q;
    memoryC1_uid467_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan2_s5_memoryC1_uid467_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid467_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid467_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid467_invTabGen_lutmem_iq,
        address_a => memoryC1_uid467_invTabGen_lutmem_aa,
        data_a => memoryC1_uid467_invTabGen_lutmem_ia
    );
    memoryC1_uid467_invTabGen_lutmem_reset0 <= areset;
        memoryC1_uid467_invTabGen_lutmem_q <= memoryC1_uid467_invTabGen_lutmem_iq(19 downto 0);

	--reg_memoryC1_uid467_invTabGen_lutmem_0_to_sumAHighB_uid475_invPolyEval_0(REG,538)@24
    reg_memoryC1_uid467_invTabGen_lutmem_0_to_sumAHighB_uid475_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid467_invTabGen_lutmem_0_to_sumAHighB_uid475_invPolyEval_0_q <= "00000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid467_invTabGen_lutmem_0_to_sumAHighB_uid475_invPolyEval_0_q <= memoryC1_uid467_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid475_invPolyEval(ADD,474)@25
    sumAHighB_uid475_invPolyEval_a <= STD_LOGIC_VECTOR((20 downto 20 => reg_memoryC1_uid467_invTabGen_lutmem_0_to_sumAHighB_uid475_invPolyEval_0_q(19)) & reg_memoryC1_uid467_invTabGen_lutmem_0_to_sumAHighB_uid475_invPolyEval_0_q);
    sumAHighB_uid475_invPolyEval_b <= STD_LOGIC_VECTOR((20 downto 12 => highBBits_uid474_invPolyEval_b(11)) & highBBits_uid474_invPolyEval_b);
            sumAHighB_uid475_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid475_invPolyEval_a) + SIGNED(sumAHighB_uid475_invPolyEval_b));
    sumAHighB_uid475_invPolyEval_q <= sumAHighB_uid475_invPolyEval_o(20 downto 0);


	--lowRangeB_uid473_invPolyEval(BITSELECT,472)@25
    lowRangeB_uid473_invPolyEval_in <= prodXYTruncFR_uid497_pT1_uid472_invPolyEval_b(0 downto 0);
    lowRangeB_uid473_invPolyEval_b <= lowRangeB_uid473_invPolyEval_in(0 downto 0);

	--s1_uid473_uid476_invPolyEval(BITJOIN,475)@25
    s1_uid473_uid476_invPolyEval_q <= sumAHighB_uid475_invPolyEval_q & lowRangeB_uid473_invPolyEval_b;

	--reg_s1_uid473_uid476_invPolyEval_0_to_prodXY_uid499_pT2_uid478_invPolyEval_1(REG,540)@25
    reg_s1_uid473_uid476_invPolyEval_0_to_prodXY_uid499_pT2_uid478_invPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid473_uid476_invPolyEval_0_to_prodXY_uid499_pT2_uid478_invPolyEval_1_q <= "0000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid473_uid476_invPolyEval_0_to_prodXY_uid499_pT2_uid478_invPolyEval_1_q <= s1_uid473_uid476_invPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor(LOGICAL,1382)
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_b <= ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_q <= not (ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_a or ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_b);

	--ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_sticky_ena(REG,1383)
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_nor_q = "1") THEN
                ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_sticky_ena_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd(LOGICAL,1384)
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_a <= ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_b <= en;
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_q <= ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_a and ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_b;

	--reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0(REG,539)@21
    reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q <= yPPolyEval_uid321_z_uid95_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_inputreg(DELAY,1374)
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q, xout => ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem(DUALMEM,1375)
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_ia <= ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_inputreg_q;
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_aa <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg_q;
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_ab <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_q;
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_iq,
        address_a => ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_aa,
        data_a => ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_ia
    );
    ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_q <= ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_iq(14 downto 0);

	--prodXY_uid499_pT2_uid478_invPolyEval(MULT,498)@26
    prodXY_uid499_pT2_uid478_invPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid499_pT2_uid478_invPolyEval_a),16)) * SIGNED(prodXY_uid499_pT2_uid478_invPolyEval_b);
    prodXY_uid499_pT2_uid478_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid499_pT2_uid478_invPolyEval_a <= (others => '0');
            prodXY_uid499_pT2_uid478_invPolyEval_b <= (others => '0');
            prodXY_uid499_pT2_uid478_invPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid499_pT2_uid478_invPolyEval_a <= ld_reg_yPPolyEval_uid321_z_uid95_fpArctan2Test_0_to_prodXY_uid499_pT2_uid478_invPolyEval_0_q_to_prodXY_uid499_pT2_uid478_invPolyEval_a_replace_mem_q;
                prodXY_uid499_pT2_uid478_invPolyEval_b <= reg_s1_uid473_uid476_invPolyEval_0_to_prodXY_uid499_pT2_uid478_invPolyEval_1_q;
                prodXY_uid499_pT2_uid478_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid499_pT2_uid478_invPolyEval_pr,37));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid499_pT2_uid478_invPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid499_pT2_uid478_invPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid499_pT2_uid478_invPolyEval_q <= prodXY_uid499_pT2_uid478_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid500_pT2_uid478_invPolyEval(BITSELECT,499)@29
    prodXYTruncFR_uid500_pT2_uid478_invPolyEval_in <= prodXY_uid499_pT2_uid478_invPolyEval_q;
    prodXYTruncFR_uid500_pT2_uid478_invPolyEval_b <= prodXYTruncFR_uid500_pT2_uid478_invPolyEval_in(36 downto 14);

	--highBBits_uid480_invPolyEval(BITSELECT,479)@29
    highBBits_uid480_invPolyEval_in <= prodXYTruncFR_uid500_pT2_uid478_invPolyEval_b;
    highBBits_uid480_invPolyEval_b <= highBBits_uid480_invPolyEval_in(22 downto 2);

	--ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor(LOGICAL,1447)
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_b <= ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_sticky_ena_q;
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_q <= not (ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_a or ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_b);

	--ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_sticky_ena(REG,1448)
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_nor_q = "1") THEN
                ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_sticky_ena_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd(LOGICAL,1449)
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_a <= ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_sticky_ena_q;
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_b <= en;
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_q <= ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_a and ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_b;

	--ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_inputreg(DELAY,1437)
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => yAddr_uid320_z_uid95_fpArctan2Test_b, xout => ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem(DUALMEM,1438)
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_ia <= ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_inputreg_q;
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_aa <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q;
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_ab <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q;
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_ia
    );
    ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_q <= ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0(REG,541)@25
    reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_q <= ld_yAddr_uid320_z_uid95_fpArctan2Test_b_to_reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid465_invTabGen_lutmem(DUALMEM,507)@26
    memoryC0_uid465_invTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid465_invTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid465_invTabGen_lutmem_ab <= reg_yAddr_uid320_z_uid95_fpArctan2Test_0_to_memoryC0_uid465_invTabGen_lutmem_0_q;
    memoryC0_uid465_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan2_s5_memoryC0_uid465_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid465_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid465_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid465_invTabGen_lutmem_iq,
        address_a => memoryC0_uid465_invTabGen_lutmem_aa,
        data_a => memoryC0_uid465_invTabGen_lutmem_ia
    );
    memoryC0_uid465_invTabGen_lutmem_reset0 <= areset;
        memoryC0_uid465_invTabGen_lutmem_q <= memoryC0_uid465_invTabGen_lutmem_iq(28 downto 0);

	--reg_memoryC0_uid465_invTabGen_lutmem_0_to_sumAHighB_uid481_invPolyEval_0(REG,542)@28
    reg_memoryC0_uid465_invTabGen_lutmem_0_to_sumAHighB_uid481_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid465_invTabGen_lutmem_0_to_sumAHighB_uid481_invPolyEval_0_q <= "00000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid465_invTabGen_lutmem_0_to_sumAHighB_uid481_invPolyEval_0_q <= memoryC0_uid465_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid481_invPolyEval(ADD,480)@29
    sumAHighB_uid481_invPolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => reg_memoryC0_uid465_invTabGen_lutmem_0_to_sumAHighB_uid481_invPolyEval_0_q(28)) & reg_memoryC0_uid465_invTabGen_lutmem_0_to_sumAHighB_uid481_invPolyEval_0_q);
    sumAHighB_uid481_invPolyEval_b <= STD_LOGIC_VECTOR((29 downto 21 => highBBits_uid480_invPolyEval_b(20)) & highBBits_uid480_invPolyEval_b);
            sumAHighB_uid481_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid481_invPolyEval_a) + SIGNED(sumAHighB_uid481_invPolyEval_b));
    sumAHighB_uid481_invPolyEval_q <= sumAHighB_uid481_invPolyEval_o(29 downto 0);


	--lowRangeB_uid479_invPolyEval(BITSELECT,478)@29
    lowRangeB_uid479_invPolyEval_in <= prodXYTruncFR_uid500_pT2_uid478_invPolyEval_b(1 downto 0);
    lowRangeB_uid479_invPolyEval_b <= lowRangeB_uid479_invPolyEval_in(1 downto 0);

	--s2_uid479_uid482_invPolyEval(BITJOIN,481)@29
    s2_uid479_uid482_invPolyEval_q <= sumAHighB_uid481_invPolyEval_q & lowRangeB_uid479_invPolyEval_b;

	--fxpInverseRes_uid323_z_uid95_fpArctan2Test(BITSELECT,322)@29
    fxpInverseRes_uid323_z_uid95_fpArctan2Test_in <= s2_uid479_uid482_invPolyEval_q(28 downto 0);
    fxpInverseRes_uid323_z_uid95_fpArctan2Test_b <= fxpInverseRes_uid323_z_uid95_fpArctan2Test_in(28 downto 5);

	--fxpInverseResFrac_uid329_z_uid95_fpArctan2Test(BITSELECT,328)@29
    fxpInverseResFrac_uid329_z_uid95_fpArctan2Test_in <= fxpInverseRes_uid323_z_uid95_fpArctan2Test_b(22 downto 0);
    fxpInverseResFrac_uid329_z_uid95_fpArctan2Test_b <= fxpInverseResFrac_uid329_z_uid95_fpArctan2Test_in(22 downto 0);

	--ld_fracXIsZero_uid317_z_uid95_fpArctan2Test_q_to_fracRCalc_uid330_z_uid95_fpArctan2Test_b(DELAY,889)@19
    ld_fracXIsZero_uid317_z_uid95_fpArctan2Test_q_to_fracRCalc_uid330_z_uid95_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => fracXIsZero_uid317_z_uid95_fpArctan2Test_q, xout => ld_fracXIsZero_uid317_z_uid95_fpArctan2Test_q_to_fracRCalc_uid330_z_uid95_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRCalc_uid330_z_uid95_fpArctan2Test(MUX,329)@29
    fracRCalc_uid330_z_uid95_fpArctan2Test_s <= ld_fracXIsZero_uid317_z_uid95_fpArctan2Test_q_to_fracRCalc_uid330_z_uid95_fpArctan2Test_b_q;
    fracRCalc_uid330_z_uid95_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid330_z_uid95_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracRCalc_uid330_z_uid95_fpArctan2Test_s IS
                      WHEN "0" => fracRCalc_uid330_z_uid95_fpArctan2Test_q <= fxpInverseResFrac_uid329_z_uid95_fpArctan2Test_b;
                      WHEN "1" => fracRCalc_uid330_z_uid95_fpArctan2Test_q <= cstAllZWF_uid7_fpArctan2Test_q;
                      WHEN OTHERS => fracRCalc_uid330_z_uid95_fpArctan2Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1(REG,543)@20
    reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q <= outMuxSelEnc_uid335_z_uid95_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_b(DELAY,902)@21
    ld_reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 9 )
    PORT MAP ( xin => reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q, xout => ld_reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid336_z_uid95_fpArctan2Test(MUX,335)@30
    fracRPostExc_uid336_z_uid95_fpArctan2Test_s <= ld_reg_outMuxSelEnc_uid335_z_uid95_fpArctan2Test_0_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_1_q_to_fracRPostExc_uid336_z_uid95_fpArctan2Test_b_q;
    fracRPostExc_uid336_z_uid95_fpArctan2Test: PROCESS (fracRPostExc_uid336_z_uid95_fpArctan2Test_s, en, cstAllZWF_uid7_fpArctan2Test_q, fracRCalc_uid330_z_uid95_fpArctan2Test_q, cstAllZWF_uid7_fpArctan2Test_q, cstNaNWF_uid55_fpArctan2Test_q)
    BEGIN
            CASE fracRPostExc_uid336_z_uid95_fpArctan2Test_s IS
                  WHEN "00" => fracRPostExc_uid336_z_uid95_fpArctan2Test_q <= cstAllZWF_uid7_fpArctan2Test_q;
                  WHEN "01" => fracRPostExc_uid336_z_uid95_fpArctan2Test_q <= fracRCalc_uid330_z_uid95_fpArctan2Test_q;
                  WHEN "10" => fracRPostExc_uid336_z_uid95_fpArctan2Test_q <= cstAllZWF_uid7_fpArctan2Test_q;
                  WHEN "11" => fracRPostExc_uid336_z_uid95_fpArctan2Test_q <= cstNaNWF_uid55_fpArctan2Test_q;
                  WHEN OTHERS => fracRPostExc_uid336_z_uid95_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid340_z_uid95_fpArctan2Test(BITJOIN,339)@30
    R_uid340_z_uid95_fpArctan2Test_q <= ld_signR_uid339_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_c_q & ld_expRPostExc_uid337_z_uid95_fpArctan2Test_q_to_R_uid340_z_uid95_fpArctan2Test_b_replace_mem_q & fracRPostExc_uid336_z_uid95_fpArctan2Test_q;

	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor(LOGICAL,1190)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_b <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_sticky_ena_q;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_q <= not (ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_a or ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_b);

	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_sticky_ena(REG,1191)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_nor_q = "1") THEN
                ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_sticky_ena_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd(LOGICAL,1192)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_a <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_sticky_ena_q;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_b <= en;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_a and ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_b;

	--reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2(REG,547)@18
    reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q <= divR_uid288_div_uid49_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_inputreg(DELAY,1180)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q, xout => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem(DUALMEM,1181)
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_ia <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_inputreg_q;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_aa <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdreg_q;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_ab <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_rdmux_q;
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 32,
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
        clocken1 => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_iq,
        address_a => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_aa,
        data_a => ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_ia
    );
    ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_reset0 <= areset;
        ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_iq(31 downto 0);

	--path2_uid94_fpArctan2Test(COMPARE,93)@19
    path2_uid94_fpArctan2Test_cin <= GND_q;
    path2_uid94_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q) & '0';
    path2_uid94_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBias_uid57_fpArctan2Test_q) & path2_uid94_fpArctan2Test_cin(0);
            path2_uid94_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(path2_uid94_fpArctan2Test_a) - UNSIGNED(path2_uid94_fpArctan2Test_b));
    path2_uid94_fpArctan2Test_n(0) <= not path2_uid94_fpArctan2Test_o(10);


	--reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1(REG,546)@19
    reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q <= path2_uid94_fpArctan2Test_n;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q_to_u_uid96_fpArctan2Test_b(DELAY,651)@20
    ld_reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q_to_u_uid96_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q, xout => ld_reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q_to_u_uid96_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--u_uid96_fpArctan2Test(MUX,95)@30
    u_uid96_fpArctan2Test_s <= ld_reg_path2_uid94_fpArctan2Test_2_to_u_uid96_fpArctan2Test_1_q_to_u_uid96_fpArctan2Test_b_q;
    u_uid96_fpArctan2Test: PROCESS (u_uid96_fpArctan2Test_s, en, ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_q, R_uid340_z_uid95_fpArctan2Test_q)
    BEGIN
            CASE u_uid96_fpArctan2Test_s IS
                  WHEN "0" => u_uid96_fpArctan2Test_q <= ld_reg_divR_uid288_div_uid49_fpArctan2Test_0_to_u_uid96_fpArctan2Test_2_q_to_u_uid96_fpArctan2Test_c_replace_mem_q;
                  WHEN "1" => u_uid96_fpArctan2Test_q <= R_uid340_z_uid95_fpArctan2Test_q;
                  WHEN OTHERS => u_uid96_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracU_uid98_fpArctan2Test(BITSELECT,97)@30
    fracU_uid98_fpArctan2Test_in <= u_uid96_fpArctan2Test_q(22 downto 0);
    fracU_uid98_fpArctan2Test_b <= fracU_uid98_fpArctan2Test_in(22 downto 0);

	--ld_fracU_uid98_fpArctan2Test_b_to_oFracU_uid99_uid99_fpArctan2Test_a(DELAY,656)@30
    ld_fracU_uid98_fpArctan2Test_b_to_oFracU_uid99_uid99_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracU_uid98_fpArctan2Test_b, xout => ld_fracU_uid98_fpArctan2Test_b_to_oFracU_uid99_uid99_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracU_uid99_uid99_fpArctan2Test(BITJOIN,98)@31
    oFracU_uid99_uid99_fpArctan2Test_q <= VCC_q & ld_fracU_uid98_fpArctan2Test_b_to_oFracU_uid99_uid99_fpArctan2Test_a_q;

	--oFracUExt_uid108_fpArctan2Test(BITJOIN,107)@31
    oFracUExt_uid108_fpArctan2Test_q <= cst01pWShift_uid107_fpArctan2Test_q & oFracU_uid99_uid99_fpArctan2Test_q;

	--X24dto0_uid350_fxpU_uid110_fpArctan2Test(BITSELECT,349)@31
    X24dto0_uid350_fxpU_uid110_fpArctan2Test_in <= oFracUExt_uid108_fpArctan2Test_q(24 downto 0);
    X24dto0_uid350_fxpU_uid110_fpArctan2Test_b <= X24dto0_uid350_fxpU_uid110_fpArctan2Test_in(24 downto 0);

	--leftShiftStage0Idx3Pad12_uid349_fxpU_uid110_fpArctan2Test(CONSTANT,348)
    leftShiftStage0Idx3Pad12_uid349_fxpU_uid110_fpArctan2Test_q <= "000000000000";

	--leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test(BITJOIN,350)@31
    leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_q <= X24dto0_uid350_fxpU_uid110_fpArctan2Test_b & leftShiftStage0Idx3Pad12_uid349_fxpU_uid110_fpArctan2Test_q;

	--reg_leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_5(REG,557)@31
    reg_leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_5_q <= leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--X28dto0_uid347_fxpU_uid110_fpArctan2Test(BITSELECT,346)@31
    X28dto0_uid347_fxpU_uid110_fpArctan2Test_in <= oFracUExt_uid108_fpArctan2Test_q(28 downto 0);
    X28dto0_uid347_fxpU_uid110_fpArctan2Test_b <= X28dto0_uid347_fxpU_uid110_fpArctan2Test_in(28 downto 0);

	--leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test(BITJOIN,347)@31
    leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_q <= X28dto0_uid347_fxpU_uid110_fpArctan2Test_b & cstAllZWE_uid56_fpArctan2Test_q;

	--reg_leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_4(REG,556)@31
    reg_leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_4_q <= leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--X32dto0_uid344_fxpU_uid110_fpArctan2Test(BITSELECT,343)@31
    X32dto0_uid344_fxpU_uid110_fpArctan2Test_in <= oFracUExt_uid108_fpArctan2Test_q(32 downto 0);
    X32dto0_uid344_fxpU_uid110_fpArctan2Test_b <= X32dto0_uid344_fxpU_uid110_fpArctan2Test_in(32 downto 0);

	--leftShiftStage0Idx1Pad4_uid343_fxpU_uid110_fpArctan2Test(CONSTANT,342)
    leftShiftStage0Idx1Pad4_uid343_fxpU_uid110_fpArctan2Test_q <= "0000";

	--leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test(BITJOIN,344)@31
    leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_q <= X32dto0_uid344_fxpU_uid110_fpArctan2Test_b & leftShiftStage0Idx1Pad4_uid343_fxpU_uid110_fpArctan2Test_q;

	--reg_leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_3(REG,555)@31
    reg_leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_3_q <= leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracUExt_uid108_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_2(REG,554)@31
    reg_oFracUExt_uid108_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracUExt_uid108_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracUExt_uid108_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_2_q <= oFracUExt_uid108_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--zS_uid105_fpArctan2Test(CONSTANT,104)
    zS_uid105_fpArctan2Test_q <= "000000000";

	--shiftBias_uid102_fpArctan2Test(CONSTANT,101)
    shiftBias_uid102_fpArctan2Test_q <= "01110010";

	--expU_uid97_fpArctan2Test(BITSELECT,96)@30
    expU_uid97_fpArctan2Test_in <= u_uid96_fpArctan2Test_q(30 downto 0);
    expU_uid97_fpArctan2Test_b <= expU_uid97_fpArctan2Test_in(30 downto 23);

	--reg_expU_uid97_fpArctan2Test_0_to_atanUIsU_uid101_fpArctan2Test_1(REG,548)@30
    reg_expU_uid97_fpArctan2Test_0_to_atanUIsU_uid101_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expU_uid97_fpArctan2Test_0_to_atanUIsU_uid101_fpArctan2Test_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expU_uid97_fpArctan2Test_0_to_atanUIsU_uid101_fpArctan2Test_1_q <= expU_uid97_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--shiftValue_uid103_fpArctan2Test(SUB,102)@31
    shiftValue_uid103_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & reg_expU_uid97_fpArctan2Test_0_to_atanUIsU_uid101_fpArctan2Test_1_q);
    shiftValue_uid103_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid102_fpArctan2Test_q);
            shiftValue_uid103_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid103_fpArctan2Test_a) - UNSIGNED(shiftValue_uid103_fpArctan2Test_b));
    shiftValue_uid103_fpArctan2Test_q <= shiftValue_uid103_fpArctan2Test_o(8 downto 0);


	--ShiftValue8_uid104_fpArctan2Test(BITSELECT,103)@31
    ShiftValue8_uid104_fpArctan2Test_in <= shiftValue_uid103_fpArctan2Test_q;
    ShiftValue8_uid104_fpArctan2Test_b <= ShiftValue8_uid104_fpArctan2Test_in(8 downto 8);

	--shiftValuePostNeg_uid106_fpArctan2Test(MUX,105)@31
    shiftValuePostNeg_uid106_fpArctan2Test_s <= ShiftValue8_uid104_fpArctan2Test_b;
    shiftValuePostNeg_uid106_fpArctan2Test: PROCESS (shiftValuePostNeg_uid106_fpArctan2Test_s, en, shiftValue_uid103_fpArctan2Test_q, zS_uid105_fpArctan2Test_q)
    BEGIN
            CASE shiftValuePostNeg_uid106_fpArctan2Test_s IS
                  WHEN "0" => shiftValuePostNeg_uid106_fpArctan2Test_q <= shiftValue_uid103_fpArctan2Test_q;
                  WHEN "1" => shiftValuePostNeg_uid106_fpArctan2Test_q <= zS_uid105_fpArctan2Test_q;
                  WHEN OTHERS => shiftValuePostNeg_uid106_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fxpShifterBits_uid109_fpArctan2Test(BITSELECT,108)@31
    fxpShifterBits_uid109_fpArctan2Test_in <= shiftValuePostNeg_uid106_fpArctan2Test_q(3 downto 0);
    fxpShifterBits_uid109_fpArctan2Test_b <= fxpShifterBits_uid109_fpArctan2Test_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test(BITSELECT,351)@31
    leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_in <= fxpShifterBits_uid109_fpArctan2Test_b;
    leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_b <= leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_1(REG,553)@31
    reg_leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_1_q <= leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test(MUX,352)@32
    leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_s <= reg_leftShiftStageSel3Dto2_uid352_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_1_q;
    leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test: PROCESS (leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_s, en, reg_oFracUExt_uid108_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_2_q, reg_leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_3_q, reg_leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_4_q, reg_leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_5_q)
    BEGIN
            CASE leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_s IS
                  WHEN "00" => leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q <= reg_oFracUExt_uid108_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_2_q;
                  WHEN "01" => leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q <= reg_leftShiftStage0Idx1_uid345_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_3_q;
                  WHEN "10" => leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q <= reg_leftShiftStage0Idx2_uid348_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_4_q;
                  WHEN "11" => leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q <= reg_leftShiftStage0Idx3_uid351_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_5_q;
                  WHEN OTHERS => leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test(BITSELECT,360)@32
    LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_in <= leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q(33 downto 0);
    LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_b <= LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_in(33 downto 0);

	--ld_LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_b(DELAY,928)@32
    ld_LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_b, xout => ld_LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad3_uid360_fxpU_uid110_fpArctan2Test(CONSTANT,359)
    leftShiftStage1Idx3Pad3_uid360_fxpU_uid110_fpArctan2Test_q <= "000";

	--leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test(BITJOIN,361)@33
    leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_q <= ld_LeftShiftStage033dto0_uid361_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_b_q & leftShiftStage1Idx3Pad3_uid360_fxpU_uid110_fpArctan2Test_q;

	--LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test(BITSELECT,357)@32
    LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_in <= leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q(34 downto 0);
    LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_b <= LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_in(34 downto 0);

	--ld_LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_b(DELAY,926)@32
    ld_LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_b, xout => ld_LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test(BITJOIN,358)@33
    leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_q <= ld_LeftShiftStage034dto0_uid358_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_b_q & z_uid243_div_uid49_fpArctan2Test_q;

	--LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test(BITSELECT,354)@32
    LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_in <= leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q(35 downto 0);
    LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_b <= LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_in(35 downto 0);

	--ld_LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_b(DELAY,924)@32
    ld_LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 36, depth => 1 )
    PORT MAP ( xin => LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_b, xout => ld_LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test(BITJOIN,355)@33
    leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_q <= ld_LeftShiftStage035dto0_uid355_fxpU_uid110_fpArctan2Test_b_to_leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_b_q & GND_q;

	--reg_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_2(REG,559)@32
    reg_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_2_q <= leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test(BITSELECT,362)@31
    leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_in <= fxpShifterBits_uid109_fpArctan2Test_b(1 downto 0);
    leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_b <= leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1(REG,558)@31
    reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q <= leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_b(DELAY,930)@32
    ld_reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q, xout => ld_reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test(MUX,363)@33
    leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_s <= ld_reg_leftShiftStageSel1Dto0_uid363_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_1_q_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_b_q;
    leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test: PROCESS (leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_s, en, reg_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_2_q, leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_q, leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_q, leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_q)
    BEGIN
            CASE leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_s IS
                  WHEN "00" => leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_q <= reg_leftShiftStage0_uid353_fxpU_uid110_fpArctan2Test_0_to_leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_2_q;
                  WHEN "01" => leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_q <= leftShiftStage1Idx1_uid356_fxpU_uid110_fpArctan2Test_q;
                  WHEN "10" => leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_q <= leftShiftStage1Idx2_uid359_fxpU_uid110_fpArctan2Test_q;
                  WHEN "11" => leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_q <= leftShiftStage1Idx3_uid362_fxpU_uid110_fpArctan2Test_q;
                  WHEN OTHERS => leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid111_fpArctan2Test(BITSELECT,110)@33
    y_uid111_fpArctan2Test_in <= leftShiftStage1_uid364_fxpU_uid110_fpArctan2Test_q(35 downto 0);
    y_uid111_fpArctan2Test_b <= y_uid111_fpArctan2Test_in(35 downto 1);

	--yAddr_uid113_fpArctan2Test(BITSELECT,112)@33
    yAddr_uid113_fpArctan2Test_in <= y_uid111_fpArctan2Test_b;
    yAddr_uid113_fpArctan2Test_b <= yAddr_uid113_fpArctan2Test_in(34 downto 27);

	--reg_yAddr_uid113_fpArctan2Test_0_to_memoryC2_uid370_atanXOXTabGen_lutmem_0(REG,560)@33
    reg_yAddr_uid113_fpArctan2Test_0_to_memoryC2_uid370_atanXOXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid113_fpArctan2Test_0_to_memoryC2_uid370_atanXOXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid113_fpArctan2Test_0_to_memoryC2_uid370_atanXOXTabGen_lutmem_0_q <= yAddr_uid113_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid370_atanXOXTabGen_lutmem(DUALMEM,503)@34
    memoryC2_uid370_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid370_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid370_atanXOXTabGen_lutmem_ab <= reg_yAddr_uid113_fpArctan2Test_0_to_memoryC2_uid370_atanXOXTabGen_lutmem_0_q;
    memoryC2_uid370_atanXOXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan2_s5_memoryC2_uid370_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid370_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid370_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid370_atanXOXTabGen_lutmem_iq,
        address_a => memoryC2_uid370_atanXOXTabGen_lutmem_aa,
        data_a => memoryC2_uid370_atanXOXTabGen_lutmem_ia
    );
    memoryC2_uid370_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC2_uid370_atanXOXTabGen_lutmem_q <= memoryC2_uid370_atanXOXTabGen_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid370_atanXOXTabGen_lutmem_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_1(REG,562)@36
    reg_memoryC2_uid370_atanXOXTabGen_lutmem_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid370_atanXOXTabGen_lutmem_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid370_atanXOXTabGen_lutmem_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_1_q <= memoryC2_uid370_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--yPPolyEval_uid114_fpArctan2Test(BITSELECT,113)@33
    yPPolyEval_uid114_fpArctan2Test_in <= y_uid111_fpArctan2Test_b(26 downto 0);
    yPPolyEval_uid114_fpArctan2Test_b <= yPPolyEval_uid114_fpArctan2Test_in(26 downto 9);

	--yT1_uid372_atanXOXPolyEval(BITSELECT,371)@33
    yT1_uid372_atanXOXPolyEval_in <= yPPolyEval_uid114_fpArctan2Test_b;
    yT1_uid372_atanXOXPolyEval_b <= yT1_uid372_atanXOXPolyEval_in(17 downto 5);

	--reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0(REG,561)@33
    reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q <= yT1_uid372_atanXOXPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a_inputreg(DELAY,1359)
    ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q, xout => ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a(DELAY,1037)@34
    ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a_inputreg_q, xout => ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid484_pT1_uid373_atanXOXPolyEval(MULT,483)@37
    prodXY_uid484_pT1_uid373_atanXOXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid484_pT1_uid373_atanXOXPolyEval_a),14)) * SIGNED(prodXY_uid484_pT1_uid373_atanXOXPolyEval_b);
    prodXY_uid484_pT1_uid373_atanXOXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid484_pT1_uid373_atanXOXPolyEval_a <= (others => '0');
            prodXY_uid484_pT1_uid373_atanXOXPolyEval_b <= (others => '0');
            prodXY_uid484_pT1_uid373_atanXOXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid484_pT1_uid373_atanXOXPolyEval_a <= ld_reg_yT1_uid372_atanXOXPolyEval_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_0_q_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_a_q;
                prodXY_uid484_pT1_uid373_atanXOXPolyEval_b <= reg_memoryC2_uid370_atanXOXTabGen_lutmem_0_to_prodXY_uid484_pT1_uid373_atanXOXPolyEval_1_q;
                prodXY_uid484_pT1_uid373_atanXOXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid484_pT1_uid373_atanXOXPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid484_pT1_uid373_atanXOXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid484_pT1_uid373_atanXOXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid484_pT1_uid373_atanXOXPolyEval_q <= prodXY_uid484_pT1_uid373_atanXOXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid485_pT1_uid373_atanXOXPolyEval(BITSELECT,484)@40
    prodXYTruncFR_uid485_pT1_uid373_atanXOXPolyEval_in <= prodXY_uid484_pT1_uid373_atanXOXPolyEval_q;
    prodXYTruncFR_uid485_pT1_uid373_atanXOXPolyEval_b <= prodXYTruncFR_uid485_pT1_uid373_atanXOXPolyEval_in(25 downto 12);

	--highBBits_uid375_atanXOXPolyEval(BITSELECT,374)@40
    highBBits_uid375_atanXOXPolyEval_in <= prodXYTruncFR_uid485_pT1_uid373_atanXOXPolyEval_b;
    highBBits_uid375_atanXOXPolyEval_b <= highBBits_uid375_atanXOXPolyEval_in(13 downto 1);

	--ld_yAddr_uid113_fpArctan2Test_b_to_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_a(DELAY,1117)@33
    ld_yAddr_uid113_fpArctan2Test_b_to_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => yAddr_uid113_fpArctan2Test_b, xout => ld_yAddr_uid113_fpArctan2Test_b_to_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0(REG,563)@36
    reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_q <= ld_yAddr_uid113_fpArctan2Test_b_to_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid368_atanXOXTabGen_lutmem(DUALMEM,502)@37
    memoryC1_uid368_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid368_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid368_atanXOXTabGen_lutmem_ab <= reg_yAddr_uid113_fpArctan2Test_0_to_memoryC1_uid368_atanXOXTabGen_lutmem_0_q;
    memoryC1_uid368_atanXOXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan2_s5_memoryC1_uid368_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid368_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid368_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid368_atanXOXTabGen_lutmem_iq,
        address_a => memoryC1_uid368_atanXOXTabGen_lutmem_aa,
        data_a => memoryC1_uid368_atanXOXTabGen_lutmem_ia
    );
    memoryC1_uid368_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC1_uid368_atanXOXTabGen_lutmem_q <= memoryC1_uid368_atanXOXTabGen_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid368_atanXOXTabGen_lutmem_0_to_sumAHighB_uid376_atanXOXPolyEval_0(REG,564)@39
    reg_memoryC1_uid368_atanXOXTabGen_lutmem_0_to_sumAHighB_uid376_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid368_atanXOXTabGen_lutmem_0_to_sumAHighB_uid376_atanXOXPolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid368_atanXOXTabGen_lutmem_0_to_sumAHighB_uid376_atanXOXPolyEval_0_q <= memoryC1_uid368_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid376_atanXOXPolyEval(ADD,375)@40
    sumAHighB_uid376_atanXOXPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid368_atanXOXTabGen_lutmem_0_to_sumAHighB_uid376_atanXOXPolyEval_0_q(20)) & reg_memoryC1_uid368_atanXOXTabGen_lutmem_0_to_sumAHighB_uid376_atanXOXPolyEval_0_q);
    sumAHighB_uid376_atanXOXPolyEval_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid375_atanXOXPolyEval_b(12)) & highBBits_uid375_atanXOXPolyEval_b);
            sumAHighB_uid376_atanXOXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid376_atanXOXPolyEval_a) + SIGNED(sumAHighB_uid376_atanXOXPolyEval_b));
    sumAHighB_uid376_atanXOXPolyEval_q <= sumAHighB_uid376_atanXOXPolyEval_o(21 downto 0);


	--lowRangeB_uid374_atanXOXPolyEval(BITSELECT,373)@40
    lowRangeB_uid374_atanXOXPolyEval_in <= prodXYTruncFR_uid485_pT1_uid373_atanXOXPolyEval_b(0 downto 0);
    lowRangeB_uid374_atanXOXPolyEval_b <= lowRangeB_uid374_atanXOXPolyEval_in(0 downto 0);

	--s1_uid374_uid377_atanXOXPolyEval(BITJOIN,376)@40
    s1_uid374_uid377_atanXOXPolyEval_q <= sumAHighB_uid376_atanXOXPolyEval_q & lowRangeB_uid374_atanXOXPolyEval_b;

	--reg_s1_uid374_uid377_atanXOXPolyEval_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_1(REG,566)@40
    reg_s1_uid374_uid377_atanXOXPolyEval_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid374_uid377_atanXOXPolyEval_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid374_uid377_atanXOXPolyEval_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_1_q <= s1_uid374_uid377_atanXOXPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor(LOGICAL,1370)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_b <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_q <= not (ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_a or ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_b);

	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_sticky_ena(REG,1371)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_nor_q = "1") THEN
                ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_sticky_ena_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd(LOGICAL,1372)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_a <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_b <= en;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_a and ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_b;

	--reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0(REG,565)@33
    reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q <= yPPolyEval_uid114_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_inputreg(DELAY,1360)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q, xout => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem(DUALMEM,1361)
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_ia <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_inputreg_q;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_aa <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_ab <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q;
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_iq,
        address_a => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_aa,
        data_a => ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_ia
    );
    ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_iq(17 downto 0);

	--prodXY_uid487_pT2_uid379_atanXOXPolyEval(MULT,486)@41
    prodXY_uid487_pT2_uid379_atanXOXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid487_pT2_uid379_atanXOXPolyEval_a),19)) * SIGNED(prodXY_uid487_pT2_uid379_atanXOXPolyEval_b);
    prodXY_uid487_pT2_uid379_atanXOXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid487_pT2_uid379_atanXOXPolyEval_a <= (others => '0');
            prodXY_uid487_pT2_uid379_atanXOXPolyEval_b <= (others => '0');
            prodXY_uid487_pT2_uid379_atanXOXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid487_pT2_uid379_atanXOXPolyEval_a <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_mem_q;
                prodXY_uid487_pT2_uid379_atanXOXPolyEval_b <= reg_s1_uid374_uid377_atanXOXPolyEval_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_1_q;
                prodXY_uid487_pT2_uid379_atanXOXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid487_pT2_uid379_atanXOXPolyEval_pr,41));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid487_pT2_uid379_atanXOXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid487_pT2_uid379_atanXOXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid487_pT2_uid379_atanXOXPolyEval_q <= prodXY_uid487_pT2_uid379_atanXOXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid488_pT2_uid379_atanXOXPolyEval(BITSELECT,487)@44
    prodXYTruncFR_uid488_pT2_uid379_atanXOXPolyEval_in <= prodXY_uid487_pT2_uid379_atanXOXPolyEval_q;
    prodXYTruncFR_uid488_pT2_uid379_atanXOXPolyEval_b <= prodXYTruncFR_uid488_pT2_uid379_atanXOXPolyEval_in(40 downto 17);

	--highBBits_uid381_atanXOXPolyEval(BITSELECT,380)@44
    highBBits_uid381_atanXOXPolyEval_in <= prodXYTruncFR_uid488_pT2_uid379_atanXOXPolyEval_b;
    highBBits_uid381_atanXOXPolyEval_b <= highBBits_uid381_atanXOXPolyEval_in(23 downto 2);

	--ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor(LOGICAL,1395)
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_b <= ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_q <= not (ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_a or ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_b);

	--ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_sticky_ena(REG,1396)
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_sticky_ena_q <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd(LOGICAL,1397)
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_a <= ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_q <= ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_a and ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_b;

	--ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_inputreg(DELAY,1385)
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_yAddr_uid113_fpArctan2Test_0_to_memoryC2_uid370_atanXOXTabGen_lutmem_0_q, xout => ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem(DUALMEM,1386)
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_ia <= ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_inputreg_q;
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_aa <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdreg_q;
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_ab <= ld_reg_yPPolyEval_uid114_fpArctan2Test_0_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_0_q_to_prodXY_uid487_pT2_uid379_atanXOXPolyEval_a_replace_rdmux_q;
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_ia
    );
    ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_q <= ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_iq(7 downto 0);

	--memoryC0_uid366_atanXOXTabGen_lutmem(DUALMEM,501)@41
    memoryC0_uid366_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid366_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid366_atanXOXTabGen_lutmem_ab <= ld_reg_yAddr_uid113_fpArctan2Test_0_to_memoryC0_uid366_atanXOXTabGen_lutmem_0_q_to_memoryC0_uid366_atanXOXTabGen_lutmem_a_replace_mem_q;
    memoryC0_uid366_atanXOXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atan2_s5_memoryC0_uid366_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid366_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid366_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid366_atanXOXTabGen_lutmem_iq,
        address_a => memoryC0_uid366_atanXOXTabGen_lutmem_aa,
        data_a => memoryC0_uid366_atanXOXTabGen_lutmem_ia
    );
    memoryC0_uid366_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC0_uid366_atanXOXTabGen_lutmem_q <= memoryC0_uid366_atanXOXTabGen_lutmem_iq(30 downto 0);

	--reg_memoryC0_uid366_atanXOXTabGen_lutmem_0_to_sumAHighB_uid382_atanXOXPolyEval_0(REG,568)@43
    reg_memoryC0_uid366_atanXOXTabGen_lutmem_0_to_sumAHighB_uid382_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid366_atanXOXTabGen_lutmem_0_to_sumAHighB_uid382_atanXOXPolyEval_0_q <= "0000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid366_atanXOXTabGen_lutmem_0_to_sumAHighB_uid382_atanXOXPolyEval_0_q <= memoryC0_uid366_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid382_atanXOXPolyEval(ADD,381)@44
    sumAHighB_uid382_atanXOXPolyEval_a <= STD_LOGIC_VECTOR((31 downto 31 => reg_memoryC0_uid366_atanXOXTabGen_lutmem_0_to_sumAHighB_uid382_atanXOXPolyEval_0_q(30)) & reg_memoryC0_uid366_atanXOXTabGen_lutmem_0_to_sumAHighB_uid382_atanXOXPolyEval_0_q);
    sumAHighB_uid382_atanXOXPolyEval_b <= STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid381_atanXOXPolyEval_b(21)) & highBBits_uid381_atanXOXPolyEval_b);
            sumAHighB_uid382_atanXOXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid382_atanXOXPolyEval_a) + SIGNED(sumAHighB_uid382_atanXOXPolyEval_b));
    sumAHighB_uid382_atanXOXPolyEval_q <= sumAHighB_uid382_atanXOXPolyEval_o(31 downto 0);


	--lowRangeB_uid380_atanXOXPolyEval(BITSELECT,379)@44
    lowRangeB_uid380_atanXOXPolyEval_in <= prodXYTruncFR_uid488_pT2_uid379_atanXOXPolyEval_b(1 downto 0);
    lowRangeB_uid380_atanXOXPolyEval_b <= lowRangeB_uid380_atanXOXPolyEval_in(1 downto 0);

	--s2_uid380_uid383_atanXOXPolyEval(BITJOIN,382)@44
    s2_uid380_uid383_atanXOXPolyEval_q <= sumAHighB_uid382_atanXOXPolyEval_q & lowRangeB_uid380_atanXOXPolyEval_b;

	--fxpAtanXOXRes_uid116_fpArctan2Test(BITSELECT,115)@44
    fxpAtanXOXRes_uid116_fpArctan2Test_in <= s2_uid380_uid383_atanXOXPolyEval_q(31 downto 0);
    fxpAtanXOXRes_uid116_fpArctan2Test_b <= fxpAtanXOXRes_uid116_fpArctan2Test_in(31 downto 5);

	--reg_fxpAtanXOXRes_uid116_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_1(REG,570)@44
    reg_fxpAtanXOXRes_uid116_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpAtanXOXRes_uid116_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpAtanXOXRes_uid116_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_1_q <= fxpAtanXOXRes_uid116_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor(LOGICAL,1473)
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_b <= ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_sticky_ena_q;
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_q <= not (ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_a or ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_b);

	--ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_sticky_ena(REG,1474)
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_nor_q = "1") THEN
                ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_sticky_ena_q <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd(LOGICAL,1475)
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_a <= ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_sticky_ena_q;
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_b <= en;
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_q <= ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_a and ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_b;

	--ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_inputreg(DELAY,1463)
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => oFracU_uid99_uid99_fpArctan2Test_q, xout => ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem(DUALMEM,1464)
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_ia <= ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_inputreg_q;
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_aa <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdreg_q;
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_ab <= ld_expXmY_uid232_div_uid49_fpArctan2Test_q_to_expR_uid233_div_uid49_fpArctan2Test_a_replace_rdmux_q;
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_iq,
        address_a => ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_aa,
        data_a => ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_ia
    );
    ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_reset0 <= areset;
        ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_q <= ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_iq(23 downto 0);

	--reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0(REG,569)@44
    reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_q <= ld_oFracU_uid99_uid99_fpArctan2Test_q_to_reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--mulXAtanXOXRes_uid117_fpArctan2Test(MULT,116)@45
    mulXAtanXOXRes_uid117_fpArctan2Test_pr <= UNSIGNED(mulXAtanXOXRes_uid117_fpArctan2Test_a) * UNSIGNED(mulXAtanXOXRes_uid117_fpArctan2Test_b);
    mulXAtanXOXRes_uid117_fpArctan2Test_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid117_fpArctan2Test_a <= (others => '0');
            mulXAtanXOXRes_uid117_fpArctan2Test_b <= (others => '0');
            mulXAtanXOXRes_uid117_fpArctan2Test_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulXAtanXOXRes_uid117_fpArctan2Test_a <= reg_oFracU_uid99_uid99_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_0_q;
                mulXAtanXOXRes_uid117_fpArctan2Test_b <= reg_fxpAtanXOXRes_uid116_fpArctan2Test_0_to_mulXAtanXOXRes_uid117_fpArctan2Test_1_q;
                mulXAtanXOXRes_uid117_fpArctan2Test_s1 <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid117_fpArctan2Test_pr);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid117_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid117_fpArctan2Test_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulXAtanXOXRes_uid117_fpArctan2Test_q <= mulXAtanXOXRes_uid117_fpArctan2Test_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBit_uid118_fpArctan2Test(BITSELECT,117)@48
    normBit_uid118_fpArctan2Test_in <= mulXAtanXOXRes_uid117_fpArctan2Test_q(49 downto 0);
    normBit_uid118_fpArctan2Test_b <= normBit_uid118_fpArctan2Test_in(49 downto 49);

	--InvNormBit_uid122_fpArctan2Test(LOGICAL,121)@48
    InvNormBit_uid122_fpArctan2Test_a <= normBit_uid118_fpArctan2Test_b;
    InvNormBit_uid122_fpArctan2Test_q <= not InvNormBit_uid122_fpArctan2Test_a;

	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor(LOGICAL,1203)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_b <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_sticky_ena_q;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_q <= not (ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_a or ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_b);

	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_mem_top(CONSTANT,1199)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_mem_top_q <= "01111";

	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp(LOGICAL,1200)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_a <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_mem_top_q;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_q);
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_q <= "1" when ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_a = ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_b else "0";

	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmpReg(REG,1201)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmpReg_q <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_sticky_ena(REG,1204)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_nor_q = "1") THEN
                ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_sticky_ena_q <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd(LOGICAL,1205)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_a <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_sticky_ena_q;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_b <= en;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_q <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_a and ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_b;

	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_inputreg(DELAY,1193)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expU_uid97_fpArctan2Test_b, xout => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt(COUNTER,1195)
    -- every=1, low=0, high=15, step=1, init=1
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_i <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_i,4));


	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdreg(REG,1196)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdreg_q <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux(MUX,1197)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_s <= en;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux: PROCESS (ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_s, ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdreg_q, ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_q <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdreg_q;
                  WHEN "1" => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_q <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem(DUALMEM,1194)
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_ia <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_inputreg_q;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_aa <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdreg_q;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_ab <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_rdmux_q;
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_iq,
        address_a => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_aa,
        data_a => ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_ia
    );
    ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_reset0 <= areset;
        ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_q <= ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_iq(7 downto 0);

	--expRPath3Ext_uid123_fpArctan2Test(SUB,122)@48
    expRPath3Ext_uid123_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & ld_expU_uid97_fpArctan2Test_b_to_expRPath3Ext_uid123_fpArctan2Test_a_replace_mem_q);
    expRPath3Ext_uid123_fpArctan2Test_b <= STD_LOGIC_VECTOR("00000000" & InvNormBit_uid122_fpArctan2Test_q);
            expRPath3Ext_uid123_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expRPath3Ext_uid123_fpArctan2Test_a) - UNSIGNED(expRPath3Ext_uid123_fpArctan2Test_b));
    expRPath3Ext_uid123_fpArctan2Test_q <= expRPath3Ext_uid123_fpArctan2Test_o(8 downto 0);


	--expRPath3PreRnd_uid124_fpArctan2Test(BITSELECT,123)@48
    expRPath3PreRnd_uid124_fpArctan2Test_in <= expRPath3Ext_uid123_fpArctan2Test_q(7 downto 0);
    expRPath3PreRnd_uid124_fpArctan2Test_b <= expRPath3PreRnd_uid124_fpArctan2Test_in(7 downto 0);

	--fracRPath3High_uid119_fpArctan2Test(BITSELECT,118)@48
    fracRPath3High_uid119_fpArctan2Test_in <= mulXAtanXOXRes_uid117_fpArctan2Test_q(48 downto 0);
    fracRPath3High_uid119_fpArctan2Test_b <= fracRPath3High_uid119_fpArctan2Test_in(48 downto 25);

	--fracRPath3Low_uid120_fpArctan2Test(BITSELECT,119)@48
    fracRPath3Low_uid120_fpArctan2Test_in <= mulXAtanXOXRes_uid117_fpArctan2Test_q(47 downto 0);
    fracRPath3Low_uid120_fpArctan2Test_b <= fracRPath3Low_uid120_fpArctan2Test_in(47 downto 24);

	--fracRPath3Pre_uid121_fpArctan2Test(MUX,120)@48
    fracRPath3Pre_uid121_fpArctan2Test_s <= normBit_uid118_fpArctan2Test_b;
    fracRPath3Pre_uid121_fpArctan2Test: PROCESS (fracRPath3Pre_uid121_fpArctan2Test_s, en, fracRPath3Low_uid120_fpArctan2Test_b, fracRPath3High_uid119_fpArctan2Test_b)
    BEGIN
            CASE fracRPath3Pre_uid121_fpArctan2Test_s IS
                  WHEN "0" => fracRPath3Pre_uid121_fpArctan2Test_q <= fracRPath3Low_uid120_fpArctan2Test_b;
                  WHEN "1" => fracRPath3Pre_uid121_fpArctan2Test_q <= fracRPath3High_uid119_fpArctan2Test_b;
                  WHEN OTHERS => fracRPath3Pre_uid121_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRPath3PreRnd_uid125_uid125_fpArctan2Test(BITJOIN,124)@48
    expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_q <= expRPath3PreRnd_uid124_fpArctan2Test_b & fracRPath3Pre_uid121_fpArctan2Test_q;

	--reg_expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_0_to_fracRPath3PostRnd_uid126_fpArctan2Test_0(REG,578)@48
    reg_expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_0_to_fracRPath3PostRnd_uid126_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_0_to_fracRPath3PostRnd_uid126_fpArctan2Test_0_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_0_to_fracRPath3PostRnd_uid126_fpArctan2Test_0_q <= expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--fracRPath3PostRnd_uid126_fpArctan2Test(ADD,125)@49
    fracRPath3PostRnd_uid126_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & reg_expFracRPath3PreRnd_uid125_uid125_fpArctan2Test_0_to_fracRPath3PostRnd_uid126_fpArctan2Test_0_q);
    fracRPath3PostRnd_uid126_fpArctan2Test_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
            fracRPath3PostRnd_uid126_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPath3PostRnd_uid126_fpArctan2Test_a) + UNSIGNED(fracRPath3PostRnd_uid126_fpArctan2Test_b));
    fracRPath3PostRnd_uid126_fpArctan2Test_q <= fracRPath3PostRnd_uid126_fpArctan2Test_o(32 downto 0);


	--fracRPath3_uid127_fpArctan2Test(BITSELECT,126)@49
    fracRPath3_uid127_fpArctan2Test_in <= fracRPath3PostRnd_uid126_fpArctan2Test_q(23 downto 0);
    fracRPath3_uid127_fpArctan2Test_b <= fracRPath3_uid127_fpArctan2Test_in(23 downto 1);

	--reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4(REG,583)@49
    reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q <= fracRPath3_uid127_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_inputreg(DELAY,1206)
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q, xout => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem(DUALMEM,1207)
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_ia <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_inputreg_q;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_aa <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdreg_q;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_ab <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_rdmux_q;
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_iq,
        address_a => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_aa,
        data_a => ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_ia
    );
    ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_reset0 <= areset;
        ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_iq(22 downto 0);

	--RightShiftStage124dto1_uid408_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,407)@51
    RightShiftStage124dto1_uid408_fxpOp2Path2_uid135_fpArctan2Test_in <= rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q;
    RightShiftStage124dto1_uid408_fxpOp2Path2_uid135_fpArctan2Test_b <= RightShiftStage124dto1_uid408_fxpOp2Path2_uid135_fpArctan2Test_in(24 downto 1);

	--rightShiftStage2Idx1_uid410_fxpOp2Path2_uid135_fpArctan2Test(BITJOIN,409)@51
    rightShiftStage2Idx1_uid410_fxpOp2Path2_uid135_fpArctan2Test_q <= GND_q & RightShiftStage124dto1_uid408_fxpOp2Path2_uid135_fpArctan2Test_b;

	--X24dto24_uid392_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,391)@50
    X24dto24_uid392_fxpOp2Path2_uid135_fpArctan2Test_in <= oFracRPath2_uid133_uid133_fpArctan2Test_q;
    X24dto24_uid392_fxpOp2Path2_uid135_fpArctan2Test_b <= X24dto24_uid392_fxpOp2Path2_uid135_fpArctan2Test_in(24 downto 24);

	--rightShiftStage0Idx3_uid394_fxpOp2Path2_uid135_fpArctan2Test(BITJOIN,393)@50
    rightShiftStage0Idx3_uid394_fxpOp2Path2_uid135_fpArctan2Test_q <= padConst_uid161_fpArctan2Test_q & X24dto24_uid392_fxpOp2Path2_uid135_fpArctan2Test_b;

	--X24dto16_uid389_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,388)@50
    X24dto16_uid389_fxpOp2Path2_uid135_fpArctan2Test_in <= oFracRPath2_uid133_uid133_fpArctan2Test_q;
    X24dto16_uid389_fxpOp2Path2_uid135_fpArctan2Test_b <= X24dto16_uid389_fxpOp2Path2_uid135_fpArctan2Test_in(24 downto 16);

	--rightShiftStage0Idx2_uid391_fxpOp2Path2_uid135_fpArctan2Test(BITJOIN,390)@50
    rightShiftStage0Idx2_uid391_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage0Idx2Pad16_uid390_fxpOp2Path2_uid135_fpArctan2Test_q & X24dto16_uid389_fxpOp2Path2_uid135_fpArctan2Test_b;

	--X24dto8_uid386_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,385)@50
    X24dto8_uid386_fxpOp2Path2_uid135_fpArctan2Test_in <= oFracRPath2_uid133_uid133_fpArctan2Test_q;
    X24dto8_uid386_fxpOp2Path2_uid135_fpArctan2Test_b <= X24dto8_uid386_fxpOp2Path2_uid135_fpArctan2Test_in(24 downto 8);

	--rightShiftStage0Idx1_uid388_fxpOp2Path2_uid135_fpArctan2Test(BITJOIN,387)@50
    rightShiftStage0Idx1_uid388_fxpOp2Path2_uid135_fpArctan2Test_q <= cstAllZWE_uid56_fpArctan2Test_q & X24dto8_uid386_fxpOp2Path2_uid135_fpArctan2Test_b;

	--ld_fracRPath3Pre_uid121_fpArctan2Test_q_to_oFracRPath2_uid133_uid133_fpArctan2Test_a(DELAY,690)@48
    ld_fracRPath3Pre_uid121_fpArctan2Test_q_to_oFracRPath2_uid133_uid133_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => fracRPath3Pre_uid121_fpArctan2Test_q, xout => ld_fracRPath3Pre_uid121_fpArctan2Test_q_to_oFracRPath2_uid133_uid133_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracRPath2_uid133_uid133_fpArctan2Test(BITJOIN,132)@50
    oFracRPath2_uid133_uid133_fpArctan2Test_q <= VCC_q & ld_fracRPath3Pre_uid121_fpArctan2Test_q_to_oFracRPath2_uid133_uid133_fpArctan2Test_a_q;

	--cstWFP2_uid62_fpArctan2Test(CONSTANT,61)
    cstWFP2_uid62_fpArctan2Test_q <= "00011001";

	--reg_expRPath3PreRnd_uid124_fpArctan2Test_0_to_shiftValPath2PreSub_uid129_fpArctan2Test_1(REG,571)@48
    reg_expRPath3PreRnd_uid124_fpArctan2Test_0_to_shiftValPath2PreSub_uid129_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath3PreRnd_uid124_fpArctan2Test_0_to_shiftValPath2PreSub_uid129_fpArctan2Test_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath3PreRnd_uid124_fpArctan2Test_0_to_shiftValPath2PreSub_uid129_fpArctan2Test_1_q <= expRPath3PreRnd_uid124_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--shiftValPath2PreSub_uid129_fpArctan2Test(SUB,128)@49
    shiftValPath2PreSub_uid129_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & cstBias_uid57_fpArctan2Test_q);
    shiftValPath2PreSub_uid129_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & reg_expRPath3PreRnd_uid124_fpArctan2Test_0_to_shiftValPath2PreSub_uid129_fpArctan2Test_1_q);
            shiftValPath2PreSub_uid129_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValPath2PreSub_uid129_fpArctan2Test_a) - UNSIGNED(shiftValPath2PreSub_uid129_fpArctan2Test_b));
    shiftValPath2PreSub_uid129_fpArctan2Test_q <= shiftValPath2PreSub_uid129_fpArctan2Test_o(8 downto 0);


	--shiftValPath2PreSubR_uid131_fpArctan2Test(BITSELECT,130)@49
    shiftValPath2PreSubR_uid131_fpArctan2Test_in <= shiftValPath2PreSub_uid129_fpArctan2Test_q(7 downto 0);
    shiftValPath2PreSubR_uid131_fpArctan2Test_b <= shiftValPath2PreSubR_uid131_fpArctan2Test_in(7 downto 0);

	--cstBiasMWF_uid59_fpArctan2Test(CONSTANT,58)
    cstBiasMWF_uid59_fpArctan2Test_q <= "01101000";

	--shiftOut_uid130_fpArctan2Test(COMPARE,129)@31
    shiftOut_uid130_fpArctan2Test_cin <= GND_q;
    shiftOut_uid130_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & reg_expU_uid97_fpArctan2Test_0_to_atanUIsU_uid101_fpArctan2Test_1_q) & '0';
    shiftOut_uid130_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid59_fpArctan2Test_q) & shiftOut_uid130_fpArctan2Test_cin(0);
            shiftOut_uid130_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftOut_uid130_fpArctan2Test_a) - UNSIGNED(shiftOut_uid130_fpArctan2Test_b));
    shiftOut_uid130_fpArctan2Test_c(0) <= shiftOut_uid130_fpArctan2Test_o(10);


	--ld_shiftOut_uid130_fpArctan2Test_c_to_sValPostSOut_uid132_fpArctan2Test_b(DELAY,688)@31
    ld_shiftOut_uid130_fpArctan2Test_c_to_sValPostSOut_uid132_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => shiftOut_uid130_fpArctan2Test_c, xout => ld_shiftOut_uid130_fpArctan2Test_c_to_sValPostSOut_uid132_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--sValPostSOut_uid132_fpArctan2Test(MUX,131)@49
    sValPostSOut_uid132_fpArctan2Test_s <= ld_shiftOut_uid130_fpArctan2Test_c_to_sValPostSOut_uid132_fpArctan2Test_b_q;
    sValPostSOut_uid132_fpArctan2Test: PROCESS (sValPostSOut_uid132_fpArctan2Test_s, en, shiftValPath2PreSubR_uid131_fpArctan2Test_b, cstWFP2_uid62_fpArctan2Test_q)
    BEGIN
            CASE sValPostSOut_uid132_fpArctan2Test_s IS
                  WHEN "0" => sValPostSOut_uid132_fpArctan2Test_q <= shiftValPath2PreSubR_uid131_fpArctan2Test_b;
                  WHEN "1" => sValPostSOut_uid132_fpArctan2Test_q <= cstWFP2_uid62_fpArctan2Test_q;
                  WHEN OTHERS => sValPostSOut_uid132_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sValPostSOutR_uid134_fpArctan2Test(BITSELECT,133)@49
    sValPostSOutR_uid134_fpArctan2Test_in <= sValPostSOut_uid132_fpArctan2Test_q(4 downto 0);
    sValPostSOutR_uid134_fpArctan2Test_b <= sValPostSOutR_uid134_fpArctan2Test_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,394)@49
    rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_in <= sValPostSOutR_uid134_fpArctan2Test_b;
    rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_b <= rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_1(REG,572)@49
    reg_rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_1_q <= rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test(MUX,395)@50
    rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_s <= reg_rightShiftStageSel4Dto3_uid395_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_1_q;
    rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test: PROCESS (rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_s, en, oFracRPath2_uid133_uid133_fpArctan2Test_q, rightShiftStage0Idx1_uid388_fxpOp2Path2_uid135_fpArctan2Test_q, rightShiftStage0Idx2_uid391_fxpOp2Path2_uid135_fpArctan2Test_q, rightShiftStage0Idx3_uid394_fxpOp2Path2_uid135_fpArctan2Test_q)
    BEGIN
            CASE rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_s IS
                  WHEN "00" => rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q <= oFracRPath2_uid133_uid133_fpArctan2Test_q;
                  WHEN "01" => rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage0Idx1_uid388_fxpOp2Path2_uid135_fpArctan2Test_q;
                  WHEN "10" => rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage0Idx2_uid391_fxpOp2Path2_uid135_fpArctan2Test_q;
                  WHEN "11" => rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage0Idx3_uid394_fxpOp2Path2_uid135_fpArctan2Test_q;
                  WHEN OTHERS => rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,402)@50
    RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_in <= rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q;
    RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_b <= RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_in(24 downto 6);

	--ld_RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_a(DELAY,965)@50
    ld_RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_b, xout => ld_RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test(BITJOIN,404)@51
    rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage1Idx3Pad6_uid404_fxpOp2Path2_uid135_fpArctan2Test_q & ld_RightShiftStage024dto6_uid403_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_a_q;

	--RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,399)@50
    RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_in <= rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q;
    RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_b <= RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_in(24 downto 4);

	--ld_RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_a(DELAY,963)@50
    ld_RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_b, xout => ld_RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test(BITJOIN,401)@51
    rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_q <= leftShiftStage0Idx1Pad4_uid343_fxpU_uid110_fpArctan2Test_q & ld_RightShiftStage024dto4_uid400_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_a_q;

	--RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,396)@50
    RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_in <= rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q;
    RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_b <= RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_in(24 downto 2);

	--ld_RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_a(DELAY,961)@50
    ld_RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_b, xout => ld_RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test(BITJOIN,398)@51
    rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_q <= z_uid243_div_uid49_fpArctan2Test_q & ld_RightShiftStage024dto2_uid397_fxpOp2Path2_uid135_fpArctan2Test_b_to_rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_a_q;

	--reg_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_2(REG,574)@50
    reg_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_2_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_2_q <= rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,405)@49
    rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_in <= sValPostSOutR_uid134_fpArctan2Test_b(2 downto 0);
    rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_b <= rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_in(2 downto 1);

	--ld_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_a(DELAY,1127)@49
    ld_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_b, xout => ld_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1(REG,573)@50
    reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_q <= ld_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test(MUX,406)@51
    rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_s <= reg_rightShiftStageSel2Dto1_uid406_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_1_q;
    rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test: PROCESS (rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_s, en, reg_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_2_q, rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_q, rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_q, rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_q)
    BEGIN
            CASE rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_s IS
                  WHEN "00" => rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q <= reg_rightShiftStage0_uid396_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_2_q;
                  WHEN "01" => rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage1Idx1_uid399_fxpOp2Path2_uid135_fpArctan2Test_q;
                  WHEN "10" => rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage1Idx2_uid402_fxpOp2Path2_uid135_fpArctan2Test_q;
                  WHEN "11" => rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage1Idx3_uid405_fxpOp2Path2_uid135_fpArctan2Test_q;
                  WHEN OTHERS => rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test(BITSELECT,410)@49
    rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_in <= sValPostSOutR_uid134_fpArctan2Test_b(0 downto 0);
    rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_b <= rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_in(0 downto 0);

	--ld_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_a(DELAY,1129)@49
    ld_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_b, xout => ld_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1(REG,575)@50
    reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_q <= ld_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_b_to_reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test(MUX,411)@51
    rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_s <= reg_rightShiftStageSel0Dto0_uid411_fxpOp2Path2_uid135_fpArctan2Test_0_to_rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_1_q;
    rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test: PROCESS (rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_s, en, rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q, rightShiftStage2Idx1_uid410_fxpOp2Path2_uid135_fpArctan2Test_q)
    BEGIN
            CASE rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_s IS
                  WHEN "0" => rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage1_uid407_fxpOp2Path2_uid135_fpArctan2Test_q;
                  WHEN "1" => rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_q <= rightShiftStage2Idx1_uid410_fxpOp2Path2_uid135_fpArctan2Test_q;
                  WHEN OTHERS => rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pad_fxpOp2Path2_uid135_uid136_fpArctan2Test(BITJOIN,135)@51
    pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_q <= rightShiftStage2_uid412_fxpOp2Path2_uid135_fpArctan2Test_q & GND_q;

	--reg_pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_0_to_path2Diff_uid136_fpArctan2Test_1(REG,576)@51
    reg_pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_0_to_path2Diff_uid136_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_0_to_path2Diff_uid136_fpArctan2Test_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_0_to_path2Diff_uid136_fpArctan2Test_1_q <= pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--path2Diff_uid136_fpArctan2Test(SUB,136)@52
    path2Diff_uid136_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & piO2_uid83_fpArctan2Test_q);
    path2Diff_uid136_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & reg_pad_fxpOp2Path2_uid135_uid136_fpArctan2Test_0_to_path2Diff_uid136_fpArctan2Test_1_q);
            path2Diff_uid136_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid136_fpArctan2Test_a) - UNSIGNED(path2Diff_uid136_fpArctan2Test_b));
    path2Diff_uid136_fpArctan2Test_q <= path2Diff_uid136_fpArctan2Test_o(26 downto 0);


	--normBitPath2Diff_uid138_fpArctan2Test(BITSELECT,137)@52
    normBitPath2Diff_uid138_fpArctan2Test_in <= path2Diff_uid136_fpArctan2Test_q(25 downto 0);
    normBitPath2Diff_uid138_fpArctan2Test_b <= normBitPath2Diff_uid138_fpArctan2Test_in(25 downto 25);

	--expRPath2_uid142_fpArctan2Test(MUX,141)@52
    expRPath2_uid142_fpArctan2Test_s <= normBitPath2Diff_uid138_fpArctan2Test_b;
    expRPath2_uid142_fpArctan2Test: PROCESS (expRPath2_uid142_fpArctan2Test_s, en, cstBiasM1_uid58_fpArctan2Test_q, cstBias_uid57_fpArctan2Test_q)
    BEGIN
            CASE expRPath2_uid142_fpArctan2Test_s IS
                  WHEN "0" => expRPath2_uid142_fpArctan2Test_q <= cstBiasM1_uid58_fpArctan2Test_q;
                  WHEN "1" => expRPath2_uid142_fpArctan2Test_q <= cstBias_uid57_fpArctan2Test_q;
                  WHEN OTHERS => expRPath2_uid142_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--path2DiffHigh_uid139_fpArctan2Test(BITSELECT,138)@52
    path2DiffHigh_uid139_fpArctan2Test_in <= path2Diff_uid136_fpArctan2Test_q(24 downto 0);
    path2DiffHigh_uid139_fpArctan2Test_b <= path2DiffHigh_uid139_fpArctan2Test_in(24 downto 1);

	--path2DiffLow_uid140_fpArctan2Test(BITSELECT,139)@52
    path2DiffLow_uid140_fpArctan2Test_in <= path2Diff_uid136_fpArctan2Test_q(23 downto 0);
    path2DiffLow_uid140_fpArctan2Test_b <= path2DiffLow_uid140_fpArctan2Test_in(23 downto 0);

	--fracRPath2_uid141_fpArctan2Test(MUX,140)@52
    fracRPath2_uid141_fpArctan2Test_s <= normBitPath2Diff_uid138_fpArctan2Test_b;
    fracRPath2_uid141_fpArctan2Test: PROCESS (fracRPath2_uid141_fpArctan2Test_s, en, path2DiffLow_uid140_fpArctan2Test_b, path2DiffHigh_uid139_fpArctan2Test_b)
    BEGIN
            CASE fracRPath2_uid141_fpArctan2Test_s IS
                  WHEN "0" => fracRPath2_uid141_fpArctan2Test_q <= path2DiffLow_uid140_fpArctan2Test_b;
                  WHEN "1" => fracRPath2_uid141_fpArctan2Test_q <= path2DiffHigh_uid139_fpArctan2Test_b;
                  WHEN OTHERS => fracRPath2_uid141_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracConc_uid143_uid143_fpArctan2Test(BITJOIN,142)@52
    expFracConc_uid143_uid143_fpArctan2Test_q <= expRPath2_uid142_fpArctan2Test_q & fracRPath2_uid141_fpArctan2Test_q;

	--reg_expFracConc_uid143_uid143_fpArctan2Test_0_to_expFracRPath2PostRnd_uid144_fpArctan2Test_0(REG,577)@52
    reg_expFracConc_uid143_uid143_fpArctan2Test_0_to_expFracRPath2PostRnd_uid144_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid143_uid143_fpArctan2Test_0_to_expFracRPath2PostRnd_uid144_fpArctan2Test_0_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid143_uid143_fpArctan2Test_0_to_expFracRPath2PostRnd_uid144_fpArctan2Test_0_q <= expFracConc_uid143_uid143_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPath2PostRnd_uid144_fpArctan2Test(ADD,143)@53
    expFracRPath2PostRnd_uid144_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid143_uid143_fpArctan2Test_0_to_expFracRPath2PostRnd_uid144_fpArctan2Test_0_q);
    expFracRPath2PostRnd_uid144_fpArctan2Test_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
            expFracRPath2PostRnd_uid144_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid144_fpArctan2Test_a) + UNSIGNED(expFracRPath2PostRnd_uid144_fpArctan2Test_b));
    expFracRPath2PostRnd_uid144_fpArctan2Test_q <= expFracRPath2PostRnd_uid144_fpArctan2Test_o(32 downto 0);


	--fracRPath2_uid145_fpArctan2Test(BITSELECT,144)@53
    fracRPath2_uid145_fpArctan2Test_in <= expFracRPath2PostRnd_uid144_fpArctan2Test_q(23 downto 0);
    fracRPath2_uid145_fpArctan2Test_b <= fracRPath2_uid145_fpArctan2Test_in(23 downto 1);

	--reg_fracRPath2_uid145_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_3(REG,582)@53
    reg_fracRPath2_uid145_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPath2_uid145_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPath2_uid145_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_3_q <= fracRPath2_uid145_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor(LOGICAL,1486)
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_b <= ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_sticky_ena_q;
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_q <= not (ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_a or ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_b);

	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_mem_top(CONSTANT,1223)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_mem_top_q <= "0100000";

	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp(LOGICAL,1224)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_a <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_mem_top_q;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_q);
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_q <= "1" when ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_a = ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_b else "0";

	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmpReg(REG,1225)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmpReg_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_sticky_ena(REG,1487)
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_nor_q = "1") THEN
                ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_sticky_ena_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd(LOGICAL,1488)
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_a <= ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_sticky_ena_q;
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_b <= en;
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_q <= ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_a and ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_b;

	--ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_inputreg(DELAY,1476)
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid51_fpArctan2Test_b, xout => ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt(COUNTER,1219)
    -- every=1, low=0, high=32, step=1, init=1
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_i = 31 THEN
                      ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_eq = '1') THEN
                        ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_i <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_i - 32;
                    ELSE
                        ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_i <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_i,6));


	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg(REG,1220)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux(MUX,1221)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_s <= en;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux: PROCESS (ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_s, ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg_q, ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_s IS
                  WHEN "0" => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg_q;
                  WHEN "1" => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem(DUALMEM,1477)
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_ia <= ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_inputreg_q;
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_aa <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg_q;
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_ab <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_q;
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_iq,
        address_a => ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_aa,
        data_a => ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_ia
    );
    ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_reset0 <= areset;
        ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_q <= ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_iq(22 downto 0);

	--reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2(REG,581)@53
    reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_q <= ld_fracX_uid51_fpArctan2Test_b_to_reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor(LOGICAL,1460)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_b <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_sticky_ena_q;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_q <= not (ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_a or ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_b);

	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_mem_top(CONSTANT,1456)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_mem_top_q <= "010010";

	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp(LOGICAL,1457)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_a <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_mem_top_q;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_q);
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_q <= "1" when ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_a = ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_b else "0";

	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmpReg(REG,1458)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmpReg_q <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_sticky_ena(REG,1461)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_nor_q = "1") THEN
                ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_sticky_ena_q <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd(LOGICAL,1462)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_a <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_sticky_ena_q;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_b <= en;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_q <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_a and ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_b;

	--xyInInf_uid92_fpArctan2Test(LOGICAL,91)@0
    xyInInf_uid92_fpArctan2Test_a <= exc_I_uid15_fpArctan2Test_q;
    xyInInf_uid92_fpArctan2Test_b <= exc_I_uid31_fpArctan2Test_q;
    xyInInf_uid92_fpArctan2Test_q <= xyInInf_uid92_fpArctan2Test_a and xyInInf_uid92_fpArctan2Test_b;

	--ld_xyInInf_uid92_fpArctan2Test_q_to_arctanIsConst_uid93_fpArctan2Test_c(DELAY,649)@0
    ld_xyInInf_uid92_fpArctan2Test_q_to_arctanIsConst_uid93_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => xyInInf_uid92_fpArctan2Test_q, xout => ld_xyInInf_uid92_fpArctan2Test_q_to_arctanIsConst_uid93_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--expXIsBias_uid81_fpArctan2Test(LOGICAL,80)@19
    expXIsBias_uid81_fpArctan2Test_a <= reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q;
    expXIsBias_uid81_fpArctan2Test_b <= cstBias_uid57_fpArctan2Test_q;
    expXIsBias_uid81_fpArctan2Test_q <= "1" when expXIsBias_uid81_fpArctan2Test_a = expXIsBias_uid81_fpArctan2Test_b else "0";

	--inIsOne_uid82_fpArctan2Test(LOGICAL,81)@19
    inIsOne_uid82_fpArctan2Test_a <= fracXIsZero_uid72_fpArctan2Test_q;
    inIsOne_uid82_fpArctan2Test_b <= expXIsBias_uid81_fpArctan2Test_q;
    inIsOne_uid82_fpArctan2Test_q <= inIsOne_uid82_fpArctan2Test_a and inIsOne_uid82_fpArctan2Test_b;

	--arctanIsConst_uid93_fpArctan2Test(LOGICAL,92)@19
    arctanIsConst_uid93_fpArctan2Test_a <= exc_I_uid73_fpArctan2Test_q;
    arctanIsConst_uid93_fpArctan2Test_b <= inIsOne_uid82_fpArctan2Test_q;
    arctanIsConst_uid93_fpArctan2Test_c <= ld_xyInInf_uid92_fpArctan2Test_q_to_arctanIsConst_uid93_fpArctan2Test_c_q;
    arctanIsConst_uid93_fpArctan2Test_q_i <= arctanIsConst_uid93_fpArctan2Test_a or arctanIsConst_uid93_fpArctan2Test_b or arctanIsConst_uid93_fpArctan2Test_c;
    arctanIsConst_uid93_fpArctan2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => arctanIsConst_uid93_fpArctan2Test_q, xin => arctanIsConst_uid93_fpArctan2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_arctanIsConst_uid93_fpArctan2Test_q_to_pathSelBits_uid147_fpArctan2Test_c(DELAY,708)@20
    ld_arctanIsConst_uid93_fpArctan2Test_q_to_pathSelBits_uid147_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => arctanIsConst_uid93_fpArctan2Test_q, xout => ld_arctanIsConst_uid93_fpArctan2Test_q_to_pathSelBits_uid147_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--biasMwShift_uid100_fpArctan2Test(CONSTANT,99)
    biasMwShift_uid100_fpArctan2Test_q <= "01110011";

	--atanUIsU_uid101_fpArctan2Test(COMPARE,100)@31
    atanUIsU_uid101_fpArctan2Test_cin <= GND_q;
    atanUIsU_uid101_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid100_fpArctan2Test_q) & '0';
    atanUIsU_uid101_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & reg_expU_uid97_fpArctan2Test_0_to_atanUIsU_uid101_fpArctan2Test_1_q) & atanUIsU_uid101_fpArctan2Test_cin(0);
            atanUIsU_uid101_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(atanUIsU_uid101_fpArctan2Test_a) - UNSIGNED(atanUIsU_uid101_fpArctan2Test_b));
    atanUIsU_uid101_fpArctan2Test_n(0) <= not atanUIsU_uid101_fpArctan2Test_o(10);


	--ld_path2_uid94_fpArctan2Test_n_to_pathSelBits_uid147_fpArctan2Test_a(DELAY,706)@19
    ld_path2_uid94_fpArctan2Test_n_to_pathSelBits_uid147_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => path2_uid94_fpArctan2Test_n, xout => ld_path2_uid94_fpArctan2Test_n_to_pathSelBits_uid147_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--pathSelBits_uid147_fpArctan2Test(BITJOIN,146)@31
    pathSelBits_uid147_fpArctan2Test_q <= ld_arctanIsConst_uid93_fpArctan2Test_q_to_pathSelBits_uid147_fpArctan2Test_c_q & atanUIsU_uid101_fpArctan2Test_n & ld_path2_uid94_fpArctan2Test_n_to_pathSelBits_uid147_fpArctan2Test_a_q;

	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_inputreg(DELAY,1450)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => pathSelBits_uid147_fpArctan2Test_q, xout => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt(COUNTER,1452)
    -- every=1, low=0, high=18, step=1, init=1
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_i = 17 THEN
                      ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_eq = '1') THEN
                        ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_i <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_i - 18;
                    ELSE
                        ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_i <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_i,5));


	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdreg(REG,1453)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdreg_q <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux(MUX,1454)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_s <= en;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux: PROCESS (ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_s, ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdreg_q, ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_q <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdreg_q;
                  WHEN "1" => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_q <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem(DUALMEM,1451)
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_ia <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_inputreg_q;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_aa <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdreg_q;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_ab <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_rdmux_q;
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_iq,
        address_a => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_aa,
        data_a => ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_ia
    );
    ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_reset0 <= areset;
        ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_q <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_iq(2 downto 0);

	--reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0(REG,550)@52
    reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_q <= ld_pathSelBits_uid147_fpArctan2Test_q_to_reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--fracOutMuxSelEnc_uid148_fpArctan2Test(LOOKUP,147)@53
    fracOutMuxSelEnc_uid148_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "10";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_pathSelBits_uid147_fpArctan2Test_0_to_fracOutMuxSelEnc_uid148_fpArctan2Test_0_q) IS
                WHEN "000" =>  fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "10";
                WHEN "001" =>  fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "01";
                WHEN "010" =>  fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "00";
                WHEN "011" =>  fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "01";
                WHEN "100" =>  fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "11";
                WHEN "101" =>  fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "11";
                WHEN "110" =>  fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "11";
                WHEN "111" =>  fracOutMuxSelEnc_uid148_fpArctan2Test_q <= "11";
                WHEN OTHERS =>
                    fracOutMuxSelEnc_uid148_fpArctan2Test_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--fracRCalc_uid150_fpArctan2Test(MUX,149)@54
    fracRCalc_uid150_fpArctan2Test_s <= fracOutMuxSelEnc_uid148_fpArctan2Test_q;
    fracRCalc_uid150_fpArctan2Test: PROCESS (fracRCalc_uid150_fpArctan2Test_s, en, reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_q, reg_fracRPath2_uid145_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_3_q, ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_q, reg_fracOutCst_uid149_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_5_q)
    BEGIN
            CASE fracRCalc_uid150_fpArctan2Test_s IS
                  WHEN "00" => fracRCalc_uid150_fpArctan2Test_q <= reg_fracX_uid51_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_2_q;
                  WHEN "01" => fracRCalc_uid150_fpArctan2Test_q <= reg_fracRPath2_uid145_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_3_q;
                  WHEN "10" => fracRCalc_uid150_fpArctan2Test_q <= ld_reg_fracRPath3_uid127_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_4_q_to_fracRCalc_uid150_fpArctan2Test_e_replace_mem_q;
                  WHEN "11" => fracRCalc_uid150_fpArctan2Test_q <= reg_fracOutCst_uid149_fpArctan2Test_0_to_fracRCalc_uid150_fpArctan2Test_5_q;
                  WHEN OTHERS => fracRCalc_uid150_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracRCalc_uid150_fpArctan2Test_q_to_oFracRCalc_uid160_uid160_fpArctan2Test_a(DELAY,730)@54
    ld_fracRCalc_uid150_fpArctan2Test_q_to_oFracRCalc_uid160_uid160_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => fracRCalc_uid150_fpArctan2Test_q, xout => ld_fracRCalc_uid150_fpArctan2Test_q_to_oFracRCalc_uid160_uid160_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracRCalc_uid160_uid160_fpArctan2Test(BITJOIN,159)@56
    oFracRCalc_uid160_uid160_fpArctan2Test_q <= VCC_q & ld_fracRCalc_uid150_fpArctan2Test_q_to_oFracRCalc_uid160_uid160_fpArctan2Test_a_q;

	--rightPaddedIn_uid162_fpArctan2Test(BITJOIN,161)@56
    rightPaddedIn_uid162_fpArctan2Test_q <= oFracRCalc_uid160_uid160_fpArctan2Test_q & padConst_uid161_fpArctan2Test_q;

	--cstWFP1_uid61_fpArctan2Test(CONSTANT,60)
    cstWFP1_uid61_fpArctan2Test_q <= "00011000";

	--expOutCst_uid151_fpArctan2Test(BITSELECT,150)@53
    expOutCst_uid151_fpArctan2Test_in <= constOut_uid91_fpArctan2Test_q(30 downto 0);
    expOutCst_uid151_fpArctan2Test_b <= expOutCst_uid151_fpArctan2Test_in(30 downto 23);

	--reg_expOutCst_uid151_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_5(REG,588)@53
    reg_expOutCst_uid151_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expOutCst_uid151_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_5_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expOutCst_uid151_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_5_q <= expOutCst_uid151_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--expRPath3_uid128_fpArctan2Test(BITSELECT,127)@49
    expRPath3_uid128_fpArctan2Test_in <= fracRPath3PostRnd_uid126_fpArctan2Test_q(31 downto 0);
    expRPath3_uid128_fpArctan2Test_b <= expRPath3_uid128_fpArctan2Test_in(31 downto 24);

	--ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a_inputreg(DELAY,1489)
    ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPath3_uid128_fpArctan2Test_b, xout => ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a(DELAY,1141)@49
    ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a_inputreg_q, xout => ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4(REG,587)@53
    reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_q <= ld_expRPath3_uid128_fpArctan2Test_b_to_reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--expRPath2_uid146_fpArctan2Test(BITSELECT,145)@53
    expRPath2_uid146_fpArctan2Test_in <= expFracRPath2PostRnd_uid144_fpArctan2Test_q(31 downto 0);
    expRPath2_uid146_fpArctan2Test_b <= expRPath2_uid146_fpArctan2Test_in(31 downto 24);

	--reg_expRPath2_uid146_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_3(REG,586)@53
    reg_expRPath2_uid146_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath2_uid146_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath2_uid146_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_3_q <= expRPath2_uid146_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor(LOGICAL,1227)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_b <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_sticky_ena_q;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_q <= not (ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_a or ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_b);

	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_sticky_ena(REG,1228)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_nor_q = "1") THEN
                ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_sticky_ena_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd(LOGICAL,1229)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_a <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_sticky_ena_q;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_b <= en;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_a and ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_b;

	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_inputreg(DELAY,1217)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_expX_uid50_fpArctan2Test_0_to_expXIsZero_uid68_fpArctan2Test_1_q, xout => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem(DUALMEM,1218)
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_ia <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_inputreg_q;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_aa <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdreg_q;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_ab <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_rdmux_q;
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_iq,
        address_a => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_aa,
        data_a => ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_ia
    );
    ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_reset0 <= areset;
        ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_iq(7 downto 0);

	--expRCalc_uid152_fpArctan2Test(MUX,151)@54
    expRCalc_uid152_fpArctan2Test_s <= fracOutMuxSelEnc_uid148_fpArctan2Test_q;
    expRCalc_uid152_fpArctan2Test: PROCESS (expRCalc_uid152_fpArctan2Test_s, en, ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_q, reg_expRPath2_uid146_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_3_q, reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_q, reg_expOutCst_uid151_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_5_q)
    BEGIN
            CASE expRCalc_uid152_fpArctan2Test_s IS
                  WHEN "00" => expRCalc_uid152_fpArctan2Test_q <= ld_reg_expX_uid50_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_2_q_to_expRCalc_uid152_fpArctan2Test_c_replace_mem_q;
                  WHEN "01" => expRCalc_uid152_fpArctan2Test_q <= reg_expRPath2_uid146_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_3_q;
                  WHEN "10" => expRCalc_uid152_fpArctan2Test_q <= reg_expRPath3_uid128_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_4_q;
                  WHEN "11" => expRCalc_uid152_fpArctan2Test_q <= reg_expOutCst_uid151_fpArctan2Test_0_to_expRCalc_uid152_fpArctan2Test_5_q;
                  WHEN OTHERS => expRCalc_uid152_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--reg_expRCalc_uid152_fpArctan2Test_0_to_sOutAlignRes_uid155_fpArctan2Test_0(REG,589)@54
    reg_expRCalc_uid152_fpArctan2Test_0_to_sOutAlignRes_uid155_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRCalc_uid152_fpArctan2Test_0_to_sOutAlignRes_uid155_fpArctan2Test_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRCalc_uid152_fpArctan2Test_0_to_sOutAlignRes_uid155_fpArctan2Test_0_q <= expRCalc_uid152_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--sValAlignRes_uid154_fpArctan2Test(SUB,153)@55
    sValAlignRes_uid154_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & cstBias_uid57_fpArctan2Test_q);
    sValAlignRes_uid154_fpArctan2Test_b <= STD_LOGIC_VECTOR("0" & reg_expRCalc_uid152_fpArctan2Test_0_to_sOutAlignRes_uid155_fpArctan2Test_0_q);
            sValAlignRes_uid154_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(sValAlignRes_uid154_fpArctan2Test_a) - UNSIGNED(sValAlignRes_uid154_fpArctan2Test_b));
    sValAlignRes_uid154_fpArctan2Test_q <= sValAlignRes_uid154_fpArctan2Test_o(8 downto 0);


	--sValAlignResRange_uid157_fpArctan2Test(BITSELECT,156)@55
    sValAlignResRange_uid157_fpArctan2Test_in <= sValAlignRes_uid154_fpArctan2Test_q(7 downto 0);
    sValAlignResRange_uid157_fpArctan2Test_b <= sValAlignResRange_uid157_fpArctan2Test_in(7 downto 0);

	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor(LOGICAL,1240)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_b <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_sticky_ena_q;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_q <= not (ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_a or ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_b);

	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_mem_top(CONSTANT,1236)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_mem_top_q <= "0110100";

	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp(LOGICAL,1237)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_a <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_mem_top_q;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_q);
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_q <= "1" when ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_a = ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_b else "0";

	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmpReg(REG,1238)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmpReg_q <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_sticky_ena(REG,1241)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_nor_q = "1") THEN
                ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_sticky_ena_q <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd(LOGICAL,1242)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_a <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_sticky_ena_q;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_b <= en;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_q <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_a and ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_b;

	--zwEwF_uid40_fpArctan2Test(CONSTANT,39)
    zwEwF_uid40_fpArctan2Test_q <= "0000000000000000000000000000000";

	--join_uid43_fpArctan2Test(BITJOIN,42)@0
    join_uid43_fpArctan2Test_q <= exp_uid27_fpArctan2Test_b & frac_uid29_fpArctan2Test_b;

	--yInZero_uid44_fpArctan2Test(LOGICAL,43)@0
    yInZero_uid44_fpArctan2Test_a <= join_uid43_fpArctan2Test_q;
    yInZero_uid44_fpArctan2Test_b <= zwEwF_uid40_fpArctan2Test_q;
    yInZero_uid44_fpArctan2Test_q <= "1" when yInZero_uid44_fpArctan2Test_a = yInZero_uid44_fpArctan2Test_b else "0";

	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_inputreg(DELAY,1230)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => yInZero_uid44_fpArctan2Test_q, xout => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt(COUNTER,1232)
    -- every=1, low=0, high=52, step=1, init=1
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_i = 51 THEN
                      ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_eq = '1') THEN
                        ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_i <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_i - 52;
                    ELSE
                        ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_i <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_i,6));


	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdreg(REG,1233)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdreg_q <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux(MUX,1234)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_s <= en;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux: PROCESS (ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_s, ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdreg_q, ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_q)
    BEGIN
            CASE ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_s IS
                  WHEN "0" => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_q <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdreg_q;
                  WHEN "1" => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_q <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem(DUALMEM,1231)
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_ia <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_inputreg_q;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_aa <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdreg_q;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_ab <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_rdmux_q;
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 53,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 53,
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
        clocken1 => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_iq,
        address_a => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_aa,
        data_a => ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_ia
    );
    ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_reset0 <= areset;
        ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_q <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_iq(0 downto 0);

	--sOutAlignRes_uid155_fpArctan2Test(COMPARE,154)@55
    sOutAlignRes_uid155_fpArctan2Test_cin <= GND_q;
    sOutAlignRes_uid155_fpArctan2Test_a <= STD_LOGIC_VECTOR("00" & reg_expRCalc_uid152_fpArctan2Test_0_to_sOutAlignRes_uid155_fpArctan2Test_0_q) & '0';
    sOutAlignRes_uid155_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid59_fpArctan2Test_q) & sOutAlignRes_uid155_fpArctan2Test_cin(0);
            sOutAlignRes_uid155_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(sOutAlignRes_uid155_fpArctan2Test_a) - UNSIGNED(sOutAlignRes_uid155_fpArctan2Test_b));
    sOutAlignRes_uid155_fpArctan2Test_c(0) <= sOutAlignRes_uid155_fpArctan2Test_o(10);


	--yInZOrsOutAlignRes_uid156_fpArctan2Test(LOGICAL,155)@55
    yInZOrsOutAlignRes_uid156_fpArctan2Test_a <= sOutAlignRes_uid155_fpArctan2Test_c;
    yInZOrsOutAlignRes_uid156_fpArctan2Test_b <= ld_yInZero_uid44_fpArctan2Test_q_to_yInZOrsOutAlignRes_uid156_fpArctan2Test_b_replace_mem_q;
    yInZOrsOutAlignRes_uid156_fpArctan2Test_q <= yInZOrsOutAlignRes_uid156_fpArctan2Test_a or yInZOrsOutAlignRes_uid156_fpArctan2Test_b;

	--sValPostSAlignOut_uid158_fpArctan2Test(MUX,157)@55
    sValPostSAlignOut_uid158_fpArctan2Test_s <= yInZOrsOutAlignRes_uid156_fpArctan2Test_q;
    sValPostSAlignOut_uid158_fpArctan2Test: PROCESS (sValPostSAlignOut_uid158_fpArctan2Test_s, en, sValAlignResRange_uid157_fpArctan2Test_b, cstWFP1_uid61_fpArctan2Test_q)
    BEGIN
            CASE sValPostSAlignOut_uid158_fpArctan2Test_s IS
                  WHEN "0" => sValPostSAlignOut_uid158_fpArctan2Test_q <= sValAlignResRange_uid157_fpArctan2Test_b;
                  WHEN "1" => sValPostSAlignOut_uid158_fpArctan2Test_q <= cstWFP1_uid61_fpArctan2Test_q;
                  WHEN OTHERS => sValPostSAlignOut_uid158_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sValPostSOutRange_uid159_fpArctan2Test(BITSELECT,158)@55
    sValPostSOutRange_uid159_fpArctan2Test_in <= sValPostSAlignOut_uid158_fpArctan2Test_q(4 downto 0);
    sValPostSOutRange_uid159_fpArctan2Test_b <= sValPostSOutRange_uid159_fpArctan2Test_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,423)@55
    rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_in <= sValPostSOutRange_uid159_fpArctan2Test_b;
    rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_b <= rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_1(REG,591)@55
    reg_rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_1_q <= rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test(MUX,424)@56
    rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_s <= reg_rightShiftStageSel4Dto3_uid424_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_1_q;
    rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test: PROCESS (rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_s, en, rightPaddedIn_uid162_fpArctan2Test_q, rightShiftStage0Idx1_uid417_fxpAlignedRes_uid161_fpArctan2Test_q, rightShiftStage0Idx2_uid420_fxpAlignedRes_uid161_fpArctan2Test_q, rightShiftStage0Idx3_uid423_fxpAlignedRes_uid161_fpArctan2Test_q)
    BEGIN
            CASE rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_s IS
                  WHEN "00" => rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q <= rightPaddedIn_uid162_fpArctan2Test_q;
                  WHEN "01" => rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage0Idx1_uid417_fxpAlignedRes_uid161_fpArctan2Test_q;
                  WHEN "10" => rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage0Idx2_uid420_fxpAlignedRes_uid161_fpArctan2Test_q;
                  WHEN "11" => rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage0Idx3_uid423_fxpAlignedRes_uid161_fpArctan2Test_q;
                  WHEN OTHERS => rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,431)@56
    RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_in <= rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q;
    RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_b <= RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_in(47 downto 6);

	--ld_RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_a(DELAY,995)@56
    ld_RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 42, depth => 1 )
    PORT MAP ( xin => RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_b, xout => ld_RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test(BITJOIN,433)@57
    rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage1Idx3Pad6_uid404_fxpOp2Path2_uid135_fpArctan2Test_q & ld_RightShiftStage047dto6_uid432_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_a_q;

	--RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,428)@56
    RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_in <= rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q;
    RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_b <= RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_in(47 downto 4);

	--ld_RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_a(DELAY,993)@56
    ld_RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 44, depth => 1 )
    PORT MAP ( xin => RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_b, xout => ld_RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test(BITJOIN,430)@57
    rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_q <= leftShiftStage0Idx1Pad4_uid343_fxpU_uid110_fpArctan2Test_q & ld_RightShiftStage047dto4_uid429_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_a_q;

	--RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,425)@56
    RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_in <= rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q;
    RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_b <= RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_in(47 downto 2);

	--ld_RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_a(DELAY,991)@56
    ld_RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 46, depth => 1 )
    PORT MAP ( xin => RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_b, xout => ld_RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test(BITJOIN,427)@57
    rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_q <= z_uid243_div_uid49_fpArctan2Test_q & ld_RightShiftStage047dto2_uid426_fxpAlignedRes_uid161_fpArctan2Test_b_to_rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_a_q;

	--reg_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_2(REG,593)@56
    reg_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_2_q <= "000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_2_q <= rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,434)@55
    rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_in <= sValPostSOutRange_uid159_fpArctan2Test_b(2 downto 0);
    rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_b <= rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_in(2 downto 1);

	--ld_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_a(DELAY,1146)@55
    ld_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_b, xout => ld_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1(REG,592)@56
    reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_q <= ld_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_b_to_reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test(MUX,435)@57
    rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_s <= reg_rightShiftStageSel2Dto1_uid435_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_1_q;
    rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test: PROCESS (rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_s, en, reg_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_2_q, rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_q, rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_q, rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_q)
    BEGIN
            CASE rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_s IS
                  WHEN "00" => rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_q <= reg_rightShiftStage0_uid425_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_2_q;
                  WHEN "01" => rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage1Idx1_uid428_fxpAlignedRes_uid161_fpArctan2Test_q;
                  WHEN "10" => rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage1Idx2_uid431_fxpAlignedRes_uid161_fpArctan2Test_q;
                  WHEN "11" => rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage1Idx3_uid434_fxpAlignedRes_uid161_fpArctan2Test_q;
                  WHEN OTHERS => rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test(BITSELECT,439)@55
    rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_in <= sValPostSOutRange_uid159_fpArctan2Test_b(0 downto 0);
    rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_b <= rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1(REG,594)@55
    reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q <= rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_b(DELAY,1005)@56
    ld_reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q, xout => ld_reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test(MUX,440)@57
    rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_s <= ld_reg_rightShiftStageSel0Dto0_uid440_fxpAlignedRes_uid161_fpArctan2Test_0_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_1_q_to_rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_b_q;
    rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_s IS
                      WHEN "0" => rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage1_uid436_fxpAlignedRes_uid161_fpArctan2Test_q;
                      WHEN "1" => rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_q <= rightShiftStage2Idx1_uid439_fxpAlignedRes_uid161_fpArctan2Test_q;
                      WHEN OTHERS => rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--cstPi_uid153_fpArctan2Test(CONSTANT,152)
    cstPi_uid153_fpArctan2Test_q <= "11001001000011111101101010100010001000010110100";

	--pad_cstPi_uid153_uid164_fpArctan2Test(BITJOIN,163)@57
    pad_cstPi_uid153_uid164_fpArctan2Test_q <= cstPi_uid153_fpArctan2Test_q & STD_LOGIC_VECTOR((1 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_cstPi_uid153_uid164_fpArctan2Test_0_to_subRes_uid164_fpArctan2Test_0(REG,595)@57
    reg_pad_cstPi_uid153_uid164_fpArctan2Test_0_to_subRes_uid164_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_cstPi_uid153_uid164_fpArctan2Test_0_to_subRes_uid164_fpArctan2Test_0_q <= "0000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_cstPi_uid153_uid164_fpArctan2Test_0_to_subRes_uid164_fpArctan2Test_0_q <= pad_cstPi_uid153_uid164_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--subRes_uid164_fpArctan2Test(SUB,164)@58
    subRes_uid164_fpArctan2Test_a <= STD_LOGIC_VECTOR("0" & reg_pad_cstPi_uid153_uid164_fpArctan2Test_0_to_subRes_uid164_fpArctan2Test_0_q);
    subRes_uid164_fpArctan2Test_b <= STD_LOGIC_VECTOR("00" & rightShiftStage2_uid441_fxpAlignedRes_uid161_fpArctan2Test_q);
            subRes_uid164_fpArctan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(subRes_uid164_fpArctan2Test_a) - UNSIGNED(subRes_uid164_fpArctan2Test_b));
    subRes_uid164_fpArctan2Test_q <= subRes_uid164_fpArctan2Test_o(49 downto 0);


	--subResNormBit_uid166_fpArctan2Test(BITSELECT,165)@58
    subResNormBit_uid166_fpArctan2Test_in <= subRes_uid164_fpArctan2Test_q(48 downto 0);
    subResNormBit_uid166_fpArctan2Test_b <= subResNormBit_uid166_fpArctan2Test_in(48 downto 48);

	--reg_subResNormBit_uid166_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_1(REG,596)@58
    reg_subResNormBit_uid166_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_subResNormBit_uid166_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_subResNormBit_uid166_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_1_q <= subResNormBit_uid166_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--expRSub_uid170_fpArctan2Test(MUX,169)@59
    expRSub_uid170_fpArctan2Test_s <= reg_subResNormBit_uid166_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_1_q;
    expRSub_uid170_fpArctan2Test: PROCESS (expRSub_uid170_fpArctan2Test_s, en, cstBias_uid57_fpArctan2Test_q, cstBiasP1_uid60_fpArctan2Test_q)
    BEGIN
            CASE expRSub_uid170_fpArctan2Test_s IS
                  WHEN "0" => expRSub_uid170_fpArctan2Test_q <= cstBias_uid57_fpArctan2Test_q;
                  WHEN "1" => expRSub_uid170_fpArctan2Test_q <= cstBiasP1_uid60_fpArctan2Test_q;
                  WHEN OTHERS => expRSub_uid170_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor(LOGICAL,1279)
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_b <= ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_sticky_ena_q;
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_q <= not (ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_a or ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_b);

	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_mem_top(CONSTANT,1262)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_mem_top_q <= "010";

	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp(LOGICAL,1263)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_a <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_mem_top_q;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_q);
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_q <= "1" when ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_a = ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_b else "0";

	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmpReg(REG,1264)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmpReg_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_sticky_ena(REG,1280)
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_nor_q = "1") THEN
                ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_sticky_ena_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd(LOGICAL,1281)
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_a <= ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_sticky_ena_q;
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_b <= en;
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_q <= ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_a and ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_b;

	--ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_inputreg(DELAY,1269)
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRCalc_uid152_fpArctan2Test_q, xout => ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt(COUNTER,1258)
    -- every=1, low=0, high=2, step=1, init=1
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_i = 1 THEN
                      ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_eq = '1') THEN
                        ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_i <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_i - 2;
                    ELSE
                        ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_i <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_i,2));


	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg(REG,1259)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux(MUX,1260)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_s <= en;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux: PROCESS (ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_s, ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg_q, ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_q)
    BEGIN
            CASE ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_s IS
                  WHEN "0" => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg_q;
                  WHEN "1" => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem(DUALMEM,1270)
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_ia <= ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_inputreg_q;
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_aa <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg_q;
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_ab <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_q;
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 8,
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
        clocken1 => ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_iq,
        address_a => ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_aa,
        data_a => ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_ia
    );
    ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_reset0 <= areset;
        ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_q <= ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_iq(7 downto 0);

	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor(LOGICAL,1253)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_b <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_sticky_ena_q;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_q <= not (ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_a or ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_b);

	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_mem_top(CONSTANT,1249)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_mem_top_q <= "0110111";

	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp(LOGICAL,1250)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_a <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_mem_top_q;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_q);
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_q <= "1" when ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_a = ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_b else "0";

	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmpReg(REG,1251)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmpReg_q <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_sticky_ena(REG,1254)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_nor_q = "1") THEN
                ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_sticky_ena_q <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd(LOGICAL,1255)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_a <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_sticky_ena_q;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_b <= en;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_q <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_a and ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_b;

	--join_uid47_fpArctan2Test(BITJOIN,46)@0
    join_uid47_fpArctan2Test_q <= exp_uid11_fpArctan2Test_b & frac_uid13_fpArctan2Test_b;

	--xInZero_uid48_fpArctan2Test(LOGICAL,47)@0
    xInZero_uid48_fpArctan2Test_a <= join_uid47_fpArctan2Test_q;
    xInZero_uid48_fpArctan2Test_b <= zwEwF_uid40_fpArctan2Test_q;
    xInZero_uid48_fpArctan2Test_q <= "1" when xInZero_uid48_fpArctan2Test_a = xInZero_uid48_fpArctan2Test_b else "0";

	--xInIsLTEZero_uid171_fpArctan2Test(LOGICAL,170)@0
    xInIsLTEZero_uid171_fpArctan2Test_a <= xInSign_uid39_fpArctan2Test_b;
    xInIsLTEZero_uid171_fpArctan2Test_b <= xInZero_uid48_fpArctan2Test_q;
    xInIsLTEZero_uid171_fpArctan2Test_q_i <= xInIsLTEZero_uid171_fpArctan2Test_a or xInIsLTEZero_uid171_fpArctan2Test_b;
    xInIsLTEZero_uid171_fpArctan2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => xInIsLTEZero_uid171_fpArctan2Test_q, xin => xInIsLTEZero_uid171_fpArctan2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_inputreg(DELAY,1243)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xInIsLTEZero_uid171_fpArctan2Test_q, xout => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt(COUNTER,1245)
    -- every=1, low=0, high=55, step=1, init=1
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_i = 54 THEN
                      ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_eq = '1') THEN
                        ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_i <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_i - 55;
                    ELSE
                        ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_i <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_i,6));


	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdreg(REG,1246)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdreg_q <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux(MUX,1247)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_s <= en;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux: PROCESS (ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_s, ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdreg_q, ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_q)
    BEGIN
            CASE ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_s IS
                  WHEN "0" => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_q <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdreg_q;
                  WHEN "1" => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_q <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem(DUALMEM,1244)
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_ia <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_inputreg_q;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_aa <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdreg_q;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_ab <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_rdmux_q;
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 56,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 56,
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
        clocken1 => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_iq,
        address_a => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_aa,
        data_a => ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_ia
    );
    ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_reset0 <= areset;
        ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_q <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_iq(0 downto 0);

	--expRFinal_uid173_fpArctan2Test(MUX,172)@59
    expRFinal_uid173_fpArctan2Test_s <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_q;
    expRFinal_uid173_fpArctan2Test: PROCESS (expRFinal_uid173_fpArctan2Test_s, en, ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_q, expRSub_uid170_fpArctan2Test_q)
    BEGIN
            CASE expRFinal_uid173_fpArctan2Test_s IS
                  WHEN "0" => expRFinal_uid173_fpArctan2Test_q <= ld_expRCalc_uid152_fpArctan2Test_q_to_expRFinal_uid173_fpArctan2Test_c_replace_mem_q;
                  WHEN "1" => expRFinal_uid173_fpArctan2Test_q <= expRSub_uid170_fpArctan2Test_q;
                  WHEN OTHERS => expRFinal_uid173_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstAllZWE_uid56_fpArctan2Test(CONSTANT,55)
    cstAllZWE_uid56_fpArctan2Test_q <= "00000000";

	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor(LOGICAL,1434)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_b <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_sticky_ena_q;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_q <= not (ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_a or ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_b);

	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_mem_top(CONSTANT,1430)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_mem_top_q <= "0110110";

	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp(LOGICAL,1431)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_a <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_mem_top_q;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_q);
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_q <= "1" when ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_a = ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_b else "0";

	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmpReg(REG,1432)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmpReg_q <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_sticky_ena(REG,1435)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_nor_q = "1") THEN
                ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_sticky_ena_q <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd(LOGICAL,1436)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_a <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_sticky_ena_q;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_b <= en;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_q <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_a and ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_b;

	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_inputreg(DELAY,1424)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRNaN_uid180_fpArctan2Test_q, xout => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt(COUNTER,1426)
    -- every=1, low=0, high=54, step=1, init=1
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_i = 53 THEN
                      ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_eq = '1') THEN
                        ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_i <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_i - 54;
                    ELSE
                        ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_i <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_i,6));


	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdreg(REG,1427)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdreg_q <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux(MUX,1428)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_s <= en;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux: PROCESS (ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_s, ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdreg_q, ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_q)
    BEGIN
            CASE ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_s IS
                  WHEN "0" => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_q <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdreg_q;
                  WHEN "1" => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_q <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem(DUALMEM,1425)
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_ia <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_inputreg_q;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_aa <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdreg_q;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_ab <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_rdmux_q;
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 55,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 55,
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
        clocken1 => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_iq,
        address_a => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_aa,
        data_a => ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_ia
    );
    ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_reset0 <= areset;
        ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_q <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_iq(0 downto 0);

	--reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2(REG,526)@57
    reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_q <= ld_excRNaN_uid180_fpArctan2Test_q_to_reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor(LOGICAL,1292)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_b <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_sticky_ena_q;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_q <= not (ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_a or ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_b);

	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_mem_top(CONSTANT,1288)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_mem_top_q <= "0100100";

	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp(LOGICAL,1289)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_a <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_mem_top_q;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_q);
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_q <= "1" when ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_a = ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_b else "0";

	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmpReg(REG,1290)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmpReg_q <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_sticky_ena(REG,1293)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_nor_q = "1") THEN
                ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_sticky_ena_q <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd(LOGICAL,1294)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_a <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_sticky_ena_q;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_b <= en;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_q <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_a and ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_b;

	--InvXInSign_uid174_fpArctan2Test(LOGICAL,173)@0
    InvXInSign_uid174_fpArctan2Test_a <= xInSign_uid39_fpArctan2Test_b;
    InvXInSign_uid174_fpArctan2Test_q <= not InvXInSign_uid174_fpArctan2Test_a;

	--excRZero2_uid175_fpArctan2Test(LOGICAL,174)@0
    excRZero2_uid175_fpArctan2Test_a <= xInZero_uid48_fpArctan2Test_q;
    excRZero2_uid175_fpArctan2Test_b <= yInZero_uid44_fpArctan2Test_q;
    excRZero2_uid175_fpArctan2Test_c <= InvXInSign_uid174_fpArctan2Test_q;
    excRZero2_uid175_fpArctan2Test_q_i <= excRZero2_uid175_fpArctan2Test_a and excRZero2_uid175_fpArctan2Test_b and excRZero2_uid175_fpArctan2Test_c;
    excRZero2_uid175_fpArctan2Test_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => excRZero2_uid175_fpArctan2Test_q, xin => excRZero2_uid175_fpArctan2Test_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_excRZero2_uid175_fpArctan2Test_q_to_excRZero_uid179_fpArctan2Test_b(DELAY,758)@1
    ld_excRZero2_uid175_fpArctan2Test_q_to_excRZero_uid179_fpArctan2Test_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => excRZero2_uid175_fpArctan2Test_q, xout => ld_excRZero2_uid175_fpArctan2Test_q_to_excRZero_uid179_fpArctan2Test_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_InvXInSign_uid174_fpArctan2Test_q_to_excRZero1_uid178_fpArctan2Test_c(DELAY,756)@0
    ld_InvXInSign_uid174_fpArctan2Test_q_to_excRZero1_uid178_fpArctan2Test_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => InvXInSign_uid174_fpArctan2Test_q, xout => ld_InvXInSign_uid174_fpArctan2Test_q_to_excRZero1_uid178_fpArctan2Test_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yInSign_uid38_fpArctan2Test_b_to_InvYInSign_uid177_fpArctan2Test_a(DELAY,753)@0
    ld_yInSign_uid38_fpArctan2Test_b_to_InvYInSign_uid177_fpArctan2Test_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => yInSign_uid38_fpArctan2Test_b, xout => ld_yInSign_uid38_fpArctan2Test_b_to_InvYInSign_uid177_fpArctan2Test_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvYInSign_uid177_fpArctan2Test(LOGICAL,176)@19
    InvYInSign_uid177_fpArctan2Test_a <= ld_yInSign_uid38_fpArctan2Test_b_to_InvYInSign_uid177_fpArctan2Test_a_q;
    InvYInSign_uid177_fpArctan2Test_q <= not InvYInSign_uid177_fpArctan2Test_a;

	--excRZero1_uid178_fpArctan2Test(LOGICAL,177)@19
    excRZero1_uid178_fpArctan2Test_a <= expXIsZero_uid68_fpArctan2Test_q;
    excRZero1_uid178_fpArctan2Test_b <= InvYInSign_uid177_fpArctan2Test_q;
    excRZero1_uid178_fpArctan2Test_c <= ld_InvXInSign_uid174_fpArctan2Test_q_to_excRZero1_uid178_fpArctan2Test_c_q;
    excRZero1_uid178_fpArctan2Test_q <= excRZero1_uid178_fpArctan2Test_a and excRZero1_uid178_fpArctan2Test_b and excRZero1_uid178_fpArctan2Test_c;

	--excRZero_uid179_fpArctan2Test(LOGICAL,178)@19
    excRZero_uid179_fpArctan2Test_a <= excRZero1_uid178_fpArctan2Test_q;
    excRZero_uid179_fpArctan2Test_b <= ld_excRZero2_uid175_fpArctan2Test_q_to_excRZero_uid179_fpArctan2Test_b_q;
    excRZero_uid179_fpArctan2Test_q <= excRZero_uid179_fpArctan2Test_a or excRZero_uid179_fpArctan2Test_b;

	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_inputreg(DELAY,1282)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRZero_uid179_fpArctan2Test_q, xout => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt(COUNTER,1284)
    -- every=1, low=0, high=36, step=1, init=1
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_i = 35 THEN
                      ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_eq = '1') THEN
                        ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_i <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_i - 36;
                    ELSE
                        ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_i <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_i,6));


	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdreg(REG,1285)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdreg_q <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux(MUX,1286)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_s <= en;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux: PROCESS (ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_s, ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdreg_q, ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_q)
    BEGIN
            CASE ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_s IS
                  WHEN "0" => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_q <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdreg_q;
                  WHEN "1" => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_q <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem(DUALMEM,1283)
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_ia <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_inputreg_q;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_aa <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdreg_q;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_ab <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_rdmux_q;
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_iq,
        address_a => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_aa,
        data_a => ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_ia
    );
    ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_reset0 <= areset;
        ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_q <= ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_iq(0 downto 0);

	--excSelBits_uid181_fpArctan2Test(BITJOIN,180)@58
    excSelBits_uid181_fpArctan2Test_q <= reg_excRNaN_uid180_fpArctan2Test_0_to_excSelBits_uid181_fpArctan2Test_2_q & GND_q & ld_excRZero_uid179_fpArctan2Test_q_to_excSelBits_uid181_fpArctan2Test_a_replace_mem_q;

	--reg_excSelBits_uid181_fpArctan2Test_0_to_outMuxSelEnc_uid182_fpArctan2Test_0(REG,527)@58
    reg_excSelBits_uid181_fpArctan2Test_0_to_outMuxSelEnc_uid182_fpArctan2Test_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid181_fpArctan2Test_0_to_outMuxSelEnc_uid182_fpArctan2Test_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid181_fpArctan2Test_0_to_outMuxSelEnc_uid182_fpArctan2Test_0_q <= excSelBits_uid181_fpArctan2Test_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid182_fpArctan2Test(LOOKUP,181)@59
    outMuxSelEnc_uid182_fpArctan2Test: PROCESS (reg_excSelBits_uid181_fpArctan2Test_0_to_outMuxSelEnc_uid182_fpArctan2Test_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid181_fpArctan2Test_0_to_outMuxSelEnc_uid182_fpArctan2Test_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid182_fpArctan2Test_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid182_fpArctan2Test_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid182_fpArctan2Test_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid182_fpArctan2Test_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid182_fpArctan2Test_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid182_fpArctan2Test_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid182_fpArctan2Test_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid182_fpArctan2Test_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid182_fpArctan2Test_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid184_fpArctan2Test(MUX,183)@59
    expRPostExc_uid184_fpArctan2Test_s <= outMuxSelEnc_uid182_fpArctan2Test_q;
    expRPostExc_uid184_fpArctan2Test: PROCESS (expRPostExc_uid184_fpArctan2Test_s, en, cstAllZWE_uid56_fpArctan2Test_q, expRFinal_uid173_fpArctan2Test_q, cstAllOWE_uid6_fpArctan2Test_q, cstAllOWE_uid6_fpArctan2Test_q)
    BEGIN
            CASE expRPostExc_uid184_fpArctan2Test_s IS
                  WHEN "00" => expRPostExc_uid184_fpArctan2Test_q <= cstAllZWE_uid56_fpArctan2Test_q;
                  WHEN "01" => expRPostExc_uid184_fpArctan2Test_q <= expRFinal_uid173_fpArctan2Test_q;
                  WHEN "10" => expRPostExc_uid184_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
                  WHEN "11" => expRPostExc_uid184_fpArctan2Test_q <= cstAllOWE_uid6_fpArctan2Test_q;
                  WHEN OTHERS => expRPostExc_uid184_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--subResHigh_uid167_fpArctan2Test(BITSELECT,166)@58
    subResHigh_uid167_fpArctan2Test_in <= subRes_uid164_fpArctan2Test_q(47 downto 0);
    subResHigh_uid167_fpArctan2Test_b <= subResHigh_uid167_fpArctan2Test_in(47 downto 25);

	--reg_subResHigh_uid167_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_3(REG,598)@58
    reg_subResHigh_uid167_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_subResHigh_uid167_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_subResHigh_uid167_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_3_q <= subResHigh_uid167_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--subResLow_uid168_fpArctan2Test(BITSELECT,167)@58
    subResLow_uid168_fpArctan2Test_in <= subRes_uid164_fpArctan2Test_q(46 downto 0);
    subResLow_uid168_fpArctan2Test_b <= subResLow_uid168_fpArctan2Test_in(46 downto 24);

	--reg_subResLow_uid168_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_2(REG,597)@58
    reg_subResLow_uid168_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_subResLow_uid168_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_subResLow_uid168_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_2_q <= subResLow_uid168_fpArctan2Test_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRSub_uid169_fpArctan2Test(MUX,168)@59
    fracRSub_uid169_fpArctan2Test_s <= reg_subResNormBit_uid166_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_1_q;
    fracRSub_uid169_fpArctan2Test: PROCESS (fracRSub_uid169_fpArctan2Test_s, en, reg_subResLow_uid168_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_2_q, reg_subResHigh_uid167_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_3_q)
    BEGIN
            CASE fracRSub_uid169_fpArctan2Test_s IS
                  WHEN "0" => fracRSub_uid169_fpArctan2Test_q <= reg_subResLow_uid168_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_2_q;
                  WHEN "1" => fracRSub_uid169_fpArctan2Test_q <= reg_subResHigh_uid167_fpArctan2Test_0_to_fracRSub_uid169_fpArctan2Test_3_q;
                  WHEN OTHERS => fracRSub_uid169_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor(LOGICAL,1266)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_a <= ld_singX_uid52_fpArctan2Test_b_to_fpPiO2C_uid86_fpArctan2Test_c_notEnable_q;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_b <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_sticky_ena_q;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_q <= not (ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_a or ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_b);

	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_sticky_ena(REG,1267)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_nor_q = "1") THEN
                ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_sticky_ena_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd(LOGICAL,1268)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_a <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_sticky_ena_q;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_b <= en;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_a and ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_b;

	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_inputreg(DELAY,1256)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracRCalc_uid150_fpArctan2Test_q, xout => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem(DUALMEM,1257)
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_ia <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_inputreg_q;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_aa <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdreg_q;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_ab <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_rdmux_q;
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 23,
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
        clocken1 => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_iq,
        address_a => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_aa,
        data_a => ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_ia
    );
    ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_reset0 <= areset;
        ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_iq(22 downto 0);

	--fracRFinal_uid172_fpArctan2Test(MUX,171)@59
    fracRFinal_uid172_fpArctan2Test_s <= ld_xInIsLTEZero_uid171_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_b_replace_mem_q;
    fracRFinal_uid172_fpArctan2Test: PROCESS (fracRFinal_uid172_fpArctan2Test_s, en, ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_q, fracRSub_uid169_fpArctan2Test_q)
    BEGIN
            CASE fracRFinal_uid172_fpArctan2Test_s IS
                  WHEN "0" => fracRFinal_uid172_fpArctan2Test_q <= ld_fracRCalc_uid150_fpArctan2Test_q_to_fracRFinal_uid172_fpArctan2Test_c_replace_mem_q;
                  WHEN "1" => fracRFinal_uid172_fpArctan2Test_q <= fracRSub_uid169_fpArctan2Test_q;
                  WHEN OTHERS => fracRFinal_uid172_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPostExc_uid183_fpArctan2Test(MUX,182)@59
    fracRPostExc_uid183_fpArctan2Test_s <= outMuxSelEnc_uid182_fpArctan2Test_q;
    fracRPostExc_uid183_fpArctan2Test: PROCESS (fracRPostExc_uid183_fpArctan2Test_s, en, cstAllZWF_uid7_fpArctan2Test_q, fracRFinal_uid172_fpArctan2Test_q, cstAllZWF_uid7_fpArctan2Test_q, cstNaNWF_uid55_fpArctan2Test_q)
    BEGIN
            CASE fracRPostExc_uid183_fpArctan2Test_s IS
                  WHEN "00" => fracRPostExc_uid183_fpArctan2Test_q <= cstAllZWF_uid7_fpArctan2Test_q;
                  WHEN "01" => fracRPostExc_uid183_fpArctan2Test_q <= fracRFinal_uid172_fpArctan2Test_q;
                  WHEN "10" => fracRPostExc_uid183_fpArctan2Test_q <= cstAllZWF_uid7_fpArctan2Test_q;
                  WHEN "11" => fracRPostExc_uid183_fpArctan2Test_q <= cstNaNWF_uid55_fpArctan2Test_q;
                  WHEN OTHERS => fracRPostExc_uid183_fpArctan2Test_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid187_fpArctan2Test(BITJOIN,186)@59
    R_uid187_fpArctan2Test_q <= ld_signR_uid186_fpArctan2Test_q_to_R_uid187_fpArctan2Test_c_replace_mem_q & expRPostExc_uid184_fpArctan2Test_q & fracRPostExc_uid183_fpArctan2Test_q;

	--xOut(GPOUT,4)@59
    q <= R_uid187_fpArctan2Test_q;


end normal;
