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

-- VHDL created from fp_tan_s5
-- VHDL created on Wed Mar 13 12:44:30 2013


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

entity fp_tan_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_tan_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid6_fpTanTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid7_fpTanTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid8_fpTanTest_q : std_logic_vector (7 downto 0);
    signal cstBias_uid22_fpTanTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid23_fpTanTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShift_uid24_fpTanTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShiftM2_uid25_fpTanTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShiftM2_uid26_fpTanTest_q : std_logic_vector (7 downto 0);
    signal cstZwShiftP1_uid27_fpTanTest_q : std_logic_vector (13 downto 0);
    signal cstNaNwF_uid32_fpTanTest_q : std_logic_vector (22 downto 0);
    signal cstZwShiftPwFRR_uid35_fpTanTest_q : std_logic_vector (64 downto 0);
    signal cPi_uid70_fpTanTest_q : std_logic_vector (25 downto 0);
    signal p_uid72_fpTanTest_s : std_logic_vector (0 downto 0);
    signal p_uid72_fpTanTest_q : std_logic_vector (25 downto 0);
    signal expPSin_uid75_fpTanTest_s : std_logic_vector (0 downto 0);
    signal expPSin_uid75_fpTanTest_q : std_logic_vector (7 downto 0);
    signal multSinOp2_uid90_fpTanTest_s : std_logic_vector (0 downto 0);
    signal multSinOp2_uid90_fpTanTest_q : std_logic_vector (25 downto 0);
    signal mulSin_uid91_fpTanTest_a : std_logic_vector (25 downto 0);
    signal mulSin_uid91_fpTanTest_b : std_logic_vector (25 downto 0);
    signal mulSin_uid91_fpTanTest_s1 : std_logic_vector (51 downto 0);
    signal mulSin_uid91_fpTanTest_pr : UNSIGNED (51 downto 0);
    signal mulSin_uid91_fpTanTest_q : std_logic_vector (51 downto 0);
    signal mulCos_uid104_fpTanTest_a : std_logic_vector (25 downto 0);
    signal mulCos_uid104_fpTanTest_b : std_logic_vector (25 downto 0);
    signal mulCos_uid104_fpTanTest_s1 : std_logic_vector (51 downto 0);
    signal mulCos_uid104_fpTanTest_pr : UNSIGNED (51 downto 0);
    signal mulCos_uid104_fpTanTest_q : std_logic_vector (51 downto 0);
    signal excSelSin_uid118_fpTanTest_q : std_logic_vector(1 downto 0);
    signal InvSinXIsXRR_uid127_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsXRR_uid127_fpTanTest_q : std_logic_vector(0 downto 0);
    signal signR_uid129_fpTanTest_a : std_logic_vector(0 downto 0);
    signal signR_uid129_fpTanTest_b : std_logic_vector(0 downto 0);
    signal signR_uid129_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvCosXIsOneXRR_uid132_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvCosXIsOneXRR_uid132_fpTanTest_q : std_logic_vector(0 downto 0);
    signal expSelectorCos_uid141_fpTanTest_q : std_logic_vector(1 downto 0);
    signal InvCosOne_uid145_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvCosOne_uid145_fpTanTest_q : std_logic_vector(0 downto 0);
    signal signRCond2_uid148_fpTanTest_a : std_logic_vector(0 downto 0);
    signal signRCond2_uid148_fpTanTest_b : std_logic_vector(0 downto 0);
    signal signRCond2_uid148_fpTanTest_c : std_logic_vector(0 downto 0);
    signal signRCond2_uid148_fpTanTest_d : std_logic_vector(0 downto 0);
    signal signRCond2_uid148_fpTanTest_q : std_logic_vector(0 downto 0);
    signal signRCond1_uid153_fpTanTest_a : std_logic_vector(0 downto 0);
    signal signRCond1_uid153_fpTanTest_b : std_logic_vector(0 downto 0);
    signal signRCond1_uid153_fpTanTest_c : std_logic_vector(0 downto 0);
    signal signRCond1_uid153_fpTanTest_d : std_logic_vector(0 downto 0);
    signal signRCond1_uid153_fpTanTest_q : std_logic_vector(0 downto 0);
    signal xBranch_uid184_rrx_uid34_fpTanTest_a : std_logic_vector(10 downto 0);
    signal xBranch_uid184_rrx_uid34_fpTanTest_b : std_logic_vector(10 downto 0);
    signal xBranch_uid184_rrx_uid34_fpTanTest_o : std_logic_vector (10 downto 0);
    signal xBranch_uid184_rrx_uid34_fpTanTest_cin : std_logic_vector (0 downto 0);
    signal xBranch_uid184_rrx_uid34_fpTanTest_n : std_logic_vector (0 downto 0);
    signal ZerosGB_uid199_rrx_uid34_fpTanTest_q : std_logic_vector (29 downto 0);
    signal leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid212_fxpX_uid48_fpTanTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1Idx3Pad3_uid223_fxpX_uid48_fpTanTest_q : std_logic_vector (2 downto 0);
    signal zs_uid229_lzcZSin_uid65_fpTanTest_q : std_logic_vector (63 downto 0);
    signal vCount_uid231_lzcZSin_uid65_fpTanTest_a : std_logic_vector(63 downto 0);
    signal vCount_uid231_lzcZSin_uid65_fpTanTest_b : std_logic_vector(63 downto 0);
    signal vCount_uid231_lzcZSin_uid65_fpTanTest_q : std_logic_vector(0 downto 0);
    signal mO_uid232_lzcZSin_uid65_fpTanTest_q : std_logic_vector (62 downto 0);
    signal zs_uid237_lzcZSin_uid65_fpTanTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid239_lzcZSin_uid65_fpTanTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid239_lzcZSin_uid65_fpTanTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid239_lzcZSin_uid65_fpTanTest_q : std_logic_vector(0 downto 0);
    signal zs_uid243_lzcZSin_uid65_fpTanTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid257_lzcZSin_uid65_fpTanTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid257_lzcZSin_uid65_fpTanTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid257_lzcZSin_uid65_fpTanTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1Idx3Pad24_uid286_alignedZSin_uid66_fpTanTest_q : std_logic_vector (23 downto 0);
    signal leftShiftStage2Idx3Pad6_uid297_alignedZSin_uid66_fpTanTest_q : std_logic_vector (5 downto 0);
    signal vCount_uid310_lzcZCos_uid68_fpTanTest_a : std_logic_vector(63 downto 0);
    signal vCount_uid310_lzcZCos_uid68_fpTanTest_b : std_logic_vector(63 downto 0);
    signal vCount_uid310_lzcZCos_uid68_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid318_lzcZCos_uid68_fpTanTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid318_lzcZCos_uid68_fpTanTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid318_lzcZCos_uid68_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid336_lzcZCos_uid68_fpTanTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid336_lzcZCos_uid68_fpTanTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid336_lzcZCos_uid68_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid447_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid447_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid448_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid448_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid463_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid463_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid464_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid464_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal signR_uid467_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal signR_uid467_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal signR_uid467_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal expXmY_uid468_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(8 downto 0);
    signal expXmY_uid468_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(8 downto 0);
    signal expXmY_uid468_fpTanXComp_uid157_fpTanTest_o : std_logic_vector (8 downto 0);
    signal expXmY_uid468_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (8 downto 0);
    signal expR_uid469_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(10 downto 0);
    signal expR_uid469_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(10 downto 0);
    signal expR_uid469_fpTanXComp_uid157_fpTanTest_o : std_logic_vector (10 downto 0);
    signal expR_uid469_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (9 downto 0);
    signal fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excXIYI_uid510_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excXIYI_uid510_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excXIYI_uid510_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal mO_uid529_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector (1 downto 0);
    signal vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector(0 downto 0);
    signal prodXY_uid586_pT1_uid400_polyEvalsinPiZ_a : std_logic_vector (12 downto 0);
    signal prodXY_uid586_pT1_uid400_polyEvalsinPiZ_b : std_logic_vector (12 downto 0);
    signal prodXY_uid586_pT1_uid400_polyEvalsinPiZ_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid586_pT1_uid400_polyEvalsinPiZ_pr : SIGNED (26 downto 0);
    signal prodXY_uid586_pT1_uid400_polyEvalsinPiZ_q : std_logic_vector (25 downto 0);
    signal prodXY_uid589_pT2_uid406_polyEvalsinPiZ_a : std_logic_vector (14 downto 0);
    signal prodXY_uid589_pT2_uid406_polyEvalsinPiZ_b : std_logic_vector (22 downto 0);
    signal prodXY_uid589_pT2_uid406_polyEvalsinPiZ_s1 : std_logic_vector (37 downto 0);
    signal prodXY_uid589_pT2_uid406_polyEvalsinPiZ_pr : SIGNED (38 downto 0);
    signal prodXY_uid589_pT2_uid406_polyEvalsinPiZ_q : std_logic_vector (37 downto 0);
    signal prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a : std_logic_vector (12 downto 0);
    signal prodXY_uid592_pT1_uid413_polyEvalcosPiZ_b : std_logic_vector (12 downto 0);
    signal prodXY_uid592_pT1_uid413_polyEvalcosPiZ_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid592_pT1_uid413_polyEvalcosPiZ_pr : SIGNED (26 downto 0);
    signal prodXY_uid592_pT1_uid413_polyEvalcosPiZ_q : std_logic_vector (25 downto 0);
    signal prodXY_uid595_pT2_uid419_polyEvalcosPiZ_a : std_logic_vector (14 downto 0);
    signal prodXY_uid595_pT2_uid419_polyEvalcosPiZ_b : std_logic_vector (22 downto 0);
    signal prodXY_uid595_pT2_uid419_polyEvalcosPiZ_s1 : std_logic_vector (37 downto 0);
    signal prodXY_uid595_pT2_uid419_polyEvalcosPiZ_pr : SIGNED (38 downto 0);
    signal prodXY_uid595_pT2_uid419_polyEvalcosPiZ_q : std_logic_vector (37 downto 0);
    signal prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_a : std_logic_vector (25 downto 0);
    signal prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (23 downto 0);
    signal prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_s1 : std_logic_vector (49 downto 0);
    signal prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_pr : UNSIGNED (49 downto 0);
    signal prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (49 downto 0);
    signal prodXY_uid620_pT1_uid605_invPE_a : std_logic_vector (11 downto 0);
    signal prodXY_uid620_pT1_uid605_invPE_b : std_logic_vector (11 downto 0);
    signal prodXY_uid620_pT1_uid605_invPE_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid620_pT1_uid605_invPE_pr : SIGNED (24 downto 0);
    signal prodXY_uid620_pT1_uid605_invPE_q : std_logic_vector (23 downto 0);
    signal prodXY_uid623_pT2_uid611_invPE_a : std_logic_vector (13 downto 0);
    signal prodXY_uid623_pT2_uid611_invPE_b : std_logic_vector (22 downto 0);
    signal prodXY_uid623_pT2_uid611_invPE_s1 : std_logic_vector (36 downto 0);
    signal prodXY_uid623_pT2_uid611_invPE_pr : SIGNED (37 downto 0);
    signal prodXY_uid623_pT2_uid611_invPE_q : std_logic_vector (36 downto 0);
    signal rrTable_uid187_rrx_uid34_fpTanTest_lutmem_reset0 : std_logic;
    signal rrTable_uid187_rrx_uid34_fpTanTest_lutmem_ia : std_logic_vector (39 downto 0);
    signal rrTable_uid187_rrx_uid34_fpTanTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal rrTable_uid187_rrx_uid34_fpTanTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal rrTable_uid187_rrx_uid34_fpTanTest_lutmem_iq : std_logic_vector (39 downto 0);
    signal rrTable_uid187_rrx_uid34_fpTanTest_lutmem_q : std_logic_vector (39 downto 0);
    signal rrTable_uid188_rrx_uid34_fpTanTest_lutmem_reset0 : std_logic;
    signal rrTable_uid188_rrx_uid34_fpTanTest_lutmem_ia : std_logic_vector (37 downto 0);
    signal rrTable_uid188_rrx_uid34_fpTanTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal rrTable_uid188_rrx_uid34_fpTanTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal rrTable_uid188_rrx_uid34_fpTanTest_lutmem_iq : std_logic_vector (37 downto 0);
    signal rrTable_uid188_rrx_uid34_fpTanTest_lutmem_q : std_logic_vector (37 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a0_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a0_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a0_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a0_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a0_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a1_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a1_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a1_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a1_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a1_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a2_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a2_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a2_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a2_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a2_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_a : std_logic_vector(81 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_b : std_logic_vector(81 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_o : std_logic_vector (81 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_q : std_logic_vector (81 downto 0);
    signal memoryC0_uid387_tableGensinPiZ_lutmem_reset0 : std_logic;
    signal memoryC0_uid387_tableGensinPiZ_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid387_tableGensinPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid387_tableGensinPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid387_tableGensinPiZ_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid387_tableGensinPiZ_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid389_tableGensinPiZ_lutmem_reset0 : std_logic;
    signal memoryC1_uid389_tableGensinPiZ_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid389_tableGensinPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid389_tableGensinPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid389_tableGensinPiZ_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid389_tableGensinPiZ_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid391_tableGensinPiZ_lutmem_reset0 : std_logic;
    signal memoryC2_uid391_tableGensinPiZ_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid391_tableGensinPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid391_tableGensinPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid391_tableGensinPiZ_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid391_tableGensinPiZ_lutmem_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid393_tableGencosPiZ_lutmem_reset0 : std_logic;
    signal memoryC0_uid393_tableGencosPiZ_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid393_tableGencosPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid393_tableGencosPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid393_tableGencosPiZ_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid393_tableGencosPiZ_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid395_tableGencosPiZ_lutmem_reset0 : std_logic;
    signal memoryC1_uid395_tableGencosPiZ_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid395_tableGencosPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid395_tableGencosPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid395_tableGencosPiZ_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid395_tableGencosPiZ_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid397_tableGencosPiZ_lutmem_reset0 : std_logic;
    signal memoryC2_uid397_tableGencosPiZ_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid397_tableGencosPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid397_tableGencosPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid397_tableGencosPiZ_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid397_tableGencosPiZ_lutmem_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid598_invTab_lutmem_reset0 : std_logic;
    signal memoryC0_uid598_invTab_lutmem_ia : std_logic_vector (30 downto 0);
    signal memoryC0_uid598_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC0_uid598_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC0_uid598_invTab_lutmem_iq : std_logic_vector (30 downto 0);
    signal memoryC0_uid598_invTab_lutmem_q : std_logic_vector (30 downto 0);
    signal memoryC1_uid600_invTab_lutmem_reset0 : std_logic;
    signal memoryC1_uid600_invTab_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid600_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC1_uid600_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC1_uid600_invTab_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid600_invTab_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid602_invTab_lutmem_reset0 : std_logic;
    signal memoryC2_uid602_invTab_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid602_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC2_uid602_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC2_uid602_invTab_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid602_invTab_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_q : std_logic_vector (2 downto 0);
    signal reg_expXTableAddr_uid186_rrx_uid34_fpTanTest_0_to_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_0_q : std_logic_vector (39 downto 0);
    signal reg_rrTable_uid188_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_1_q : std_logic_vector (37 downto 0);
    signal reg_prod_uid191_rrx_uid34_fpTanTest_a_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid191_rrx_uid34_fpTanTest_b_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid191_rrx_uid34_fpTanTest_a_1_0_to_prod_uid191_rrx_uid34_fpTanTest_a1_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid191_rrx_uid34_fpTanTest_a_2_0_to_prod_uid191_rrx_uid34_fpTanTest_a2_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_0_to_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_1_q : std_logic_vector (15 downto 0);
    signal reg_cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_2_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_3_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_4_q : std_logic_vector (75 downto 0);
    signal reg_leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_5_q : std_logic_vector (75 downto 0);
    signal reg_fracCompOut_uid196_rrx_uid34_fpTanTest_0_to_finalFrac_uid201_rrx_uid34_fpTanTest_2_q : std_logic_vector (52 downto 0);
    signal reg_expCompOut_uid198_rrx_uid34_fpTanTest_0_to_finalExp_uid202_rrx_uid34_fpTanTest_2_q : std_logic_vector (7 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_0_to_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_2_q : std_logic_vector (67 downto 0);
    signal reg_pad_one_uid54_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_0_q : std_logic_vector (66 downto 0);
    signal reg_y_uid50_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_1_q : std_logic_vector (65 downto 0);
    signal reg_oneMinusY_uid54_fpTanTest_0_to_cmpYToOneMinusY_uid56_fpTanTest_0_q : std_logic_vector (67 downto 0);
    signal reg_cmpYToOneMinusY_uid56_fpTanTest_1_to_zSin_uid59_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2_q : std_logic_vector (64 downto 0);
    signal reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3_q : std_logic_vector (64 downto 0);
    signal reg_rVStage_uid250_lzcZSin_uid65_fpTanTest_0_to_vCount_uid251_lzcZSin_uid65_fpTanTest_1_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid252_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid254_lzcZSin_uid65_fpTanTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid256_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_2_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid258_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_2_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_3_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_4_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_5_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_2_q : std_logic_vector (64 downto 0);
    signal reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_pHigh_uid71_fpTanTest_0_to_p_uid72_fpTanTest_2_q : std_logic_vector (25 downto 0);
    signal reg_addr_uid80_fpTanTest_0_to_memoryC2_uid391_tableGensinPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid391_tableGensinPiZ_lutmem_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_1_q : std_logic_vector (12 downto 0);
    signal reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid389_tableGensinPiZ_lutmem_0_to_sumAHighB_uid403_polyEvalsinPiZ_0_q : std_logic_vector (20 downto 0);
    signal reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid401_uid404_polyEvalsinPiZ_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_1_q : std_logic_vector (22 downto 0);
    signal reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid387_tableGensinPiZ_lutmem_0_to_sumAHighB_uid409_polyEvalsinPiZ_0_q : std_logic_vector (29 downto 0);
    signal reg_r_uid270_lzcZSin_uid65_fpTanTest_0_to_expSinHC_uid73_fpTanTest_1_q : std_logic_vector (6 downto 0);
    signal reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_fracRCompSin_uid102_fpTanTest_0_to_fracRPostExcSin_uid121_fpTanTest_2_q : std_logic_vector (22 downto 0);
    signal reg_expRCompSin_uid103_fpTanTest_0_to_expRPostExcSin_uid125_fpTanTest_2_q : std_logic_vector (7 downto 0);
    signal reg_yHalfCosNotONe_uid134_fpTanTest_0_to_rZeroOrCosOne_uid136_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q : std_logic_vector (0 downto 0);
    signal reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q : std_logic_vector (0 downto 0);
    signal reg_excRNaN_uid116_fpTanTest_0_to_join_uid137_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_InvCmpYToOneMinusY_uid60_fpTanTest_0_to_zCos_uid63_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_rVStage_uid329_lzcZCos_uid68_fpTanTest_0_to_vCount_uid330_lzcZCos_uid68_fpTanTest_1_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid331_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid333_lzcZCos_uid68_fpTanTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid335_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_2_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid337_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_2_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_3_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_4_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_5_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_2_q : std_logic_vector (64 downto 0);
    signal reg_addr_uid82_fpTanTest_0_to_memoryC2_uid397_tableGencosPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid397_tableGencosPiZ_lutmem_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_1_q : std_logic_vector (12 downto 0);
    signal reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid395_tableGencosPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalcosPiZ_0_q : std_logic_vector (20 downto 0);
    signal reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid414_uid417_polyEvalcosPiZ_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_1_q : std_logic_vector (22 downto 0);
    signal reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid393_tableGencosPiZ_lutmem_0_to_sumAHighB_uid422_polyEvalcosPiZ_0_q : std_logic_vector (29 downto 0);
    signal reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_q : std_logic_vector (25 downto 0);
    signal reg_polyEvalSigcosPiZ_uid88_fpTanTest_0_to_mulCos_uid104_fpTanTest_1_q : std_logic_vector (25 downto 0);
    signal reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q : std_logic_vector (6 downto 0);
    signal reg_expPCos_uid78_fpTanTest_0_to_expFracRCosPreRnd_uid110_uid110_fpTanTest_1_q : std_logic_vector (7 downto 0);
    signal reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q : std_logic_vector (1 downto 0);
    signal reg_fracRCompCos_uid114_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_2_q : std_logic_vector (22 downto 0);
    signal reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_q : std_logic_vector (0 downto 0);
    signal reg_expSelBitsCos_uid140_fpTanTest_0_to_expSelectorCos_uid141_fpTanTest_0_q : std_logic_vector (3 downto 0);
    signal reg_expRCompSin_uid115_fpTanTest_0_to_expRPostExcCos_uid143_fpTanTest_2_q : std_logic_vector (7 downto 0);
    signal reg_expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_0_to_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC2_uid602_invTab_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid602_invTab_lutmem_0_to_prodXY_uid620_pT1_uid605_invPE_1_q : std_logic_vector (11 downto 0);
    signal reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_memoryC1_uid600_invTab_lutmem_0_to_sumAHighB_uid608_invPE_0_q : std_logic_vector (20 downto 0);
    signal reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_q : std_logic_vector (13 downto 0);
    signal reg_s1_uid606_uid609_invPE_0_to_prodXY_uid623_pT2_uid611_invPE_1_q : std_logic_vector (22 downto 0);
    signal reg_memoryC0_uid598_invTab_lutmem_0_to_sumAHighB_uid614_invPE_0_q : std_logic_vector (30 downto 0);
    signal reg_invY_uid474_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_0_q : std_logic_vector (25 downto 0);
    signal reg_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_1_q : std_logic_vector (23 downto 0);
    signal reg_expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_0_to_expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_0_q : std_logic_vector (33 downto 0);
    signal reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1_q : std_logic_vector (10 downto 0);
    signal reg_exc_I_uid460_fpTanXComp_uid157_fpTanTest_0_to_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_2_q : std_logic_vector (0 downto 0);
    signal reg_expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_0_to_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_2_q : std_logic_vector (0 downto 0);
    signal reg_exc_I_uid444_fpTanXComp_uid157_fpTanTest_0_to_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_1_q : std_logic_vector (0 downto 0);
    signal reg_exc_N_uid446_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_2_q : std_logic_vector (0 downto 0);
    signal reg_exc_N_uid462_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_3_q : std_logic_vector (0 downto 0);
    signal reg_concExc_uid512_fpTanXComp_uid157_fpTanTest_0_to_excREnc_uid513_fpTanXComp_uid157_fpTanTest_0_q : std_logic_vector (2 downto 0);
    signal ld_fracXRR_uid40_fpTanTest_b_to_oFracXRR_uid44_uid44_fpTanTest_a_q : std_logic_vector (52 downto 0);
    signal ld_y_uid50_fpTanTest_b_to_cmpYToOneMinusY_uid56_fpTanTest_b_q : std_logic_vector (65 downto 0);
    signal ld_oneMinusY_uid54_fpTanTest_q_to_zSinOMyBottom_uid57_fpTanTest_a_q : std_logic_vector (67 downto 0);
    signal ld_sinXIsXRR_uid42_fpTanTest_n_to_multSinOp2_uid90_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid17_fpTanTest_q_to_excRNaN_uid116_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid15_fpTanTest_q_to_excRNaN_uid116_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid41_fpTanTest_n_to_excSelBitsSin_uid117_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpTanTest_q_to_excSelBitsSin_uid117_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid41_fpTanTest_n_to_InvSinXIsX_uid126_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_InvSinXIsXRR_uid127_fpTanTest_q_to_signComp_uid128_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid38_fpTanTest_b_to_signR_uid129_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid129_fpTanTest_q_to_fpSin_uid130_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_InvSinXIsX_uid126_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_InvCosXIsOneXRR_uid132_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q_to_rZeroOrCosOne_uid136_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q_to_rZeroOrCosOne_uid136_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid41_fpTanTest_n_to_cosOne_uid144_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_cosOne_uid144_fpTanTest_q_to_InvCosOne_uid145_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_yIsZero_uid51_fpTanTest_q_to_InvYIsZero_uid147_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_intXParity_uid49_fpTanTest_b_to_signRCond2_uid148_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_InvIntXParity_uid151_fpTanTest_q_to_signRCond1_uid153_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_signRCos_uid154_fpTanTest_q_to_fpCos_uid155_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalFrac_uid201_rrx_uid34_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalExp_uid202_rrx_uid34_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_finalExp_uid202_rrx_uid34_fpTanTest_q_to_RRangeRed_uid203_rrx_uid34_fpTanTest_b_q : std_logic_vector (7 downto 0);
    signal ld_LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_b_q : std_logic_vector (66 downto 0);
    signal ld_LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_b_q : std_logic_vector (65 downto 0);
    signal ld_LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_b_q : std_logic_vector (64 downto 0);
    signal ld_vStage_uid233_lzcZSin_uid65_fpTanTest_b_to_cStage_uid234_lzcZSin_uid65_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_rVStage_uid230_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid236_lzcZSin_uid65_fpTanTest_c_q : std_logic_vector (63 downto 0);
    signal ld_rVStage_uid238_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vStage_uid240_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_d_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid251_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q_to_r_uid270_lzcZSin_uid65_fpTanTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid239_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid231_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_g_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_b_q : std_logic_vector (62 downto 0);
    signal ld_LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_b_q : std_logic_vector (60 downto 0);
    signal ld_LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_b_q : std_logic_vector (58 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_vStage_uid312_lzcZCos_uid68_fpTanTest_b_to_cStage_uid313_lzcZCos_uid68_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_rVStage_uid309_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid315_lzcZCos_uid68_fpTanTest_c_q : std_logic_vector (63 downto 0);
    signal ld_rVStage_uid317_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vStage_uid319_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_d_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid330_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q_to_r_uid349_lzcZCos_uid68_fpTanTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid318_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid310_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_g_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_b_q : std_logic_vector (62 downto 0);
    signal ld_LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_b_q : std_logic_vector (60 downto 0);
    signal ld_LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_b_q : std_logic_vector (58 downto 0);
    signal ld_reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_b_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracYZero_uid434_fpTanXComp_uid157_fpTanTest_q_to_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q_to_divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_norm_uid483_fpTanXComp_uid157_fpTanTest_b_to_rndOp_uid489_fpTanXComp_uid157_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid450_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid466_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_d_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q_to_concExc_uid512_fpTanXComp_uid157_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b_to_fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_d_q : std_logic_vector (22 downto 0);
    signal ld_excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b_to_expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_d_q : std_logic_vector (7 downto 0);
    signal ld_sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_q_to_divR_uid524_fpTanXComp_uid157_fpTanTest_c_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_e_q : std_logic_vector (0 downto 0);
    signal ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b_q : std_logic_vector (67 downto 0);
    signal ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b_q : std_logic_vector (59 downto 0);
    signal ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b_q : std_logic_vector (51 downto 0);
    signal ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_q : std_logic_vector (75 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a_q : std_logic_vector (12 downto 0);
    signal ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a_q : std_logic_vector (11 downto 0);
    signal ld_prod_uid191_rrx_uid34_fpTanTest_a2_b0_q_to_prod_uid191_rrx_uid34_fpTanTest_align_2_a_q : std_logic_vector (53 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_b_to_reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_b_to_reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a_q : std_logic_vector (12 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_cosXIsOneXRR_uid43_fpTanTest_n_to_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_a_q : std_logic_vector (0 downto 0);
    signal ld_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b_to_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_a_q : std_logic_vector (8 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_reset0 : std_logic;
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_sticky_ena_q : signal is true;
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_sticky_ena_q : signal is true;
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_reset0 : std_logic;
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_eq : std_logic;
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_sticky_ena_q : signal is true;
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_reset0 : std_logic;
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_sticky_ena_q : signal is true;
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_reset0 : std_logic;
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_sticky_ena_q : signal is true;
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_reset0 : std_logic;
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_eq : std_logic;
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_sticky_ena_q : signal is true;
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_reset0 : std_logic;
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_sticky_ena_q : signal is true;
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_sticky_ena_q : signal is true;
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_reset0 : std_logic;
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_sticky_ena_q : signal is true;
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_reset0 : std_logic;
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_sticky_ena_q : signal is true;
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_reset0 : std_logic;
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_sticky_ena_q : signal is true;
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_inputreg_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_reset0 : std_logic;
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_ia : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_iq : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_sticky_ena_q : signal is true;
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_inputreg_q : std_logic_vector (64 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_reset0 : std_logic;
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_ia : std_logic_vector (64 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_iq : std_logic_vector (64 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_q : std_logic_vector (64 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_sticky_ena_q : signal is true;
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_inputreg_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_reset0 : std_logic;
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_ia : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_iq : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_sticky_ena_q : signal is true;
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_inputreg_q : std_logic_vector (64 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_reset0 : std_logic;
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_ia : std_logic_vector (64 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_iq : std_logic_vector (64 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_q : std_logic_vector (64 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_sticky_ena_q : signal is true;
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_reset0 : std_logic;
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_eq : std_logic;
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q : signal is true;
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_reset0 : std_logic;
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_sticky_ena_q : signal is true;
    signal ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q : std_logic_vector (67 downto 0);
    signal ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q : std_logic_vector (59 downto 0);
    signal ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q : std_logic_vector (51 downto 0);
    signal ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_inputreg_q : std_logic_vector (75 downto 0);
    signal ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a_inputreg_q : std_logic_vector (11 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_sticky_ena_q : signal is true;
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_sticky_ena_q : signal is true;
    signal ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_reset0 : std_logic;
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_reset0 : std_logic;
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_eq : std_logic;
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_sticky_ena_q : signal is true;
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_inputreg_q : std_logic_vector (13 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_reset0 : std_logic;
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_ia : std_logic_vector (13 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_iq : std_logic_vector (13 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_q : std_logic_vector (13 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_sticky_ena_q : signal is true;
    signal yIsZero_uid51_fpTanTest_a : std_logic_vector(65 downto 0);
    signal yIsZero_uid51_fpTanTest_b : std_logic_vector(65 downto 0);
    signal yIsZero_uid51_fpTanTest_q : std_logic_vector(0 downto 0);
    signal pad_one_uid54_fpTanTest_q : std_logic_vector (66 downto 0);
    signal cmpYToOneMinusY_uid56_fpTanTest_a : std_logic_vector(70 downto 0);
    signal cmpYToOneMinusY_uid56_fpTanTest_b : std_logic_vector(70 downto 0);
    signal cmpYToOneMinusY_uid56_fpTanTest_o : std_logic_vector (70 downto 0);
    signal cmpYToOneMinusY_uid56_fpTanTest_cin : std_logic_vector (0 downto 0);
    signal cmpYToOneMinusY_uid56_fpTanTest_c : std_logic_vector (0 downto 0);
    signal expUdf_uid495_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(13 downto 0);
    signal expUdf_uid495_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(13 downto 0);
    signal expUdf_uid495_fpTanXComp_uid157_fpTanTest_o : std_logic_vector (13 downto 0);
    signal expUdf_uid495_fpTanXComp_uid157_fpTanTest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid495_fpTanXComp_uid157_fpTanTest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid498_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(13 downto 0);
    signal expOvf_uid498_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(13 downto 0);
    signal expOvf_uid498_fpTanXComp_uid157_fpTanTest_o : std_logic_vector (13 downto 0);
    signal expOvf_uid498_fpTanXComp_uid157_fpTanTest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid498_fpTanXComp_uid157_fpTanTest_n : std_logic_vector (0 downto 0);
    signal leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_q : std_logic_vector (67 downto 0);
    signal InvCmpYToOneMinusY_uid60_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvCmpYToOneMinusY_uid60_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvSinXIsX_uid126_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsX_uid126_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid147_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid147_fpTanTest_q : std_logic_vector(0 downto 0);
    signal lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (23 downto 0);
    signal rndOp_uid489_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (24 downto 0);
    signal oFracXRR_uid44_uid44_fpTanTest_q : std_logic_vector (53 downto 0);
    signal half_uid52_fpTanTest_q : std_logic_vector (65 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal exp_uid9_fpTanTest_in : std_logic_vector (30 downto 0);
    signal exp_uid9_fpTanTest_b : std_logic_vector (7 downto 0);
    signal frac_uid13_fpTanTest_in : std_logic_vector (22 downto 0);
    signal frac_uid13_fpTanTest_b : std_logic_vector (22 downto 0);
    signal signX_uid38_fpTanTest_in : std_logic_vector (31 downto 0);
    signal signX_uid38_fpTanTest_b : std_logic_vector (0 downto 0);
    signal expFracX_uid159_px_uid33_fpTanTest_in : std_logic_vector (30 downto 0);
    signal expFracX_uid159_px_uid33_fpTanTest_b : std_logic_vector (30 downto 0);
    signal expXIsZero_uid10_fpTanTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpTanTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpTanTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid12_fpTanTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpTanTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpTanTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid14_fpTanTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpTanTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpTanTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpTanTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpTanTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpTanTest_q : std_logic_vector(0 downto 0);
    signal sinXIsX_uid41_fpTanTest_a : std_logic_vector(10 downto 0);
    signal sinXIsX_uid41_fpTanTest_b : std_logic_vector(10 downto 0);
    signal sinXIsX_uid41_fpTanTest_o : std_logic_vector (10 downto 0);
    signal sinXIsX_uid41_fpTanTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsX_uid41_fpTanTest_n : std_logic_vector (0 downto 0);
    signal yIsHalf_uid53_fpTanTest_a : std_logic_vector(65 downto 0);
    signal yIsHalf_uid53_fpTanTest_b : std_logic_vector(65 downto 0);
    signal yIsHalf_uid53_fpTanTest_q : std_logic_vector(0 downto 0);
    signal oneMinusY_uid54_fpTanTest_a : std_logic_vector(67 downto 0);
    signal oneMinusY_uid54_fpTanTest_b : std_logic_vector(67 downto 0);
    signal oneMinusY_uid54_fpTanTest_o : std_logic_vector (67 downto 0);
    signal oneMinusY_uid54_fpTanTest_q : std_logic_vector (67 downto 0);
    signal zSin_uid59_fpTanTest_s : std_logic_vector (0 downto 0);
    signal zSin_uid59_fpTanTest_q : std_logic_vector (64 downto 0);
    signal zCos_uid63_fpTanTest_s : std_logic_vector (0 downto 0);
    signal zCos_uid63_fpTanTest_q : std_logic_vector (64 downto 0);
    signal expSinHC_uid73_fpTanTest_a : std_logic_vector(8 downto 0);
    signal expSinHC_uid73_fpTanTest_b : std_logic_vector(8 downto 0);
    signal expSinHC_uid73_fpTanTest_o : std_logic_vector (8 downto 0);
    signal expSinHC_uid73_fpTanTest_q : std_logic_vector (8 downto 0);
    signal expHardCase_uid77_fpTanTest_a : std_logic_vector(8 downto 0);
    signal expHardCase_uid77_fpTanTest_b : std_logic_vector(8 downto 0);
    signal expHardCase_uid77_fpTanTest_o : std_logic_vector (8 downto 0);
    signal expHardCase_uid77_fpTanTest_q : std_logic_vector (8 downto 0);
    signal excRNaN_uid116_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid116_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid116_fpTanTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExcSin_uid121_fpTanTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExcSin_uid121_fpTanTest_q : std_logic_vector (22 downto 0);
    signal expRPostExcSin_uid125_fpTanTest_s : std_logic_vector (1 downto 0);
    signal expRPostExcSin_uid125_fpTanTest_q : std_logic_vector (7 downto 0);
    signal yHalfCosNotONe_uid134_fpTanTest_a : std_logic_vector(0 downto 0);
    signal yHalfCosNotONe_uid134_fpTanTest_b : std_logic_vector(0 downto 0);
    signal yHalfCosNotONe_uid134_fpTanTest_c : std_logic_vector(0 downto 0);
    signal yHalfCosNotONe_uid134_fpTanTest_q : std_logic_vector(0 downto 0);
    signal rZeroOrCosOne_uid136_fpTanTest_a : std_logic_vector(0 downto 0);
    signal rZeroOrCosOne_uid136_fpTanTest_b : std_logic_vector(0 downto 0);
    signal rZeroOrCosOne_uid136_fpTanTest_c : std_logic_vector(0 downto 0);
    signal rZeroOrCosOne_uid136_fpTanTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExcCos_uid138_fpTanTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExcCos_uid138_fpTanTest_q : std_logic_vector (22 downto 0);
    signal expRPostExcCos_uid143_fpTanTest_s : std_logic_vector (1 downto 0);
    signal expRPostExcCos_uid143_fpTanTest_q : std_logic_vector (7 downto 0);
    signal signRCos_uid154_fpTanTest_a : std_logic_vector(0 downto 0);
    signal signRCos_uid154_fpTanTest_b : std_logic_vector(0 downto 0);
    signal signRCos_uid154_fpTanTest_q : std_logic_vector(0 downto 0);
    signal finalExp_uid202_rrx_uid34_fpTanTest_s : std_logic_vector (0 downto 0);
    signal finalExp_uid202_rrx_uid34_fpTanTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid242_lzcZSin_uid65_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid242_lzcZSin_uid65_fpTanTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid251_lzcZSin_uid65_fpTanTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid251_lzcZSin_uid65_fpTanTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid251_lzcZSin_uid65_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid254_lzcZSin_uid65_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid254_lzcZSin_uid65_fpTanTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid260_lzcZSin_uid65_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid260_lzcZSin_uid65_fpTanTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal vStagei_uid321_lzcZCos_uid68_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid321_lzcZCos_uid68_fpTanTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid330_lzcZCos_uid68_fpTanTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid330_lzcZCos_uid68_fpTanTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid330_lzcZCos_uid68_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid333_lzcZCos_uid68_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid333_lzcZCos_uid68_fpTanTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid339_lzcZCos_uid68_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid339_lzcZCos_uid68_fpTanTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal exc_R_uid450_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid450_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid450_fpTanXComp_uid157_fpTanTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid450_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid466_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid466_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid466_fpTanXComp_uid157_fpTanTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid466_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(35 downto 0);
    signal expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(35 downto 0);
    signal expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_o : std_logic_vector (35 downto 0);
    signal expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (34 downto 0);
    signal zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid503_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid503_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid503_fpTanXComp_uid157_fpTanTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid503_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_c : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excXIYR_uid507_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excXIYR_uid507_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excXIYR_uid507_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid508_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid508_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid508_fpTanXComp_uid157_fpTanTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid508_fpTanXComp_uid157_fpTanTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid508_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid511_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid511_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid511_fpTanXComp_uid157_fpTanTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid511_fpTanXComp_uid157_fpTanTest_d : std_logic_vector(0 downto 0);
    signal excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid513_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal extendedFracX_uid47_fpTanTest_q : std_logic_vector (67 downto 0);
    signal normBitSin_uid92_fpTanTest_in : std_logic_vector (51 downto 0);
    signal normBitSin_uid92_fpTanTest_b : std_logic_vector (0 downto 0);
    signal fracRSinPreRndHigh_uid94_fpTanTest_in : std_logic_vector (50 downto 0);
    signal fracRSinPreRndHigh_uid94_fpTanTest_b : std_logic_vector (23 downto 0);
    signal fracRSinPreRndLow_uid95_fpTanTest_in : std_logic_vector (49 downto 0);
    signal fracRSinPreRndLow_uid95_fpTanTest_b : std_logic_vector (23 downto 0);
    signal normBitCos_uid105_fpTanTest_in : std_logic_vector (51 downto 0);
    signal normBitCos_uid105_fpTanTest_b : std_logic_vector (0 downto 0);
    signal fracRCosPreRndHigh_uid107_fpTanTest_in : std_logic_vector (50 downto 0);
    signal fracRCosPreRndHigh_uid107_fpTanTest_b : std_logic_vector (23 downto 0);
    signal fracRCosPreRndLow_uid108_fpTanTest_in : std_logic_vector (49 downto 0);
    signal fracRCosPreRndLow_uid108_fpTanTest_b : std_logic_vector (23 downto 0);
    signal fracXRExt_uid200_rrx_uid34_fpTanTest_q : std_logic_vector (52 downto 0);
    signal leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (25 downto 0);
    signal leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_q : std_logic_vector (67 downto 0);
    signal cStage_uid234_lzcZSin_uid65_fpTanTest_q : std_logic_vector (63 downto 0);
    signal cStage_uid313_lzcZCos_uid68_fpTanTest_q : std_logic_vector (63 downto 0);
    signal leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal vStagei_uid315_lzcZCos_uid68_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid315_lzcZCos_uid68_fpTanTest_q : std_logic_vector (63 downto 0);
    signal prodXYTruncFR_uid587_pT1_uid400_polyEvalsinPiZ_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid587_pT1_uid400_polyEvalsinPiZ_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid590_pT2_uid406_polyEvalsinPiZ_in : std_logic_vector (37 downto 0);
    signal prodXYTruncFR_uid590_pT2_uid406_polyEvalsinPiZ_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid593_pT1_uid413_polyEvalcosPiZ_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid593_pT1_uid413_polyEvalcosPiZ_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid596_pT2_uid419_polyEvalcosPiZ_in : std_logic_vector (37 downto 0);
    signal prodXYTruncFR_uid596_pT2_uid419_polyEvalcosPiZ_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid618_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (49 downto 0);
    signal prodXYTruncFR_uid618_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid621_pT1_uid605_invPE_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid621_pT1_uid605_invPE_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid624_pT2_uid611_invPE_in : std_logic_vector (36 downto 0);
    signal prodXYTruncFR_uid624_pT2_uid611_invPE_b : std_logic_vector (23 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_align_0_q_int : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_align_0_q : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_align_1_q_int : std_logic_vector (80 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_align_1_q : std_logic_vector (80 downto 0);
    signal os_uid189_rrx_uid34_fpTanTest_q : std_logic_vector (77 downto 0);
    signal finalFrac_uid201_rrx_uid34_fpTanTest_s : std_logic_vector (0 downto 0);
    signal finalFrac_uid201_rrx_uid34_fpTanTest_q : std_logic_vector (52 downto 0);
    signal leftShiftStage1_uid227_fxpX_uid48_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid227_fxpX_uid48_fpTanTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal join_uid98_fpTanTest_q : std_logic_vector (1 downto 0);
    signal join_uid137_fpTanTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal join_uid139_fpTanTest_q : std_logic_vector (2 downto 0);
    signal zSinYBottom_uid58_fpTanTest_in : std_logic_vector (64 downto 0);
    signal zSinYBottom_uid58_fpTanTest_b : std_logic_vector (64 downto 0);
    signal zSinOMyBottom_uid57_fpTanTest_in : std_logic_vector (64 downto 0);
    signal zSinOMyBottom_uid57_fpTanTest_b : std_logic_vector (64 downto 0);
    signal excSelBitsSin_uid117_fpTanTest_q : std_logic_vector (2 downto 0);
    signal expSelBitsCos_uid140_fpTanTest_q : std_logic_vector (3 downto 0);
    signal fpSin_uid130_fpTanTest_q : std_logic_vector (31 downto 0);
    signal fpCos_uid155_fpTanTest_q : std_logic_vector (31 downto 0);
    signal RRangeRed_uid203_rrx_uid34_fpTanTest_q : std_logic_vector (61 downto 0);
    signal vStagei_uid236_lzcZSin_uid65_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid236_lzcZSin_uid65_fpTanTest_q : std_logic_vector (63 downto 0);
    signal divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_s : std_logic_vector (0 downto 0);
    signal divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (25 downto 0);
    signal concExc_uid512_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (2 downto 0);
    signal divR_uid524_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (31 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_align_2_q_int : std_logic_vector (107 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_align_2_q : std_logic_vector (107 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_a : std_logic_vector(6 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_b : std_logic_vector(6 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_q : std_logic_vector(0 downto 0);
    signal fracX_uid180_rrx_uid34_fpTanTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid180_rrx_uid34_fpTanTest_b : std_logic_vector (22 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_q : std_logic_vector(0 downto 0);
    signal oFracXRRSmallXRR_uid89_fpTanTest_in : std_logic_vector (53 downto 0);
    signal oFracXRRSmallXRR_uid89_fpTanTest_b : std_logic_vector (25 downto 0);
    signal R_uid160_px_uid33_fpTanTest_q : std_logic_vector (31 downto 0);
    signal InvFracXIsZero_uid16_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid16_fpTanTest_q : std_logic_vector(0 downto 0);
    signal addr_uid80_fpTanTest_in : std_logic_vector (64 downto 0);
    signal addr_uid80_fpTanTest_b : std_logic_vector (7 downto 0);
    signal zPsinPiZ_uid83_fpTanTest_in : std_logic_vector (56 downto 0);
    signal zPsinPiZ_uid83_fpTanTest_b : std_logic_vector (14 downto 0);
    signal rVStage_uid230_lzcZSin_uid65_fpTanTest_in : std_logic_vector (64 downto 0);
    signal rVStage_uid230_lzcZSin_uid65_fpTanTest_b : std_logic_vector (63 downto 0);
    signal vStage_uid233_lzcZSin_uid65_fpTanTest_in : std_logic_vector (0 downto 0);
    signal vStage_uid233_lzcZSin_uid65_fpTanTest_b : std_logic_vector (0 downto 0);
    signal X32dto0_uid274_alignedZSin_uid66_fpTanTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid274_alignedZSin_uid66_fpTanTest_b : std_logic_vector (32 downto 0);
    signal addr_uid82_fpTanTest_in : std_logic_vector (64 downto 0);
    signal addr_uid82_fpTanTest_b : std_logic_vector (7 downto 0);
    signal zPcosPiZ_uid86_fpTanTest_in : std_logic_vector (56 downto 0);
    signal zPcosPiZ_uid86_fpTanTest_b : std_logic_vector (14 downto 0);
    signal rVStage_uid309_lzcZCos_uid68_fpTanTest_in : std_logic_vector (64 downto 0);
    signal rVStage_uid309_lzcZCos_uid68_fpTanTest_b : std_logic_vector (63 downto 0);
    signal vStage_uid312_lzcZCos_uid68_fpTanTest_in : std_logic_vector (0 downto 0);
    signal vStage_uid312_lzcZCos_uid68_fpTanTest_b : std_logic_vector (0 downto 0);
    signal X32dto0_uid353_alignedZCos_uid69_fpTanTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid353_alignedZCos_uid69_fpTanTest_b : std_logic_vector (32 downto 0);
    signal expSinHCR_uid74_fpTanTest_in : std_logic_vector (7 downto 0);
    signal expSinHCR_uid74_fpTanTest_b : std_logic_vector (7 downto 0);
    signal expPCos_uid78_fpTanTest_in : std_logic_vector (7 downto 0);
    signal expPCos_uid78_fpTanTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid244_lzcZSin_uid65_fpTanTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid244_lzcZSin_uid65_fpTanTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid246_lzcZSin_uid65_fpTanTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid246_lzcZSin_uid65_fpTanTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid256_lzcZSin_uid65_fpTanTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid256_lzcZSin_uid65_fpTanTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid258_lzcZSin_uid65_fpTanTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid258_lzcZSin_uid65_fpTanTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid262_lzcZSin_uid65_fpTanTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid262_lzcZSin_uid65_fpTanTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid264_lzcZSin_uid65_fpTanTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid264_lzcZSin_uid65_fpTanTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_in : std_logic_vector (62 downto 0);
    signal LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_b : std_logic_vector (62 downto 0);
    signal LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_in : std_logic_vector (60 downto 0);
    signal LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_b : std_logic_vector (60 downto 0);
    signal LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_in : std_logic_vector (58 downto 0);
    signal LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_b : std_logic_vector (58 downto 0);
    signal rVStage_uid323_lzcZCos_uid68_fpTanTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid323_lzcZCos_uid68_fpTanTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid325_lzcZCos_uid68_fpTanTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid325_lzcZCos_uid68_fpTanTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid335_lzcZCos_uid68_fpTanTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid335_lzcZCos_uid68_fpTanTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid337_lzcZCos_uid68_fpTanTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid337_lzcZCos_uid68_fpTanTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid341_lzcZCos_uid68_fpTanTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid341_lzcZCos_uid68_fpTanTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid343_lzcZCos_uid68_fpTanTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid343_lzcZCos_uid68_fpTanTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_in : std_logic_vector (62 downto 0);
    signal LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_b : std_logic_vector (62 downto 0);
    signal LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_in : std_logic_vector (60 downto 0);
    signal LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_b : std_logic_vector (60 downto 0);
    signal LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_in : std_logic_vector (58 downto 0);
    signal LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_b : std_logic_vector (58 downto 0);
    signal fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (22 downto 0);
    signal excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (31 downto 0);
    signal excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (7 downto 0);
    signal expRExt_uid494_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (34 downto 0);
    signal expRExt_uid494_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (10 downto 0);
    signal InvExcRNaN_uid522_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid522_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid543_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid543_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid553_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid553_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage174dto0_uid581_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (74 downto 0);
    signal LeftShiftStage174dto0_uid581_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (74 downto 0);
    signal X63dto0_uid207_fxpX_uid48_fpTanTest_in : std_logic_vector (63 downto 0);
    signal X63dto0_uid207_fxpX_uid48_fpTanTest_b : std_logic_vector (63 downto 0);
    signal X59dto0_uid210_fxpX_uid48_fpTanTest_in : std_logic_vector (59 downto 0);
    signal X59dto0_uid210_fxpX_uid48_fpTanTest_b : std_logic_vector (59 downto 0);
    signal X55dto0_uid213_fxpX_uid48_fpTanTest_in : std_logic_vector (55 downto 0);
    signal X55dto0_uid213_fxpX_uid48_fpTanTest_b : std_logic_vector (55 downto 0);
    signal fracRSinPreRnd_uid96_fpTanTest_s : std_logic_vector (0 downto 0);
    signal fracRSinPreRnd_uid96_fpTanTest_q : std_logic_vector (23 downto 0);
    signal fracRCosPreRnd_uid109_fpTanTest_s : std_logic_vector (0 downto 0);
    signal fracRCosPreRnd_uid109_fpTanTest_q : std_logic_vector (23 downto 0);
    signal cosRndOp_uid111_uid112_fpTanTest_q : std_logic_vector (24 downto 0);
    signal rVStage_uid317_lzcZCos_uid68_fpTanTest_in : std_logic_vector (63 downto 0);
    signal rVStage_uid317_lzcZCos_uid68_fpTanTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid319_lzcZCos_uid68_fpTanTest_in : std_logic_vector (31 downto 0);
    signal vStage_uid319_lzcZCos_uid68_fpTanTest_b : std_logic_vector (31 downto 0);
    signal lowRangeB_uid401_polyEvalsinPiZ_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid401_polyEvalsinPiZ_b : std_logic_vector (0 downto 0);
    signal highBBits_uid402_polyEvalsinPiZ_in : std_logic_vector (13 downto 0);
    signal highBBits_uid402_polyEvalsinPiZ_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid407_polyEvalsinPiZ_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid407_polyEvalsinPiZ_b : std_logic_vector (1 downto 0);
    signal highBBits_uid408_polyEvalsinPiZ_in : std_logic_vector (23 downto 0);
    signal highBBits_uid408_polyEvalsinPiZ_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid414_polyEvalcosPiZ_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid414_polyEvalcosPiZ_b : std_logic_vector (0 downto 0);
    signal highBBits_uid415_polyEvalcosPiZ_in : std_logic_vector (13 downto 0);
    signal highBBits_uid415_polyEvalcosPiZ_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid420_polyEvalcosPiZ_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid420_polyEvalcosPiZ_b : std_logic_vector (1 downto 0);
    signal highBBits_uid421_polyEvalcosPiZ_in : std_logic_vector (23 downto 0);
    signal highBBits_uid421_polyEvalcosPiZ_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid606_invPE_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid606_invPE_b : std_logic_vector (0 downto 0);
    signal highBBits_uid607_invPE_in : std_logic_vector (12 downto 0);
    signal highBBits_uid607_invPE_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid612_invPE_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid612_invPE_b : std_logic_vector (1 downto 0);
    signal highBBits_uid613_invPE_in : std_logic_vector (23 downto 0);
    signal highBBits_uid613_invPE_b : std_logic_vector (21 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a_0_in : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a_0_b : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a_1_in : std_logic_vector (53 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a_1_b : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a_2_in : std_logic_vector (80 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_a_2_b : std_logic_vector (26 downto 0);
    signal intXParity_uid49_fpTanTest_in : std_logic_vector (67 downto 0);
    signal intXParity_uid49_fpTanTest_b : std_logic_vector (0 downto 0);
    signal y_uid50_fpTanTest_in : std_logic_vector (66 downto 0);
    signal y_uid50_fpTanTest_b : std_logic_vector (65 downto 0);
    signal LeftShiftStage263dto0_uid303_alignedZSin_uid66_fpTanTest_in : std_logic_vector (63 downto 0);
    signal LeftShiftStage263dto0_uid303_alignedZSin_uid66_fpTanTest_b : std_logic_vector (63 downto 0);
    signal sinRndOp_uid99_uid100_fpTanTest_q : std_logic_vector (25 downto 0);
    signal LeftShiftStage263dto0_uid382_alignedZCos_uid69_fpTanTest_in : std_logic_vector (63 downto 0);
    signal LeftShiftStage263dto0_uid382_alignedZCos_uid69_fpTanTest_b : std_logic_vector (63 downto 0);
    signal expX_uid428_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (30 downto 0);
    signal expX_uid428_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid429_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid429_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (22 downto 0);
    signal signX_uid430_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (31 downto 0);
    signal signX_uid430_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (0 downto 0);
    signal expY_uid431_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (30 downto 0);
    signal expY_uid431_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (7 downto 0);
    signal fracY_uid432_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid432_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (22 downto 0);
    signal signY_uid433_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (31 downto 0);
    signal signY_uid433_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (0 downto 0);
    signal fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (22 downto 0);
    signal fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (8 downto 0);
    signal yPE_uid472_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (13 downto 0);
    signal yPE_uid472_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (13 downto 0);
    signal expXRR_uid39_fpTanTest_in : std_logic_vector (60 downto 0);
    signal expXRR_uid39_fpTanTest_b : std_logic_vector (7 downto 0);
    signal fracXRR_uid40_fpTanTest_in : std_logic_vector (52 downto 0);
    signal fracXRR_uid40_fpTanTest_b : std_logic_vector (52 downto 0);
    signal rVStage_uid238_lzcZSin_uid65_fpTanTest_in : std_logic_vector (63 downto 0);
    signal rVStage_uid238_lzcZSin_uid65_fpTanTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid240_lzcZSin_uid65_fpTanTest_in : std_logic_vector (31 downto 0);
    signal vStage_uid240_lzcZSin_uid65_fpTanTest_b : std_logic_vector (31 downto 0);
    signal norm_uid483_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (25 downto 0);
    signal norm_uid483_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (0 downto 0);
    signal divValPreNormHigh_uid484_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (24 downto 0);
    signal divValPreNormHigh_uid484_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (23 downto 0);
    signal divValPreNormLow_uid485_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (23 downto 0);
    signal divValPreNormLow_uid485_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (23 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_a : std_logic_vector(108 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_b : std_logic_vector(108 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_o : std_logic_vector (108 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_q : std_logic_vector (108 downto 0);
    signal oFracX_uid190_uid190_rrx_uid34_fpTanTest_q : std_logic_vector (23 downto 0);
    signal expX_uid179_rrx_uid34_fpTanTest_in : std_logic_vector (30 downto 0);
    signal expX_uid179_rrx_uid34_fpTanTest_b : std_logic_vector (7 downto 0);
    signal exc_N_uid17_fpTanTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpTanTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpTanTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid399_polyEvalsinPiZ_in : std_logic_vector (14 downto 0);
    signal yT1_uid399_polyEvalsinPiZ_b : std_logic_vector (12 downto 0);
    signal yT1_uid412_polyEvalcosPiZ_in : std_logic_vector (14 downto 0);
    signal yT1_uid412_polyEvalcosPiZ_b : std_logic_vector (12 downto 0);
    signal vCount_uid245_lzcZSin_uid65_fpTanTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid245_lzcZSin_uid65_fpTanTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid245_lzcZSin_uid65_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid248_lzcZSin_uid65_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid248_lzcZSin_uid65_fpTanTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid263_lzcZSin_uid65_fpTanTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid263_lzcZSin_uid65_fpTanTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid263_lzcZSin_uid65_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid266_lzcZSin_uid65_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid266_lzcZSin_uid65_fpTanTest_q : std_logic_vector (1 downto 0);
    signal vCount_uid324_lzcZCos_uid68_fpTanTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid324_lzcZCos_uid68_fpTanTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid324_lzcZCos_uid68_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid327_lzcZCos_uid68_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid327_lzcZCos_uid68_fpTanTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid342_lzcZCos_uid68_fpTanTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid342_lzcZCos_uid68_fpTanTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid342_lzcZCos_uid68_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid345_lzcZCos_uid68_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid345_lzcZCos_uid68_fpTanTest_q : std_logic_vector (1 downto 0);
    signal sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage2Idx1_uid582_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0Idx1_uid208_fxpX_uid48_fpTanTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage0Idx2_uid211_fxpX_uid48_fpTanTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage0Idx3_uid214_fxpX_uid48_fpTanTest_q : std_logic_vector (67 downto 0);
    signal expFracRSinPreRnd_uid97_uid97_fpTanTest_q : std_logic_vector (31 downto 0);
    signal expFracRCosPreRnd_uid110_uid110_fpTanTest_q : std_logic_vector (31 downto 0);
    signal expFracRCos_uid113_fpTanTest_a : std_logic_vector(32 downto 0);
    signal expFracRCos_uid113_fpTanTest_b : std_logic_vector(32 downto 0);
    signal expFracRCos_uid113_fpTanTest_o : std_logic_vector (32 downto 0);
    signal expFracRCos_uid113_fpTanTest_q : std_logic_vector (32 downto 0);
    signal sumAHighB_uid403_polyEvalsinPiZ_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid403_polyEvalsinPiZ_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid403_polyEvalsinPiZ_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid403_polyEvalsinPiZ_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid409_polyEvalsinPiZ_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid409_polyEvalsinPiZ_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid409_polyEvalsinPiZ_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid409_polyEvalsinPiZ_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid416_polyEvalcosPiZ_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid416_polyEvalcosPiZ_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid416_polyEvalcosPiZ_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid416_polyEvalcosPiZ_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid422_polyEvalcosPiZ_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid422_polyEvalcosPiZ_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid422_polyEvalcosPiZ_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid422_polyEvalcosPiZ_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid608_invPE_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid608_invPE_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid608_invPE_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid608_invPE_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid614_invPE_a : std_logic_vector(31 downto 0);
    signal sumAHighB_uid614_invPE_b : std_logic_vector(31 downto 0);
    signal sumAHighB_uid614_invPE_o : std_logic_vector (31 downto 0);
    signal sumAHighB_uid614_invPE_q : std_logic_vector (31 downto 0);
    signal signComp_uid128_fpTanTest_a : std_logic_vector(0 downto 0);
    signal signComp_uid128_fpTanTest_b : std_logic_vector(0 downto 0);
    signal signComp_uid128_fpTanTest_c : std_logic_vector(0 downto 0);
    signal signComp_uid128_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvIntXParity_uid151_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvIntXParity_uid151_fpTanTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage3Idx1_uid304_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal expFracRSin_uid101_fpTanTest_a : std_logic_vector(32 downto 0);
    signal expFracRSin_uid101_fpTanTest_b : std_logic_vector(32 downto 0);
    signal expFracRSin_uid101_fpTanTest_o : std_logic_vector (32 downto 0);
    signal expFracRSin_uid101_fpTanTest_q : std_logic_vector (32 downto 0);
    signal leftShiftStage3Idx1_uid383_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal fracYZero_uid434_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(22 downto 0);
    signal fracYZero_uid434_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(22 downto 0);
    signal fracYZero_uid434_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid604_invPE_in : std_logic_vector (13 downto 0);
    signal yT1_uid604_invPE_b : std_logic_vector (11 downto 0);
    signal sinXIsXRR_uid42_fpTanTest_a : std_logic_vector(11 downto 0);
    signal sinXIsXRR_uid42_fpTanTest_b : std_logic_vector(11 downto 0);
    signal sinXIsXRR_uid42_fpTanTest_o : std_logic_vector (11 downto 0);
    signal sinXIsXRR_uid42_fpTanTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsXRR_uid42_fpTanTest_n : std_logic_vector (0 downto 0);
    signal cosXIsOneXRR_uid43_fpTanTest_a : std_logic_vector(11 downto 0);
    signal cosXIsOneXRR_uid43_fpTanTest_b : std_logic_vector(11 downto 0);
    signal cosXIsOneXRR_uid43_fpTanTest_o : std_logic_vector (11 downto 0);
    signal cosXIsOneXRR_uid43_fpTanTest_cin : std_logic_vector (0 downto 0);
    signal cosXIsOneXRR_uid43_fpTanTest_n : std_logic_vector (0 downto 0);
    signal fxpXShiftValExt_uid45_fpTanTest_a : std_logic_vector(10 downto 0);
    signal fxpXShiftValExt_uid45_fpTanTest_b : std_logic_vector(10 downto 0);
    signal fxpXShiftValExt_uid45_fpTanTest_o : std_logic_vector (10 downto 0);
    signal fxpXShiftValExt_uid45_fpTanTest_q : std_logic_vector (9 downto 0);
    signal normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_s : std_logic_vector (0 downto 0);
    signal normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (23 downto 0);
    signal multFracBits_uid192_rrx_uid34_fpTanTest_in : std_logic_vector (75 downto 0);
    signal multFracBits_uid192_rrx_uid34_fpTanTest_b : std_logic_vector (75 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_b_0_in : std_logic_vector (26 downto 0);
    signal prod_uid191_rrx_uid34_fpTanTest_b_0_b : std_logic_vector (26 downto 0);
    signal expXTableAddrExt_uid185_rrx_uid34_fpTanTest_a : std_logic_vector(8 downto 0);
    signal expXTableAddrExt_uid185_rrx_uid34_fpTanTest_b : std_logic_vector(8 downto 0);
    signal expXTableAddrExt_uid185_rrx_uid34_fpTanTest_o : std_logic_vector (8 downto 0);
    signal expXTableAddrExt_uid185_rrx_uid34_fpTanTest_q : std_logic_vector (8 downto 0);
    signal rVStage_uid250_lzcZSin_uid65_fpTanTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid250_lzcZSin_uid65_fpTanTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid252_lzcZSin_uid65_fpTanTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid252_lzcZSin_uid65_fpTanTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid268_lzcZSin_uid65_fpTanTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid268_lzcZSin_uid65_fpTanTest_b : std_logic_vector (0 downto 0);
    signal rVStage_uid329_lzcZCos_uid68_fpTanTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid329_lzcZCos_uid68_fpTanTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid331_lzcZCos_uid68_fpTanTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid331_lzcZCos_uid68_fpTanTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid347_lzcZCos_uid68_fpTanTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid347_lzcZCos_uid68_fpTanTest_b : std_logic_vector (0 downto 0);
    signal rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (1 downto 0);
    signal r_uid555_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector (4 downto 0);
    signal leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage0_uid216_fxpX_uid48_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q : std_logic_vector (67 downto 0);
    signal fracRCompCos_uid114_fpTanTest_in : std_logic_vector (23 downto 0);
    signal fracRCompCos_uid114_fpTanTest_b : std_logic_vector (22 downto 0);
    signal expRCompSin_uid115_fpTanTest_in : std_logic_vector (31 downto 0);
    signal expRCompSin_uid115_fpTanTest_b : std_logic_vector (7 downto 0);
    signal s1_uid401_uid404_polyEvalsinPiZ_q : std_logic_vector (22 downto 0);
    signal s2_uid407_uid410_polyEvalsinPiZ_q : std_logic_vector (32 downto 0);
    signal s1_uid414_uid417_polyEvalcosPiZ_q : std_logic_vector (22 downto 0);
    signal s2_uid420_uid423_polyEvalcosPiZ_q : std_logic_vector (32 downto 0);
    signal s1_uid606_uid609_invPE_q : std_logic_vector (22 downto 0);
    signal s2_uid612_uid615_invPE_q : std_logic_vector (33 downto 0);
    signal leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal fracRCompSin_uid102_fpTanTest_in : std_logic_vector (23 downto 0);
    signal fracRCompSin_uid102_fpTanTest_b : std_logic_vector (22 downto 0);
    signal expRCompSin_uid103_fpTanTest_in : std_logic_vector (31 downto 0);
    signal expRCompSin_uid103_fpTanTest_b : std_logic_vector (7 downto 0);
    signal leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal exc_I_uid444_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid444_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid444_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid445_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid445_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid460_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid460_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid460_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid461_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid461_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal cosOne_uid144_fpTanTest_a : std_logic_vector(0 downto 0);
    signal cosOne_uid144_fpTanTest_b : std_logic_vector(0 downto 0);
    signal cosOne_uid144_fpTanTest_q : std_logic_vector(0 downto 0);
    signal fxpXShiftVal_uid46_fpTanTest_in : std_logic_vector (3 downto 0);
    signal fxpXShiftVal_uid46_fpTanTest_b : std_logic_vector (3 downto 0);
    signal expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_q : std_logic_vector (33 downto 0);
    signal multFracBitsTop_uid193_rrx_uid34_fpTanTest_in : std_logic_vector (75 downto 0);
    signal multFracBitsTop_uid193_rrx_uid34_fpTanTest_b : std_logic_vector (29 downto 0);
    signal X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (67 downto 0);
    signal X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (67 downto 0);
    signal X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (59 downto 0);
    signal X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (59 downto 0);
    signal X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (51 downto 0);
    signal X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (51 downto 0);
    signal expXTableAddr_uid186_rrx_uid34_fpTanTest_in : std_logic_vector (7 downto 0);
    signal expXTableAddr_uid186_rrx_uid34_fpTanTest_b : std_logic_vector (7 downto 0);
    signal vCount_uid269_lzcZSin_uid65_fpTanTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid269_lzcZSin_uid65_fpTanTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid269_lzcZSin_uid65_fpTanTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid348_lzcZCos_uid68_fpTanTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid348_lzcZCos_uid68_fpTanTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid348_lzcZCos_uid68_fpTanTest_q : std_logic_vector(0 downto 0);
    signal expCompOutExt_uid197_rrx_uid34_fpTanTest_a : std_logic_vector(8 downto 0);
    signal expCompOutExt_uid197_rrx_uid34_fpTanTest_b : std_logic_vector(8 downto 0);
    signal expCompOutExt_uid197_rrx_uid34_fpTanTest_o : std_logic_vector (8 downto 0);
    signal expCompOutExt_uid197_rrx_uid34_fpTanTest_q : std_logic_vector (8 downto 0);
    signal leftShiftStageSel4Dto3_uid567_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid567_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (0 downto 0);
    signal fracCompOut_uid196_rrx_uid34_fpTanTest_in : std_logic_vector (74 downto 0);
    signal fracCompOut_uid196_rrx_uid34_fpTanTest_b : std_logic_vector (52 downto 0);
    signal LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_in : std_logic_vector (66 downto 0);
    signal LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_b : std_logic_vector (66 downto 0);
    signal LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_in : std_logic_vector (65 downto 0);
    signal LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_b : std_logic_vector (65 downto 0);
    signal LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_in : std_logic_vector (64 downto 0);
    signal LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_b : std_logic_vector (64 downto 0);
    signal polyEvalSigsinPiZ_uid85_fpTanTest_in : std_logic_vector (30 downto 0);
    signal polyEvalSigsinPiZ_uid85_fpTanTest_b : std_logic_vector (25 downto 0);
    signal polyEvalSigcosPiZ_uid88_fpTanTest_in : std_logic_vector (30 downto 0);
    signal polyEvalSigcosPiZ_uid88_fpTanTest_b : std_logic_vector (25 downto 0);
    signal invY_uid474_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (30 downto 0);
    signal invY_uid474_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (25 downto 0);
    signal invYO_uid475_fpTanXComp_uid157_fpTanTest_in : std_logic_vector (31 downto 0);
    signal invYO_uid475_fpTanXComp_uid157_fpTanTest_b : std_logic_vector (0 downto 0);
    signal pHigh_uid71_fpTanTest_in : std_logic_vector (64 downto 0);
    signal pHigh_uid71_fpTanTest_b : std_logic_vector (25 downto 0);
    signal pCos_uid76_fpTanTest_in : std_logic_vector (64 downto 0);
    signal pCos_uid76_fpTanTest_b : std_logic_vector (25 downto 0);
    signal exc_N_uid446_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid446_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid446_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid462_fpTanXComp_uid157_fpTanTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid462_fpTanXComp_uid157_fpTanTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid462_fpTanXComp_uid157_fpTanTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_b : std_logic_vector (1 downto 0);
    signal rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (29 downto 0);
    signal rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid530_zCount_uid194_rrx_uid34_fpTanTest_in : std_logic_vector (13 downto 0);
    signal vStage_uid530_zCount_uid194_rrx_uid34_fpTanTest_b : std_logic_vector (13 downto 0);
    signal r_uid270_lzcZSin_uid65_fpTanTest_q : std_logic_vector (6 downto 0);
    signal r_uid349_lzcZCos_uid68_fpTanTest_q : std_logic_vector (6 downto 0);
    signal expCompOut_uid198_rrx_uid34_fpTanTest_in : std_logic_vector (7 downto 0);
    signal expCompOut_uid198_rrx_uid34_fpTanTest_b : std_logic_vector (7 downto 0);
    signal leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_q : std_logic_vector (15 downto 0);
    signal leftShiftStageSel6Dto5_uid278_alignedZSin_uid66_fpTanTest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid278_alignedZSin_uid66_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_b : std_logic_vector (0 downto 0);
    signal leftShiftStageSel6Dto5_uid357_alignedZCos_uid69_fpTanTest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid357_alignedZCos_uid69_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage073dto0_uid570_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (73 downto 0);
    signal LeftShiftStage073dto0_uid570_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (73 downto 0);
    signal LeftShiftStage071dto0_uid573_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (71 downto 0);
    signal LeftShiftStage071dto0_uid573_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (71 downto 0);
    signal LeftShiftStage069dto0_uid576_normMult_uid195_rrx_uid34_fpTanTest_in : std_logic_vector (69 downto 0);
    signal LeftShiftStage069dto0_uid576_normMult_uid195_rrx_uid34_fpTanTest_b : std_logic_vector (69 downto 0);
    signal leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_q : std_logic_vector (75 downto 0);
    signal LeftShiftStage056dto0_uid281_alignedZSin_uid66_fpTanTest_in : std_logic_vector (56 downto 0);
    signal LeftShiftStage056dto0_uid281_alignedZSin_uid66_fpTanTest_b : std_logic_vector (56 downto 0);
    signal LeftShiftStage048dto0_uid284_alignedZSin_uid66_fpTanTest_in : std_logic_vector (48 downto 0);
    signal LeftShiftStage048dto0_uid284_alignedZSin_uid66_fpTanTest_b : std_logic_vector (48 downto 0);
    signal LeftShiftStage040dto0_uid287_alignedZSin_uid66_fpTanTest_in : std_logic_vector (40 downto 0);
    signal LeftShiftStage040dto0_uid287_alignedZSin_uid66_fpTanTest_b : std_logic_vector (40 downto 0);
    signal LeftShiftStage056dto0_uid360_alignedZCos_uid69_fpTanTest_in : std_logic_vector (56 downto 0);
    signal LeftShiftStage056dto0_uid360_alignedZCos_uid69_fpTanTest_b : std_logic_vector (56 downto 0);
    signal LeftShiftStage048dto0_uid363_alignedZCos_uid69_fpTanTest_in : std_logic_vector (48 downto 0);
    signal LeftShiftStage048dto0_uid363_alignedZCos_uid69_fpTanTest_b : std_logic_vector (48 downto 0);
    signal LeftShiftStage040dto0_uid366_alignedZCos_uid69_fpTanTest_in : std_logic_vector (40 downto 0);
    signal LeftShiftStage040dto0_uid366_alignedZCos_uid69_fpTanTest_b : std_logic_vector (40 downto 0);
    signal leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_q : std_logic_vector (64 downto 0);
begin


	--xIn(GPIN,3)@0

	--cstAllZWF_uid7_fpTanTest(CONSTANT,6)
    cstAllZWF_uid7_fpTanTest_q <= "00000000000000000000000";

	--GND(CONSTANT,0)
    GND_q <= "0";

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable(LOGICAL,1538)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_a <= en;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q <= not ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_a;

	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor(LOGICAL,1678)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_b <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_sticky_ena_q;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_q <= not (ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_a or ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_b);

	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_mem_top(CONSTANT,1674)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_mem_top_q <= "01010";

	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp(LOGICAL,1675)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_a <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_mem_top_q;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_q);
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_q <= "1" when ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_a = ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_b else "0";

	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmpReg(REG,1676)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmpReg_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_sticky_ena(REG,1679)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_nor_q = "1") THEN
                ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_sticky_ena_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd(LOGICAL,1680)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_a <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_sticky_ena_q;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_b <= en;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_a and ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_b;

	--expFracX_uid159_px_uid33_fpTanTest(BITSELECT,158)@0
    expFracX_uid159_px_uid33_fpTanTest_in <= a(30 downto 0);
    expFracX_uid159_px_uid33_fpTanTest_b <= expFracX_uid159_px_uid33_fpTanTest_in(30 downto 0);

	--R_uid160_px_uid33_fpTanTest(BITJOIN,159)@0
    R_uid160_px_uid33_fpTanTest_q <= GND_q & expFracX_uid159_px_uid33_fpTanTest_b;

	--expX_uid179_rrx_uid34_fpTanTest(BITSELECT,178)@0
    expX_uid179_rrx_uid34_fpTanTest_in <= R_uid160_px_uid33_fpTanTest_q(30 downto 0);
    expX_uid179_rrx_uid34_fpTanTest_b <= expX_uid179_rrx_uid34_fpTanTest_in(30 downto 23);

	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_inputreg(DELAY,1668)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid179_rrx_uid34_fpTanTest_b, xout => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt(COUNTER,1670)
    -- every=1, low=0, high=10, step=1, init=1
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_i = 9 THEN
                      ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_i <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_i - 10;
                    ELSE
                        ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_i <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_i,4));


	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg(REG,1671)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux(MUX,1672)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_s <= en;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux: PROCESS (ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_s, ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg_q, ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem(DUALMEM,1669)
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_ia <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_inputreg_q;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_aa <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg_q;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_ab <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_q;
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 8,
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
        clocken1 => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_iq,
        address_a => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_aa,
        data_a => ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_ia
    );
    ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_reset0 <= areset;
        ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_iq(7 downto 0);

	--zs_uid243_lzcZSin_uid65_fpTanTest(CONSTANT,242)
    zs_uid243_lzcZSin_uid65_fpTanTest_q <= "0000000000000000";

	--ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor(LOGICAL,1652)
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_b <= ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_sticky_ena_q;
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_q <= not (ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_a or ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_b);

	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg(REG,1574)
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_sticky_ena(REG,1653)
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_nor_q = "1") THEN
                ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_sticky_ena_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd(LOGICAL,1654)
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_a <= ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_sticky_ena_q;
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_b <= en;
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_q <= ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_a and ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_b;

	--ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_inputreg(DELAY,1644)
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => R_uid160_px_uid33_fpTanTest_q, xout => ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt(COUNTER,1570)
    -- every=1, low=0, high=1, step=1, init=1
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_i <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_i,1));


	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg(REG,1571)
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux(MUX,1572)
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_s <= en;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux: PROCESS (ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_s, ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q, ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q;
                  WHEN "1" => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem(DUALMEM,1645)
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_ia <= ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_inputreg_q;
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_aa <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q;
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_ab <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q;
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
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
        clocken1 => ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_iq,
        address_a => ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_aa,
        data_a => ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_ia
    );
    ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_reset0 <= areset;
        ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_q <= ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_iq(31 downto 0);

	--fracX_uid180_rrx_uid34_fpTanTest(BITSELECT,179)@4
    fracX_uid180_rrx_uid34_fpTanTest_in <= ld_R_uid160_px_uid33_fpTanTest_q_to_fracX_uid180_rrx_uid34_fpTanTest_a_replace_mem_q(22 downto 0);
    fracX_uid180_rrx_uid34_fpTanTest_b <= fracX_uid180_rrx_uid34_fpTanTest_in(22 downto 0);

	--oFracX_uid190_uid190_rrx_uid34_fpTanTest(BITJOIN,189)@4
    oFracX_uid190_uid190_rrx_uid34_fpTanTest_q <= VCC_q & fracX_uid180_rrx_uid34_fpTanTest_b;

	--prod_uid191_rrx_uid34_fpTanTest_b_0(BITSELECT,630)@4
    prod_uid191_rrx_uid34_fpTanTest_b_0_in <= STD_LOGIC_VECTOR("000" & oFracX_uid190_uid190_rrx_uid34_fpTanTest_q);
    prod_uid191_rrx_uid34_fpTanTest_b_0_b <= prod_uid191_rrx_uid34_fpTanTest_b_0_in(26 downto 0);

	--reg_prod_uid191_rrx_uid34_fpTanTest_b_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_1(REG,654)@4
    reg_prod_uid191_rrx_uid34_fpTanTest_b_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid191_rrx_uid34_fpTanTest_b_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid191_rrx_uid34_fpTanTest_b_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_1_q <= prod_uid191_rrx_uid34_fpTanTest_b_0_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasMwShift_uid24_fpTanTest(CONSTANT,23)
    cstBiasMwShift_uid24_fpTanTest_q <= "01110011";

	--expXTableAddrExt_uid185_rrx_uid34_fpTanTest(SUB,184)@0
    expXTableAddrExt_uid185_rrx_uid34_fpTanTest_a <= STD_LOGIC_VECTOR("0" & expX_uid179_rrx_uid34_fpTanTest_b);
    expXTableAddrExt_uid185_rrx_uid34_fpTanTest_b <= STD_LOGIC_VECTOR("0" & cstBiasMwShift_uid24_fpTanTest_q);
            expXTableAddrExt_uid185_rrx_uid34_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXTableAddrExt_uid185_rrx_uid34_fpTanTest_a) - UNSIGNED(expXTableAddrExt_uid185_rrx_uid34_fpTanTest_b));
    expXTableAddrExt_uid185_rrx_uid34_fpTanTest_q <= expXTableAddrExt_uid185_rrx_uid34_fpTanTest_o(8 downto 0);


	--expXTableAddr_uid186_rrx_uid34_fpTanTest(BITSELECT,185)@0
    expXTableAddr_uid186_rrx_uid34_fpTanTest_in <= expXTableAddrExt_uid185_rrx_uid34_fpTanTest_q(7 downto 0);
    expXTableAddr_uid186_rrx_uid34_fpTanTest_b <= expXTableAddr_uid186_rrx_uid34_fpTanTest_in(7 downto 0);

	--reg_expXTableAddr_uid186_rrx_uid34_fpTanTest_0_to_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0(REG,649)@0
    reg_expXTableAddr_uid186_rrx_uid34_fpTanTest_0_to_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXTableAddr_uid186_rrx_uid34_fpTanTest_0_to_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXTableAddr_uid186_rrx_uid34_fpTanTest_0_to_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_q <= expXTableAddr_uid186_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rrTable_uid188_rrx_uid34_fpTanTest_lutmem(DUALMEM,626)@1
    rrTable_uid188_rrx_uid34_fpTanTest_lutmem_ia <= (others => '0');
    rrTable_uid188_rrx_uid34_fpTanTest_lutmem_aa <= (others => '0');
    rrTable_uid188_rrx_uid34_fpTanTest_lutmem_ab <= reg_expXTableAddr_uid186_rrx_uid34_fpTanTest_0_to_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_q;
    rrTable_uid188_rrx_uid34_fpTanTest_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 38,
        widthad_a => 8,
        numwords_a => 140,
        width_b => 38,
        widthad_b => 8,
        numwords_b => 140,
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
        init_file => "fp_tan_s5_rrTable_uid188_rrx_uid34_fpTanTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => rrTable_uid188_rrx_uid34_fpTanTest_lutmem_reset0,
        clock0 => clk,
        address_b => rrTable_uid188_rrx_uid34_fpTanTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => rrTable_uid188_rrx_uid34_fpTanTest_lutmem_iq,
        address_a => rrTable_uid188_rrx_uid34_fpTanTest_lutmem_aa,
        data_a => rrTable_uid188_rrx_uid34_fpTanTest_lutmem_ia
    );
    rrTable_uid188_rrx_uid34_fpTanTest_lutmem_reset0 <= areset;
        rrTable_uid188_rrx_uid34_fpTanTest_lutmem_q <= rrTable_uid188_rrx_uid34_fpTanTest_lutmem_iq(37 downto 0);

	--reg_rrTable_uid188_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_1(REG,652)@3
    reg_rrTable_uid188_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rrTable_uid188_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_1_q <= "00000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rrTable_uid188_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_1_q <= rrTable_uid188_rrx_uid34_fpTanTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--rrTable_uid187_rrx_uid34_fpTanTest_lutmem(DUALMEM,625)@1
    rrTable_uid187_rrx_uid34_fpTanTest_lutmem_ia <= (others => '0');
    rrTable_uid187_rrx_uid34_fpTanTest_lutmem_aa <= (others => '0');
    rrTable_uid187_rrx_uid34_fpTanTest_lutmem_ab <= reg_expXTableAddr_uid186_rrx_uid34_fpTanTest_0_to_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_q;
    rrTable_uid187_rrx_uid34_fpTanTest_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 140,
        width_b => 40,
        widthad_b => 8,
        numwords_b => 140,
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
        init_file => "fp_tan_s5_rrTable_uid187_rrx_uid34_fpTanTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => rrTable_uid187_rrx_uid34_fpTanTest_lutmem_reset0,
        clock0 => clk,
        address_b => rrTable_uid187_rrx_uid34_fpTanTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => rrTable_uid187_rrx_uid34_fpTanTest_lutmem_iq,
        address_a => rrTable_uid187_rrx_uid34_fpTanTest_lutmem_aa,
        data_a => rrTable_uid187_rrx_uid34_fpTanTest_lutmem_ia
    );
    rrTable_uid187_rrx_uid34_fpTanTest_lutmem_reset0 <= areset;
        rrTable_uid187_rrx_uid34_fpTanTest_lutmem_q <= rrTable_uid187_rrx_uid34_fpTanTest_lutmem_iq(39 downto 0);

	--reg_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_0(REG,651)@3
    reg_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_0_q <= rrTable_uid187_rrx_uid34_fpTanTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid189_rrx_uid34_fpTanTest(BITJOIN,188)@4
    os_uid189_rrx_uid34_fpTanTest_q <= reg_rrTable_uid188_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_1_q & reg_rrTable_uid187_rrx_uid34_fpTanTest_lutmem_0_to_os_uid189_rrx_uid34_fpTanTest_0_q;

	--prod_uid191_rrx_uid34_fpTanTest_a_2(BITSELECT,629)@4
    prod_uid191_rrx_uid34_fpTanTest_a_2_in <= STD_LOGIC_VECTOR("000" & os_uid189_rrx_uid34_fpTanTest_q);
    prod_uid191_rrx_uid34_fpTanTest_a_2_b <= prod_uid191_rrx_uid34_fpTanTest_a_2_in(80 downto 54);

	--reg_prod_uid191_rrx_uid34_fpTanTest_a_2_0_to_prod_uid191_rrx_uid34_fpTanTest_a2_b0_0(REG,657)@4
    reg_prod_uid191_rrx_uid34_fpTanTest_a_2_0_to_prod_uid191_rrx_uid34_fpTanTest_a2_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid191_rrx_uid34_fpTanTest_a_2_0_to_prod_uid191_rrx_uid34_fpTanTest_a2_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid191_rrx_uid34_fpTanTest_a_2_0_to_prod_uid191_rrx_uid34_fpTanTest_a2_b0_0_q <= prod_uid191_rrx_uid34_fpTanTest_a_2_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid191_rrx_uid34_fpTanTest_a2_b0(MULT,633)@5
    prod_uid191_rrx_uid34_fpTanTest_a2_b0_pr <= UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_a2_b0_a) * UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_a2_b0_b);
    prod_uid191_rrx_uid34_fpTanTest_a2_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid191_rrx_uid34_fpTanTest_a2_b0_a <= (others => '0');
            prod_uid191_rrx_uid34_fpTanTest_a2_b0_b <= (others => '0');
            prod_uid191_rrx_uid34_fpTanTest_a2_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid191_rrx_uid34_fpTanTest_a2_b0_a <= reg_prod_uid191_rrx_uid34_fpTanTest_a_2_0_to_prod_uid191_rrx_uid34_fpTanTest_a2_b0_0_q;
                prod_uid191_rrx_uid34_fpTanTest_a2_b0_b <= reg_prod_uid191_rrx_uid34_fpTanTest_b_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_1_q;
                prod_uid191_rrx_uid34_fpTanTest_a2_b0_s1 <= STD_LOGIC_VECTOR(prod_uid191_rrx_uid34_fpTanTest_a2_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid191_rrx_uid34_fpTanTest_a2_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid191_rrx_uid34_fpTanTest_a2_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid191_rrx_uid34_fpTanTest_a2_b0_q <= prod_uid191_rrx_uid34_fpTanTest_a2_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_prod_uid191_rrx_uid34_fpTanTest_a2_b0_q_to_prod_uid191_rrx_uid34_fpTanTest_align_2_a(DELAY,1388)@8
    ld_prod_uid191_rrx_uid34_fpTanTest_a2_b0_q_to_prod_uid191_rrx_uid34_fpTanTest_align_2_a : dspba_delay
    GENERIC MAP ( width => 54, depth => 1 )
    PORT MAP ( xin => prod_uid191_rrx_uid34_fpTanTest_a2_b0_q, xout => ld_prod_uid191_rrx_uid34_fpTanTest_a2_b0_q_to_prod_uid191_rrx_uid34_fpTanTest_align_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--prod_uid191_rrx_uid34_fpTanTest_align_2(BITSHIFT,636)@9
    prod_uid191_rrx_uid34_fpTanTest_align_2_q_int <= ld_prod_uid191_rrx_uid34_fpTanTest_a2_b0_q_to_prod_uid191_rrx_uid34_fpTanTest_align_2_a_q & "000000000000000000000000000000000000000000000000000000";
    prod_uid191_rrx_uid34_fpTanTest_align_2_q <= prod_uid191_rrx_uid34_fpTanTest_align_2_q_int(107 downto 0);

	--prod_uid191_rrx_uid34_fpTanTest_a_1(BITSELECT,628)@4
    prod_uid191_rrx_uid34_fpTanTest_a_1_in <= os_uid189_rrx_uid34_fpTanTest_q(53 downto 0);
    prod_uid191_rrx_uid34_fpTanTest_a_1_b <= prod_uid191_rrx_uid34_fpTanTest_a_1_in(53 downto 27);

	--reg_prod_uid191_rrx_uid34_fpTanTest_a_1_0_to_prod_uid191_rrx_uid34_fpTanTest_a1_b0_0(REG,655)@4
    reg_prod_uid191_rrx_uid34_fpTanTest_a_1_0_to_prod_uid191_rrx_uid34_fpTanTest_a1_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid191_rrx_uid34_fpTanTest_a_1_0_to_prod_uid191_rrx_uid34_fpTanTest_a1_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid191_rrx_uid34_fpTanTest_a_1_0_to_prod_uid191_rrx_uid34_fpTanTest_a1_b0_0_q <= prod_uid191_rrx_uid34_fpTanTest_a_1_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid191_rrx_uid34_fpTanTest_a1_b0(MULT,632)@5
    prod_uid191_rrx_uid34_fpTanTest_a1_b0_pr <= UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_a1_b0_a) * UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_a1_b0_b);
    prod_uid191_rrx_uid34_fpTanTest_a1_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid191_rrx_uid34_fpTanTest_a1_b0_a <= (others => '0');
            prod_uid191_rrx_uid34_fpTanTest_a1_b0_b <= (others => '0');
            prod_uid191_rrx_uid34_fpTanTest_a1_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid191_rrx_uid34_fpTanTest_a1_b0_a <= reg_prod_uid191_rrx_uid34_fpTanTest_a_1_0_to_prod_uid191_rrx_uid34_fpTanTest_a1_b0_0_q;
                prod_uid191_rrx_uid34_fpTanTest_a1_b0_b <= reg_prod_uid191_rrx_uid34_fpTanTest_b_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_1_q;
                prod_uid191_rrx_uid34_fpTanTest_a1_b0_s1 <= STD_LOGIC_VECTOR(prod_uid191_rrx_uid34_fpTanTest_a1_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid191_rrx_uid34_fpTanTest_a1_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid191_rrx_uid34_fpTanTest_a1_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid191_rrx_uid34_fpTanTest_a1_b0_q <= prod_uid191_rrx_uid34_fpTanTest_a1_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prod_uid191_rrx_uid34_fpTanTest_align_1(BITSHIFT,635)@8
    prod_uid191_rrx_uid34_fpTanTest_align_1_q_int <= prod_uid191_rrx_uid34_fpTanTest_a1_b0_q & "000000000000000000000000000";
    prod_uid191_rrx_uid34_fpTanTest_align_1_q <= prod_uid191_rrx_uid34_fpTanTest_align_1_q_int(80 downto 0);

	--prod_uid191_rrx_uid34_fpTanTest_a_0(BITSELECT,627)@4
    prod_uid191_rrx_uid34_fpTanTest_a_0_in <= os_uid189_rrx_uid34_fpTanTest_q(26 downto 0);
    prod_uid191_rrx_uid34_fpTanTest_a_0_b <= prod_uid191_rrx_uid34_fpTanTest_a_0_in(26 downto 0);

	--reg_prod_uid191_rrx_uid34_fpTanTest_a_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_0(REG,653)@4
    reg_prod_uid191_rrx_uid34_fpTanTest_a_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid191_rrx_uid34_fpTanTest_a_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid191_rrx_uid34_fpTanTest_a_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_0_q <= prod_uid191_rrx_uid34_fpTanTest_a_0_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid191_rrx_uid34_fpTanTest_a0_b0(MULT,631)@5
    prod_uid191_rrx_uid34_fpTanTest_a0_b0_pr <= UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_a0_b0_a) * UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_a0_b0_b);
    prod_uid191_rrx_uid34_fpTanTest_a0_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid191_rrx_uid34_fpTanTest_a0_b0_a <= (others => '0');
            prod_uid191_rrx_uid34_fpTanTest_a0_b0_b <= (others => '0');
            prod_uid191_rrx_uid34_fpTanTest_a0_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid191_rrx_uid34_fpTanTest_a0_b0_a <= reg_prod_uid191_rrx_uid34_fpTanTest_a_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_0_q;
                prod_uid191_rrx_uid34_fpTanTest_a0_b0_b <= reg_prod_uid191_rrx_uid34_fpTanTest_b_0_0_to_prod_uid191_rrx_uid34_fpTanTest_a0_b0_1_q;
                prod_uid191_rrx_uid34_fpTanTest_a0_b0_s1 <= STD_LOGIC_VECTOR(prod_uid191_rrx_uid34_fpTanTest_a0_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid191_rrx_uid34_fpTanTest_a0_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid191_rrx_uid34_fpTanTest_a0_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid191_rrx_uid34_fpTanTest_a0_b0_q <= prod_uid191_rrx_uid34_fpTanTest_a0_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prod_uid191_rrx_uid34_fpTanTest_align_0(BITSHIFT,634)@8
    prod_uid191_rrx_uid34_fpTanTest_align_0_q_int <= prod_uid191_rrx_uid34_fpTanTest_a0_b0_q;
    prod_uid191_rrx_uid34_fpTanTest_align_0_q <= prod_uid191_rrx_uid34_fpTanTest_align_0_q_int(53 downto 0);

	--prod_uid191_rrx_uid34_fpTanTest_result_add_0_0(ADD,637)@8
    prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_a <= STD_LOGIC_VECTOR("0000000000000000000000000000" & prod_uid191_rrx_uid34_fpTanTest_align_0_q);
    prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & prod_uid191_rrx_uid34_fpTanTest_align_1_q);
    prod_uid191_rrx_uid34_fpTanTest_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_a) + UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_b));
        END IF;
    END PROCESS;
    prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_q <= prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_o(81 downto 0);


	--prod_uid191_rrx_uid34_fpTanTest_result_add_1_0(ADD,638)@9
    prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_a <= STD_LOGIC_VECTOR("000000000000000000000000000" & prod_uid191_rrx_uid34_fpTanTest_result_add_0_0_q);
    prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_b <= STD_LOGIC_VECTOR("0" & prod_uid191_rrx_uid34_fpTanTest_align_2_q);
            prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_a) + UNSIGNED(prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_b));
    prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_q <= prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_o(108 downto 0);


	--multFracBits_uid192_rrx_uid34_fpTanTest(BITSELECT,191)@9
    multFracBits_uid192_rrx_uid34_fpTanTest_in <= prod_uid191_rrx_uid34_fpTanTest_result_add_1_0_q(75 downto 0);
    multFracBits_uid192_rrx_uid34_fpTanTest_b <= multFracBits_uid192_rrx_uid34_fpTanTest_in(75 downto 0);

	--multFracBitsTop_uid193_rrx_uid34_fpTanTest(BITSELECT,192)@9
    multFracBitsTop_uid193_rrx_uid34_fpTanTest_in <= multFracBits_uid192_rrx_uid34_fpTanTest_b;
    multFracBitsTop_uid193_rrx_uid34_fpTanTest_b <= multFracBitsTop_uid193_rrx_uid34_fpTanTest_in(75 downto 46);

	--rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,526)@9
    rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_in <= multFracBitsTop_uid193_rrx_uid34_fpTanTest_b;
    rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_b <= rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_in(29 downto 14);

	--reg_rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_0_to_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_1(REG,659)@9
    reg_rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_0_to_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_0_to_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_0_to_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_1_q <= rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest(LOGICAL,527)@10
    vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_a <= reg_rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_0_to_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_1_q;
    vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_b <= zs_uid243_lzcZSin_uid65_fpTanTest_q;
    vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_q <= "1" when vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_a = vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_b else "0";

	--reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4(REG,667)@10
    reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q <= vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_e(DELAY,1309)@11
    ld_reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q, xout => ld_reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllZWE_uid8_fpTanTest(CONSTANT,7)
    cstAllZWE_uid8_fpTanTest_q <= "00000000";

	--vStage_uid530_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,529)@9
    vStage_uid530_zCount_uid194_rrx_uid34_fpTanTest_in <= multFracBitsTop_uid193_rrx_uid34_fpTanTest_b(13 downto 0);
    vStage_uid530_zCount_uid194_rrx_uid34_fpTanTest_b <= vStage_uid530_zCount_uid194_rrx_uid34_fpTanTest_in(13 downto 0);

	--mO_uid529_zCount_uid194_rrx_uid34_fpTanTest(CONSTANT,528)
    mO_uid529_zCount_uid194_rrx_uid34_fpTanTest_q <= "11";

	--cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest(BITJOIN,530)@9
    cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_q <= vStage_uid530_zCount_uid194_rrx_uid34_fpTanTest_b & mO_uid529_zCount_uid194_rrx_uid34_fpTanTest_q;

	--reg_cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_3(REG,661)@9
    reg_cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_3_q <= cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest(MUX,532)@10
    vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_s <= vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_q;
    vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest: PROCESS (vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_s, en, reg_rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_0_to_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_1_q, reg_cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_3_q)
    BEGIN
            CASE vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_s IS
                  WHEN "0" => vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_q <= reg_rVStage_uid527_zCount_uid194_rrx_uid34_fpTanTest_0_to_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_1_q;
                  WHEN "1" => vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_q <= reg_cStage_uid531_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_3_q;
                  WHEN OTHERS => vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,534)@10
    rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_in <= vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_q;
    rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_b <= rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_in(15 downto 8);

	--vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest(LOGICAL,535)@10
    vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_a <= rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_b;
    vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_b <= cstAllZWE_uid8_fpTanTest_q;
    vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_a = vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_b) THEN
                vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q <= "1";
            ELSE
                vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_d(DELAY,1308)@11
    ld_vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q, xout => ld_vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest(CONSTANT,205)
    leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q <= "0000";

	--vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,536)@10
    vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_in <= vStagei_uid533_zCount_uid194_rrx_uid34_fpTanTest_q(7 downto 0);
    vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_b <= vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_in(7 downto 0);

	--reg_vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_3(REG,663)@10
    reg_vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_3_q <= vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_2(REG,662)@10
    reg_rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_2_q <= rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest(MUX,538)@11
    vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_s <= vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q;
    vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest: PROCESS (vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_s, en, reg_rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_2_q, reg_vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_3_q)
    BEGIN
            CASE vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_s IS
                  WHEN "0" => vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_q <= reg_rVStage_uid535_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_2_q;
                  WHEN "1" => vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_q <= reg_vStage_uid537_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_3_q;
                  WHEN OTHERS => vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,540)@11
    rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest_in <= vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_q;
    rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest_b <= rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest_in(7 downto 4);

	--vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest(LOGICAL,541)@11
    vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_a <= rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest_b;
    vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_b <= leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q;
    vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_q <= "1" when vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_a = vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_b else "0";

	--reg_vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_2(REG,666)@11
    reg_vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_2_q <= vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest(CONSTANT,219)
    leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q <= "00";

	--vStage_uid543_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,542)@11
    vStage_uid543_zCount_uid194_rrx_uid34_fpTanTest_in <= vStagei_uid539_zCount_uid194_rrx_uid34_fpTanTest_q(3 downto 0);
    vStage_uid543_zCount_uid194_rrx_uid34_fpTanTest_b <= vStage_uid543_zCount_uid194_rrx_uid34_fpTanTest_in(3 downto 0);

	--vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest(MUX,544)@11
    vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_s <= vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_q;
    vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest: PROCESS (vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_s, en, rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest_b, vStage_uid543_zCount_uid194_rrx_uid34_fpTanTest_b)
    BEGIN
            CASE vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_s IS
                  WHEN "0" => vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_q <= rVStage_uid541_zCount_uid194_rrx_uid34_fpTanTest_b;
                  WHEN "1" => vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_q <= vStage_uid543_zCount_uid194_rrx_uid34_fpTanTest_b;
                  WHEN OTHERS => vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,546)@11
    rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_in <= vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_q;
    rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_b <= rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_in(3 downto 2);

	--vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest(LOGICAL,547)@11
    vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_a <= rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_b;
    vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_b <= leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q;
    vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_a = vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_b) THEN
                vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_q <= "1";
            ELSE
                vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,548)@11
    vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_in <= vStagei_uid545_zCount_uid194_rrx_uid34_fpTanTest_q(1 downto 0);
    vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_b <= vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_in(1 downto 0);

	--reg_vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_3(REG,665)@11
    reg_vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_3_q <= vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_2(REG,664)@11
    reg_rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_2_q <= rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest(MUX,550)@12
    vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_s <= vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_q;
    vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest: PROCESS (vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_s, en, reg_rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_2_q, reg_vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_3_q)
    BEGIN
            CASE vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_s IS
                  WHEN "0" => vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_q <= reg_rVStage_uid547_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_2_q;
                  WHEN "1" => vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_q <= reg_vStage_uid549_zCount_uid194_rrx_uid34_fpTanTest_0_to_vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_3_q;
                  WHEN OTHERS => vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid553_zCount_uid194_rrx_uid34_fpTanTest(BITSELECT,552)@12
    rVStage_uid553_zCount_uid194_rrx_uid34_fpTanTest_in <= vStagei_uid551_zCount_uid194_rrx_uid34_fpTanTest_q;
    rVStage_uid553_zCount_uid194_rrx_uid34_fpTanTest_b <= rVStage_uid553_zCount_uid194_rrx_uid34_fpTanTest_in(1 downto 1);

	--vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest(LOGICAL,553)@12
    vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_a <= rVStage_uid553_zCount_uid194_rrx_uid34_fpTanTest_b;
    vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_b <= GND_q;
    vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_q <= "1" when vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_a = vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_b else "0";

	--r_uid555_zCount_uid194_rrx_uid34_fpTanTest(BITJOIN,554)@12
    r_uid555_zCount_uid194_rrx_uid34_fpTanTest_q <= ld_reg_vCount_uid528_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_4_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_e_q & ld_vCount_uid536_zCount_uid194_rrx_uid34_fpTanTest_q_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_d_q & reg_vCount_uid542_zCount_uid194_rrx_uid34_fpTanTest_0_to_r_uid555_zCount_uid194_rrx_uid34_fpTanTest_2_q & vCount_uid548_zCount_uid194_rrx_uid34_fpTanTest_q & vCount_uid554_zCount_uid194_rrx_uid34_fpTanTest_q;

	--cstBiasM1_uid23_fpTanTest(CONSTANT,22)
    cstBiasM1_uid23_fpTanTest_q <= "01111110";

	--expCompOutExt_uid197_rrx_uid34_fpTanTest(SUB,196)@12
    expCompOutExt_uid197_rrx_uid34_fpTanTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_fpTanTest_q);
    expCompOutExt_uid197_rrx_uid34_fpTanTest_b <= STD_LOGIC_VECTOR("0000" & r_uid555_zCount_uid194_rrx_uid34_fpTanTest_q);
            expCompOutExt_uid197_rrx_uid34_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expCompOutExt_uid197_rrx_uid34_fpTanTest_a) - UNSIGNED(expCompOutExt_uid197_rrx_uid34_fpTanTest_b));
    expCompOutExt_uid197_rrx_uid34_fpTanTest_q <= expCompOutExt_uid197_rrx_uid34_fpTanTest_o(8 downto 0);


	--expCompOut_uid198_rrx_uid34_fpTanTest(BITSELECT,197)@12
    expCompOut_uid198_rrx_uid34_fpTanTest_in <= expCompOutExt_uid197_rrx_uid34_fpTanTest_q(7 downto 0);
    expCompOut_uid198_rrx_uid34_fpTanTest_b <= expCompOut_uid198_rrx_uid34_fpTanTest_in(7 downto 0);

	--reg_expCompOut_uid198_rrx_uid34_fpTanTest_0_to_finalExp_uid202_rrx_uid34_fpTanTest_2(REG,674)@12
    reg_expCompOut_uid198_rrx_uid34_fpTanTest_0_to_finalExp_uid202_rrx_uid34_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expCompOut_uid198_rrx_uid34_fpTanTest_0_to_finalExp_uid202_rrx_uid34_fpTanTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expCompOut_uid198_rrx_uid34_fpTanTest_0_to_finalExp_uid202_rrx_uid34_fpTanTest_2_q <= expCompOut_uid198_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--xBranch_uid184_rrx_uid34_fpTanTest(COMPARE,183)@0
    xBranch_uid184_rrx_uid34_fpTanTest_cin <= GND_q;
    xBranch_uid184_rrx_uid34_fpTanTest_a <= STD_LOGIC_VECTOR("00" & cstBiasMwShift_uid24_fpTanTest_q) & '0';
    xBranch_uid184_rrx_uid34_fpTanTest_b <= STD_LOGIC_VECTOR("00" & expX_uid179_rrx_uid34_fpTanTest_b) & xBranch_uid184_rrx_uid34_fpTanTest_cin(0);
    xBranch_uid184_rrx_uid34_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xBranch_uid184_rrx_uid34_fpTanTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                xBranch_uid184_rrx_uid34_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xBranch_uid184_rrx_uid34_fpTanTest_a) - UNSIGNED(xBranch_uid184_rrx_uid34_fpTanTest_b));
            END IF;
        END IF;
    END PROCESS;
    xBranch_uid184_rrx_uid34_fpTanTest_n(0) <= not xBranch_uid184_rrx_uid34_fpTanTest_o(10);


	--ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalExp_uid202_rrx_uid34_fpTanTest_b(DELAY,945)@1
    ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalExp_uid202_rrx_uid34_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => xBranch_uid184_rrx_uid34_fpTanTest_n, xout => ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalExp_uid202_rrx_uid34_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalExp_uid202_rrx_uid34_fpTanTest(MUX,201)@13
    finalExp_uid202_rrx_uid34_fpTanTest_s <= ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalExp_uid202_rrx_uid34_fpTanTest_b_q;
    finalExp_uid202_rrx_uid34_fpTanTest: PROCESS (finalExp_uid202_rrx_uid34_fpTanTest_s, en, reg_expCompOut_uid198_rrx_uid34_fpTanTest_0_to_finalExp_uid202_rrx_uid34_fpTanTest_2_q, ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_q)
    BEGIN
            CASE finalExp_uid202_rrx_uid34_fpTanTest_s IS
                  WHEN "0" => finalExp_uid202_rrx_uid34_fpTanTest_q <= reg_expCompOut_uid198_rrx_uid34_fpTanTest_0_to_finalExp_uid202_rrx_uid34_fpTanTest_2_q;
                  WHEN "1" => finalExp_uid202_rrx_uid34_fpTanTest_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_mem_q;
                  WHEN OTHERS => finalExp_uid202_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_finalExp_uid202_rrx_uid34_fpTanTest_q_to_RRangeRed_uid203_rrx_uid34_fpTanTest_b(DELAY,949)@13
    ld_finalExp_uid202_rrx_uid34_fpTanTest_q_to_RRangeRed_uid203_rrx_uid34_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => finalExp_uid202_rrx_uid34_fpTanTest_q, xout => ld_finalExp_uid202_rrx_uid34_fpTanTest_q_to_RRangeRed_uid203_rrx_uid34_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor(LOGICAL,1665)
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_b <= ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_sticky_ena_q;
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_q <= not (ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_a or ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_b);

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_mem_top(CONSTANT,1535)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_mem_top_q <= "0111";

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp(LOGICAL,1536)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_mem_top_q;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_q);
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_q <= "1" when ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_a = ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_b else "0";

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmpReg(REG,1537)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmpReg_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_sticky_ena(REG,1666)
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_nor_q = "1") THEN
                ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_sticky_ena_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd(LOGICAL,1667)
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_a <= ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_sticky_ena_q;
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_b <= en;
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_q <= ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_a and ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_b;

	--ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_inputreg(DELAY,1655)
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid180_rrx_uid34_fpTanTest_b, xout => ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt(COUNTER,1531)
    -- every=1, low=0, high=7, step=1, init=1
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_i <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_i,3));


	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg(REG,1532)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux(MUX,1533)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_s <= en;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux: PROCESS (ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_s, ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg_q, ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg_q;
                  WHEN "1" => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem(DUALMEM,1656)
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_ia <= ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_inputreg_q;
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_aa <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg_q;
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_ab <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_q;
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 23,
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
        clocken1 => ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_iq,
        address_a => ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_aa,
        data_a => ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_ia
    );
    ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_reset0 <= areset;
        ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_q <= ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_iq(22 downto 0);

	--ZerosGB_uid199_rrx_uid34_fpTanTest(CONSTANT,198)
    ZerosGB_uid199_rrx_uid34_fpTanTest_q <= "000000000000000000000000000000";

	--fracXRExt_uid200_rrx_uid34_fpTanTest(BITJOIN,199)@14
    fracXRExt_uid200_rrx_uid34_fpTanTest_q <= ld_fracX_uid180_rrx_uid34_fpTanTest_b_to_fracXRExt_uid200_rrx_uid34_fpTanTest_b_replace_mem_q & ZerosGB_uid199_rrx_uid34_fpTanTest_q;

	--LeftShiftStage174dto0_uid581_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,580)@13
    LeftShiftStage174dto0_uid581_normMult_uid195_rrx_uid34_fpTanTest_in <= leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q(74 downto 0);
    LeftShiftStage174dto0_uid581_normMult_uid195_rrx_uid34_fpTanTest_b <= LeftShiftStage174dto0_uid581_normMult_uid195_rrx_uid34_fpTanTest_in(74 downto 0);

	--leftShiftStage2Idx1_uid582_normMult_uid195_rrx_uid34_fpTanTest(BITJOIN,581)@13
    leftShiftStage2Idx1_uid582_normMult_uid195_rrx_uid34_fpTanTest_q <= LeftShiftStage174dto0_uid581_normMult_uid195_rrx_uid34_fpTanTest_b & GND_q;

	--X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,564)@9
    X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_in <= multFracBits_uid192_rrx_uid34_fpTanTest_b(51 downto 0);
    X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b <= X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_in(51 downto 0);

	--ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg(DELAY,1764)
    ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b, xout => ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b(DELAY,1315)@9
    ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 52, depth => 2 )
    PORT MAP ( xin => ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q, xout => ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad24_uid286_alignedZSin_uid66_fpTanTest(CONSTANT,285)
    leftShiftStage1Idx3Pad24_uid286_alignedZSin_uid66_fpTanTest_q <= "000000000000000000000000";

	--leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest(BITJOIN,565)@12
    leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_q <= ld_X51dto0_uid565_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_b_q & leftShiftStage1Idx3Pad24_uid286_alignedZSin_uid66_fpTanTest_q;

	--X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,561)@9
    X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_in <= multFracBits_uid192_rrx_uid34_fpTanTest_b(59 downto 0);
    X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b <= X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_in(59 downto 0);

	--ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg(DELAY,1763)
    ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b, xout => ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b(DELAY,1313)@9
    ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 60, depth => 2 )
    PORT MAP ( xin => ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q, xout => ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest(BITJOIN,562)@12
    leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_q <= ld_X59dto0_uid562_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_b_q & zs_uid243_lzcZSin_uid65_fpTanTest_q;

	--X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,558)@9
    X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_in <= multFracBits_uid192_rrx_uid34_fpTanTest_b(67 downto 0);
    X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b <= X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_in(67 downto 0);

	--ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg(DELAY,1762)
    ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 68, depth => 1 )
    PORT MAP ( xin => X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b, xout => ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b(DELAY,1311)@9
    ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 68, depth => 2 )
    PORT MAP ( xin => ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b_inputreg_q, xout => ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest(BITJOIN,559)@12
    leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_q <= ld_X67dto0_uid559_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_b_q & cstAllZWE_uid8_fpTanTest_q;

	--ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_inputreg(DELAY,1765)
    ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 76, depth => 1 )
    PORT MAP ( xin => multFracBits_uid192_rrx_uid34_fpTanTest_b, xout => ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c(DELAY,1318)@9
    ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 76, depth => 2 )
    PORT MAP ( xin => ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_inputreg_q, xout => ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStageSel4Dto3_uid567_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,566)@12
    leftShiftStageSel4Dto3_uid567_normMult_uid195_rrx_uid34_fpTanTest_in <= r_uid555_zCount_uid194_rrx_uid34_fpTanTest_q;
    leftShiftStageSel4Dto3_uid567_normMult_uid195_rrx_uid34_fpTanTest_b <= leftShiftStageSel4Dto3_uid567_normMult_uid195_rrx_uid34_fpTanTest_in(4 downto 3);

	--leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest(MUX,567)@12
    leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_s <= leftShiftStageSel4Dto3_uid567_normMult_uid195_rrx_uid34_fpTanTest_b;
    leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest: PROCESS (leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_s, en, ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_q, leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_q, leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_q, leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_q)
    BEGIN
            CASE leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_s IS
                  WHEN "00" => leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q <= ld_multFracBits_uid192_rrx_uid34_fpTanTest_b_to_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_c_q;
                  WHEN "01" => leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q <= leftShiftStage0Idx1_uid560_normMult_uid195_rrx_uid34_fpTanTest_q;
                  WHEN "10" => leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q <= leftShiftStage0Idx2_uid563_normMult_uid195_rrx_uid34_fpTanTest_q;
                  WHEN "11" => leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q <= leftShiftStage0Idx3_uid566_normMult_uid195_rrx_uid34_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage069dto0_uid576_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,575)@12
    LeftShiftStage069dto0_uid576_normMult_uid195_rrx_uid34_fpTanTest_in <= leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q(69 downto 0);
    LeftShiftStage069dto0_uid576_normMult_uid195_rrx_uid34_fpTanTest_b <= LeftShiftStage069dto0_uid576_normMult_uid195_rrx_uid34_fpTanTest_in(69 downto 0);

	--leftShiftStage2Idx3Pad6_uid297_alignedZSin_uid66_fpTanTest(CONSTANT,296)
    leftShiftStage2Idx3Pad6_uid297_alignedZSin_uid66_fpTanTest_q <= "000000";

	--leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest(BITJOIN,576)@12
    leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_q <= LeftShiftStage069dto0_uid576_normMult_uid195_rrx_uid34_fpTanTest_b & leftShiftStage2Idx3Pad6_uid297_alignedZSin_uid66_fpTanTest_q;

	--reg_leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_5(REG,672)@12
    reg_leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_5_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_5_q <= leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage071dto0_uid573_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,572)@12
    LeftShiftStage071dto0_uid573_normMult_uid195_rrx_uid34_fpTanTest_in <= leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q(71 downto 0);
    LeftShiftStage071dto0_uid573_normMult_uid195_rrx_uid34_fpTanTest_b <= LeftShiftStage071dto0_uid573_normMult_uid195_rrx_uid34_fpTanTest_in(71 downto 0);

	--leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest(BITJOIN,573)@12
    leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_q <= LeftShiftStage071dto0_uid573_normMult_uid195_rrx_uid34_fpTanTest_b & leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q;

	--reg_leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_4(REG,671)@12
    reg_leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_4_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_4_q <= leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage073dto0_uid570_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,569)@12
    LeftShiftStage073dto0_uid570_normMult_uid195_rrx_uid34_fpTanTest_in <= leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q(73 downto 0);
    LeftShiftStage073dto0_uid570_normMult_uid195_rrx_uid34_fpTanTest_b <= LeftShiftStage073dto0_uid570_normMult_uid195_rrx_uid34_fpTanTest_in(73 downto 0);

	--leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest(BITJOIN,570)@12
    leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_q <= LeftShiftStage073dto0_uid570_normMult_uid195_rrx_uid34_fpTanTest_b & leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q;

	--reg_leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_3(REG,670)@12
    reg_leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_3_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_3_q <= leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_2(REG,669)@12
    reg_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_2_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_2_q <= leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,577)@12
    leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_in <= r_uid555_zCount_uid194_rrx_uid34_fpTanTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_b <= leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_1(REG,668)@12
    reg_leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_1_q <= leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest(MUX,578)@13
    leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_s <= reg_leftShiftStageSel2Dto1_uid578_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_1_q;
    leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest: PROCESS (leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_s, en, reg_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_2_q, reg_leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_3_q, reg_leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_4_q, reg_leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_s IS
                  WHEN "00" => leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q <= reg_leftShiftStage0_uid568_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_2_q;
                  WHEN "01" => leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q <= reg_leftShiftStage1Idx1_uid571_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_3_q;
                  WHEN "10" => leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q <= reg_leftShiftStage1Idx2_uid574_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_4_q;
                  WHEN "11" => leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q <= reg_leftShiftStage1Idx3_uid577_normMult_uid195_rrx_uid34_fpTanTest_0_to_leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest(BITSELECT,582)@12
    leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_in <= r_uid555_zCount_uid194_rrx_uid34_fpTanTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_b <= leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_b(DELAY,1337)@12
    ld_leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_b, xout => ld_leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest(MUX,583)@13
    leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_s <= ld_leftShiftStageSel0Dto0_uid583_normMult_uid195_rrx_uid34_fpTanTest_b_to_leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_b_q;
    leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest: PROCESS (leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_s, en, leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q, leftShiftStage2Idx1_uid582_normMult_uid195_rrx_uid34_fpTanTest_q)
    BEGIN
            CASE leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_s IS
                  WHEN "0" => leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_q <= leftShiftStage1_uid579_normMult_uid195_rrx_uid34_fpTanTest_q;
                  WHEN "1" => leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_q <= leftShiftStage2Idx1_uid582_normMult_uid195_rrx_uid34_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracCompOut_uid196_rrx_uid34_fpTanTest(BITSELECT,195)@13
    fracCompOut_uid196_rrx_uid34_fpTanTest_in <= leftShiftStage2_uid584_normMult_uid195_rrx_uid34_fpTanTest_q(74 downto 0);
    fracCompOut_uid196_rrx_uid34_fpTanTest_b <= fracCompOut_uid196_rrx_uid34_fpTanTest_in(74 downto 22);

	--reg_fracCompOut_uid196_rrx_uid34_fpTanTest_0_to_finalFrac_uid201_rrx_uid34_fpTanTest_2(REG,673)@13
    reg_fracCompOut_uid196_rrx_uid34_fpTanTest_0_to_finalFrac_uid201_rrx_uid34_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracCompOut_uid196_rrx_uid34_fpTanTest_0_to_finalFrac_uid201_rrx_uid34_fpTanTest_2_q <= "00000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracCompOut_uid196_rrx_uid34_fpTanTest_0_to_finalFrac_uid201_rrx_uid34_fpTanTest_2_q <= fracCompOut_uid196_rrx_uid34_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalFrac_uid201_rrx_uid34_fpTanTest_b(DELAY,942)@1
    ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalFrac_uid201_rrx_uid34_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => xBranch_uid184_rrx_uid34_fpTanTest_n, xout => ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalFrac_uid201_rrx_uid34_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalFrac_uid201_rrx_uid34_fpTanTest(MUX,200)@14
    finalFrac_uid201_rrx_uid34_fpTanTest_s <= ld_xBranch_uid184_rrx_uid34_fpTanTest_n_to_finalFrac_uid201_rrx_uid34_fpTanTest_b_q;
    finalFrac_uid201_rrx_uid34_fpTanTest: PROCESS (finalFrac_uid201_rrx_uid34_fpTanTest_s, en, reg_fracCompOut_uid196_rrx_uid34_fpTanTest_0_to_finalFrac_uid201_rrx_uid34_fpTanTest_2_q, fracXRExt_uid200_rrx_uid34_fpTanTest_q)
    BEGIN
            CASE finalFrac_uid201_rrx_uid34_fpTanTest_s IS
                  WHEN "0" => finalFrac_uid201_rrx_uid34_fpTanTest_q <= reg_fracCompOut_uid196_rrx_uid34_fpTanTest_0_to_finalFrac_uid201_rrx_uid34_fpTanTest_2_q;
                  WHEN "1" => finalFrac_uid201_rrx_uid34_fpTanTest_q <= fracXRExt_uid200_rrx_uid34_fpTanTest_q;
                  WHEN OTHERS => finalFrac_uid201_rrx_uid34_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RRangeRed_uid203_rrx_uid34_fpTanTest(BITJOIN,202)@14
    RRangeRed_uid203_rrx_uid34_fpTanTest_q <= GND_q & ld_finalExp_uid202_rrx_uid34_fpTanTest_q_to_RRangeRed_uid203_rrx_uid34_fpTanTest_b_q & finalFrac_uid201_rrx_uid34_fpTanTest_q;

	--expXRR_uid39_fpTanTest(BITSELECT,38)@14
    expXRR_uid39_fpTanTest_in <= RRangeRed_uid203_rrx_uid34_fpTanTest_q(60 downto 0);
    expXRR_uid39_fpTanTest_b <= expXRR_uid39_fpTanTest_in(60 downto 53);

	--cstBiasMwShiftM2_uid26_fpTanTest(CONSTANT,25)
    cstBiasMwShiftM2_uid26_fpTanTest_q <= "01110000";

	--cosXIsOneXRR_uid43_fpTanTest(COMPARE,42)@14
    cosXIsOneXRR_uid43_fpTanTest_cin <= GND_q;
    cosXIsOneXRR_uid43_fpTanTest_a <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid26_fpTanTest_q) & '0';
    cosXIsOneXRR_uid43_fpTanTest_b <= STD_LOGIC_VECTOR((10 downto 8 => expXRR_uid39_fpTanTest_b(7)) & expXRR_uid39_fpTanTest_b) & cosXIsOneXRR_uid43_fpTanTest_cin(0);
            cosXIsOneXRR_uid43_fpTanTest_o <= STD_LOGIC_VECTOR(SIGNED(cosXIsOneXRR_uid43_fpTanTest_a) - SIGNED(cosXIsOneXRR_uid43_fpTanTest_b));
    cosXIsOneXRR_uid43_fpTanTest_n(0) <= not cosXIsOneXRR_uid43_fpTanTest_o(11);


	--exp_uid9_fpTanTest(BITSELECT,8)@0
    exp_uid9_fpTanTest_in <= a(30 downto 0);
    exp_uid9_fpTanTest_b <= exp_uid9_fpTanTest_in(30 downto 23);

	--sinXIsX_uid41_fpTanTest(COMPARE,40)@0
    sinXIsX_uid41_fpTanTest_cin <= GND_q;
    sinXIsX_uid41_fpTanTest_a <= STD_LOGIC_VECTOR("00" & cstBiasMwShift_uid24_fpTanTest_q) & '0';
    sinXIsX_uid41_fpTanTest_b <= STD_LOGIC_VECTOR("00" & exp_uid9_fpTanTest_b) & sinXIsX_uid41_fpTanTest_cin(0);
            sinXIsX_uid41_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sinXIsX_uid41_fpTanTest_a) - UNSIGNED(sinXIsX_uid41_fpTanTest_b));
    sinXIsX_uid41_fpTanTest_n(0) <= not sinXIsX_uid41_fpTanTest_o(10);


	--ld_sinXIsX_uid41_fpTanTest_n_to_cosOne_uid144_fpTanTest_a(DELAY,908)@0
    ld_sinXIsX_uid41_fpTanTest_n_to_cosOne_uid144_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => sinXIsX_uid41_fpTanTest_n, xout => ld_sinXIsX_uid41_fpTanTest_n_to_cosOne_uid144_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--cosOne_uid144_fpTanTest(LOGICAL,143)@14
    cosOne_uid144_fpTanTest_a <= ld_sinXIsX_uid41_fpTanTest_n_to_cosOne_uid144_fpTanTest_a_q;
    cosOne_uid144_fpTanTest_b <= cosXIsOneXRR_uid43_fpTanTest_n;
    cosOne_uid144_fpTanTest_q <= cosOne_uid144_fpTanTest_a or cosOne_uid144_fpTanTest_b;

	--ld_cosOne_uid144_fpTanTest_q_to_InvCosOne_uid145_fpTanTest_a(DELAY,910)@14
    ld_cosOne_uid144_fpTanTest_q_to_InvCosOne_uid145_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => cosOne_uid144_fpTanTest_q, xout => ld_cosOne_uid144_fpTanTest_q_to_InvCosOne_uid145_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvCosOne_uid145_fpTanTest(LOGICAL,144)@17
    InvCosOne_uid145_fpTanTest_a <= ld_cosOne_uid144_fpTanTest_q_to_InvCosOne_uid145_fpTanTest_a_q;
    InvCosOne_uid145_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvCosOne_uid145_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvCosOne_uid145_fpTanTest_q <= not InvCosOne_uid145_fpTanTest_a;
        END IF;
    END PROCESS;



	--X55dto0_uid213_fxpX_uid48_fpTanTest(BITSELECT,212)@15
    X55dto0_uid213_fxpX_uid48_fpTanTest_in <= extendedFracX_uid47_fpTanTest_q(55 downto 0);
    X55dto0_uid213_fxpX_uid48_fpTanTest_b <= X55dto0_uid213_fxpX_uid48_fpTanTest_in(55 downto 0);

	--leftShiftStage0Idx3Pad12_uid212_fxpX_uid48_fpTanTest(CONSTANT,211)
    leftShiftStage0Idx3Pad12_uid212_fxpX_uid48_fpTanTest_q <= "000000000000";

	--leftShiftStage0Idx3_uid214_fxpX_uid48_fpTanTest(BITJOIN,213)@15
    leftShiftStage0Idx3_uid214_fxpX_uid48_fpTanTest_q <= X55dto0_uid213_fxpX_uid48_fpTanTest_b & leftShiftStage0Idx3Pad12_uid212_fxpX_uid48_fpTanTest_q;

	--X59dto0_uid210_fxpX_uid48_fpTanTest(BITSELECT,209)@15
    X59dto0_uid210_fxpX_uid48_fpTanTest_in <= extendedFracX_uid47_fpTanTest_q(59 downto 0);
    X59dto0_uid210_fxpX_uid48_fpTanTest_b <= X59dto0_uid210_fxpX_uid48_fpTanTest_in(59 downto 0);

	--leftShiftStage0Idx2_uid211_fxpX_uid48_fpTanTest(BITJOIN,210)@15
    leftShiftStage0Idx2_uid211_fxpX_uid48_fpTanTest_q <= X59dto0_uid210_fxpX_uid48_fpTanTest_b & cstAllZWE_uid8_fpTanTest_q;

	--X63dto0_uid207_fxpX_uid48_fpTanTest(BITSELECT,206)@15
    X63dto0_uid207_fxpX_uid48_fpTanTest_in <= extendedFracX_uid47_fpTanTest_q(63 downto 0);
    X63dto0_uid207_fxpX_uid48_fpTanTest_b <= X63dto0_uid207_fxpX_uid48_fpTanTest_in(63 downto 0);

	--leftShiftStage0Idx1_uid208_fxpX_uid48_fpTanTest(BITJOIN,207)@15
    leftShiftStage0Idx1_uid208_fxpX_uid48_fpTanTest_q <= X63dto0_uid207_fxpX_uid48_fpTanTest_b & leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q;

	--cstZwShiftP1_uid27_fpTanTest(CONSTANT,26)
    cstZwShiftP1_uid27_fpTanTest_q <= "00000000000000";

	--fracXRR_uid40_fpTanTest(BITSELECT,39)@14
    fracXRR_uid40_fpTanTest_in <= RRangeRed_uid203_rrx_uid34_fpTanTest_q(52 downto 0);
    fracXRR_uid40_fpTanTest_b <= fracXRR_uid40_fpTanTest_in(52 downto 0);

	--ld_fracXRR_uid40_fpTanTest_b_to_oFracXRR_uid44_uid44_fpTanTest_a(DELAY,792)@14
    ld_fracXRR_uid40_fpTanTest_b_to_oFracXRR_uid44_uid44_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => fracXRR_uid40_fpTanTest_b, xout => ld_fracXRR_uid40_fpTanTest_b_to_oFracXRR_uid44_uid44_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracXRR_uid44_uid44_fpTanTest(BITJOIN,43)@15
    oFracXRR_uid44_uid44_fpTanTest_q <= VCC_q & ld_fracXRR_uid40_fpTanTest_b_to_oFracXRR_uid44_uid44_fpTanTest_a_q;

	--extendedFracX_uid47_fpTanTest(BITJOIN,46)@15
    extendedFracX_uid47_fpTanTest_q <= cstZwShiftP1_uid27_fpTanTest_q & oFracXRR_uid44_uid44_fpTanTest_q;

	--fxpXShiftValExt_uid45_fpTanTest(SUB,44)@14
    fxpXShiftValExt_uid45_fpTanTest_a <= STD_LOGIC_VECTOR((10 downto 8 => expXRR_uid39_fpTanTest_b(7)) & expXRR_uid39_fpTanTest_b);
    fxpXShiftValExt_uid45_fpTanTest_b <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid26_fpTanTest_q);
            fxpXShiftValExt_uid45_fpTanTest_o <= STD_LOGIC_VECTOR(SIGNED(fxpXShiftValExt_uid45_fpTanTest_a) - SIGNED(fxpXShiftValExt_uid45_fpTanTest_b));
    fxpXShiftValExt_uid45_fpTanTest_q <= fxpXShiftValExt_uid45_fpTanTest_o(9 downto 0);


	--fxpXShiftVal_uid46_fpTanTest(BITSELECT,45)@14
    fxpXShiftVal_uid46_fpTanTest_in <= fxpXShiftValExt_uid45_fpTanTest_q(3 downto 0);
    fxpXShiftVal_uid46_fpTanTest_b <= fxpXShiftVal_uid46_fpTanTest_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest(BITSELECT,214)@14
    leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_in <= fxpXShiftVal_uid46_fpTanTest_b;
    leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_b <= leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_0_to_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_1(REG,675)@14
    reg_leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_0_to_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_0_to_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_0_to_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_1_q <= leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid216_fxpX_uid48_fpTanTest(MUX,215)@15
    leftShiftStage0_uid216_fxpX_uid48_fpTanTest_s <= reg_leftShiftStageSel3Dto2_uid215_fxpX_uid48_fpTanTest_0_to_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_1_q;
    leftShiftStage0_uid216_fxpX_uid48_fpTanTest: PROCESS (leftShiftStage0_uid216_fxpX_uid48_fpTanTest_s, en, extendedFracX_uid47_fpTanTest_q, leftShiftStage0Idx1_uid208_fxpX_uid48_fpTanTest_q, leftShiftStage0Idx2_uid211_fxpX_uid48_fpTanTest_q, leftShiftStage0Idx3_uid214_fxpX_uid48_fpTanTest_q)
    BEGIN
            CASE leftShiftStage0_uid216_fxpX_uid48_fpTanTest_s IS
                  WHEN "00" => leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q <= extendedFracX_uid47_fpTanTest_q;
                  WHEN "01" => leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q <= leftShiftStage0Idx1_uid208_fxpX_uid48_fpTanTest_q;
                  WHEN "10" => leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q <= leftShiftStage0Idx2_uid211_fxpX_uid48_fpTanTest_q;
                  WHEN "11" => leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q <= leftShiftStage0Idx3_uid214_fxpX_uid48_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest(BITSELECT,223)@15
    LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_in <= leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q(64 downto 0);
    LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_b <= LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_in(64 downto 0);

	--ld_LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_b(DELAY,967)@15
    ld_LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_b, xout => ld_LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad3_uid223_fxpX_uid48_fpTanTest(CONSTANT,222)
    leftShiftStage1Idx3Pad3_uid223_fxpX_uid48_fpTanTest_q <= "000";

	--leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest(BITJOIN,224)@16
    leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_q <= ld_LeftShiftStage064dto0_uid224_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_b_q & leftShiftStage1Idx3Pad3_uid223_fxpX_uid48_fpTanTest_q;

	--LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest(BITSELECT,220)@15
    LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_in <= leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q(65 downto 0);
    LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_b <= LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_in(65 downto 0);

	--ld_LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_b(DELAY,965)@15
    ld_LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 66, depth => 1 )
    PORT MAP ( xin => LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_b, xout => ld_LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest(BITJOIN,221)@16
    leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_q <= ld_LeftShiftStage065dto0_uid221_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_b_q & leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q;

	--LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest(BITSELECT,217)@15
    LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_in <= leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q(66 downto 0);
    LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_b <= LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_in(66 downto 0);

	--ld_LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_b(DELAY,963)@15
    ld_LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 67, depth => 1 )
    PORT MAP ( xin => LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_b, xout => ld_LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest(BITJOIN,218)@16
    leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_q <= ld_LeftShiftStage066dto0_uid218_fxpX_uid48_fpTanTest_b_to_leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_b_q & GND_q;

	--reg_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_2(REG,677)@15
    reg_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_2_q <= leftShiftStage0_uid216_fxpX_uid48_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest(BITSELECT,225)@14
    leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_in <= fxpXShiftVal_uid46_fpTanTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_b <= leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_b_to_reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_a(DELAY,1430)@14
    ld_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_b_to_reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_b, xout => ld_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_b_to_reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1(REG,676)@15
    reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_q <= ld_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_b_to_reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid227_fxpX_uid48_fpTanTest(MUX,226)@16
    leftShiftStage1_uid227_fxpX_uid48_fpTanTest_s <= reg_leftShiftStageSel1Dto0_uid226_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_1_q;
    leftShiftStage1_uid227_fxpX_uid48_fpTanTest: PROCESS (leftShiftStage1_uid227_fxpX_uid48_fpTanTest_s, en, reg_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_2_q, leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_q, leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_q, leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_q)
    BEGIN
            CASE leftShiftStage1_uid227_fxpX_uid48_fpTanTest_s IS
                  WHEN "00" => leftShiftStage1_uid227_fxpX_uid48_fpTanTest_q <= reg_leftShiftStage0_uid216_fxpX_uid48_fpTanTest_0_to_leftShiftStage1_uid227_fxpX_uid48_fpTanTest_2_q;
                  WHEN "01" => leftShiftStage1_uid227_fxpX_uid48_fpTanTest_q <= leftShiftStage1Idx1_uid219_fxpX_uid48_fpTanTest_q;
                  WHEN "10" => leftShiftStage1_uid227_fxpX_uid48_fpTanTest_q <= leftShiftStage1Idx2_uid222_fxpX_uid48_fpTanTest_q;
                  WHEN "11" => leftShiftStage1_uid227_fxpX_uid48_fpTanTest_q <= leftShiftStage1Idx3_uid225_fxpX_uid48_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage1_uid227_fxpX_uid48_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid50_fpTanTest(BITSELECT,49)@16
    y_uid50_fpTanTest_in <= leftShiftStage1_uid227_fxpX_uid48_fpTanTest_q(66 downto 0);
    y_uid50_fpTanTest_b <= y_uid50_fpTanTest_in(66 downto 1);

	--ld_y_uid50_fpTanTest_b_to_cmpYToOneMinusY_uid56_fpTanTest_b(DELAY,804)@16
    ld_y_uid50_fpTanTest_b_to_cmpYToOneMinusY_uid56_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 66, depth => 2 )
    PORT MAP ( xin => y_uid50_fpTanTest_b, xout => ld_y_uid50_fpTanTest_b_to_cmpYToOneMinusY_uid56_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_y_uid50_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_1(REG,679)@16
    reg_y_uid50_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid50_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_1_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_y_uid50_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_1_q <= y_uid50_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--pad_one_uid54_fpTanTest(BITJOIN,53)@16
    pad_one_uid54_fpTanTest_q <= VCC_q & STD_LOGIC_VECTOR((65 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_one_uid54_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_0(REG,678)@16
    reg_pad_one_uid54_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_one_uid54_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_0_q <= "0000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_one_uid54_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_0_q <= pad_one_uid54_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oneMinusY_uid54_fpTanTest(SUB,54)@17
    oneMinusY_uid54_fpTanTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_one_uid54_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_0_q);
    oneMinusY_uid54_fpTanTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid50_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_1_q);
            oneMinusY_uid54_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oneMinusY_uid54_fpTanTest_a) - UNSIGNED(oneMinusY_uid54_fpTanTest_b));
    oneMinusY_uid54_fpTanTest_q <= oneMinusY_uid54_fpTanTest_o(67 downto 0);


	--reg_oneMinusY_uid54_fpTanTest_0_to_cmpYToOneMinusY_uid56_fpTanTest_0(REG,680)@17
    reg_oneMinusY_uid54_fpTanTest_0_to_cmpYToOneMinusY_uid56_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oneMinusY_uid54_fpTanTest_0_to_cmpYToOneMinusY_uid56_fpTanTest_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oneMinusY_uid54_fpTanTest_0_to_cmpYToOneMinusY_uid56_fpTanTest_0_q <= oneMinusY_uid54_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--cmpYToOneMinusY_uid56_fpTanTest(COMPARE,55)@18
    cmpYToOneMinusY_uid56_fpTanTest_cin <= GND_q;
    cmpYToOneMinusY_uid56_fpTanTest_a <= STD_LOGIC_VECTOR("00" & reg_oneMinusY_uid54_fpTanTest_0_to_cmpYToOneMinusY_uid56_fpTanTest_0_q) & '0';
    cmpYToOneMinusY_uid56_fpTanTest_b <= STD_LOGIC_VECTOR("0000" & ld_y_uid50_fpTanTest_b_to_cmpYToOneMinusY_uid56_fpTanTest_b_q) & cmpYToOneMinusY_uid56_fpTanTest_cin(0);
            cmpYToOneMinusY_uid56_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpYToOneMinusY_uid56_fpTanTest_a) - UNSIGNED(cmpYToOneMinusY_uid56_fpTanTest_b));
    cmpYToOneMinusY_uid56_fpTanTest_c(0) <= cmpYToOneMinusY_uid56_fpTanTest_o(70);


	--InvCmpYToOneMinusY_uid60_fpTanTest(LOGICAL,59)@18
    InvCmpYToOneMinusY_uid60_fpTanTest_a <= cmpYToOneMinusY_uid56_fpTanTest_c;
    InvCmpYToOneMinusY_uid60_fpTanTest_q <= not InvCmpYToOneMinusY_uid60_fpTanTest_a;

	--intXParity_uid49_fpTanTest(BITSELECT,48)@16
    intXParity_uid49_fpTanTest_in <= leftShiftStage1_uid227_fxpX_uid48_fpTanTest_q;
    intXParity_uid49_fpTanTest_b <= intXParity_uid49_fpTanTest_in(67 downto 67);

	--ld_intXParity_uid49_fpTanTest_b_to_signRCond2_uid148_fpTanTest_b(DELAY,913)@16
    ld_intXParity_uid49_fpTanTest_b_to_signRCond2_uid148_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => intXParity_uid49_fpTanTest_b, xout => ld_intXParity_uid49_fpTanTest_b_to_signRCond2_uid148_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--yIsZero_uid51_fpTanTest(LOGICAL,50)@17
    yIsZero_uid51_fpTanTest_a <= reg_y_uid50_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_1_q;
    yIsZero_uid51_fpTanTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000000000000000000000000" & GND_q);
    yIsZero_uid51_fpTanTest_q <= "1" when yIsZero_uid51_fpTanTest_a = yIsZero_uid51_fpTanTest_b else "0";

	--ld_yIsZero_uid51_fpTanTest_q_to_InvYIsZero_uid147_fpTanTest_a(DELAY,911)@17
    ld_yIsZero_uid51_fpTanTest_q_to_InvYIsZero_uid147_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => yIsZero_uid51_fpTanTest_q, xout => ld_yIsZero_uid51_fpTanTest_q_to_InvYIsZero_uid147_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvYIsZero_uid147_fpTanTest(LOGICAL,146)@18
    InvYIsZero_uid147_fpTanTest_a <= ld_yIsZero_uid51_fpTanTest_q_to_InvYIsZero_uid147_fpTanTest_a_q;
    InvYIsZero_uid147_fpTanTest_q <= not InvYIsZero_uid147_fpTanTest_a;

	--signRCond2_uid148_fpTanTest(LOGICAL,147)@18
    signRCond2_uid148_fpTanTest_a <= InvYIsZero_uid147_fpTanTest_q;
    signRCond2_uid148_fpTanTest_b <= ld_intXParity_uid49_fpTanTest_b_to_signRCond2_uid148_fpTanTest_b_q;
    signRCond2_uid148_fpTanTest_c <= InvCmpYToOneMinusY_uid60_fpTanTest_q;
    signRCond2_uid148_fpTanTest_d <= InvCosOne_uid145_fpTanTest_q;
    signRCond2_uid148_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signRCond2_uid148_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            signRCond2_uid148_fpTanTest_q <= signRCond2_uid148_fpTanTest_a and signRCond2_uid148_fpTanTest_b and signRCond2_uid148_fpTanTest_c and signRCond2_uid148_fpTanTest_d;
        END IF;
        END IF;
    END PROCESS;



	--InvIntXParity_uid151_fpTanTest(LOGICAL,150)@16
    InvIntXParity_uid151_fpTanTest_a <= intXParity_uid49_fpTanTest_b;
    InvIntXParity_uid151_fpTanTest_q <= not InvIntXParity_uid151_fpTanTest_a;

	--ld_InvIntXParity_uid151_fpTanTest_q_to_signRCond1_uid153_fpTanTest_b(DELAY,918)@16
    ld_InvIntXParity_uid151_fpTanTest_q_to_signRCond1_uid153_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => InvIntXParity_uid151_fpTanTest_q, xout => ld_InvIntXParity_uid151_fpTanTest_q_to_signRCond1_uid153_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--signRCond1_uid153_fpTanTest(LOGICAL,152)@18
    signRCond1_uid153_fpTanTest_a <= InvYIsZero_uid147_fpTanTest_q;
    signRCond1_uid153_fpTanTest_b <= ld_InvIntXParity_uid151_fpTanTest_q_to_signRCond1_uid153_fpTanTest_b_q;
    signRCond1_uid153_fpTanTest_c <= cmpYToOneMinusY_uid56_fpTanTest_c;
    signRCond1_uid153_fpTanTest_d <= InvCosOne_uid145_fpTanTest_q;
    signRCond1_uid153_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signRCond1_uid153_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            signRCond1_uid153_fpTanTest_q <= signRCond1_uid153_fpTanTest_a and signRCond1_uid153_fpTanTest_b and signRCond1_uid153_fpTanTest_c and signRCond1_uid153_fpTanTest_d;
        END IF;
        END IF;
    END PROCESS;



	--signRCos_uid154_fpTanTest(LOGICAL,153)@19
    signRCos_uid154_fpTanTest_a <= signRCond1_uid153_fpTanTest_q;
    signRCos_uid154_fpTanTest_b <= signRCond2_uid148_fpTanTest_q;
    signRCos_uid154_fpTanTest_q <= signRCos_uid154_fpTanTest_a or signRCos_uid154_fpTanTest_b;

	--ld_signRCos_uid154_fpTanTest_q_to_fpCos_uid155_fpTanTest_c(DELAY,925)@19
    ld_signRCos_uid154_fpTanTest_q_to_fpCos_uid155_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => signRCos_uid154_fpTanTest_q, xout => ld_signRCos_uid154_fpTanTest_q_to_fpCos_uid155_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllOWE_uid6_fpTanTest(CONSTANT,5)
    cstAllOWE_uid6_fpTanTest_q <= "11111111";

	--cstBias_uid22_fpTanTest(CONSTANT,21)
    cstBias_uid22_fpTanTest_q <= "01111111";

	--ld_oneMinusY_uid54_fpTanTest_q_to_zSinOMyBottom_uid57_fpTanTest_a(DELAY,805)@17
    ld_oneMinusY_uid54_fpTanTest_q_to_zSinOMyBottom_uid57_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 68, depth => 1 )
    PORT MAP ( xin => oneMinusY_uid54_fpTanTest_q, xout => ld_oneMinusY_uid54_fpTanTest_q_to_zSinOMyBottom_uid57_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--zSinOMyBottom_uid57_fpTanTest(BITSELECT,56)@18
    zSinOMyBottom_uid57_fpTanTest_in <= ld_oneMinusY_uid54_fpTanTest_q_to_zSinOMyBottom_uid57_fpTanTest_a_q(64 downto 0);
    zSinOMyBottom_uid57_fpTanTest_b <= zSinOMyBottom_uid57_fpTanTest_in(64 downto 0);

	--reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3(REG,683)@18
    reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3_q <= zSinOMyBottom_uid57_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--zSinYBottom_uid58_fpTanTest(BITSELECT,57)@18
    zSinYBottom_uid58_fpTanTest_in <= ld_y_uid50_fpTanTest_b_to_cmpYToOneMinusY_uid56_fpTanTest_b_q(64 downto 0);
    zSinYBottom_uid58_fpTanTest_b <= zSinYBottom_uid58_fpTanTest_in(64 downto 0);

	--reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2(REG,682)@18
    reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2_q <= zSinYBottom_uid58_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_InvCmpYToOneMinusY_uid60_fpTanTest_0_to_zCos_uid63_fpTanTest_1(REG,718)@18
    reg_InvCmpYToOneMinusY_uid60_fpTanTest_0_to_zCos_uid63_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_InvCmpYToOneMinusY_uid60_fpTanTest_0_to_zCos_uid63_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_InvCmpYToOneMinusY_uid60_fpTanTest_0_to_zCos_uid63_fpTanTest_1_q <= InvCmpYToOneMinusY_uid60_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--zCos_uid63_fpTanTest(MUX,62)@19
    zCos_uid63_fpTanTest_s <= reg_InvCmpYToOneMinusY_uid60_fpTanTest_0_to_zCos_uid63_fpTanTest_1_q;
    zCos_uid63_fpTanTest: PROCESS (zCos_uid63_fpTanTest_s, en, reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2_q, reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3_q)
    BEGIN
            CASE zCos_uid63_fpTanTest_s IS
                  WHEN "0" => zCos_uid63_fpTanTest_q <= reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2_q;
                  WHEN "1" => zCos_uid63_fpTanTest_q <= reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3_q;
                  WHEN OTHERS => zCos_uid63_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--addr_uid82_fpTanTest(BITSELECT,81)@19
    addr_uid82_fpTanTest_in <= zCos_uid63_fpTanTest_q;
    addr_uid82_fpTanTest_b <= addr_uid82_fpTanTest_in(64 downto 57);

	--reg_addr_uid82_fpTanTest_0_to_memoryC2_uid397_tableGencosPiZ_lutmem_0(REG,734)@19
    reg_addr_uid82_fpTanTest_0_to_memoryC2_uid397_tableGencosPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid82_fpTanTest_0_to_memoryC2_uid397_tableGencosPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid82_fpTanTest_0_to_memoryC2_uid397_tableGencosPiZ_lutmem_0_q <= addr_uid82_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid397_tableGencosPiZ_lutmem(DUALMEM,644)@20
    memoryC2_uid397_tableGencosPiZ_lutmem_ia <= (others => '0');
    memoryC2_uid397_tableGencosPiZ_lutmem_aa <= (others => '0');
    memoryC2_uid397_tableGencosPiZ_lutmem_ab <= reg_addr_uid82_fpTanTest_0_to_memoryC2_uid397_tableGencosPiZ_lutmem_0_q;
    memoryC2_uid397_tableGencosPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_tan_s5_memoryC2_uid397_tableGencosPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid397_tableGencosPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid397_tableGencosPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid397_tableGencosPiZ_lutmem_iq,
        address_a => memoryC2_uid397_tableGencosPiZ_lutmem_aa,
        data_a => memoryC2_uid397_tableGencosPiZ_lutmem_ia
    );
    memoryC2_uid397_tableGencosPiZ_lutmem_reset0 <= areset;
        memoryC2_uid397_tableGencosPiZ_lutmem_q <= memoryC2_uid397_tableGencosPiZ_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid397_tableGencosPiZ_lutmem_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_1(REG,736)@22
    reg_memoryC2_uid397_tableGencosPiZ_lutmem_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid397_tableGencosPiZ_lutmem_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid397_tableGencosPiZ_lutmem_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_1_q <= memoryC2_uid397_tableGencosPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--zPcosPiZ_uid86_fpTanTest(BITSELECT,85)@19
    zPcosPiZ_uid86_fpTanTest_in <= zCos_uid63_fpTanTest_q(56 downto 0);
    zPcosPiZ_uid86_fpTanTest_b <= zPcosPiZ_uid86_fpTanTest_in(56 downto 42);

	--yT1_uid412_polyEvalcosPiZ(BITSELECT,411)@19
    yT1_uid412_polyEvalcosPiZ_in <= zPcosPiZ_uid86_fpTanTest_b;
    yT1_uid412_polyEvalcosPiZ_b <= yT1_uid412_polyEvalcosPiZ_in(14 downto 2);

	--reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0(REG,735)@19
    reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q <= yT1_uid412_polyEvalcosPiZ_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a_inputreg(DELAY,1766)
    ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q, xout => ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a(DELAY,1346)@20
    ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a_inputreg_q, xout => ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid592_pT1_uid413_polyEvalcosPiZ(MULT,591)@23
    prodXY_uid592_pT1_uid413_polyEvalcosPiZ_pr <= signed(resize(UNSIGNED(prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a),14)) * SIGNED(prodXY_uid592_pT1_uid413_polyEvalcosPiZ_b);
    prodXY_uid592_pT1_uid413_polyEvalcosPiZ_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a <= (others => '0');
            prodXY_uid592_pT1_uid413_polyEvalcosPiZ_b <= (others => '0');
            prodXY_uid592_pT1_uid413_polyEvalcosPiZ_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a <= ld_reg_yT1_uid412_polyEvalcosPiZ_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_0_q_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_a_q;
                prodXY_uid592_pT1_uid413_polyEvalcosPiZ_b <= reg_memoryC2_uid397_tableGencosPiZ_lutmem_0_to_prodXY_uid592_pT1_uid413_polyEvalcosPiZ_1_q;
                prodXY_uid592_pT1_uid413_polyEvalcosPiZ_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid592_pT1_uid413_polyEvalcosPiZ_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid592_pT1_uid413_polyEvalcosPiZ: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid592_pT1_uid413_polyEvalcosPiZ_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid592_pT1_uid413_polyEvalcosPiZ_q <= prodXY_uid592_pT1_uid413_polyEvalcosPiZ_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid593_pT1_uid413_polyEvalcosPiZ(BITSELECT,592)@26
    prodXYTruncFR_uid593_pT1_uid413_polyEvalcosPiZ_in <= prodXY_uid592_pT1_uid413_polyEvalcosPiZ_q;
    prodXYTruncFR_uid593_pT1_uid413_polyEvalcosPiZ_b <= prodXYTruncFR_uid593_pT1_uid413_polyEvalcosPiZ_in(25 downto 12);

	--highBBits_uid415_polyEvalcosPiZ(BITSELECT,414)@26
    highBBits_uid415_polyEvalcosPiZ_in <= prodXYTruncFR_uid593_pT1_uid413_polyEvalcosPiZ_b;
    highBBits_uid415_polyEvalcosPiZ_b <= highBBits_uid415_polyEvalcosPiZ_in(13 downto 1);

	--ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_a(DELAY,1491)@19
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => addr_uid82_fpTanTest_b, xout => ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0(REG,737)@22
    reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_q <= ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid395_tableGencosPiZ_lutmem(DUALMEM,643)@23
    memoryC1_uid395_tableGencosPiZ_lutmem_ia <= (others => '0');
    memoryC1_uid395_tableGencosPiZ_lutmem_aa <= (others => '0');
    memoryC1_uid395_tableGencosPiZ_lutmem_ab <= reg_addr_uid82_fpTanTest_0_to_memoryC1_uid395_tableGencosPiZ_lutmem_0_q;
    memoryC1_uid395_tableGencosPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_tan_s5_memoryC1_uid395_tableGencosPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid395_tableGencosPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid395_tableGencosPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid395_tableGencosPiZ_lutmem_iq,
        address_a => memoryC1_uid395_tableGencosPiZ_lutmem_aa,
        data_a => memoryC1_uid395_tableGencosPiZ_lutmem_ia
    );
    memoryC1_uid395_tableGencosPiZ_lutmem_reset0 <= areset;
        memoryC1_uid395_tableGencosPiZ_lutmem_q <= memoryC1_uid395_tableGencosPiZ_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid395_tableGencosPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalcosPiZ_0(REG,738)@25
    reg_memoryC1_uid395_tableGencosPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalcosPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid395_tableGencosPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalcosPiZ_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid395_tableGencosPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalcosPiZ_0_q <= memoryC1_uid395_tableGencosPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid416_polyEvalcosPiZ(ADD,415)@26
    sumAHighB_uid416_polyEvalcosPiZ_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid395_tableGencosPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalcosPiZ_0_q(20)) & reg_memoryC1_uid395_tableGencosPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalcosPiZ_0_q);
    sumAHighB_uid416_polyEvalcosPiZ_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid415_polyEvalcosPiZ_b(12)) & highBBits_uid415_polyEvalcosPiZ_b);
            sumAHighB_uid416_polyEvalcosPiZ_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid416_polyEvalcosPiZ_a) + SIGNED(sumAHighB_uid416_polyEvalcosPiZ_b));
    sumAHighB_uid416_polyEvalcosPiZ_q <= sumAHighB_uid416_polyEvalcosPiZ_o(21 downto 0);


	--lowRangeB_uid414_polyEvalcosPiZ(BITSELECT,413)@26
    lowRangeB_uid414_polyEvalcosPiZ_in <= prodXYTruncFR_uid593_pT1_uid413_polyEvalcosPiZ_b(0 downto 0);
    lowRangeB_uid414_polyEvalcosPiZ_b <= lowRangeB_uid414_polyEvalcosPiZ_in(0 downto 0);

	--s1_uid414_uid417_polyEvalcosPiZ(BITJOIN,416)@26
    s1_uid414_uid417_polyEvalcosPiZ_q <= sumAHighB_uid416_polyEvalcosPiZ_q & lowRangeB_uid414_polyEvalcosPiZ_b;

	--reg_s1_uid414_uid417_polyEvalcosPiZ_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_1(REG,740)@26
    reg_s1_uid414_uid417_polyEvalcosPiZ_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid414_uid417_polyEvalcosPiZ_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid414_uid417_polyEvalcosPiZ_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_1_q <= s1_uid414_uid417_polyEvalcosPiZ_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor(LOGICAL,1831)
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_b <= ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_sticky_ena_q;
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_q <= not (ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_a or ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_b);

	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_mem_top(CONSTANT,1774)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_mem_top_q <= "0100";

	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp(LOGICAL,1775)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_a <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_mem_top_q;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q);
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_q <= "1" when ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_a = ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_b else "0";

	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg(REG,1776)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_sticky_ena(REG,1832)
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_nor_q = "1") THEN
                ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_sticky_ena_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd(LOGICAL,1833)
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_a <= ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_sticky_ena_q;
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_b <= en;
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_q <= ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_a and ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_b;

	--ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_inputreg(DELAY,1821)
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => zPcosPiZ_uid86_fpTanTest_b, xout => ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt(COUNTER,1770)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_i = 3 THEN
                      ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_i <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_i <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_i,3));


	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg(REG,1771)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux(MUX,1772)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_s <= en;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux: PROCESS (ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_s, ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q, ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem(DUALMEM,1822)
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_ia <= ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_inputreg_q;
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_aa <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q;
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_ab <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q;
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 15,
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
        clocken1 => ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_iq,
        address_a => ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_aa,
        data_a => ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_ia
    );
    ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_reset0 <= areset;
        ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_q <= ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_iq(14 downto 0);

	--reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0(REG,739)@26
    reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_q <= ld_zPcosPiZ_uid86_fpTanTest_b_to_reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid595_pT2_uid419_polyEvalcosPiZ(MULT,594)@27
    prodXY_uid595_pT2_uid419_polyEvalcosPiZ_pr <= signed(resize(UNSIGNED(prodXY_uid595_pT2_uid419_polyEvalcosPiZ_a),16)) * SIGNED(prodXY_uid595_pT2_uid419_polyEvalcosPiZ_b);
    prodXY_uid595_pT2_uid419_polyEvalcosPiZ_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid595_pT2_uid419_polyEvalcosPiZ_a <= (others => '0');
            prodXY_uid595_pT2_uid419_polyEvalcosPiZ_b <= (others => '0');
            prodXY_uid595_pT2_uid419_polyEvalcosPiZ_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid595_pT2_uid419_polyEvalcosPiZ_a <= reg_zPcosPiZ_uid86_fpTanTest_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_0_q;
                prodXY_uid595_pT2_uid419_polyEvalcosPiZ_b <= reg_s1_uid414_uid417_polyEvalcosPiZ_0_to_prodXY_uid595_pT2_uid419_polyEvalcosPiZ_1_q;
                prodXY_uid595_pT2_uid419_polyEvalcosPiZ_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid595_pT2_uid419_polyEvalcosPiZ_pr,38));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid595_pT2_uid419_polyEvalcosPiZ: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid595_pT2_uid419_polyEvalcosPiZ_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid595_pT2_uid419_polyEvalcosPiZ_q <= prodXY_uid595_pT2_uid419_polyEvalcosPiZ_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid596_pT2_uid419_polyEvalcosPiZ(BITSELECT,595)@30
    prodXYTruncFR_uid596_pT2_uid419_polyEvalcosPiZ_in <= prodXY_uid595_pT2_uid419_polyEvalcosPiZ_q;
    prodXYTruncFR_uid596_pT2_uid419_polyEvalcosPiZ_b <= prodXYTruncFR_uid596_pT2_uid419_polyEvalcosPiZ_in(37 downto 14);

	--highBBits_uid421_polyEvalcosPiZ(BITSELECT,420)@30
    highBBits_uid421_polyEvalcosPiZ_in <= prodXYTruncFR_uid596_pT2_uid419_polyEvalcosPiZ_b;
    highBBits_uid421_polyEvalcosPiZ_b <= highBBits_uid421_polyEvalcosPiZ_in(23 downto 2);

	--ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor(LOGICAL,1844)
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_b <= ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_sticky_ena_q;
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_q <= not (ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_a or ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_b);

	--ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_sticky_ena(REG,1845)
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_nor_q = "1") THEN
                ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_sticky_ena_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd(LOGICAL,1846)
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_a <= ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_sticky_ena_q;
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_b <= en;
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_q <= ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_a and ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_b;

	--ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_inputreg(DELAY,1834)
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addr_uid82_fpTanTest_b, xout => ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem(DUALMEM,1835)
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_ia <= ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_inputreg_q;
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_aa <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q;
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_ab <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q;
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_iq,
        address_a => ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_aa,
        data_a => ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_ia
    );
    ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_q <= ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0(REG,741)@26
    reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_q <= ld_addr_uid82_fpTanTest_b_to_reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid393_tableGencosPiZ_lutmem(DUALMEM,642)@27
    memoryC0_uid393_tableGencosPiZ_lutmem_ia <= (others => '0');
    memoryC0_uid393_tableGencosPiZ_lutmem_aa <= (others => '0');
    memoryC0_uid393_tableGencosPiZ_lutmem_ab <= reg_addr_uid82_fpTanTest_0_to_memoryC0_uid393_tableGencosPiZ_lutmem_0_q;
    memoryC0_uid393_tableGencosPiZ_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 30,
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
        init_file => "fp_tan_s5_memoryC0_uid393_tableGencosPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid393_tableGencosPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid393_tableGencosPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid393_tableGencosPiZ_lutmem_iq,
        address_a => memoryC0_uid393_tableGencosPiZ_lutmem_aa,
        data_a => memoryC0_uid393_tableGencosPiZ_lutmem_ia
    );
    memoryC0_uid393_tableGencosPiZ_lutmem_reset0 <= areset;
        memoryC0_uid393_tableGencosPiZ_lutmem_q <= memoryC0_uid393_tableGencosPiZ_lutmem_iq(29 downto 0);

	--reg_memoryC0_uid393_tableGencosPiZ_lutmem_0_to_sumAHighB_uid422_polyEvalcosPiZ_0(REG,742)@29
    reg_memoryC0_uid393_tableGencosPiZ_lutmem_0_to_sumAHighB_uid422_polyEvalcosPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid393_tableGencosPiZ_lutmem_0_to_sumAHighB_uid422_polyEvalcosPiZ_0_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid393_tableGencosPiZ_lutmem_0_to_sumAHighB_uid422_polyEvalcosPiZ_0_q <= memoryC0_uid393_tableGencosPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid422_polyEvalcosPiZ(ADD,421)@30
    sumAHighB_uid422_polyEvalcosPiZ_a <= STD_LOGIC_VECTOR((30 downto 30 => reg_memoryC0_uid393_tableGencosPiZ_lutmem_0_to_sumAHighB_uid422_polyEvalcosPiZ_0_q(29)) & reg_memoryC0_uid393_tableGencosPiZ_lutmem_0_to_sumAHighB_uid422_polyEvalcosPiZ_0_q);
    sumAHighB_uid422_polyEvalcosPiZ_b <= STD_LOGIC_VECTOR((30 downto 22 => highBBits_uid421_polyEvalcosPiZ_b(21)) & highBBits_uid421_polyEvalcosPiZ_b);
            sumAHighB_uid422_polyEvalcosPiZ_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid422_polyEvalcosPiZ_a) + SIGNED(sumAHighB_uid422_polyEvalcosPiZ_b));
    sumAHighB_uid422_polyEvalcosPiZ_q <= sumAHighB_uid422_polyEvalcosPiZ_o(30 downto 0);


	--lowRangeB_uid420_polyEvalcosPiZ(BITSELECT,419)@30
    lowRangeB_uid420_polyEvalcosPiZ_in <= prodXYTruncFR_uid596_pT2_uid419_polyEvalcosPiZ_b(1 downto 0);
    lowRangeB_uid420_polyEvalcosPiZ_b <= lowRangeB_uid420_polyEvalcosPiZ_in(1 downto 0);

	--s2_uid420_uid423_polyEvalcosPiZ(BITJOIN,422)@30
    s2_uid420_uid423_polyEvalcosPiZ_q <= sumAHighB_uid422_polyEvalcosPiZ_q & lowRangeB_uid420_polyEvalcosPiZ_b;

	--polyEvalSigcosPiZ_uid88_fpTanTest(BITSELECT,87)@30
    polyEvalSigcosPiZ_uid88_fpTanTest_in <= s2_uid420_uid423_polyEvalcosPiZ_q(30 downto 0);
    polyEvalSigcosPiZ_uid88_fpTanTest_b <= polyEvalSigcosPiZ_uid88_fpTanTest_in(30 downto 5);

	--reg_polyEvalSigcosPiZ_uid88_fpTanTest_0_to_mulCos_uid104_fpTanTest_1(REG,744)@30
    reg_polyEvalSigcosPiZ_uid88_fpTanTest_0_to_mulCos_uid104_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_polyEvalSigcosPiZ_uid88_fpTanTest_0_to_mulCos_uid104_fpTanTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_polyEvalSigcosPiZ_uid88_fpTanTest_0_to_mulCos_uid104_fpTanTest_1_q <= polyEvalSigcosPiZ_uid88_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor(LOGICAL,1857)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_b <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_sticky_ena_q;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_q <= not (ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_a or ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_b);

	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_mem_top(CONSTANT,1853)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_mem_top_q <= "010";

	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp(LOGICAL,1854)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_a <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_mem_top_q;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_q);
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_q <= "1" when ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_a = ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_b else "0";

	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmpReg(REG,1855)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmpReg_q <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_sticky_ena(REG,1858)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_nor_q = "1") THEN
                ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_sticky_ena_q <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd(LOGICAL,1859)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_a <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_sticky_ena_q;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_b <= en;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_q <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_a and ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_b;

	--LeftShiftStage263dto0_uid382_alignedZCos_uid69_fpTanTest(BITSELECT,381)@25
    LeftShiftStage263dto0_uid382_alignedZCos_uid69_fpTanTest_in <= leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q(63 downto 0);
    LeftShiftStage263dto0_uid382_alignedZCos_uid69_fpTanTest_b <= LeftShiftStage263dto0_uid382_alignedZCos_uid69_fpTanTest_in(63 downto 0);

	--leftShiftStage3Idx1_uid383_alignedZCos_uid69_fpTanTest(BITJOIN,382)@25
    leftShiftStage3Idx1_uid383_alignedZCos_uid69_fpTanTest_q <= LeftShiftStage263dto0_uid382_alignedZCos_uid69_fpTanTest_b & GND_q;

	--cstZwShiftPwFRR_uid35_fpTanTest(CONSTANT,34)
    cstZwShiftPwFRR_uid35_fpTanTest_q <= "00000000000000000000000000000000000000000000000000000000000000000";

	--ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor(LOGICAL,1711)
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_b <= ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_sticky_ena_q;
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_q <= not (ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_a or ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_b);

	--ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_sticky_ena(REG,1712)
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_nor_q = "1") THEN
                ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_sticky_ena_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd(LOGICAL,1713)
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_a <= ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_sticky_ena_q;
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_b <= en;
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_q <= ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_a and ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_b;

	--X32dto0_uid353_alignedZCos_uid69_fpTanTest(BITSELECT,352)@19
    X32dto0_uid353_alignedZCos_uid69_fpTanTest_in <= zCos_uid63_fpTanTest_q(32 downto 0);
    X32dto0_uid353_alignedZCos_uid69_fpTanTest_b <= X32dto0_uid353_alignedZCos_uid69_fpTanTest_in(32 downto 0);

	--ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_inputreg(DELAY,1703)
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => X32dto0_uid353_alignedZCos_uid69_fpTanTest_b, xout => ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem(DUALMEM,1704)
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_ia <= ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_inputreg_q;
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_aa <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q;
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_ab <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q;
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 33,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 33,
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
        clocken1 => ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_iq,
        address_a => ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_aa,
        data_a => ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_ia
    );
    ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_reset0 <= areset;
        ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_q <= ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_iq(32 downto 0);

	--zs_uid237_lzcZSin_uid65_fpTanTest(CONSTANT,236)
    zs_uid237_lzcZSin_uid65_fpTanTest_q <= "00000000000000000000000000000000";

	--leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest(BITJOIN,353)@23
    leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_q <= ld_X32dto0_uid353_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_b_replace_mem_q & zs_uid237_lzcZSin_uid65_fpTanTest_q;

	--ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor(LOGICAL,1722)
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_b <= ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_sticky_ena_q;
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_q <= not (ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_a or ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_b);

	--ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_sticky_ena(REG,1723)
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_nor_q = "1") THEN
                ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_sticky_ena_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd(LOGICAL,1724)
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_a <= ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_sticky_ena_q;
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_b <= en;
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_q <= ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_a and ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_b;

	--ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_inputreg(DELAY,1714)
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => zCos_uid63_fpTanTest_q, xout => ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem(DUALMEM,1715)
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_ia <= ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_inputreg_q;
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_aa <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q;
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_ab <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q;
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 65,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 65,
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
        clocken1 => ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_iq,
        address_a => ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_aa,
        data_a => ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_ia
    );
    ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_reset0 <= areset;
        ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_q <= ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_iq(64 downto 0);

	--zs_uid229_lzcZSin_uid65_fpTanTest(CONSTANT,228)
    zs_uid229_lzcZSin_uid65_fpTanTest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

	--rVStage_uid309_lzcZCos_uid68_fpTanTest(BITSELECT,308)@19
    rVStage_uid309_lzcZCos_uid68_fpTanTest_in <= zCos_uid63_fpTanTest_q;
    rVStage_uid309_lzcZCos_uid68_fpTanTest_b <= rVStage_uid309_lzcZCos_uid68_fpTanTest_in(64 downto 1);

	--vCount_uid310_lzcZCos_uid68_fpTanTest(LOGICAL,309)@19
    vCount_uid310_lzcZCos_uid68_fpTanTest_a <= rVStage_uid309_lzcZCos_uid68_fpTanTest_b;
    vCount_uid310_lzcZCos_uid68_fpTanTest_b <= zs_uid229_lzcZSin_uid65_fpTanTest_q;
    vCount_uid310_lzcZCos_uid68_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid310_lzcZCos_uid68_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid310_lzcZCos_uid68_fpTanTest_a = vCount_uid310_lzcZCos_uid68_fpTanTest_b) THEN
                vCount_uid310_lzcZCos_uid68_fpTanTest_q <= "1";
            ELSE
                vCount_uid310_lzcZCos_uid68_fpTanTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid310_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_g(DELAY,1101)@20
    ld_vCount_uid310_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_g : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => vCount_uid310_lzcZCos_uid68_fpTanTest_q, xout => ld_vCount_uid310_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_g_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid312_lzcZCos_uid68_fpTanTest(BITSELECT,311)@19
    vStage_uid312_lzcZCos_uid68_fpTanTest_in <= zCos_uid63_fpTanTest_q(0 downto 0);
    vStage_uid312_lzcZCos_uid68_fpTanTest_b <= vStage_uid312_lzcZCos_uid68_fpTanTest_in(0 downto 0);

	--ld_vStage_uid312_lzcZCos_uid68_fpTanTest_b_to_cStage_uid313_lzcZCos_uid68_fpTanTest_b(DELAY,1059)@19
    ld_vStage_uid312_lzcZCos_uid68_fpTanTest_b_to_cStage_uid313_lzcZCos_uid68_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vStage_uid312_lzcZCos_uid68_fpTanTest_b, xout => ld_vStage_uid312_lzcZCos_uid68_fpTanTest_b_to_cStage_uid313_lzcZCos_uid68_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid232_lzcZSin_uid65_fpTanTest(CONSTANT,231)
    mO_uid232_lzcZSin_uid65_fpTanTest_q <= "111111111111111111111111111111111111111111111111111111111111111";

	--cStage_uid313_lzcZCos_uid68_fpTanTest(BITJOIN,312)@20
    cStage_uid313_lzcZCos_uid68_fpTanTest_q <= ld_vStage_uid312_lzcZCos_uid68_fpTanTest_b_to_cStage_uid313_lzcZCos_uid68_fpTanTest_b_q & mO_uid232_lzcZSin_uid65_fpTanTest_q;

	--ld_rVStage_uid309_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid315_lzcZCos_uid68_fpTanTest_c(DELAY,1061)@19
    ld_rVStage_uid309_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid315_lzcZCos_uid68_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => rVStage_uid309_lzcZCos_uid68_fpTanTest_b, xout => ld_rVStage_uid309_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid315_lzcZCos_uid68_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid315_lzcZCos_uid68_fpTanTest(MUX,314)@20
    vStagei_uid315_lzcZCos_uid68_fpTanTest_s <= vCount_uid310_lzcZCos_uid68_fpTanTest_q;
    vStagei_uid315_lzcZCos_uid68_fpTanTest: PROCESS (vStagei_uid315_lzcZCos_uid68_fpTanTest_s, en, ld_rVStage_uid309_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid315_lzcZCos_uid68_fpTanTest_c_q, cStage_uid313_lzcZCos_uid68_fpTanTest_q)
    BEGIN
            CASE vStagei_uid315_lzcZCos_uid68_fpTanTest_s IS
                  WHEN "0" => vStagei_uid315_lzcZCos_uid68_fpTanTest_q <= ld_rVStage_uid309_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid315_lzcZCos_uid68_fpTanTest_c_q;
                  WHEN "1" => vStagei_uid315_lzcZCos_uid68_fpTanTest_q <= cStage_uid313_lzcZCos_uid68_fpTanTest_q;
                  WHEN OTHERS => vStagei_uid315_lzcZCos_uid68_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid317_lzcZCos_uid68_fpTanTest(BITSELECT,316)@20
    rVStage_uid317_lzcZCos_uid68_fpTanTest_in <= vStagei_uid315_lzcZCos_uid68_fpTanTest_q;
    rVStage_uid317_lzcZCos_uid68_fpTanTest_b <= rVStage_uid317_lzcZCos_uid68_fpTanTest_in(63 downto 32);

	--vCount_uid318_lzcZCos_uid68_fpTanTest(LOGICAL,317)@20
    vCount_uid318_lzcZCos_uid68_fpTanTest_a <= rVStage_uid317_lzcZCos_uid68_fpTanTest_b;
    vCount_uid318_lzcZCos_uid68_fpTanTest_b <= zs_uid237_lzcZSin_uid65_fpTanTest_q;
    vCount_uid318_lzcZCos_uid68_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid318_lzcZCos_uid68_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid318_lzcZCos_uid68_fpTanTest_a = vCount_uid318_lzcZCos_uid68_fpTanTest_b) THEN
                vCount_uid318_lzcZCos_uid68_fpTanTest_q <= "1";
            ELSE
                vCount_uid318_lzcZCos_uid68_fpTanTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid318_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_f(DELAY,1100)@21
    ld_vCount_uid318_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid318_lzcZCos_uid68_fpTanTest_q, xout => ld_vCount_uid318_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid319_lzcZCos_uid68_fpTanTest(BITSELECT,318)@20
    vStage_uid319_lzcZCos_uid68_fpTanTest_in <= vStagei_uid315_lzcZCos_uid68_fpTanTest_q(31 downto 0);
    vStage_uid319_lzcZCos_uid68_fpTanTest_b <= vStage_uid319_lzcZCos_uid68_fpTanTest_in(31 downto 0);

	--ld_vStage_uid319_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_d(DELAY,1068)@20
    ld_vStage_uid319_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_d : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => vStage_uid319_lzcZCos_uid68_fpTanTest_b, xout => ld_vStage_uid319_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rVStage_uid317_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_c(DELAY,1067)@20
    ld_rVStage_uid317_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid317_lzcZCos_uid68_fpTanTest_b, xout => ld_rVStage_uid317_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid321_lzcZCos_uid68_fpTanTest(MUX,320)@21
    vStagei_uid321_lzcZCos_uid68_fpTanTest_s <= vCount_uid318_lzcZCos_uid68_fpTanTest_q;
    vStagei_uid321_lzcZCos_uid68_fpTanTest: PROCESS (vStagei_uid321_lzcZCos_uid68_fpTanTest_s, en, ld_rVStage_uid317_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_c_q, ld_vStage_uid319_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_d_q)
    BEGIN
            CASE vStagei_uid321_lzcZCos_uid68_fpTanTest_s IS
                  WHEN "0" => vStagei_uid321_lzcZCos_uid68_fpTanTest_q <= ld_rVStage_uid317_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_c_q;
                  WHEN "1" => vStagei_uid321_lzcZCos_uid68_fpTanTest_q <= ld_vStage_uid319_lzcZCos_uid68_fpTanTest_b_to_vStagei_uid321_lzcZCos_uid68_fpTanTest_d_q;
                  WHEN OTHERS => vStagei_uid321_lzcZCos_uid68_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid323_lzcZCos_uid68_fpTanTest(BITSELECT,322)@21
    rVStage_uid323_lzcZCos_uid68_fpTanTest_in <= vStagei_uid321_lzcZCos_uid68_fpTanTest_q;
    rVStage_uid323_lzcZCos_uid68_fpTanTest_b <= rVStage_uid323_lzcZCos_uid68_fpTanTest_in(31 downto 16);

	--vCount_uid324_lzcZCos_uid68_fpTanTest(LOGICAL,323)@21
    vCount_uid324_lzcZCos_uid68_fpTanTest_a <= rVStage_uid323_lzcZCos_uid68_fpTanTest_b;
    vCount_uid324_lzcZCos_uid68_fpTanTest_b <= zs_uid243_lzcZSin_uid65_fpTanTest_q;
    vCount_uid324_lzcZCos_uid68_fpTanTest_q <= "1" when vCount_uid324_lzcZCos_uid68_fpTanTest_a = vCount_uid324_lzcZCos_uid68_fpTanTest_b else "0";

	--reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4(REG,726)@21
    reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q <= vCount_uid324_lzcZCos_uid68_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q_to_r_uid349_lzcZCos_uid68_fpTanTest_e(DELAY,1099)@22
    ld_reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q_to_r_uid349_lzcZCos_uid68_fpTanTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q, xout => ld_reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q_to_r_uid349_lzcZCos_uid68_fpTanTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid325_lzcZCos_uid68_fpTanTest(BITSELECT,324)@21
    vStage_uid325_lzcZCos_uid68_fpTanTest_in <= vStagei_uid321_lzcZCos_uid68_fpTanTest_q(15 downto 0);
    vStage_uid325_lzcZCos_uid68_fpTanTest_b <= vStage_uid325_lzcZCos_uid68_fpTanTest_in(15 downto 0);

	--vStagei_uid327_lzcZCos_uid68_fpTanTest(MUX,326)@21
    vStagei_uid327_lzcZCos_uid68_fpTanTest_s <= vCount_uid324_lzcZCos_uid68_fpTanTest_q;
    vStagei_uid327_lzcZCos_uid68_fpTanTest: PROCESS (vStagei_uid327_lzcZCos_uid68_fpTanTest_s, en, rVStage_uid323_lzcZCos_uid68_fpTanTest_b, vStage_uid325_lzcZCos_uid68_fpTanTest_b)
    BEGIN
            CASE vStagei_uid327_lzcZCos_uid68_fpTanTest_s IS
                  WHEN "0" => vStagei_uid327_lzcZCos_uid68_fpTanTest_q <= rVStage_uid323_lzcZCos_uid68_fpTanTest_b;
                  WHEN "1" => vStagei_uid327_lzcZCos_uid68_fpTanTest_q <= vStage_uid325_lzcZCos_uid68_fpTanTest_b;
                  WHEN OTHERS => vStagei_uid327_lzcZCos_uid68_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid329_lzcZCos_uid68_fpTanTest(BITSELECT,328)@21
    rVStage_uid329_lzcZCos_uid68_fpTanTest_in <= vStagei_uid327_lzcZCos_uid68_fpTanTest_q;
    rVStage_uid329_lzcZCos_uid68_fpTanTest_b <= rVStage_uid329_lzcZCos_uid68_fpTanTest_in(15 downto 8);

	--reg_rVStage_uid329_lzcZCos_uid68_fpTanTest_0_to_vCount_uid330_lzcZCos_uid68_fpTanTest_1(REG,721)@21
    reg_rVStage_uid329_lzcZCos_uid68_fpTanTest_0_to_vCount_uid330_lzcZCos_uid68_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid329_lzcZCos_uid68_fpTanTest_0_to_vCount_uid330_lzcZCos_uid68_fpTanTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid329_lzcZCos_uid68_fpTanTest_0_to_vCount_uid330_lzcZCos_uid68_fpTanTest_1_q <= rVStage_uid329_lzcZCos_uid68_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid330_lzcZCos_uid68_fpTanTest(LOGICAL,329)@22
    vCount_uid330_lzcZCos_uid68_fpTanTest_a <= reg_rVStage_uid329_lzcZCos_uid68_fpTanTest_0_to_vCount_uid330_lzcZCos_uid68_fpTanTest_1_q;
    vCount_uid330_lzcZCos_uid68_fpTanTest_b <= cstAllZWE_uid8_fpTanTest_q;
    vCount_uid330_lzcZCos_uid68_fpTanTest_q <= "1" when vCount_uid330_lzcZCos_uid68_fpTanTest_a = vCount_uid330_lzcZCos_uid68_fpTanTest_b else "0";

	--ld_vCount_uid330_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_d(DELAY,1098)@22
    ld_vCount_uid330_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid330_lzcZCos_uid68_fpTanTest_q, xout => ld_vCount_uid330_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid331_lzcZCos_uid68_fpTanTest(BITSELECT,330)@21
    vStage_uid331_lzcZCos_uid68_fpTanTest_in <= vStagei_uid327_lzcZCos_uid68_fpTanTest_q(7 downto 0);
    vStage_uid331_lzcZCos_uid68_fpTanTest_b <= vStage_uid331_lzcZCos_uid68_fpTanTest_in(7 downto 0);

	--reg_vStage_uid331_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid333_lzcZCos_uid68_fpTanTest_3(REG,723)@21
    reg_vStage_uid331_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid333_lzcZCos_uid68_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid331_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid333_lzcZCos_uid68_fpTanTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid331_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid333_lzcZCos_uid68_fpTanTest_3_q <= vStage_uid331_lzcZCos_uid68_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid333_lzcZCos_uid68_fpTanTest(MUX,332)@22
    vStagei_uid333_lzcZCos_uid68_fpTanTest_s <= vCount_uid330_lzcZCos_uid68_fpTanTest_q;
    vStagei_uid333_lzcZCos_uid68_fpTanTest: PROCESS (vStagei_uid333_lzcZCos_uid68_fpTanTest_s, en, reg_rVStage_uid329_lzcZCos_uid68_fpTanTest_0_to_vCount_uid330_lzcZCos_uid68_fpTanTest_1_q, reg_vStage_uid331_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid333_lzcZCos_uid68_fpTanTest_3_q)
    BEGIN
            CASE vStagei_uid333_lzcZCos_uid68_fpTanTest_s IS
                  WHEN "0" => vStagei_uid333_lzcZCos_uid68_fpTanTest_q <= reg_rVStage_uid329_lzcZCos_uid68_fpTanTest_0_to_vCount_uid330_lzcZCos_uid68_fpTanTest_1_q;
                  WHEN "1" => vStagei_uid333_lzcZCos_uid68_fpTanTest_q <= reg_vStage_uid331_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid333_lzcZCos_uid68_fpTanTest_3_q;
                  WHEN OTHERS => vStagei_uid333_lzcZCos_uid68_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid335_lzcZCos_uid68_fpTanTest(BITSELECT,334)@22
    rVStage_uid335_lzcZCos_uid68_fpTanTest_in <= vStagei_uid333_lzcZCos_uid68_fpTanTest_q;
    rVStage_uid335_lzcZCos_uid68_fpTanTest_b <= rVStage_uid335_lzcZCos_uid68_fpTanTest_in(7 downto 4);

	--vCount_uid336_lzcZCos_uid68_fpTanTest(LOGICAL,335)@22
    vCount_uid336_lzcZCos_uid68_fpTanTest_a <= rVStage_uid335_lzcZCos_uid68_fpTanTest_b;
    vCount_uid336_lzcZCos_uid68_fpTanTest_b <= leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q;
    vCount_uid336_lzcZCos_uid68_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid336_lzcZCos_uid68_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid336_lzcZCos_uid68_fpTanTest_a = vCount_uid336_lzcZCos_uid68_fpTanTest_b) THEN
                vCount_uid336_lzcZCos_uid68_fpTanTest_q <= "1";
            ELSE
                vCount_uid336_lzcZCos_uid68_fpTanTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid337_lzcZCos_uid68_fpTanTest(BITSELECT,336)@22
    vStage_uid337_lzcZCos_uid68_fpTanTest_in <= vStagei_uid333_lzcZCos_uid68_fpTanTest_q(3 downto 0);
    vStage_uid337_lzcZCos_uid68_fpTanTest_b <= vStage_uid337_lzcZCos_uid68_fpTanTest_in(3 downto 0);

	--reg_vStage_uid337_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_3(REG,725)@22
    reg_vStage_uid337_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid337_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid337_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_3_q <= vStage_uid337_lzcZCos_uid68_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid335_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_2(REG,724)@22
    reg_rVStage_uid335_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid335_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_2_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid335_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_2_q <= rVStage_uid335_lzcZCos_uid68_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid339_lzcZCos_uid68_fpTanTest(MUX,338)@23
    vStagei_uid339_lzcZCos_uid68_fpTanTest_s <= vCount_uid336_lzcZCos_uid68_fpTanTest_q;
    vStagei_uid339_lzcZCos_uid68_fpTanTest: PROCESS (vStagei_uid339_lzcZCos_uid68_fpTanTest_s, en, reg_rVStage_uid335_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_2_q, reg_vStage_uid337_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_3_q)
    BEGIN
            CASE vStagei_uid339_lzcZCos_uid68_fpTanTest_s IS
                  WHEN "0" => vStagei_uid339_lzcZCos_uid68_fpTanTest_q <= reg_rVStage_uid335_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_2_q;
                  WHEN "1" => vStagei_uid339_lzcZCos_uid68_fpTanTest_q <= reg_vStage_uid337_lzcZCos_uid68_fpTanTest_0_to_vStagei_uid339_lzcZCos_uid68_fpTanTest_3_q;
                  WHEN OTHERS => vStagei_uid339_lzcZCos_uid68_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid341_lzcZCos_uid68_fpTanTest(BITSELECT,340)@23
    rVStage_uid341_lzcZCos_uid68_fpTanTest_in <= vStagei_uid339_lzcZCos_uid68_fpTanTest_q;
    rVStage_uid341_lzcZCos_uid68_fpTanTest_b <= rVStage_uid341_lzcZCos_uid68_fpTanTest_in(3 downto 2);

	--vCount_uid342_lzcZCos_uid68_fpTanTest(LOGICAL,341)@23
    vCount_uid342_lzcZCos_uid68_fpTanTest_a <= rVStage_uid341_lzcZCos_uid68_fpTanTest_b;
    vCount_uid342_lzcZCos_uid68_fpTanTest_b <= leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q;
    vCount_uid342_lzcZCos_uid68_fpTanTest_q <= "1" when vCount_uid342_lzcZCos_uid68_fpTanTest_a = vCount_uid342_lzcZCos_uid68_fpTanTest_b else "0";

	--vStage_uid343_lzcZCos_uid68_fpTanTest(BITSELECT,342)@23
    vStage_uid343_lzcZCos_uid68_fpTanTest_in <= vStagei_uid339_lzcZCos_uid68_fpTanTest_q(1 downto 0);
    vStage_uid343_lzcZCos_uid68_fpTanTest_b <= vStage_uid343_lzcZCos_uid68_fpTanTest_in(1 downto 0);

	--vStagei_uid345_lzcZCos_uid68_fpTanTest(MUX,344)@23
    vStagei_uid345_lzcZCos_uid68_fpTanTest_s <= vCount_uid342_lzcZCos_uid68_fpTanTest_q;
    vStagei_uid345_lzcZCos_uid68_fpTanTest: PROCESS (vStagei_uid345_lzcZCos_uid68_fpTanTest_s, en, rVStage_uid341_lzcZCos_uid68_fpTanTest_b, vStage_uid343_lzcZCos_uid68_fpTanTest_b)
    BEGIN
            CASE vStagei_uid345_lzcZCos_uid68_fpTanTest_s IS
                  WHEN "0" => vStagei_uid345_lzcZCos_uid68_fpTanTest_q <= rVStage_uid341_lzcZCos_uid68_fpTanTest_b;
                  WHEN "1" => vStagei_uid345_lzcZCos_uid68_fpTanTest_q <= vStage_uid343_lzcZCos_uid68_fpTanTest_b;
                  WHEN OTHERS => vStagei_uid345_lzcZCos_uid68_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid347_lzcZCos_uid68_fpTanTest(BITSELECT,346)@23
    rVStage_uid347_lzcZCos_uid68_fpTanTest_in <= vStagei_uid345_lzcZCos_uid68_fpTanTest_q;
    rVStage_uid347_lzcZCos_uid68_fpTanTest_b <= rVStage_uid347_lzcZCos_uid68_fpTanTest_in(1 downto 1);

	--vCount_uid348_lzcZCos_uid68_fpTanTest(LOGICAL,347)@23
    vCount_uid348_lzcZCos_uid68_fpTanTest_a <= rVStage_uid347_lzcZCos_uid68_fpTanTest_b;
    vCount_uid348_lzcZCos_uid68_fpTanTest_b <= GND_q;
    vCount_uid348_lzcZCos_uid68_fpTanTest_q <= "1" when vCount_uid348_lzcZCos_uid68_fpTanTest_a = vCount_uid348_lzcZCos_uid68_fpTanTest_b else "0";

	--r_uid349_lzcZCos_uid68_fpTanTest(BITJOIN,348)@23
    r_uid349_lzcZCos_uid68_fpTanTest_q <= ld_vCount_uid310_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_g_q & ld_vCount_uid318_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_f_q & ld_reg_vCount_uid324_lzcZCos_uid68_fpTanTest_0_to_r_uid349_lzcZCos_uid68_fpTanTest_4_q_to_r_uid349_lzcZCos_uid68_fpTanTest_e_q & ld_vCount_uid330_lzcZCos_uid68_fpTanTest_q_to_r_uid349_lzcZCos_uid68_fpTanTest_d_q & vCount_uid336_lzcZCos_uid68_fpTanTest_q & vCount_uid342_lzcZCos_uid68_fpTanTest_q & vCount_uid348_lzcZCos_uid68_fpTanTest_q;

	--leftShiftStageSel6Dto5_uid357_alignedZCos_uid69_fpTanTest(BITSELECT,356)@23
    leftShiftStageSel6Dto5_uid357_alignedZCos_uid69_fpTanTest_in <= r_uid349_lzcZCos_uid68_fpTanTest_q;
    leftShiftStageSel6Dto5_uid357_alignedZCos_uid69_fpTanTest_b <= leftShiftStageSel6Dto5_uid357_alignedZCos_uid69_fpTanTest_in(6 downto 5);

	--leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest(MUX,357)@23
    leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_s <= leftShiftStageSel6Dto5_uid357_alignedZCos_uid69_fpTanTest_b;
    leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest: PROCESS (leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_s, en, ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_q, leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_q, cstZwShiftPwFRR_uid35_fpTanTest_q, cstZwShiftPwFRR_uid35_fpTanTest_q)
    BEGIN
            CASE leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_s IS
                  WHEN "00" => leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q <= ld_zCos_uid63_fpTanTest_q_to_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q <= leftShiftStage0Idx1_uid354_alignedZCos_uid69_fpTanTest_q;
                  WHEN "10" => leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q <= cstZwShiftPwFRR_uid35_fpTanTest_q;
                  WHEN "11" => leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q <= cstZwShiftPwFRR_uid35_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage040dto0_uid366_alignedZCos_uid69_fpTanTest(BITSELECT,365)@23
    LeftShiftStage040dto0_uid366_alignedZCos_uid69_fpTanTest_in <= leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q(40 downto 0);
    LeftShiftStage040dto0_uid366_alignedZCos_uid69_fpTanTest_b <= LeftShiftStage040dto0_uid366_alignedZCos_uid69_fpTanTest_in(40 downto 0);

	--leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest(BITJOIN,366)@23
    leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_q <= LeftShiftStage040dto0_uid366_alignedZCos_uid69_fpTanTest_b & leftShiftStage1Idx3Pad24_uid286_alignedZSin_uid66_fpTanTest_q;

	--reg_leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_5(REG,731)@23
    reg_leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_5_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_5_q <= leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage048dto0_uid363_alignedZCos_uid69_fpTanTest(BITSELECT,362)@23
    LeftShiftStage048dto0_uid363_alignedZCos_uid69_fpTanTest_in <= leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q(48 downto 0);
    LeftShiftStage048dto0_uid363_alignedZCos_uid69_fpTanTest_b <= LeftShiftStage048dto0_uid363_alignedZCos_uid69_fpTanTest_in(48 downto 0);

	--leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest(BITJOIN,363)@23
    leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_q <= LeftShiftStage048dto0_uid363_alignedZCos_uid69_fpTanTest_b & zs_uid243_lzcZSin_uid65_fpTanTest_q;

	--reg_leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_4(REG,730)@23
    reg_leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_4_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_4_q <= leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage056dto0_uid360_alignedZCos_uid69_fpTanTest(BITSELECT,359)@23
    LeftShiftStage056dto0_uid360_alignedZCos_uid69_fpTanTest_in <= leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q(56 downto 0);
    LeftShiftStage056dto0_uid360_alignedZCos_uid69_fpTanTest_b <= LeftShiftStage056dto0_uid360_alignedZCos_uid69_fpTanTest_in(56 downto 0);

	--leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest(BITJOIN,360)@23
    leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_q <= LeftShiftStage056dto0_uid360_alignedZCos_uid69_fpTanTest_b & cstAllZWE_uid8_fpTanTest_q;

	--reg_leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_3(REG,729)@23
    reg_leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_3_q <= leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_2(REG,728)@23
    reg_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_2_q <= leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest(BITSELECT,367)@23
    leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_in <= r_uid349_lzcZCos_uid68_fpTanTest_q(4 downto 0);
    leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_b <= leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_in(4 downto 3);

	--reg_leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_1(REG,727)@23
    reg_leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_1_q <= leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest(MUX,368)@24
    leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_s <= reg_leftShiftStageSel4Dto3_uid368_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_1_q;
    leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest: PROCESS (leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_s, en, reg_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_2_q, reg_leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_3_q, reg_leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_4_q, reg_leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_s IS
                  WHEN "00" => leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q <= reg_leftShiftStage0_uid358_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_2_q;
                  WHEN "01" => leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q <= reg_leftShiftStage1Idx1_uid361_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_3_q;
                  WHEN "10" => leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q <= reg_leftShiftStage1Idx2_uid364_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_4_q;
                  WHEN "11" => leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q <= reg_leftShiftStage1Idx3_uid367_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest(BITSELECT,376)@24
    LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_in <= leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q(58 downto 0);
    LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_b <= LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_in(58 downto 0);

	--ld_LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_b(DELAY,1125)@24
    ld_LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 59, depth => 1 )
    PORT MAP ( xin => LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_b, xout => ld_LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest(BITJOIN,377)@25
    leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_q <= ld_LeftShiftStage158dto0_uid377_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_b_q & leftShiftStage2Idx3Pad6_uid297_alignedZSin_uid66_fpTanTest_q;

	--LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest(BITSELECT,373)@24
    LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_in <= leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q(60 downto 0);
    LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_b <= LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_in(60 downto 0);

	--ld_LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_b(DELAY,1123)@24
    ld_LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 61, depth => 1 )
    PORT MAP ( xin => LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_b, xout => ld_LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest(BITJOIN,374)@25
    leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_q <= ld_LeftShiftStage160dto0_uid374_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_b_q & leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q;

	--LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest(BITSELECT,370)@24
    LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_in <= leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q(62 downto 0);
    LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_b <= LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_in(62 downto 0);

	--ld_LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_b(DELAY,1121)@24
    ld_LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 63, depth => 1 )
    PORT MAP ( xin => LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_b, xout => ld_LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest(BITJOIN,371)@25
    leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_q <= ld_LeftShiftStage162dto0_uid371_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_b_q & leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q;

	--reg_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_2(REG,733)@24
    reg_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_2_q <= leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest(BITSELECT,378)@23
    leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_in <= r_uid349_lzcZCos_uid68_fpTanTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_b <= leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1(REG,732)@23
    reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q <= leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_b(DELAY,1127)@24
    ld_reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q, xout => ld_reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest(MUX,379)@25
    leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_s <= ld_reg_leftShiftStageSel2Dto1_uid379_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_1_q_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_b_q;
    leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest: PROCESS (leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_s, en, reg_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_2_q, leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_q, leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_q, leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_q)
    BEGIN
            CASE leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_s IS
                  WHEN "00" => leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q <= reg_leftShiftStage1_uid369_alignedZCos_uid69_fpTanTest_0_to_leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_2_q;
                  WHEN "01" => leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q <= leftShiftStage2Idx1_uid372_alignedZCos_uid69_fpTanTest_q;
                  WHEN "10" => leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q <= leftShiftStage2Idx2_uid375_alignedZCos_uid69_fpTanTest_q;
                  WHEN "11" => leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q <= leftShiftStage2Idx3_uid378_alignedZCos_uid69_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest(BITSELECT,383)@23
    leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_in <= r_uid349_lzcZCos_uid68_fpTanTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_b <= leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_b(DELAY,1135)@23
    ld_leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_b, xout => ld_leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest(MUX,384)@25
    leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_s <= ld_leftShiftStageSel0Dto0_uid384_alignedZCos_uid69_fpTanTest_b_to_leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_b_q;
    leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest: PROCESS (leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_s, en, leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q, leftShiftStage3Idx1_uid383_alignedZCos_uid69_fpTanTest_q)
    BEGIN
            CASE leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_s IS
                  WHEN "0" => leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_q <= leftShiftStage2_uid380_alignedZCos_uid69_fpTanTest_q;
                  WHEN "1" => leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_q <= leftShiftStage3Idx1_uid383_alignedZCos_uid69_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pCos_uid76_fpTanTest(BITSELECT,75)@25
    pCos_uid76_fpTanTest_in <= leftShiftStage3_uid385_alignedZCos_uid69_fpTanTest_q;
    pCos_uid76_fpTanTest_b <= pCos_uid76_fpTanTest_in(64 downto 39);

	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_inputreg(DELAY,1847)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => pCos_uid76_fpTanTest_b, xout => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt(COUNTER,1849)
    -- every=1, low=0, high=2, step=1, init=1
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_i = 1 THEN
                      ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_eq = '1') THEN
                        ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_i <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_i <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_i,2));


	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdreg(REG,1850)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdreg_q <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux(MUX,1851)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_s <= en;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux: PROCESS (ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_s, ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdreg_q, ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_q <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdreg_q;
                  WHEN "1" => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_q <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem(DUALMEM,1848)
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_ia <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_inputreg_q;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_aa <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdreg_q;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_ab <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_rdmux_q;
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 26,
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
        clocken1 => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_iq,
        address_a => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_aa,
        data_a => ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_ia
    );
    ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_reset0 <= areset;
        ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_q <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_iq(25 downto 0);

	--reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0(REG,743)@30
    reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_q <= ld_pCos_uid76_fpTanTest_b_to_reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--mulCos_uid104_fpTanTest(MULT,103)@31
    mulCos_uid104_fpTanTest_pr <= UNSIGNED(mulCos_uid104_fpTanTest_a) * UNSIGNED(mulCos_uid104_fpTanTest_b);
    mulCos_uid104_fpTanTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulCos_uid104_fpTanTest_a <= (others => '0');
            mulCos_uid104_fpTanTest_b <= (others => '0');
            mulCos_uid104_fpTanTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulCos_uid104_fpTanTest_a <= reg_pCos_uid76_fpTanTest_0_to_mulCos_uid104_fpTanTest_0_q;
                mulCos_uid104_fpTanTest_b <= reg_polyEvalSigcosPiZ_uid88_fpTanTest_0_to_mulCos_uid104_fpTanTest_1_q;
                mulCos_uid104_fpTanTest_s1 <= STD_LOGIC_VECTOR(mulCos_uid104_fpTanTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mulCos_uid104_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulCos_uid104_fpTanTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulCos_uid104_fpTanTest_q <= mulCos_uid104_fpTanTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBitCos_uid105_fpTanTest(BITSELECT,104)@34
    normBitCos_uid105_fpTanTest_in <= mulCos_uid104_fpTanTest_q;
    normBitCos_uid105_fpTanTest_b <= normBitCos_uid105_fpTanTest_in(51 downto 51);

	--cosRndOp_uid111_uid112_fpTanTest(BITJOIN,111)@34
    cosRndOp_uid111_uid112_fpTanTest_q <= normBitCos_uid105_fpTanTest_b & cstAllZWF_uid7_fpTanTest_q & VCC_q;

	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor(LOGICAL,1552)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_b <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_sticky_ena_q;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_q <= not (ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_a or ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_b);

	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_mem_top(CONSTANT,1548)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_mem_top_q <= "0110";

	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp(LOGICAL,1549)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_a <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_mem_top_q;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_q);
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_q <= "1" when ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_a = ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_b else "0";

	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmpReg(REG,1550)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmpReg_q <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_sticky_ena(REG,1553)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_nor_q = "1") THEN
                ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_sticky_ena_q <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd(LOGICAL,1554)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_a <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_sticky_ena_q;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_b <= en;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_q <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_a and ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_b;

	--reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1(REG,745)@23
    reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q <= r_uid349_lzcZCos_uid68_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_inputreg(DELAY,1542)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q, xout => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt(COUNTER,1544)
    -- every=1, low=0, high=6, step=1, init=1
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_i = 5 THEN
                      ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_i <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_i <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_i,3));


	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg(REG,1545)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg_q <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux(MUX,1546)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_s <= en;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux: PROCESS (ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_s, ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg_q, ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_q <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_q <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem(DUALMEM,1543)
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_ia <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_inputreg_q;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_aa <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg_q;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_ab <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_q;
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 7,
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
        clocken1 => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_iq,
        address_a => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_aa,
        data_a => ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_ia
    );
    ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_reset0 <= areset;
        ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_q <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_iq(6 downto 0);

	--expHardCase_uid77_fpTanTest(SUB,76)@33
    expHardCase_uid77_fpTanTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_fpTanTest_q);
    expHardCase_uid77_fpTanTest_b <= STD_LOGIC_VECTOR("00" & ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_mem_q);
            expHardCase_uid77_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid77_fpTanTest_a) - UNSIGNED(expHardCase_uid77_fpTanTest_b));
    expHardCase_uid77_fpTanTest_q <= expHardCase_uid77_fpTanTest_o(8 downto 0);


	--expPCos_uid78_fpTanTest(BITSELECT,77)@33
    expPCos_uid78_fpTanTest_in <= expHardCase_uid77_fpTanTest_q(7 downto 0);
    expPCos_uid78_fpTanTest_b <= expPCos_uid78_fpTanTest_in(7 downto 0);

	--reg_expPCos_uid78_fpTanTest_0_to_expFracRCosPreRnd_uid110_uid110_fpTanTest_1(REG,746)@33
    reg_expPCos_uid78_fpTanTest_0_to_expFracRCosPreRnd_uid110_uid110_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expPCos_uid78_fpTanTest_0_to_expFracRCosPreRnd_uid110_uid110_fpTanTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expPCos_uid78_fpTanTest_0_to_expFracRCosPreRnd_uid110_uid110_fpTanTest_1_q <= expPCos_uid78_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRCosPreRndHigh_uid107_fpTanTest(BITSELECT,106)@34
    fracRCosPreRndHigh_uid107_fpTanTest_in <= mulCos_uid104_fpTanTest_q(50 downto 0);
    fracRCosPreRndHigh_uid107_fpTanTest_b <= fracRCosPreRndHigh_uid107_fpTanTest_in(50 downto 27);

	--fracRCosPreRndLow_uid108_fpTanTest(BITSELECT,107)@34
    fracRCosPreRndLow_uid108_fpTanTest_in <= mulCos_uid104_fpTanTest_q(49 downto 0);
    fracRCosPreRndLow_uid108_fpTanTest_b <= fracRCosPreRndLow_uid108_fpTanTest_in(49 downto 26);

	--fracRCosPreRnd_uid109_fpTanTest(MUX,108)@34
    fracRCosPreRnd_uid109_fpTanTest_s <= normBitCos_uid105_fpTanTest_b;
    fracRCosPreRnd_uid109_fpTanTest: PROCESS (fracRCosPreRnd_uid109_fpTanTest_s, en, fracRCosPreRndLow_uid108_fpTanTest_b, fracRCosPreRndHigh_uid107_fpTanTest_b)
    BEGIN
            CASE fracRCosPreRnd_uid109_fpTanTest_s IS
                  WHEN "0" => fracRCosPreRnd_uid109_fpTanTest_q <= fracRCosPreRndLow_uid108_fpTanTest_b;
                  WHEN "1" => fracRCosPreRnd_uid109_fpTanTest_q <= fracRCosPreRndHigh_uid107_fpTanTest_b;
                  WHEN OTHERS => fracRCosPreRnd_uid109_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRCosPreRnd_uid110_uid110_fpTanTest(BITJOIN,109)@34
    expFracRCosPreRnd_uid110_uid110_fpTanTest_q <= reg_expPCos_uid78_fpTanTest_0_to_expFracRCosPreRnd_uid110_uid110_fpTanTest_1_q & fracRCosPreRnd_uid109_fpTanTest_q;

	--expFracRCos_uid113_fpTanTest(ADD,112)@34
    expFracRCos_uid113_fpTanTest_a <= STD_LOGIC_VECTOR("0" & expFracRCosPreRnd_uid110_uid110_fpTanTest_q);
    expFracRCos_uid113_fpTanTest_b <= STD_LOGIC_VECTOR("00000000" & cosRndOp_uid111_uid112_fpTanTest_q);
            expFracRCos_uid113_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRCos_uid113_fpTanTest_a) + UNSIGNED(expFracRCos_uid113_fpTanTest_b));
    expFracRCos_uid113_fpTanTest_q <= expFracRCos_uid113_fpTanTest_o(32 downto 0);


	--expRCompSin_uid115_fpTanTest(BITSELECT,114)@34
    expRCompSin_uid115_fpTanTest_in <= expFracRCos_uid113_fpTanTest_q(31 downto 0);
    expRCompSin_uid115_fpTanTest_b <= expRCompSin_uid115_fpTanTest_in(31 downto 24);

	--reg_expRCompSin_uid115_fpTanTest_0_to_expRPostExcCos_uid143_fpTanTest_2(REG,751)@34
    reg_expRCompSin_uid115_fpTanTest_0_to_expRPostExcCos_uid143_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRCompSin_uid115_fpTanTest_0_to_expRPostExcCos_uid143_fpTanTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRCompSin_uid115_fpTanTest_0_to_expRPostExcCos_uid143_fpTanTest_2_q <= expRCompSin_uid115_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor(LOGICAL,1641)
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_b <= ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_sticky_ena_q;
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_q <= not (ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_a or ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_b);

	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_mem_top(CONSTANT,1624)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_mem_top_q <= "01101";

	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp(LOGICAL,1625)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_a <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_mem_top_q;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_q);
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_q <= "1" when ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_a = ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_b else "0";

	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmpReg(REG,1626)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmpReg_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_sticky_ena(REG,1642)
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_nor_q = "1") THEN
                ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_sticky_ena_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd(LOGICAL,1643)
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_a <= ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_sticky_ena_q;
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_b <= en;
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_q <= ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_a and ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_b;

	--ld_sinXIsX_uid41_fpTanTest_n_to_excSelBitsSin_uid117_fpTanTest_a(DELAY,869)@0
    ld_sinXIsX_uid41_fpTanTest_n_to_excSelBitsSin_uid117_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => sinXIsX_uid41_fpTanTest_n, xout => ld_sinXIsX_uid41_fpTanTest_n_to_excSelBitsSin_uid117_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_cosXIsOneXRR_uid43_fpTanTest_n_to_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_a(DELAY,1503)@14
    ld_cosXIsOneXRR_uid43_fpTanTest_n_to_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => cosXIsOneXRR_uid43_fpTanTest_n, xout => ld_cosXIsOneXRR_uid43_fpTanTest_n_to_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2(REG,749)@16
    reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_q <= ld_cosXIsOneXRR_uid43_fpTanTest_n_to_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_a_q;
            END IF;
        END IF;
    END PROCESS;


	--InvCosXIsOneXRR_uid132_fpTanTest(LOGICAL,131)@14
    InvCosXIsOneXRR_uid132_fpTanTest_a <= cosXIsOneXRR_uid43_fpTanTest_n;
    InvCosXIsOneXRR_uid132_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvCosXIsOneXRR_uid132_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvCosXIsOneXRR_uid132_fpTanTest_q <= not InvCosXIsOneXRR_uid132_fpTanTest_a;
        END IF;
    END PROCESS;



	--ld_InvCosXIsOneXRR_uid132_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_c(DELAY,892)@15
    ld_InvCosXIsOneXRR_uid132_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => InvCosXIsOneXRR_uid132_fpTanTest_q, xout => ld_InvCosXIsOneXRR_uid132_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sinXIsX_uid41_fpTanTest_n_to_InvSinXIsX_uid126_fpTanTest_a(DELAY,879)@0
    ld_sinXIsX_uid41_fpTanTest_n_to_InvSinXIsX_uid126_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => sinXIsX_uid41_fpTanTest_n, xout => ld_sinXIsX_uid41_fpTanTest_n_to_InvSinXIsX_uid126_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvSinXIsX_uid126_fpTanTest(LOGICAL,125)@16
    InvSinXIsX_uid126_fpTanTest_a <= ld_sinXIsX_uid41_fpTanTest_n_to_InvSinXIsX_uid126_fpTanTest_a_q;
    InvSinXIsX_uid126_fpTanTest_q <= not InvSinXIsX_uid126_fpTanTest_a;

	--ld_InvSinXIsX_uid126_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_b(DELAY,891)@16
    ld_InvSinXIsX_uid126_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvSinXIsX_uid126_fpTanTest_q, xout => ld_InvSinXIsX_uid126_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--half_uid52_fpTanTest(BITJOIN,51)@17
    half_uid52_fpTanTest_q <= VCC_q & cstZwShiftPwFRR_uid35_fpTanTest_q;

	--yIsHalf_uid53_fpTanTest(LOGICAL,52)@17
    yIsHalf_uid53_fpTanTest_a <= reg_y_uid50_fpTanTest_0_to_oneMinusY_uid54_fpTanTest_1_q;
    yIsHalf_uid53_fpTanTest_b <= half_uid52_fpTanTest_q;
    yIsHalf_uid53_fpTanTest_q <= "1" when yIsHalf_uid53_fpTanTest_a = yIsHalf_uid53_fpTanTest_b else "0";

	--yHalfCosNotONe_uid134_fpTanTest(LOGICAL,133)@17
    yHalfCosNotONe_uid134_fpTanTest_a <= yIsHalf_uid53_fpTanTest_q;
    yHalfCosNotONe_uid134_fpTanTest_b <= ld_InvSinXIsX_uid126_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_b_q;
    yHalfCosNotONe_uid134_fpTanTest_c <= ld_InvCosXIsOneXRR_uid132_fpTanTest_q_to_yHalfCosNotONe_uid134_fpTanTest_c_q;
    yHalfCosNotONe_uid134_fpTanTest_q <= yHalfCosNotONe_uid134_fpTanTest_a and yHalfCosNotONe_uid134_fpTanTest_b and yHalfCosNotONe_uid134_fpTanTest_c;

	--frac_uid13_fpTanTest(BITSELECT,12)@0
    frac_uid13_fpTanTest_in <= a(22 downto 0);
    frac_uid13_fpTanTest_b <= frac_uid13_fpTanTest_in(22 downto 0);

	--fracXIsZero_uid14_fpTanTest(LOGICAL,13)@0
    fracXIsZero_uid14_fpTanTest_a <= frac_uid13_fpTanTest_b;
    fracXIsZero_uid14_fpTanTest_b <= cstAllZWF_uid7_fpTanTest_q;
    fracXIsZero_uid14_fpTanTest_q <= "1" when fracXIsZero_uid14_fpTanTest_a = fracXIsZero_uid14_fpTanTest_b else "0";

	--expXIsMax_uid12_fpTanTest(LOGICAL,11)@0
    expXIsMax_uid12_fpTanTest_a <= exp_uid9_fpTanTest_b;
    expXIsMax_uid12_fpTanTest_b <= cstAllOWE_uid6_fpTanTest_q;
    expXIsMax_uid12_fpTanTest_q <= "1" when expXIsMax_uid12_fpTanTest_a = expXIsMax_uid12_fpTanTest_b else "0";

	--exc_I_uid15_fpTanTest(LOGICAL,14)@0
    exc_I_uid15_fpTanTest_a <= expXIsMax_uid12_fpTanTest_q;
    exc_I_uid15_fpTanTest_b <= fracXIsZero_uid14_fpTanTest_q;
    exc_I_uid15_fpTanTest_q <= exc_I_uid15_fpTanTest_a and exc_I_uid15_fpTanTest_b;

	--ld_exc_I_uid15_fpTanTest_q_to_excRNaN_uid116_fpTanTest_b(DELAY,868)@0
    ld_exc_I_uid15_fpTanTest_q_to_excRNaN_uid116_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => exc_I_uid15_fpTanTest_q, xout => ld_exc_I_uid15_fpTanTest_q_to_excRNaN_uid116_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvFracXIsZero_uid16_fpTanTest(LOGICAL,15)@0
    InvFracXIsZero_uid16_fpTanTest_a <= fracXIsZero_uid14_fpTanTest_q;
    InvFracXIsZero_uid16_fpTanTest_q <= not InvFracXIsZero_uid16_fpTanTest_a;

	--exc_N_uid17_fpTanTest(LOGICAL,16)@0
    exc_N_uid17_fpTanTest_a <= expXIsMax_uid12_fpTanTest_q;
    exc_N_uid17_fpTanTest_b <= InvFracXIsZero_uid16_fpTanTest_q;
    exc_N_uid17_fpTanTest_q <= exc_N_uid17_fpTanTest_a and exc_N_uid17_fpTanTest_b;

	--ld_exc_N_uid17_fpTanTest_q_to_excRNaN_uid116_fpTanTest_a(DELAY,867)@0
    ld_exc_N_uid17_fpTanTest_q_to_excRNaN_uid116_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => exc_N_uid17_fpTanTest_q, xout => ld_exc_N_uid17_fpTanTest_q_to_excRNaN_uid116_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRNaN_uid116_fpTanTest(LOGICAL,115)@17
    excRNaN_uid116_fpTanTest_a <= ld_exc_N_uid17_fpTanTest_q_to_excRNaN_uid116_fpTanTest_a_q;
    excRNaN_uid116_fpTanTest_b <= ld_exc_I_uid15_fpTanTest_q_to_excRNaN_uid116_fpTanTest_b_q;
    excRNaN_uid116_fpTanTest_q <= excRNaN_uid116_fpTanTest_a or excRNaN_uid116_fpTanTest_b;

	--join_uid139_fpTanTest(BITJOIN,138)@17
    join_uid139_fpTanTest_q <= reg_cosXIsOneXRR_uid43_fpTanTest_2_to_join_uid139_fpTanTest_2_q & yHalfCosNotONe_uid134_fpTanTest_q & excRNaN_uid116_fpTanTest_q;

	--expSelBitsCos_uid140_fpTanTest(BITJOIN,139)@17
    expSelBitsCos_uid140_fpTanTest_q <= ld_sinXIsX_uid41_fpTanTest_n_to_excSelBitsSin_uid117_fpTanTest_a_q & join_uid139_fpTanTest_q;

	--reg_expSelBitsCos_uid140_fpTanTest_0_to_expSelectorCos_uid141_fpTanTest_0(REG,750)@17
    reg_expSelBitsCos_uid140_fpTanTest_0_to_expSelectorCos_uid141_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expSelBitsCos_uid140_fpTanTest_0_to_expSelectorCos_uid141_fpTanTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expSelBitsCos_uid140_fpTanTest_0_to_expSelectorCos_uid141_fpTanTest_0_q <= expSelBitsCos_uid140_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expSelectorCos_uid141_fpTanTest(LOOKUP,140)@18
    expSelectorCos_uid141_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSelectorCos_uid141_fpTanTest_q <= "00";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_expSelBitsCos_uid140_fpTanTest_0_to_expSelectorCos_uid141_fpTanTest_0_q) IS
                WHEN "0000" =>  expSelectorCos_uid141_fpTanTest_q <= "00";
                WHEN "0001" =>  expSelectorCos_uid141_fpTanTest_q <= "11";
                WHEN "0010" =>  expSelectorCos_uid141_fpTanTest_q <= "10";
                WHEN "0011" =>  expSelectorCos_uid141_fpTanTest_q <= "00";
                WHEN "0100" =>  expSelectorCos_uid141_fpTanTest_q <= "01";
                WHEN "0101" =>  expSelectorCos_uid141_fpTanTest_q <= "11";
                WHEN "0110" =>  expSelectorCos_uid141_fpTanTest_q <= "10";
                WHEN "0111" =>  expSelectorCos_uid141_fpTanTest_q <= "00";
                WHEN "1000" =>  expSelectorCos_uid141_fpTanTest_q <= "01";
                WHEN "1001" =>  expSelectorCos_uid141_fpTanTest_q <= "11";
                WHEN "1010" =>  expSelectorCos_uid141_fpTanTest_q <= "10";
                WHEN "1011" =>  expSelectorCos_uid141_fpTanTest_q <= "00";
                WHEN "1100" =>  expSelectorCos_uid141_fpTanTest_q <= "01";
                WHEN "1101" =>  expSelectorCos_uid141_fpTanTest_q <= "11";
                WHEN "1110" =>  expSelectorCos_uid141_fpTanTest_q <= "10";
                WHEN "1111" =>  expSelectorCos_uid141_fpTanTest_q <= "00";
                WHEN OTHERS =>
                    expSelectorCos_uid141_fpTanTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_inputreg(DELAY,1631)
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => expSelectorCos_uid141_fpTanTest_q, xout => ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt(COUNTER,1620)
    -- every=1, low=0, high=13, step=1, init=1
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_i = 12 THEN
                      ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_i <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_i - 13;
                    ELSE
                        ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_i <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_i,4));


	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg(REG,1621)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux(MUX,1622)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_s <= en;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux: PROCESS (ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_s, ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg_q, ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem(DUALMEM,1632)
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_ia <= ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_inputreg_q;
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_aa <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg_q;
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_ab <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_q;
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 2,
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
        clocken1 => ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_iq,
        address_a => ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_aa,
        data_a => ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_ia
    );
    ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_reset0 <= areset;
        ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_q <= ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_iq(1 downto 0);

	--expRPostExcCos_uid143_fpTanTest(MUX,142)@35
    expRPostExcCos_uid143_fpTanTest_s <= ld_expSelectorCos_uid141_fpTanTest_q_to_expRPostExcCos_uid143_fpTanTest_b_replace_mem_q;
    expRPostExcCos_uid143_fpTanTest: PROCESS (expRPostExcCos_uid143_fpTanTest_s, en, reg_expRCompSin_uid115_fpTanTest_0_to_expRPostExcCos_uid143_fpTanTest_2_q, cstBias_uid22_fpTanTest_q, cstAllZWE_uid8_fpTanTest_q, cstAllOWE_uid6_fpTanTest_q)
    BEGIN
            CASE expRPostExcCos_uid143_fpTanTest_s IS
                  WHEN "00" => expRPostExcCos_uid143_fpTanTest_q <= reg_expRCompSin_uid115_fpTanTest_0_to_expRPostExcCos_uid143_fpTanTest_2_q;
                  WHEN "01" => expRPostExcCos_uid143_fpTanTest_q <= cstBias_uid22_fpTanTest_q;
                  WHEN "10" => expRPostExcCos_uid143_fpTanTest_q <= cstAllZWE_uid8_fpTanTest_q;
                  WHEN "11" => expRPostExcCos_uid143_fpTanTest_q <= cstAllOWE_uid6_fpTanTest_q;
                  WHEN OTHERS => expRPostExcCos_uid143_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstNaNwF_uid32_fpTanTest(CONSTANT,31)
    cstNaNwF_uid32_fpTanTest_q <= "00000000000000000000001";

	--fracRCompCos_uid114_fpTanTest(BITSELECT,113)@34
    fracRCompCos_uid114_fpTanTest_in <= expFracRCos_uid113_fpTanTest_q(23 downto 0);
    fracRCompCos_uid114_fpTanTest_b <= fracRCompCos_uid114_fpTanTest_in(23 downto 1);

	--reg_fracRCompCos_uid114_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_2(REG,748)@34
    reg_fracRCompCos_uid114_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRCompCos_uid114_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRCompCos_uid114_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_2_q <= fracRCompCos_uid114_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor(LOGICAL,1628)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_b <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_sticky_ena_q;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_q <= not (ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_a or ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_b);

	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_sticky_ena(REG,1629)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_nor_q = "1") THEN
                ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_sticky_ena_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd(LOGICAL,1630)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_a <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_sticky_ena_q;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_b <= en;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_a and ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_b;

	--reg_excRNaN_uid116_fpTanTest_0_to_join_uid137_fpTanTest_1(REG,717)@17
    reg_excRNaN_uid116_fpTanTest_0_to_join_uid137_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRNaN_uid116_fpTanTest_0_to_join_uid137_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRNaN_uid116_fpTanTest_0_to_join_uid137_fpTanTest_1_q <= excRNaN_uid116_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3(REG,716)@14
    reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q <= cosXIsOneXRR_uid43_fpTanTest_n;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q_to_rZeroOrCosOne_uid136_fpTanTest_c(DELAY,895)@15
    ld_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q_to_rZeroOrCosOne_uid136_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q, xout => ld_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q_to_rZeroOrCosOne_uid136_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2(REG,715)@0
    reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q <= sinXIsX_uid41_fpTanTest_n;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q_to_rZeroOrCosOne_uid136_fpTanTest_b(DELAY,894)@1
    ld_reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q_to_rZeroOrCosOne_uid136_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q, xout => ld_reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q_to_rZeroOrCosOne_uid136_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yHalfCosNotONe_uid134_fpTanTest_0_to_rZeroOrCosOne_uid136_fpTanTest_1(REG,714)@17
    reg_yHalfCosNotONe_uid134_fpTanTest_0_to_rZeroOrCosOne_uid136_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yHalfCosNotONe_uid134_fpTanTest_0_to_rZeroOrCosOne_uid136_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yHalfCosNotONe_uid134_fpTanTest_0_to_rZeroOrCosOne_uid136_fpTanTest_1_q <= yHalfCosNotONe_uid134_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rZeroOrCosOne_uid136_fpTanTest(LOGICAL,135)@18
    rZeroOrCosOne_uid136_fpTanTest_a <= reg_yHalfCosNotONe_uid134_fpTanTest_0_to_rZeroOrCosOne_uid136_fpTanTest_1_q;
    rZeroOrCosOne_uid136_fpTanTest_b <= ld_reg_sinXIsX_uid41_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_2_q_to_rZeroOrCosOne_uid136_fpTanTest_b_q;
    rZeroOrCosOne_uid136_fpTanTest_c <= ld_reg_cosXIsOneXRR_uid43_fpTanTest_2_to_rZeroOrCosOne_uid136_fpTanTest_3_q_to_rZeroOrCosOne_uid136_fpTanTest_c_q;
    rZeroOrCosOne_uid136_fpTanTest_q <= rZeroOrCosOne_uid136_fpTanTest_a or rZeroOrCosOne_uid136_fpTanTest_b or rZeroOrCosOne_uid136_fpTanTest_c;

	--join_uid137_fpTanTest(BITJOIN,136)@18
    join_uid137_fpTanTest_q <= reg_excRNaN_uid116_fpTanTest_0_to_join_uid137_fpTanTest_1_q & rZeroOrCosOne_uid136_fpTanTest_q;

	--reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1(REG,747)@18
    reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q <= join_uid137_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_inputreg(DELAY,1618)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q, xout => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem(DUALMEM,1619)
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_ia <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_inputreg_q;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_aa <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg_q;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_ab <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_q;
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 2,
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
        clocken1 => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_iq,
        address_a => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_aa,
        data_a => ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_ia
    );
    ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_reset0 <= areset;
        ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_iq(1 downto 0);

	--fracRPostExcCos_uid138_fpTanTest(MUX,137)@35
    fracRPostExcCos_uid138_fpTanTest_s <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_mem_q;
    fracRPostExcCos_uid138_fpTanTest: PROCESS (fracRPostExcCos_uid138_fpTanTest_s, en, reg_fracRCompCos_uid114_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_2_q, cstAllZWF_uid7_fpTanTest_q, cstNaNwF_uid32_fpTanTest_q, cstNaNwF_uid32_fpTanTest_q)
    BEGIN
            CASE fracRPostExcCos_uid138_fpTanTest_s IS
                  WHEN "00" => fracRPostExcCos_uid138_fpTanTest_q <= reg_fracRCompCos_uid114_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_2_q;
                  WHEN "01" => fracRPostExcCos_uid138_fpTanTest_q <= cstAllZWF_uid7_fpTanTest_q;
                  WHEN "10" => fracRPostExcCos_uid138_fpTanTest_q <= cstNaNwF_uid32_fpTanTest_q;
                  WHEN "11" => fracRPostExcCos_uid138_fpTanTest_q <= cstNaNwF_uid32_fpTanTest_q;
                  WHEN OTHERS => fracRPostExcCos_uid138_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fpCos_uid155_fpTanTest(BITJOIN,154)@35
    fpCos_uid155_fpTanTest_q <= ld_signRCos_uid154_fpTanTest_q_to_fpCos_uid155_fpTanTest_c_q & expRPostExcCos_uid143_fpTanTest_q & fracRPostExcCos_uid138_fpTanTest_q;

	--fracY_uid432_fpTanXComp_uid157_fpTanTest(BITSELECT,431)@35
    fracY_uid432_fpTanXComp_uid157_fpTanTest_in <= fpCos_uid155_fpTanTest_q(22 downto 0);
    fracY_uid432_fpTanXComp_uid157_fpTanTest_b <= fracY_uid432_fpTanXComp_uid157_fpTanTest_in(22 downto 0);

	--fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest(LOGICAL,458)@35
    fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_a <= fracY_uid432_fpTanXComp_uid157_fpTanTest_b;
    fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_b <= cstAllZWF_uid7_fpTanTest_q;
    fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_q <= "1" when fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_a = fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_b else "0";

	--expY_uid431_fpTanXComp_uid157_fpTanTest(BITSELECT,430)@35
    expY_uid431_fpTanXComp_uid157_fpTanTest_in <= fpCos_uid155_fpTanTest_q(30 downto 0);
    expY_uid431_fpTanXComp_uid157_fpTanTest_b <= expY_uid431_fpTanXComp_uid157_fpTanTest_in(30 downto 23);

	--expXIsMax_uid457_fpTanXComp_uid157_fpTanTest(LOGICAL,456)@35
    expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_a <= expY_uid431_fpTanXComp_uid157_fpTanTest_b;
    expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_b <= cstAllOWE_uid6_fpTanTest_q;
    expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_q <= "1" when expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_a = expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_b else "0";

	--exc_I_uid460_fpTanXComp_uid157_fpTanTest(LOGICAL,459)@35
    exc_I_uid460_fpTanXComp_uid157_fpTanTest_a <= expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_q;
    exc_I_uid460_fpTanXComp_uid157_fpTanTest_b <= fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_q;
    exc_I_uid460_fpTanXComp_uid157_fpTanTest_q <= exc_I_uid460_fpTanXComp_uid157_fpTanTest_a and exc_I_uid460_fpTanXComp_uid157_fpTanTest_b;

	--cstBiasMwShiftM2_uid25_fpTanTest(CONSTANT,24)
    cstBiasMwShiftM2_uid25_fpTanTest_q <= "01110001";

	--sinXIsXRR_uid42_fpTanTest(COMPARE,41)@14
    sinXIsXRR_uid42_fpTanTest_cin <= GND_q;
    sinXIsXRR_uid42_fpTanTest_a <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid25_fpTanTest_q) & '0';
    sinXIsXRR_uid42_fpTanTest_b <= STD_LOGIC_VECTOR((10 downto 8 => expXRR_uid39_fpTanTest_b(7)) & expXRR_uid39_fpTanTest_b) & sinXIsXRR_uid42_fpTanTest_cin(0);
            sinXIsXRR_uid42_fpTanTest_o <= STD_LOGIC_VECTOR(SIGNED(sinXIsXRR_uid42_fpTanTest_a) - SIGNED(sinXIsXRR_uid42_fpTanTest_b));
    sinXIsXRR_uid42_fpTanTest_n(0) <= not sinXIsXRR_uid42_fpTanTest_o(11);


	--InvSinXIsXRR_uid127_fpTanTest(LOGICAL,126)@14
    InvSinXIsXRR_uid127_fpTanTest_a <= sinXIsXRR_uid42_fpTanTest_n;
    InvSinXIsXRR_uid127_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvSinXIsXRR_uid127_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvSinXIsXRR_uid127_fpTanTest_q <= not InvSinXIsXRR_uid127_fpTanTest_a;
        END IF;
    END PROCESS;



	--ld_InvSinXIsXRR_uid127_fpTanTest_q_to_signComp_uid128_fpTanTest_a(DELAY,881)@15
    ld_InvSinXIsXRR_uid127_fpTanTest_q_to_signComp_uid128_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvSinXIsXRR_uid127_fpTanTest_q, xout => ld_InvSinXIsXRR_uid127_fpTanTest_q_to_signComp_uid128_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signComp_uid128_fpTanTest(LOGICAL,127)@16
    signComp_uid128_fpTanTest_a <= ld_InvSinXIsXRR_uid127_fpTanTest_q_to_signComp_uid128_fpTanTest_a_q;
    signComp_uid128_fpTanTest_b <= InvSinXIsX_uid126_fpTanTest_q;
    signComp_uid128_fpTanTest_c <= intXParity_uid49_fpTanTest_b;
    signComp_uid128_fpTanTest_q <= signComp_uid128_fpTanTest_a and signComp_uid128_fpTanTest_b and signComp_uid128_fpTanTest_c;

	--signX_uid38_fpTanTest(BITSELECT,37)@0
    signX_uid38_fpTanTest_in <= a;
    signX_uid38_fpTanTest_b <= signX_uid38_fpTanTest_in(31 downto 31);

	--ld_signX_uid38_fpTanTest_b_to_signR_uid129_fpTanTest_a(DELAY,884)@0
    ld_signX_uid38_fpTanTest_b_to_signR_uid129_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => signX_uid38_fpTanTest_b, xout => ld_signX_uid38_fpTanTest_b_to_signR_uid129_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid129_fpTanTest(LOGICAL,128)@16
    signR_uid129_fpTanTest_a <= ld_signX_uid38_fpTanTest_b_to_signR_uid129_fpTanTest_a_q;
    signR_uid129_fpTanTest_b <= signComp_uid128_fpTanTest_q;
    signR_uid129_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid129_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            signR_uid129_fpTanTest_q <= signR_uid129_fpTanTest_a xor signR_uid129_fpTanTest_b;
        END IF;
        END IF;
    END PROCESS;



	--ld_signR_uid129_fpTanTest_q_to_fpSin_uid130_fpTanTest_c(DELAY,888)@17
    ld_signR_uid129_fpTanTest_q_to_fpSin_uid130_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => signR_uid129_fpTanTest_q, xout => ld_signR_uid129_fpTanTest_q_to_fpSin_uid130_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor(LOGICAL,1615)
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_b <= ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_sticky_ena_q;
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_q <= not (ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_a or ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_b);

	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_mem_top(CONSTANT,1598)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_mem_top_q <= "0100000";

	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp(LOGICAL,1599)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_a <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_mem_top_q;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_q);
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_q <= "1" when ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_a = ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_b else "0";

	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmpReg(REG,1600)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmpReg_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_sticky_ena(REG,1616)
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_nor_q = "1") THEN
                ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_sticky_ena_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd(LOGICAL,1617)
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_a <= ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_sticky_ena_q;
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_b <= en;
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_q <= ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_a and ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_b;

	--ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_inputreg(DELAY,1605)
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => exp_uid9_fpTanTest_b, xout => ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt(COUNTER,1594)
    -- every=1, low=0, high=32, step=1, init=1
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_i = 31 THEN
                      ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_eq = '1') THEN
                        ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_i <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_i - 32;
                    ELSE
                        ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_i <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_i,6));


	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg(REG,1595)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux(MUX,1596)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_s <= en;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux: PROCESS (ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_s, ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg_q, ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg_q;
                  WHEN "1" => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem(DUALMEM,1606)
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_ia <= ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_inputreg_q;
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_aa <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg_q;
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_ab <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_q;
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_iq,
        address_a => ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_aa,
        data_a => ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_ia
    );
    ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_reset0 <= areset;
        ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_q <= ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_iq(7 downto 0);

	--ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_a(DELAY,1464)@14
    ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => sinXIsXRR_uid42_fpTanTest_n, xout => ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1(REG,710)@33
    reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_q <= ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor(LOGICAL,1565)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_b <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_sticky_ena_q;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_q <= not (ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_a or ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_b);

	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_mem_top(CONSTANT,1561)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_mem_top_q <= "01100";

	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp(LOGICAL,1562)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_a <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_mem_top_q;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_q);
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_q <= "1" when ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_a = ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_b else "0";

	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmpReg(REG,1563)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmpReg_q <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_sticky_ena(REG,1566)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_nor_q = "1") THEN
                ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_sticky_ena_q <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd(LOGICAL,1567)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_a <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_sticky_ena_q;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_b <= en;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_q <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_a and ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_b;

	--oFracXRRSmallXRR_uid89_fpTanTest(BITSELECT,88)@15
    oFracXRRSmallXRR_uid89_fpTanTest_in <= oFracXRR_uid44_uid44_fpTanTest_q;
    oFracXRRSmallXRR_uid89_fpTanTest_b <= oFracXRRSmallXRR_uid89_fpTanTest_in(53 downto 28);

	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_inputreg(DELAY,1555)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => oFracXRRSmallXRR_uid89_fpTanTest_b, xout => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt(COUNTER,1557)
    -- every=1, low=0, high=12, step=1, init=1
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_i = 11 THEN
                      ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_eq = '1') THEN
                        ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_i <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_i - 12;
                    ELSE
                        ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_i <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_i,4));


	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdreg(REG,1558)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdreg_q <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux(MUX,1559)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_s <= en;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux: PROCESS (ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_s, ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdreg_q, ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_q <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdreg_q;
                  WHEN "1" => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_q <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem(DUALMEM,1556)
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_ia <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_inputreg_q;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_aa <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdreg_q;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_ab <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_rdmux_q;
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 26,
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
        clocken1 => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_iq,
        address_a => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_aa,
        data_a => ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_ia
    );
    ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_reset0 <= areset;
        ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_q <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_iq(25 downto 0);

	--reg_cmpYToOneMinusY_uid56_fpTanTest_1_to_zSin_uid59_fpTanTest_1(REG,681)@18
    reg_cmpYToOneMinusY_uid56_fpTanTest_1_to_zSin_uid59_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cmpYToOneMinusY_uid56_fpTanTest_1_to_zSin_uid59_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cmpYToOneMinusY_uid56_fpTanTest_1_to_zSin_uid59_fpTanTest_1_q <= cmpYToOneMinusY_uid56_fpTanTest_c;
            END IF;
        END IF;
    END PROCESS;


	--zSin_uid59_fpTanTest(MUX,58)@19
    zSin_uid59_fpTanTest_s <= reg_cmpYToOneMinusY_uid56_fpTanTest_1_to_zSin_uid59_fpTanTest_1_q;
    zSin_uid59_fpTanTest: PROCESS (zSin_uid59_fpTanTest_s, en, reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2_q, reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3_q)
    BEGIN
            CASE zSin_uid59_fpTanTest_s IS
                  WHEN "0" => zSin_uid59_fpTanTest_q <= reg_zSinYBottom_uid58_fpTanTest_0_to_zSin_uid59_fpTanTest_2_q;
                  WHEN "1" => zSin_uid59_fpTanTest_q <= reg_zSinOMyBottom_uid57_fpTanTest_0_to_zSin_uid59_fpTanTest_3_q;
                  WHEN OTHERS => zSin_uid59_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--addr_uid80_fpTanTest(BITSELECT,79)@19
    addr_uid80_fpTanTest_in <= zSin_uid59_fpTanTest_q;
    addr_uid80_fpTanTest_b <= addr_uid80_fpTanTest_in(64 downto 57);

	--reg_addr_uid80_fpTanTest_0_to_memoryC2_uid391_tableGensinPiZ_lutmem_0(REG,699)@19
    reg_addr_uid80_fpTanTest_0_to_memoryC2_uid391_tableGensinPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid80_fpTanTest_0_to_memoryC2_uid391_tableGensinPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid80_fpTanTest_0_to_memoryC2_uid391_tableGensinPiZ_lutmem_0_q <= addr_uid80_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid391_tableGensinPiZ_lutmem(DUALMEM,641)@20
    memoryC2_uid391_tableGensinPiZ_lutmem_ia <= (others => '0');
    memoryC2_uid391_tableGensinPiZ_lutmem_aa <= (others => '0');
    memoryC2_uid391_tableGensinPiZ_lutmem_ab <= reg_addr_uid80_fpTanTest_0_to_memoryC2_uid391_tableGensinPiZ_lutmem_0_q;
    memoryC2_uid391_tableGensinPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_tan_s5_memoryC2_uid391_tableGensinPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid391_tableGensinPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid391_tableGensinPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid391_tableGensinPiZ_lutmem_iq,
        address_a => memoryC2_uid391_tableGensinPiZ_lutmem_aa,
        data_a => memoryC2_uid391_tableGensinPiZ_lutmem_ia
    );
    memoryC2_uid391_tableGensinPiZ_lutmem_reset0 <= areset;
        memoryC2_uid391_tableGensinPiZ_lutmem_q <= memoryC2_uid391_tableGensinPiZ_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid391_tableGensinPiZ_lutmem_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_1(REG,701)@22
    reg_memoryC2_uid391_tableGensinPiZ_lutmem_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid391_tableGensinPiZ_lutmem_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid391_tableGensinPiZ_lutmem_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_1_q <= memoryC2_uid391_tableGensinPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--zPsinPiZ_uid83_fpTanTest(BITSELECT,82)@19
    zPsinPiZ_uid83_fpTanTest_in <= zSin_uid59_fpTanTest_q(56 downto 0);
    zPsinPiZ_uid83_fpTanTest_b <= zPsinPiZ_uid83_fpTanTest_in(56 downto 42);

	--yT1_uid399_polyEvalsinPiZ(BITSELECT,398)@19
    yT1_uid399_polyEvalsinPiZ_in <= zPsinPiZ_uid83_fpTanTest_b;
    yT1_uid399_polyEvalsinPiZ_b <= yT1_uid399_polyEvalsinPiZ_in(14 downto 2);

	--ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a_inputreg(DELAY,1794)
    ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => yT1_uid399_polyEvalsinPiZ_b, xout => ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a(DELAY,1454)@19
    ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a_inputreg_q, xout => ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0(REG,700)@22
    reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_q <= ld_yT1_uid399_polyEvalsinPiZ_b_to_reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid586_pT1_uid400_polyEvalsinPiZ(MULT,585)@23
    prodXY_uid586_pT1_uid400_polyEvalsinPiZ_pr <= signed(resize(UNSIGNED(prodXY_uid586_pT1_uid400_polyEvalsinPiZ_a),14)) * SIGNED(prodXY_uid586_pT1_uid400_polyEvalsinPiZ_b);
    prodXY_uid586_pT1_uid400_polyEvalsinPiZ_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid586_pT1_uid400_polyEvalsinPiZ_a <= (others => '0');
            prodXY_uid586_pT1_uid400_polyEvalsinPiZ_b <= (others => '0');
            prodXY_uid586_pT1_uid400_polyEvalsinPiZ_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid586_pT1_uid400_polyEvalsinPiZ_a <= reg_yT1_uid399_polyEvalsinPiZ_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_0_q;
                prodXY_uid586_pT1_uid400_polyEvalsinPiZ_b <= reg_memoryC2_uid391_tableGensinPiZ_lutmem_0_to_prodXY_uid586_pT1_uid400_polyEvalsinPiZ_1_q;
                prodXY_uid586_pT1_uid400_polyEvalsinPiZ_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid586_pT1_uid400_polyEvalsinPiZ_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid586_pT1_uid400_polyEvalsinPiZ: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid586_pT1_uid400_polyEvalsinPiZ_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid586_pT1_uid400_polyEvalsinPiZ_q <= prodXY_uid586_pT1_uid400_polyEvalsinPiZ_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid587_pT1_uid400_polyEvalsinPiZ(BITSELECT,586)@26
    prodXYTruncFR_uid587_pT1_uid400_polyEvalsinPiZ_in <= prodXY_uid586_pT1_uid400_polyEvalsinPiZ_q;
    prodXYTruncFR_uid587_pT1_uid400_polyEvalsinPiZ_b <= prodXYTruncFR_uid587_pT1_uid400_polyEvalsinPiZ_in(25 downto 12);

	--highBBits_uid402_polyEvalsinPiZ(BITSELECT,401)@26
    highBBits_uid402_polyEvalsinPiZ_in <= prodXYTruncFR_uid587_pT1_uid400_polyEvalsinPiZ_b;
    highBBits_uid402_polyEvalsinPiZ_b <= highBBits_uid402_polyEvalsinPiZ_in(13 downto 1);

	--ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_a(DELAY,1456)@19
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => addr_uid80_fpTanTest_b, xout => ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0(REG,702)@22
    reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_q <= ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid389_tableGensinPiZ_lutmem(DUALMEM,640)@23
    memoryC1_uid389_tableGensinPiZ_lutmem_ia <= (others => '0');
    memoryC1_uid389_tableGensinPiZ_lutmem_aa <= (others => '0');
    memoryC1_uid389_tableGensinPiZ_lutmem_ab <= reg_addr_uid80_fpTanTest_0_to_memoryC1_uid389_tableGensinPiZ_lutmem_0_q;
    memoryC1_uid389_tableGensinPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_tan_s5_memoryC1_uid389_tableGensinPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid389_tableGensinPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid389_tableGensinPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid389_tableGensinPiZ_lutmem_iq,
        address_a => memoryC1_uid389_tableGensinPiZ_lutmem_aa,
        data_a => memoryC1_uid389_tableGensinPiZ_lutmem_ia
    );
    memoryC1_uid389_tableGensinPiZ_lutmem_reset0 <= areset;
        memoryC1_uid389_tableGensinPiZ_lutmem_q <= memoryC1_uid389_tableGensinPiZ_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid389_tableGensinPiZ_lutmem_0_to_sumAHighB_uid403_polyEvalsinPiZ_0(REG,703)@25
    reg_memoryC1_uid389_tableGensinPiZ_lutmem_0_to_sumAHighB_uid403_polyEvalsinPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid389_tableGensinPiZ_lutmem_0_to_sumAHighB_uid403_polyEvalsinPiZ_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid389_tableGensinPiZ_lutmem_0_to_sumAHighB_uid403_polyEvalsinPiZ_0_q <= memoryC1_uid389_tableGensinPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid403_polyEvalsinPiZ(ADD,402)@26
    sumAHighB_uid403_polyEvalsinPiZ_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid389_tableGensinPiZ_lutmem_0_to_sumAHighB_uid403_polyEvalsinPiZ_0_q(20)) & reg_memoryC1_uid389_tableGensinPiZ_lutmem_0_to_sumAHighB_uid403_polyEvalsinPiZ_0_q);
    sumAHighB_uid403_polyEvalsinPiZ_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid402_polyEvalsinPiZ_b(12)) & highBBits_uid402_polyEvalsinPiZ_b);
            sumAHighB_uid403_polyEvalsinPiZ_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid403_polyEvalsinPiZ_a) + SIGNED(sumAHighB_uid403_polyEvalsinPiZ_b));
    sumAHighB_uid403_polyEvalsinPiZ_q <= sumAHighB_uid403_polyEvalsinPiZ_o(21 downto 0);


	--lowRangeB_uid401_polyEvalsinPiZ(BITSELECT,400)@26
    lowRangeB_uid401_polyEvalsinPiZ_in <= prodXYTruncFR_uid587_pT1_uid400_polyEvalsinPiZ_b(0 downto 0);
    lowRangeB_uid401_polyEvalsinPiZ_b <= lowRangeB_uid401_polyEvalsinPiZ_in(0 downto 0);

	--s1_uid401_uid404_polyEvalsinPiZ(BITJOIN,403)@26
    s1_uid401_uid404_polyEvalsinPiZ_q <= sumAHighB_uid403_polyEvalsinPiZ_q & lowRangeB_uid401_polyEvalsinPiZ_b;

	--reg_s1_uid401_uid404_polyEvalsinPiZ_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_1(REG,705)@26
    reg_s1_uid401_uid404_polyEvalsinPiZ_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid401_uid404_polyEvalsinPiZ_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid401_uid404_polyEvalsinPiZ_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_1_q <= s1_uid401_uid404_polyEvalsinPiZ_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor(LOGICAL,1805)
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_b <= ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_sticky_ena_q;
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_q <= not (ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_a or ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_b);

	--ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_sticky_ena(REG,1806)
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_nor_q = "1") THEN
                ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_sticky_ena_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd(LOGICAL,1807)
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_a <= ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_sticky_ena_q;
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_b <= en;
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_q <= ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_a and ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_b;

	--ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_inputreg(DELAY,1795)
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => zPsinPiZ_uid83_fpTanTest_b, xout => ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem(DUALMEM,1796)
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_ia <= ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_inputreg_q;
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_aa <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q;
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_ab <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q;
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 15,
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
        clocken1 => ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_iq,
        address_a => ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_aa,
        data_a => ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_ia
    );
    ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_reset0 <= areset;
        ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_q <= ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_iq(14 downto 0);

	--reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0(REG,704)@26
    reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_q <= ld_zPsinPiZ_uid83_fpTanTest_b_to_reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid589_pT2_uid406_polyEvalsinPiZ(MULT,588)@27
    prodXY_uid589_pT2_uid406_polyEvalsinPiZ_pr <= signed(resize(UNSIGNED(prodXY_uid589_pT2_uid406_polyEvalsinPiZ_a),16)) * SIGNED(prodXY_uid589_pT2_uid406_polyEvalsinPiZ_b);
    prodXY_uid589_pT2_uid406_polyEvalsinPiZ_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid589_pT2_uid406_polyEvalsinPiZ_a <= (others => '0');
            prodXY_uid589_pT2_uid406_polyEvalsinPiZ_b <= (others => '0');
            prodXY_uid589_pT2_uid406_polyEvalsinPiZ_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid589_pT2_uid406_polyEvalsinPiZ_a <= reg_zPsinPiZ_uid83_fpTanTest_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_0_q;
                prodXY_uid589_pT2_uid406_polyEvalsinPiZ_b <= reg_s1_uid401_uid404_polyEvalsinPiZ_0_to_prodXY_uid589_pT2_uid406_polyEvalsinPiZ_1_q;
                prodXY_uid589_pT2_uid406_polyEvalsinPiZ_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid589_pT2_uid406_polyEvalsinPiZ_pr,38));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid589_pT2_uid406_polyEvalsinPiZ: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid589_pT2_uid406_polyEvalsinPiZ_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid589_pT2_uid406_polyEvalsinPiZ_q <= prodXY_uid589_pT2_uid406_polyEvalsinPiZ_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid590_pT2_uid406_polyEvalsinPiZ(BITSELECT,589)@30
    prodXYTruncFR_uid590_pT2_uid406_polyEvalsinPiZ_in <= prodXY_uid589_pT2_uid406_polyEvalsinPiZ_q;
    prodXYTruncFR_uid590_pT2_uid406_polyEvalsinPiZ_b <= prodXYTruncFR_uid590_pT2_uid406_polyEvalsinPiZ_in(37 downto 14);

	--highBBits_uid408_polyEvalsinPiZ(BITSELECT,407)@30
    highBBits_uid408_polyEvalsinPiZ_in <= prodXYTruncFR_uid590_pT2_uid406_polyEvalsinPiZ_b;
    highBBits_uid408_polyEvalsinPiZ_b <= highBBits_uid408_polyEvalsinPiZ_in(23 downto 2);

	--ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor(LOGICAL,1818)
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_b <= ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_sticky_ena_q;
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_q <= not (ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_a or ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_b);

	--ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_sticky_ena(REG,1819)
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_nor_q = "1") THEN
                ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_sticky_ena_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd(LOGICAL,1820)
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_a <= ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_sticky_ena_q;
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_b <= en;
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_q <= ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_a and ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_b;

	--ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_inputreg(DELAY,1808)
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addr_uid80_fpTanTest_b, xout => ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem(DUALMEM,1809)
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_ia <= ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_inputreg_q;
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_aa <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q;
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_ab <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q;
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_iq,
        address_a => ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_aa,
        data_a => ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_ia
    );
    ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_q <= ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0(REG,706)@26
    reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_q <= ld_addr_uid80_fpTanTest_b_to_reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid387_tableGensinPiZ_lutmem(DUALMEM,639)@27
    memoryC0_uid387_tableGensinPiZ_lutmem_ia <= (others => '0');
    memoryC0_uid387_tableGensinPiZ_lutmem_aa <= (others => '0');
    memoryC0_uid387_tableGensinPiZ_lutmem_ab <= reg_addr_uid80_fpTanTest_0_to_memoryC0_uid387_tableGensinPiZ_lutmem_0_q;
    memoryC0_uid387_tableGensinPiZ_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 30,
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
        init_file => "fp_tan_s5_memoryC0_uid387_tableGensinPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid387_tableGensinPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid387_tableGensinPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid387_tableGensinPiZ_lutmem_iq,
        address_a => memoryC0_uid387_tableGensinPiZ_lutmem_aa,
        data_a => memoryC0_uid387_tableGensinPiZ_lutmem_ia
    );
    memoryC0_uid387_tableGensinPiZ_lutmem_reset0 <= areset;
        memoryC0_uid387_tableGensinPiZ_lutmem_q <= memoryC0_uid387_tableGensinPiZ_lutmem_iq(29 downto 0);

	--reg_memoryC0_uid387_tableGensinPiZ_lutmem_0_to_sumAHighB_uid409_polyEvalsinPiZ_0(REG,707)@29
    reg_memoryC0_uid387_tableGensinPiZ_lutmem_0_to_sumAHighB_uid409_polyEvalsinPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid387_tableGensinPiZ_lutmem_0_to_sumAHighB_uid409_polyEvalsinPiZ_0_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid387_tableGensinPiZ_lutmem_0_to_sumAHighB_uid409_polyEvalsinPiZ_0_q <= memoryC0_uid387_tableGensinPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid409_polyEvalsinPiZ(ADD,408)@30
    sumAHighB_uid409_polyEvalsinPiZ_a <= STD_LOGIC_VECTOR((30 downto 30 => reg_memoryC0_uid387_tableGensinPiZ_lutmem_0_to_sumAHighB_uid409_polyEvalsinPiZ_0_q(29)) & reg_memoryC0_uid387_tableGensinPiZ_lutmem_0_to_sumAHighB_uid409_polyEvalsinPiZ_0_q);
    sumAHighB_uid409_polyEvalsinPiZ_b <= STD_LOGIC_VECTOR((30 downto 22 => highBBits_uid408_polyEvalsinPiZ_b(21)) & highBBits_uid408_polyEvalsinPiZ_b);
            sumAHighB_uid409_polyEvalsinPiZ_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid409_polyEvalsinPiZ_a) + SIGNED(sumAHighB_uid409_polyEvalsinPiZ_b));
    sumAHighB_uid409_polyEvalsinPiZ_q <= sumAHighB_uid409_polyEvalsinPiZ_o(30 downto 0);


	--lowRangeB_uid407_polyEvalsinPiZ(BITSELECT,406)@30
    lowRangeB_uid407_polyEvalsinPiZ_in <= prodXYTruncFR_uid590_pT2_uid406_polyEvalsinPiZ_b(1 downto 0);
    lowRangeB_uid407_polyEvalsinPiZ_b <= lowRangeB_uid407_polyEvalsinPiZ_in(1 downto 0);

	--s2_uid407_uid410_polyEvalsinPiZ(BITJOIN,409)@30
    s2_uid407_uid410_polyEvalsinPiZ_q <= sumAHighB_uid409_polyEvalsinPiZ_q & lowRangeB_uid407_polyEvalsinPiZ_b;

	--polyEvalSigsinPiZ_uid85_fpTanTest(BITSELECT,84)@30
    polyEvalSigsinPiZ_uid85_fpTanTest_in <= s2_uid407_uid410_polyEvalsinPiZ_q(30 downto 0);
    polyEvalSigsinPiZ_uid85_fpTanTest_b <= polyEvalSigsinPiZ_uid85_fpTanTest_in(30 downto 5);

	--ld_sinXIsXRR_uid42_fpTanTest_n_to_multSinOp2_uid90_fpTanTest_b(DELAY,832)@14
    ld_sinXIsXRR_uid42_fpTanTest_n_to_multSinOp2_uid90_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => sinXIsXRR_uid42_fpTanTest_n, xout => ld_sinXIsXRR_uid42_fpTanTest_n_to_multSinOp2_uid90_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--multSinOp2_uid90_fpTanTest(MUX,89)@30
    multSinOp2_uid90_fpTanTest_s <= ld_sinXIsXRR_uid42_fpTanTest_n_to_multSinOp2_uid90_fpTanTest_b_q;
    multSinOp2_uid90_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSinOp2_uid90_fpTanTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE multSinOp2_uid90_fpTanTest_s IS
                      WHEN "0" => multSinOp2_uid90_fpTanTest_q <= polyEvalSigsinPiZ_uid85_fpTanTest_b;
                      WHEN "1" => multSinOp2_uid90_fpTanTest_q <= ld_oFracXRRSmallXRR_uid89_fpTanTest_b_to_multSinOp2_uid90_fpTanTest_d_replace_mem_q;
                      WHEN OTHERS => multSinOp2_uid90_fpTanTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor(LOGICAL,1576)
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_b <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_sticky_ena_q;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_q <= not (ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_a or ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_b);

	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_sticky_ena(REG,1577)
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_nor_q = "1") THEN
                ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_sticky_ena_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd(LOGICAL,1578)
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_a <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_sticky_ena_q;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_b <= en;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_a and ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_b;

	--cPi_uid70_fpTanTest(CONSTANT,69)
    cPi_uid70_fpTanTest_q <= "11001001000011111101101011";

	--LeftShiftStage263dto0_uid303_alignedZSin_uid66_fpTanTest(BITSELECT,302)@25
    LeftShiftStage263dto0_uid303_alignedZSin_uid66_fpTanTest_in <= leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q(63 downto 0);
    LeftShiftStage263dto0_uid303_alignedZSin_uid66_fpTanTest_b <= LeftShiftStage263dto0_uid303_alignedZSin_uid66_fpTanTest_in(63 downto 0);

	--leftShiftStage3Idx1_uid304_alignedZSin_uid66_fpTanTest(BITJOIN,303)@25
    leftShiftStage3Idx1_uid304_alignedZSin_uid66_fpTanTest_q <= LeftShiftStage263dto0_uid303_alignedZSin_uid66_fpTanTest_b & GND_q;

	--ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor(LOGICAL,1689)
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_b <= ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_sticky_ena_q;
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_q <= not (ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_a or ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_b);

	--ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_sticky_ena(REG,1690)
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_nor_q = "1") THEN
                ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_sticky_ena_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd(LOGICAL,1691)
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_a <= ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_sticky_ena_q;
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_b <= en;
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_q <= ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_a and ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_b;

	--X32dto0_uid274_alignedZSin_uid66_fpTanTest(BITSELECT,273)@19
    X32dto0_uid274_alignedZSin_uid66_fpTanTest_in <= zSin_uid59_fpTanTest_q(32 downto 0);
    X32dto0_uid274_alignedZSin_uid66_fpTanTest_b <= X32dto0_uid274_alignedZSin_uid66_fpTanTest_in(32 downto 0);

	--ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_inputreg(DELAY,1681)
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => X32dto0_uid274_alignedZSin_uid66_fpTanTest_b, xout => ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem(DUALMEM,1682)
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_ia <= ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_inputreg_q;
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_aa <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q;
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_ab <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q;
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 33,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 33,
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
        clocken1 => ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_iq,
        address_a => ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_aa,
        data_a => ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_ia
    );
    ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_reset0 <= areset;
        ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_q <= ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_iq(32 downto 0);

	--leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest(BITJOIN,274)@23
    leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_q <= ld_X32dto0_uid274_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_b_replace_mem_q & zs_uid237_lzcZSin_uid65_fpTanTest_q;

	--ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor(LOGICAL,1700)
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_b <= ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_sticky_ena_q;
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_q <= not (ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_a or ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_b);

	--ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_sticky_ena(REG,1701)
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_nor_q = "1") THEN
                ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_sticky_ena_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd(LOGICAL,1702)
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_a <= ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_sticky_ena_q;
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_b <= en;
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_q <= ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_a and ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_b;

	--ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_inputreg(DELAY,1692)
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => zSin_uid59_fpTanTest_q, xout => ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem(DUALMEM,1693)
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_ia <= ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_inputreg_q;
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_aa <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q;
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_ab <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q;
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 65,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 65,
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
        clocken1 => ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_iq,
        address_a => ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_aa,
        data_a => ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_ia
    );
    ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_reset0 <= areset;
        ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_q <= ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_iq(64 downto 0);

	--rVStage_uid230_lzcZSin_uid65_fpTanTest(BITSELECT,229)@19
    rVStage_uid230_lzcZSin_uid65_fpTanTest_in <= zSin_uid59_fpTanTest_q;
    rVStage_uid230_lzcZSin_uid65_fpTanTest_b <= rVStage_uid230_lzcZSin_uid65_fpTanTest_in(64 downto 1);

	--vCount_uid231_lzcZSin_uid65_fpTanTest(LOGICAL,230)@19
    vCount_uid231_lzcZSin_uid65_fpTanTest_a <= rVStage_uid230_lzcZSin_uid65_fpTanTest_b;
    vCount_uid231_lzcZSin_uid65_fpTanTest_b <= zs_uid229_lzcZSin_uid65_fpTanTest_q;
    vCount_uid231_lzcZSin_uid65_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid231_lzcZSin_uid65_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid231_lzcZSin_uid65_fpTanTest_a = vCount_uid231_lzcZSin_uid65_fpTanTest_b) THEN
                vCount_uid231_lzcZSin_uid65_fpTanTest_q <= "1";
            ELSE
                vCount_uid231_lzcZSin_uid65_fpTanTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid231_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_g(DELAY,1019)@20
    ld_vCount_uid231_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_g : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => vCount_uid231_lzcZSin_uid65_fpTanTest_q, xout => ld_vCount_uid231_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_g_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid233_lzcZSin_uid65_fpTanTest(BITSELECT,232)@19
    vStage_uid233_lzcZSin_uid65_fpTanTest_in <= zSin_uid59_fpTanTest_q(0 downto 0);
    vStage_uid233_lzcZSin_uid65_fpTanTest_b <= vStage_uid233_lzcZSin_uid65_fpTanTest_in(0 downto 0);

	--ld_vStage_uid233_lzcZSin_uid65_fpTanTest_b_to_cStage_uid234_lzcZSin_uid65_fpTanTest_b(DELAY,977)@19
    ld_vStage_uid233_lzcZSin_uid65_fpTanTest_b_to_cStage_uid234_lzcZSin_uid65_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vStage_uid233_lzcZSin_uid65_fpTanTest_b, xout => ld_vStage_uid233_lzcZSin_uid65_fpTanTest_b_to_cStage_uid234_lzcZSin_uid65_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cStage_uid234_lzcZSin_uid65_fpTanTest(BITJOIN,233)@20
    cStage_uid234_lzcZSin_uid65_fpTanTest_q <= ld_vStage_uid233_lzcZSin_uid65_fpTanTest_b_to_cStage_uid234_lzcZSin_uid65_fpTanTest_b_q & mO_uid232_lzcZSin_uid65_fpTanTest_q;

	--ld_rVStage_uid230_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid236_lzcZSin_uid65_fpTanTest_c(DELAY,979)@19
    ld_rVStage_uid230_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid236_lzcZSin_uid65_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => rVStage_uid230_lzcZSin_uid65_fpTanTest_b, xout => ld_rVStage_uid230_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid236_lzcZSin_uid65_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid236_lzcZSin_uid65_fpTanTest(MUX,235)@20
    vStagei_uid236_lzcZSin_uid65_fpTanTest_s <= vCount_uid231_lzcZSin_uid65_fpTanTest_q;
    vStagei_uid236_lzcZSin_uid65_fpTanTest: PROCESS (vStagei_uid236_lzcZSin_uid65_fpTanTest_s, en, ld_rVStage_uid230_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid236_lzcZSin_uid65_fpTanTest_c_q, cStage_uid234_lzcZSin_uid65_fpTanTest_q)
    BEGIN
            CASE vStagei_uid236_lzcZSin_uid65_fpTanTest_s IS
                  WHEN "0" => vStagei_uid236_lzcZSin_uid65_fpTanTest_q <= ld_rVStage_uid230_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid236_lzcZSin_uid65_fpTanTest_c_q;
                  WHEN "1" => vStagei_uid236_lzcZSin_uid65_fpTanTest_q <= cStage_uid234_lzcZSin_uid65_fpTanTest_q;
                  WHEN OTHERS => vStagei_uid236_lzcZSin_uid65_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid238_lzcZSin_uid65_fpTanTest(BITSELECT,237)@20
    rVStage_uid238_lzcZSin_uid65_fpTanTest_in <= vStagei_uid236_lzcZSin_uid65_fpTanTest_q;
    rVStage_uid238_lzcZSin_uid65_fpTanTest_b <= rVStage_uid238_lzcZSin_uid65_fpTanTest_in(63 downto 32);

	--vCount_uid239_lzcZSin_uid65_fpTanTest(LOGICAL,238)@20
    vCount_uid239_lzcZSin_uid65_fpTanTest_a <= rVStage_uid238_lzcZSin_uid65_fpTanTest_b;
    vCount_uid239_lzcZSin_uid65_fpTanTest_b <= zs_uid237_lzcZSin_uid65_fpTanTest_q;
    vCount_uid239_lzcZSin_uid65_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid239_lzcZSin_uid65_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid239_lzcZSin_uid65_fpTanTest_a = vCount_uid239_lzcZSin_uid65_fpTanTest_b) THEN
                vCount_uid239_lzcZSin_uid65_fpTanTest_q <= "1";
            ELSE
                vCount_uid239_lzcZSin_uid65_fpTanTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid239_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_f(DELAY,1018)@21
    ld_vCount_uid239_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid239_lzcZSin_uid65_fpTanTest_q, xout => ld_vCount_uid239_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid240_lzcZSin_uid65_fpTanTest(BITSELECT,239)@20
    vStage_uid240_lzcZSin_uid65_fpTanTest_in <= vStagei_uid236_lzcZSin_uid65_fpTanTest_q(31 downto 0);
    vStage_uid240_lzcZSin_uid65_fpTanTest_b <= vStage_uid240_lzcZSin_uid65_fpTanTest_in(31 downto 0);

	--ld_vStage_uid240_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_d(DELAY,986)@20
    ld_vStage_uid240_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_d : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => vStage_uid240_lzcZSin_uid65_fpTanTest_b, xout => ld_vStage_uid240_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rVStage_uid238_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_c(DELAY,985)@20
    ld_rVStage_uid238_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid238_lzcZSin_uid65_fpTanTest_b, xout => ld_rVStage_uid238_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid242_lzcZSin_uid65_fpTanTest(MUX,241)@21
    vStagei_uid242_lzcZSin_uid65_fpTanTest_s <= vCount_uid239_lzcZSin_uid65_fpTanTest_q;
    vStagei_uid242_lzcZSin_uid65_fpTanTest: PROCESS (vStagei_uid242_lzcZSin_uid65_fpTanTest_s, en, ld_rVStage_uid238_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_c_q, ld_vStage_uid240_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_d_q)
    BEGIN
            CASE vStagei_uid242_lzcZSin_uid65_fpTanTest_s IS
                  WHEN "0" => vStagei_uid242_lzcZSin_uid65_fpTanTest_q <= ld_rVStage_uid238_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_c_q;
                  WHEN "1" => vStagei_uid242_lzcZSin_uid65_fpTanTest_q <= ld_vStage_uid240_lzcZSin_uid65_fpTanTest_b_to_vStagei_uid242_lzcZSin_uid65_fpTanTest_d_q;
                  WHEN OTHERS => vStagei_uid242_lzcZSin_uid65_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid244_lzcZSin_uid65_fpTanTest(BITSELECT,243)@21
    rVStage_uid244_lzcZSin_uid65_fpTanTest_in <= vStagei_uid242_lzcZSin_uid65_fpTanTest_q;
    rVStage_uid244_lzcZSin_uid65_fpTanTest_b <= rVStage_uid244_lzcZSin_uid65_fpTanTest_in(31 downto 16);

	--vCount_uid245_lzcZSin_uid65_fpTanTest(LOGICAL,244)@21
    vCount_uid245_lzcZSin_uid65_fpTanTest_a <= rVStage_uid244_lzcZSin_uid65_fpTanTest_b;
    vCount_uid245_lzcZSin_uid65_fpTanTest_b <= zs_uid243_lzcZSin_uid65_fpTanTest_q;
    vCount_uid245_lzcZSin_uid65_fpTanTest_q <= "1" when vCount_uid245_lzcZSin_uid65_fpTanTest_a = vCount_uid245_lzcZSin_uid65_fpTanTest_b else "0";

	--reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4(REG,689)@21
    reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q <= vCount_uid245_lzcZSin_uid65_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q_to_r_uid270_lzcZSin_uid65_fpTanTest_e(DELAY,1017)@22
    ld_reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q_to_r_uid270_lzcZSin_uid65_fpTanTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q, xout => ld_reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q_to_r_uid270_lzcZSin_uid65_fpTanTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid246_lzcZSin_uid65_fpTanTest(BITSELECT,245)@21
    vStage_uid246_lzcZSin_uid65_fpTanTest_in <= vStagei_uid242_lzcZSin_uid65_fpTanTest_q(15 downto 0);
    vStage_uid246_lzcZSin_uid65_fpTanTest_b <= vStage_uid246_lzcZSin_uid65_fpTanTest_in(15 downto 0);

	--vStagei_uid248_lzcZSin_uid65_fpTanTest(MUX,247)@21
    vStagei_uid248_lzcZSin_uid65_fpTanTest_s <= vCount_uid245_lzcZSin_uid65_fpTanTest_q;
    vStagei_uid248_lzcZSin_uid65_fpTanTest: PROCESS (vStagei_uid248_lzcZSin_uid65_fpTanTest_s, en, rVStage_uid244_lzcZSin_uid65_fpTanTest_b, vStage_uid246_lzcZSin_uid65_fpTanTest_b)
    BEGIN
            CASE vStagei_uid248_lzcZSin_uid65_fpTanTest_s IS
                  WHEN "0" => vStagei_uid248_lzcZSin_uid65_fpTanTest_q <= rVStage_uid244_lzcZSin_uid65_fpTanTest_b;
                  WHEN "1" => vStagei_uid248_lzcZSin_uid65_fpTanTest_q <= vStage_uid246_lzcZSin_uid65_fpTanTest_b;
                  WHEN OTHERS => vStagei_uid248_lzcZSin_uid65_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid250_lzcZSin_uid65_fpTanTest(BITSELECT,249)@21
    rVStage_uid250_lzcZSin_uid65_fpTanTest_in <= vStagei_uid248_lzcZSin_uid65_fpTanTest_q;
    rVStage_uid250_lzcZSin_uid65_fpTanTest_b <= rVStage_uid250_lzcZSin_uid65_fpTanTest_in(15 downto 8);

	--reg_rVStage_uid250_lzcZSin_uid65_fpTanTest_0_to_vCount_uid251_lzcZSin_uid65_fpTanTest_1(REG,684)@21
    reg_rVStage_uid250_lzcZSin_uid65_fpTanTest_0_to_vCount_uid251_lzcZSin_uid65_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid250_lzcZSin_uid65_fpTanTest_0_to_vCount_uid251_lzcZSin_uid65_fpTanTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid250_lzcZSin_uid65_fpTanTest_0_to_vCount_uid251_lzcZSin_uid65_fpTanTest_1_q <= rVStage_uid250_lzcZSin_uid65_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid251_lzcZSin_uid65_fpTanTest(LOGICAL,250)@22
    vCount_uid251_lzcZSin_uid65_fpTanTest_a <= reg_rVStage_uid250_lzcZSin_uid65_fpTanTest_0_to_vCount_uid251_lzcZSin_uid65_fpTanTest_1_q;
    vCount_uid251_lzcZSin_uid65_fpTanTest_b <= cstAllZWE_uid8_fpTanTest_q;
    vCount_uid251_lzcZSin_uid65_fpTanTest_q <= "1" when vCount_uid251_lzcZSin_uid65_fpTanTest_a = vCount_uid251_lzcZSin_uid65_fpTanTest_b else "0";

	--ld_vCount_uid251_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_d(DELAY,1016)@22
    ld_vCount_uid251_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid251_lzcZSin_uid65_fpTanTest_q, xout => ld_vCount_uid251_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid252_lzcZSin_uid65_fpTanTest(BITSELECT,251)@21
    vStage_uid252_lzcZSin_uid65_fpTanTest_in <= vStagei_uid248_lzcZSin_uid65_fpTanTest_q(7 downto 0);
    vStage_uid252_lzcZSin_uid65_fpTanTest_b <= vStage_uid252_lzcZSin_uid65_fpTanTest_in(7 downto 0);

	--reg_vStage_uid252_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid254_lzcZSin_uid65_fpTanTest_3(REG,686)@21
    reg_vStage_uid252_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid254_lzcZSin_uid65_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid252_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid254_lzcZSin_uid65_fpTanTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid252_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid254_lzcZSin_uid65_fpTanTest_3_q <= vStage_uid252_lzcZSin_uid65_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid254_lzcZSin_uid65_fpTanTest(MUX,253)@22
    vStagei_uid254_lzcZSin_uid65_fpTanTest_s <= vCount_uid251_lzcZSin_uid65_fpTanTest_q;
    vStagei_uid254_lzcZSin_uid65_fpTanTest: PROCESS (vStagei_uid254_lzcZSin_uid65_fpTanTest_s, en, reg_rVStage_uid250_lzcZSin_uid65_fpTanTest_0_to_vCount_uid251_lzcZSin_uid65_fpTanTest_1_q, reg_vStage_uid252_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid254_lzcZSin_uid65_fpTanTest_3_q)
    BEGIN
            CASE vStagei_uid254_lzcZSin_uid65_fpTanTest_s IS
                  WHEN "0" => vStagei_uid254_lzcZSin_uid65_fpTanTest_q <= reg_rVStage_uid250_lzcZSin_uid65_fpTanTest_0_to_vCount_uid251_lzcZSin_uid65_fpTanTest_1_q;
                  WHEN "1" => vStagei_uid254_lzcZSin_uid65_fpTanTest_q <= reg_vStage_uid252_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid254_lzcZSin_uid65_fpTanTest_3_q;
                  WHEN OTHERS => vStagei_uid254_lzcZSin_uid65_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid256_lzcZSin_uid65_fpTanTest(BITSELECT,255)@22
    rVStage_uid256_lzcZSin_uid65_fpTanTest_in <= vStagei_uid254_lzcZSin_uid65_fpTanTest_q;
    rVStage_uid256_lzcZSin_uid65_fpTanTest_b <= rVStage_uid256_lzcZSin_uid65_fpTanTest_in(7 downto 4);

	--vCount_uid257_lzcZSin_uid65_fpTanTest(LOGICAL,256)@22
    vCount_uid257_lzcZSin_uid65_fpTanTest_a <= rVStage_uid256_lzcZSin_uid65_fpTanTest_b;
    vCount_uid257_lzcZSin_uid65_fpTanTest_b <= leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q;
    vCount_uid257_lzcZSin_uid65_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid257_lzcZSin_uid65_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid257_lzcZSin_uid65_fpTanTest_a = vCount_uid257_lzcZSin_uid65_fpTanTest_b) THEN
                vCount_uid257_lzcZSin_uid65_fpTanTest_q <= "1";
            ELSE
                vCount_uid257_lzcZSin_uid65_fpTanTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid258_lzcZSin_uid65_fpTanTest(BITSELECT,257)@22
    vStage_uid258_lzcZSin_uid65_fpTanTest_in <= vStagei_uid254_lzcZSin_uid65_fpTanTest_q(3 downto 0);
    vStage_uid258_lzcZSin_uid65_fpTanTest_b <= vStage_uid258_lzcZSin_uid65_fpTanTest_in(3 downto 0);

	--reg_vStage_uid258_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_3(REG,688)@22
    reg_vStage_uid258_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid258_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid258_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_3_q <= vStage_uid258_lzcZSin_uid65_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid256_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_2(REG,687)@22
    reg_rVStage_uid256_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid256_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_2_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid256_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_2_q <= rVStage_uid256_lzcZSin_uid65_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid260_lzcZSin_uid65_fpTanTest(MUX,259)@23
    vStagei_uid260_lzcZSin_uid65_fpTanTest_s <= vCount_uid257_lzcZSin_uid65_fpTanTest_q;
    vStagei_uid260_lzcZSin_uid65_fpTanTest: PROCESS (vStagei_uid260_lzcZSin_uid65_fpTanTest_s, en, reg_rVStage_uid256_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_2_q, reg_vStage_uid258_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_3_q)
    BEGIN
            CASE vStagei_uid260_lzcZSin_uid65_fpTanTest_s IS
                  WHEN "0" => vStagei_uid260_lzcZSin_uid65_fpTanTest_q <= reg_rVStage_uid256_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_2_q;
                  WHEN "1" => vStagei_uid260_lzcZSin_uid65_fpTanTest_q <= reg_vStage_uid258_lzcZSin_uid65_fpTanTest_0_to_vStagei_uid260_lzcZSin_uid65_fpTanTest_3_q;
                  WHEN OTHERS => vStagei_uid260_lzcZSin_uid65_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid262_lzcZSin_uid65_fpTanTest(BITSELECT,261)@23
    rVStage_uid262_lzcZSin_uid65_fpTanTest_in <= vStagei_uid260_lzcZSin_uid65_fpTanTest_q;
    rVStage_uid262_lzcZSin_uid65_fpTanTest_b <= rVStage_uid262_lzcZSin_uid65_fpTanTest_in(3 downto 2);

	--vCount_uid263_lzcZSin_uid65_fpTanTest(LOGICAL,262)@23
    vCount_uid263_lzcZSin_uid65_fpTanTest_a <= rVStage_uid262_lzcZSin_uid65_fpTanTest_b;
    vCount_uid263_lzcZSin_uid65_fpTanTest_b <= leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q;
    vCount_uid263_lzcZSin_uid65_fpTanTest_q <= "1" when vCount_uid263_lzcZSin_uid65_fpTanTest_a = vCount_uid263_lzcZSin_uid65_fpTanTest_b else "0";

	--vStage_uid264_lzcZSin_uid65_fpTanTest(BITSELECT,263)@23
    vStage_uid264_lzcZSin_uid65_fpTanTest_in <= vStagei_uid260_lzcZSin_uid65_fpTanTest_q(1 downto 0);
    vStage_uid264_lzcZSin_uid65_fpTanTest_b <= vStage_uid264_lzcZSin_uid65_fpTanTest_in(1 downto 0);

	--vStagei_uid266_lzcZSin_uid65_fpTanTest(MUX,265)@23
    vStagei_uid266_lzcZSin_uid65_fpTanTest_s <= vCount_uid263_lzcZSin_uid65_fpTanTest_q;
    vStagei_uid266_lzcZSin_uid65_fpTanTest: PROCESS (vStagei_uid266_lzcZSin_uid65_fpTanTest_s, en, rVStage_uid262_lzcZSin_uid65_fpTanTest_b, vStage_uid264_lzcZSin_uid65_fpTanTest_b)
    BEGIN
            CASE vStagei_uid266_lzcZSin_uid65_fpTanTest_s IS
                  WHEN "0" => vStagei_uid266_lzcZSin_uid65_fpTanTest_q <= rVStage_uid262_lzcZSin_uid65_fpTanTest_b;
                  WHEN "1" => vStagei_uid266_lzcZSin_uid65_fpTanTest_q <= vStage_uid264_lzcZSin_uid65_fpTanTest_b;
                  WHEN OTHERS => vStagei_uid266_lzcZSin_uid65_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid268_lzcZSin_uid65_fpTanTest(BITSELECT,267)@23
    rVStage_uid268_lzcZSin_uid65_fpTanTest_in <= vStagei_uid266_lzcZSin_uid65_fpTanTest_q;
    rVStage_uid268_lzcZSin_uid65_fpTanTest_b <= rVStage_uid268_lzcZSin_uid65_fpTanTest_in(1 downto 1);

	--vCount_uid269_lzcZSin_uid65_fpTanTest(LOGICAL,268)@23
    vCount_uid269_lzcZSin_uid65_fpTanTest_a <= rVStage_uid268_lzcZSin_uid65_fpTanTest_b;
    vCount_uid269_lzcZSin_uid65_fpTanTest_b <= GND_q;
    vCount_uid269_lzcZSin_uid65_fpTanTest_q <= "1" when vCount_uid269_lzcZSin_uid65_fpTanTest_a = vCount_uid269_lzcZSin_uid65_fpTanTest_b else "0";

	--r_uid270_lzcZSin_uid65_fpTanTest(BITJOIN,269)@23
    r_uid270_lzcZSin_uid65_fpTanTest_q <= ld_vCount_uid231_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_g_q & ld_vCount_uid239_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_f_q & ld_reg_vCount_uid245_lzcZSin_uid65_fpTanTest_0_to_r_uid270_lzcZSin_uid65_fpTanTest_4_q_to_r_uid270_lzcZSin_uid65_fpTanTest_e_q & ld_vCount_uid251_lzcZSin_uid65_fpTanTest_q_to_r_uid270_lzcZSin_uid65_fpTanTest_d_q & vCount_uid257_lzcZSin_uid65_fpTanTest_q & vCount_uid263_lzcZSin_uid65_fpTanTest_q & vCount_uid269_lzcZSin_uid65_fpTanTest_q;

	--leftShiftStageSel6Dto5_uid278_alignedZSin_uid66_fpTanTest(BITSELECT,277)@23
    leftShiftStageSel6Dto5_uid278_alignedZSin_uid66_fpTanTest_in <= r_uid270_lzcZSin_uid65_fpTanTest_q;
    leftShiftStageSel6Dto5_uid278_alignedZSin_uid66_fpTanTest_b <= leftShiftStageSel6Dto5_uid278_alignedZSin_uid66_fpTanTest_in(6 downto 5);

	--leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest(MUX,278)@23
    leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_s <= leftShiftStageSel6Dto5_uid278_alignedZSin_uid66_fpTanTest_b;
    leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest: PROCESS (leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_s, en, ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_q, leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_q, cstZwShiftPwFRR_uid35_fpTanTest_q, cstZwShiftPwFRR_uid35_fpTanTest_q)
    BEGIN
            CASE leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_s IS
                  WHEN "00" => leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q <= ld_zSin_uid59_fpTanTest_q_to_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q <= leftShiftStage0Idx1_uid275_alignedZSin_uid66_fpTanTest_q;
                  WHEN "10" => leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q <= cstZwShiftPwFRR_uid35_fpTanTest_q;
                  WHEN "11" => leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q <= cstZwShiftPwFRR_uid35_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage040dto0_uid287_alignedZSin_uid66_fpTanTest(BITSELECT,286)@23
    LeftShiftStage040dto0_uid287_alignedZSin_uid66_fpTanTest_in <= leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q(40 downto 0);
    LeftShiftStage040dto0_uid287_alignedZSin_uid66_fpTanTest_b <= LeftShiftStage040dto0_uid287_alignedZSin_uid66_fpTanTest_in(40 downto 0);

	--leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest(BITJOIN,287)@23
    leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_q <= LeftShiftStage040dto0_uid287_alignedZSin_uid66_fpTanTest_b & leftShiftStage1Idx3Pad24_uid286_alignedZSin_uid66_fpTanTest_q;

	--reg_leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_5(REG,694)@23
    reg_leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_5_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_5_q <= leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage048dto0_uid284_alignedZSin_uid66_fpTanTest(BITSELECT,283)@23
    LeftShiftStage048dto0_uid284_alignedZSin_uid66_fpTanTest_in <= leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q(48 downto 0);
    LeftShiftStage048dto0_uid284_alignedZSin_uid66_fpTanTest_b <= LeftShiftStage048dto0_uid284_alignedZSin_uid66_fpTanTest_in(48 downto 0);

	--leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest(BITJOIN,284)@23
    leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_q <= LeftShiftStage048dto0_uid284_alignedZSin_uid66_fpTanTest_b & zs_uid243_lzcZSin_uid65_fpTanTest_q;

	--reg_leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_4(REG,693)@23
    reg_leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_4_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_4_q <= leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage056dto0_uid281_alignedZSin_uid66_fpTanTest(BITSELECT,280)@23
    LeftShiftStage056dto0_uid281_alignedZSin_uid66_fpTanTest_in <= leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q(56 downto 0);
    LeftShiftStage056dto0_uid281_alignedZSin_uid66_fpTanTest_b <= LeftShiftStage056dto0_uid281_alignedZSin_uid66_fpTanTest_in(56 downto 0);

	--leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest(BITJOIN,281)@23
    leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_q <= LeftShiftStage056dto0_uid281_alignedZSin_uid66_fpTanTest_b & cstAllZWE_uid8_fpTanTest_q;

	--reg_leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_3(REG,692)@23
    reg_leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_3_q <= leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_2(REG,691)@23
    reg_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_2_q <= leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest(BITSELECT,288)@23
    leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_in <= r_uid270_lzcZSin_uid65_fpTanTest_q(4 downto 0);
    leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_b <= leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_in(4 downto 3);

	--reg_leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_1(REG,690)@23
    reg_leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_1_q <= leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest(MUX,289)@24
    leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_s <= reg_leftShiftStageSel4Dto3_uid289_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_1_q;
    leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest: PROCESS (leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_s, en, reg_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_2_q, reg_leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_3_q, reg_leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_4_q, reg_leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_s IS
                  WHEN "00" => leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q <= reg_leftShiftStage0_uid279_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_2_q;
                  WHEN "01" => leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q <= reg_leftShiftStage1Idx1_uid282_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_3_q;
                  WHEN "10" => leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q <= reg_leftShiftStage1Idx2_uid285_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_4_q;
                  WHEN "11" => leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q <= reg_leftShiftStage1Idx3_uid288_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest(BITSELECT,297)@24
    LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_in <= leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q(58 downto 0);
    LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_b <= LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_in(58 downto 0);

	--ld_LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_b(DELAY,1043)@24
    ld_LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 59, depth => 1 )
    PORT MAP ( xin => LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_b, xout => ld_LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest(BITJOIN,298)@25
    leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_q <= ld_LeftShiftStage158dto0_uid298_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_b_q & leftShiftStage2Idx3Pad6_uid297_alignedZSin_uid66_fpTanTest_q;

	--LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest(BITSELECT,294)@24
    LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_in <= leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q(60 downto 0);
    LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_b <= LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_in(60 downto 0);

	--ld_LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_b(DELAY,1041)@24
    ld_LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 61, depth => 1 )
    PORT MAP ( xin => LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_b, xout => ld_LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest(BITJOIN,295)@25
    leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_q <= ld_LeftShiftStage160dto0_uid295_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_b_q & leftShiftStage0Idx1Pad4_uid206_fxpX_uid48_fpTanTest_q;

	--LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest(BITSELECT,291)@24
    LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_in <= leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q(62 downto 0);
    LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_b <= LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_in(62 downto 0);

	--ld_LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_b(DELAY,1039)@24
    ld_LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 63, depth => 1 )
    PORT MAP ( xin => LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_b, xout => ld_LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest(BITJOIN,292)@25
    leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_q <= ld_LeftShiftStage162dto0_uid292_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_b_q & leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q;

	--reg_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_2(REG,696)@24
    reg_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_2_q <= leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest(BITSELECT,299)@23
    leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_in <= r_uid270_lzcZSin_uid65_fpTanTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_b <= leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_in(2 downto 1);

	--ld_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_b_to_reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_a(DELAY,1449)@23
    ld_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_b_to_reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_b, xout => ld_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_b_to_reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1(REG,695)@24
    reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_q <= ld_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_b_to_reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest(MUX,300)@25
    leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_s <= reg_leftShiftStageSel2Dto1_uid300_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_1_q;
    leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest: PROCESS (leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_s, en, reg_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_2_q, leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_q, leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_q, leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_q)
    BEGIN
            CASE leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_s IS
                  WHEN "00" => leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q <= reg_leftShiftStage1_uid290_alignedZSin_uid66_fpTanTest_0_to_leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_2_q;
                  WHEN "01" => leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q <= leftShiftStage2Idx1_uid293_alignedZSin_uid66_fpTanTest_q;
                  WHEN "10" => leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q <= leftShiftStage2Idx2_uid296_alignedZSin_uid66_fpTanTest_q;
                  WHEN "11" => leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q <= leftShiftStage2Idx3_uid299_alignedZSin_uid66_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest(BITSELECT,304)@23
    leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_in <= r_uid270_lzcZSin_uid65_fpTanTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_b <= leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_b(DELAY,1053)@23
    ld_leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_b, xout => ld_leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest(MUX,305)@25
    leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_s <= ld_leftShiftStageSel0Dto0_uid305_alignedZSin_uid66_fpTanTest_b_to_leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_b_q;
    leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest: PROCESS (leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_s, en, leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q, leftShiftStage3Idx1_uid304_alignedZSin_uid66_fpTanTest_q)
    BEGIN
            CASE leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_s IS
                  WHEN "0" => leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_q <= leftShiftStage2_uid301_alignedZSin_uid66_fpTanTest_q;
                  WHEN "1" => leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_q <= leftShiftStage3Idx1_uid304_alignedZSin_uid66_fpTanTest_q;
                  WHEN OTHERS => leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pHigh_uid71_fpTanTest(BITSELECT,70)@25
    pHigh_uid71_fpTanTest_in <= leftShiftStage3_uid306_alignedZSin_uid66_fpTanTest_q;
    pHigh_uid71_fpTanTest_b <= pHigh_uid71_fpTanTest_in(64 downto 39);

	--reg_pHigh_uid71_fpTanTest_0_to_p_uid72_fpTanTest_2(REG,698)@25
    reg_pHigh_uid71_fpTanTest_0_to_p_uid72_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pHigh_uid71_fpTanTest_0_to_p_uid72_fpTanTest_2_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pHigh_uid71_fpTanTest_0_to_p_uid72_fpTanTest_2_q <= pHigh_uid71_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_a(DELAY,1451)@14
    ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => sinXIsXRR_uid42_fpTanTest_n, xout => ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1(REG,697)@25
    reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_q <= ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p_uid72_fpTanTest(MUX,71)@26
    p_uid72_fpTanTest_s <= reg_sinXIsXRR_uid42_fpTanTest_2_to_p_uid72_fpTanTest_1_q;
    p_uid72_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p_uid72_fpTanTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE p_uid72_fpTanTest_s IS
                      WHEN "0" => p_uid72_fpTanTest_q <= reg_pHigh_uid71_fpTanTest_0_to_p_uid72_fpTanTest_2_q;
                      WHEN "1" => p_uid72_fpTanTest_q <= cPi_uid70_fpTanTest_q;
                      WHEN OTHERS => p_uid72_fpTanTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_inputreg(DELAY,1568)
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => p_uid72_fpTanTest_q, xout => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem(DUALMEM,1569)
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_ia <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_inputreg_q;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_aa <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_ab <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q;
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_iq,
        address_a => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_aa,
        data_a => ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_ia
    );
    ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_reset0 <= areset;
        ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_iq(25 downto 0);

	--mulSin_uid91_fpTanTest(MULT,90)@31
    mulSin_uid91_fpTanTest_pr <= UNSIGNED(mulSin_uid91_fpTanTest_a) * UNSIGNED(mulSin_uid91_fpTanTest_b);
    mulSin_uid91_fpTanTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulSin_uid91_fpTanTest_a <= (others => '0');
            mulSin_uid91_fpTanTest_b <= (others => '0');
            mulSin_uid91_fpTanTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulSin_uid91_fpTanTest_a <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_mem_q;
                mulSin_uid91_fpTanTest_b <= multSinOp2_uid90_fpTanTest_q;
                mulSin_uid91_fpTanTest_s1 <= STD_LOGIC_VECTOR(mulSin_uid91_fpTanTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mulSin_uid91_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulSin_uid91_fpTanTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulSin_uid91_fpTanTest_q <= mulSin_uid91_fpTanTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBitSin_uid92_fpTanTest(BITSELECT,91)@34
    normBitSin_uid92_fpTanTest_in <= mulSin_uid91_fpTanTest_q;
    normBitSin_uid92_fpTanTest_b <= normBitSin_uid92_fpTanTest_in(51 downto 51);

	--join_uid98_fpTanTest(BITJOIN,97)@34
    join_uid98_fpTanTest_q <= reg_sinXIsXRR_uid42_fpTanTest_2_to_join_uid98_fpTanTest_1_q & normBitSin_uid92_fpTanTest_b;

	--sinRndOp_uid99_uid100_fpTanTest(BITJOIN,99)@34
    sinRndOp_uid99_uid100_fpTanTest_q <= join_uid98_fpTanTest_q & cstAllZWF_uid7_fpTanTest_q & VCC_q;

	--ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor(LOGICAL,1589)
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_b <= ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_sticky_ena_q;
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_q <= not (ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_a or ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_b);

	--ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_sticky_ena(REG,1590)
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_nor_q = "1") THEN
                ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_sticky_ena_q <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd(LOGICAL,1591)
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_a <= ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_sticky_ena_q;
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_b <= en;
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_q <= ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_a and ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_b;

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor(LOGICAL,1539)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_b <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_sticky_ena_q;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_q <= not (ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_a or ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_b);

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_sticky_ena(REG,1540)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_nor_q = "1") THEN
                ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_sticky_ena_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd(LOGICAL,1541)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_sticky_ena_q;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_b <= en;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_a and ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_b;

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_inputreg(DELAY,1529)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expXRR_uid39_fpTanTest_b, xout => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem(DUALMEM,1530)
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_ia <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_inputreg_q;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_aa <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdreg_q;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_ab <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_rdmux_q;
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_iq,
        address_a => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_aa,
        data_a => ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_ia
    );
    ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_reset0 <= areset;
        ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_iq(7 downto 0);

	--reg_r_uid270_lzcZSin_uid65_fpTanTest_0_to_expSinHC_uid73_fpTanTest_1(REG,708)@23
    reg_r_uid270_lzcZSin_uid65_fpTanTest_0_to_expSinHC_uid73_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid270_lzcZSin_uid65_fpTanTest_0_to_expSinHC_uid73_fpTanTest_1_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid270_lzcZSin_uid65_fpTanTest_0_to_expSinHC_uid73_fpTanTest_1_q <= r_uid270_lzcZSin_uid65_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expSinHC_uid73_fpTanTest(SUB,72)@24
    expSinHC_uid73_fpTanTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_fpTanTest_q);
    expSinHC_uid73_fpTanTest_b <= STD_LOGIC_VECTOR("00" & reg_r_uid270_lzcZSin_uid65_fpTanTest_0_to_expSinHC_uid73_fpTanTest_1_q);
            expSinHC_uid73_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSinHC_uid73_fpTanTest_a) - UNSIGNED(expSinHC_uid73_fpTanTest_b));
    expSinHC_uid73_fpTanTest_q <= expSinHC_uid73_fpTanTest_o(8 downto 0);


	--expSinHCR_uid74_fpTanTest(BITSELECT,73)@24
    expSinHCR_uid74_fpTanTest_in <= expSinHC_uid73_fpTanTest_q(7 downto 0);
    expSinHCR_uid74_fpTanTest_b <= expSinHCR_uid74_fpTanTest_in(7 downto 0);

	--ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_a(DELAY,1463)@14
    ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 9 )
    PORT MAP ( xin => sinXIsXRR_uid42_fpTanTest_n, xout => ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1(REG,709)@23
    reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_q <= ld_sinXIsXRR_uid42_fpTanTest_n_to_reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--expPSin_uid75_fpTanTest(MUX,74)@24
    expPSin_uid75_fpTanTest_s <= reg_sinXIsXRR_uid42_fpTanTest_2_to_expPSin_uid75_fpTanTest_1_q;
    expPSin_uid75_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPSin_uid75_fpTanTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expPSin_uid75_fpTanTest_s IS
                      WHEN "0" => expPSin_uid75_fpTanTest_q <= expSinHCR_uid74_fpTanTest_b;
                      WHEN "1" => expPSin_uid75_fpTanTest_q <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_replace_mem_q;
                      WHEN OTHERS => expPSin_uid75_fpTanTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_inputreg(DELAY,1579)
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expPSin_uid75_fpTanTest_q, xout => ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem(DUALMEM,1580)
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_ia <= ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_inputreg_q;
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_aa <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdreg_q;
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_ab <= ld_reg_r_uid349_lzcZCos_uid68_fpTanTest_0_to_expHardCase_uid77_fpTanTest_1_q_to_expHardCase_uid77_fpTanTest_b_replace_rdmux_q;
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_iq,
        address_a => ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_aa,
        data_a => ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_ia
    );
    ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_reset0 <= areset;
        ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_q <= ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_iq(7 downto 0);

	--fracRSinPreRndHigh_uid94_fpTanTest(BITSELECT,93)@34
    fracRSinPreRndHigh_uid94_fpTanTest_in <= mulSin_uid91_fpTanTest_q(50 downto 0);
    fracRSinPreRndHigh_uid94_fpTanTest_b <= fracRSinPreRndHigh_uid94_fpTanTest_in(50 downto 27);

	--fracRSinPreRndLow_uid95_fpTanTest(BITSELECT,94)@34
    fracRSinPreRndLow_uid95_fpTanTest_in <= mulSin_uid91_fpTanTest_q(49 downto 0);
    fracRSinPreRndLow_uid95_fpTanTest_b <= fracRSinPreRndLow_uid95_fpTanTest_in(49 downto 26);

	--fracRSinPreRnd_uid96_fpTanTest(MUX,95)@34
    fracRSinPreRnd_uid96_fpTanTest_s <= normBitSin_uid92_fpTanTest_b;
    fracRSinPreRnd_uid96_fpTanTest: PROCESS (fracRSinPreRnd_uid96_fpTanTest_s, en, fracRSinPreRndLow_uid95_fpTanTest_b, fracRSinPreRndHigh_uid94_fpTanTest_b)
    BEGIN
            CASE fracRSinPreRnd_uid96_fpTanTest_s IS
                  WHEN "0" => fracRSinPreRnd_uid96_fpTanTest_q <= fracRSinPreRndLow_uid95_fpTanTest_b;
                  WHEN "1" => fracRSinPreRnd_uid96_fpTanTest_q <= fracRSinPreRndHigh_uid94_fpTanTest_b;
                  WHEN OTHERS => fracRSinPreRnd_uid96_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRSinPreRnd_uid97_uid97_fpTanTest(BITJOIN,96)@34
    expFracRSinPreRnd_uid97_uid97_fpTanTest_q <= ld_expPSin_uid75_fpTanTest_q_to_expFracRSinPreRnd_uid97_uid97_fpTanTest_b_replace_mem_q & fracRSinPreRnd_uid96_fpTanTest_q;

	--expFracRSin_uid101_fpTanTest(ADD,100)@34
    expFracRSin_uid101_fpTanTest_a <= STD_LOGIC_VECTOR("0" & expFracRSinPreRnd_uid97_uid97_fpTanTest_q);
    expFracRSin_uid101_fpTanTest_b <= STD_LOGIC_VECTOR("0000000" & sinRndOp_uid99_uid100_fpTanTest_q);
            expFracRSin_uid101_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSin_uid101_fpTanTest_a) + UNSIGNED(expFracRSin_uid101_fpTanTest_b));
    expFracRSin_uid101_fpTanTest_q <= expFracRSin_uid101_fpTanTest_o(32 downto 0);


	--expRCompSin_uid103_fpTanTest(BITSELECT,102)@34
    expRCompSin_uid103_fpTanTest_in <= expFracRSin_uid101_fpTanTest_q(31 downto 0);
    expRCompSin_uid103_fpTanTest_b <= expRCompSin_uid103_fpTanTest_in(31 downto 24);

	--reg_expRCompSin_uid103_fpTanTest_0_to_expRPostExcSin_uid125_fpTanTest_2(REG,712)@34
    reg_expRCompSin_uid103_fpTanTest_0_to_expRPostExcSin_uid125_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRCompSin_uid103_fpTanTest_0_to_expRPostExcSin_uid125_fpTanTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRCompSin_uid103_fpTanTest_0_to_expRPostExcSin_uid125_fpTanTest_2_q <= expRCompSin_uid103_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor(LOGICAL,1791)
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_b <= ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_sticky_ena_q;
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_q <= not (ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_a or ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_b);

	--ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_sticky_ena(REG,1792)
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_nor_q = "1") THEN
                ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_sticky_ena_q <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd(LOGICAL,1793)
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_a <= ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_sticky_ena_q;
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_b <= en;
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_q <= ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_a and ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_b;

	--expXIsZero_uid10_fpTanTest(LOGICAL,9)@0
    expXIsZero_uid10_fpTanTest_a <= exp_uid9_fpTanTest_b;
    expXIsZero_uid10_fpTanTest_b <= cstAllZWE_uid8_fpTanTest_q;
    expXIsZero_uid10_fpTanTest_q <= "1" when expXIsZero_uid10_fpTanTest_a = expXIsZero_uid10_fpTanTest_b else "0";

	--ld_expXIsZero_uid10_fpTanTest_q_to_excSelBitsSin_uid117_fpTanTest_b(DELAY,870)@0
    ld_expXIsZero_uid10_fpTanTest_q_to_excSelBitsSin_uid117_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => expXIsZero_uid10_fpTanTest_q, xout => ld_expXIsZero_uid10_fpTanTest_q_to_excSelBitsSin_uid117_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excSelBitsSin_uid117_fpTanTest(BITJOIN,116)@17
    excSelBitsSin_uid117_fpTanTest_q <= excRNaN_uid116_fpTanTest_q & ld_expXIsZero_uid10_fpTanTest_q_to_excSelBitsSin_uid117_fpTanTest_b_q & ld_sinXIsX_uid41_fpTanTest_n_to_excSelBitsSin_uid117_fpTanTest_a_q;

	--ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_inputreg(DELAY,1781)
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => excSelBitsSin_uid117_fpTanTest_q, xout => ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem(DUALMEM,1782)
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_ia <= ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_inputreg_q;
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_aa <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdreg_q;
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_ab <= ld_reg_join_uid137_fpTanTest_0_to_fracRPostExcCos_uid138_fpTanTest_1_q_to_fracRPostExcCos_uid138_fpTanTest_b_replace_rdmux_q;
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 3,
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
        clocken1 => ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_iq,
        address_a => ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_aa,
        data_a => ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_ia
    );
    ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_reset0 <= areset;
        ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_q <= ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_iq(2 downto 0);

	--reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0(REG,648)@33
    reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_q <= ld_excSelBitsSin_uid117_fpTanTest_q_to_reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--excSelSin_uid118_fpTanTest(LOOKUP,117)@34
    excSelSin_uid118_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excSelSin_uid118_fpTanTest_q <= "00";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_excSelBitsSin_uid117_fpTanTest_0_to_excSelSin_uid118_fpTanTest_0_q) IS
                WHEN "000" =>  excSelSin_uid118_fpTanTest_q <= "00";
                WHEN "001" =>  excSelSin_uid118_fpTanTest_q <= "01";
                WHEN "010" =>  excSelSin_uid118_fpTanTest_q <= "10";
                WHEN "011" =>  excSelSin_uid118_fpTanTest_q <= "10";
                WHEN "100" =>  excSelSin_uid118_fpTanTest_q <= "11";
                WHEN "101" =>  excSelSin_uid118_fpTanTest_q <= "11";
                WHEN "110" =>  excSelSin_uid118_fpTanTest_q <= "00";
                WHEN "111" =>  excSelSin_uid118_fpTanTest_q <= "00";
                WHEN OTHERS =>
                    excSelSin_uid118_fpTanTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--expRPostExcSin_uid125_fpTanTest(MUX,124)@35
    expRPostExcSin_uid125_fpTanTest_s <= excSelSin_uid118_fpTanTest_q;
    expRPostExcSin_uid125_fpTanTest: PROCESS (expRPostExcSin_uid125_fpTanTest_s, en, reg_expRCompSin_uid103_fpTanTest_0_to_expRPostExcSin_uid125_fpTanTest_2_q, ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_q, cstAllZWE_uid8_fpTanTest_q, cstAllOWE_uid6_fpTanTest_q)
    BEGIN
            CASE expRPostExcSin_uid125_fpTanTest_s IS
                  WHEN "00" => expRPostExcSin_uid125_fpTanTest_q <= reg_expRCompSin_uid103_fpTanTest_0_to_expRPostExcSin_uid125_fpTanTest_2_q;
                  WHEN "01" => expRPostExcSin_uid125_fpTanTest_q <= ld_exp_uid9_fpTanTest_b_to_expRPostExcSin_uid125_fpTanTest_d_replace_mem_q;
                  WHEN "10" => expRPostExcSin_uid125_fpTanTest_q <= cstAllZWE_uid8_fpTanTest_q;
                  WHEN "11" => expRPostExcSin_uid125_fpTanTest_q <= cstAllOWE_uid6_fpTanTest_q;
                  WHEN OTHERS => expRPostExcSin_uid125_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor(LOGICAL,1602)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_b <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_sticky_ena_q;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_q <= not (ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_a or ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_b);

	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_sticky_ena(REG,1603)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_nor_q = "1") THEN
                ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_sticky_ena_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd(LOGICAL,1604)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_a <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_sticky_ena_q;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_b <= en;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_a and ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_b;

	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_inputreg(DELAY,1592)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => frac_uid13_fpTanTest_b, xout => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem(DUALMEM,1593)
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_ia <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_inputreg_q;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_aa <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdreg_q;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_ab <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_rdmux_q;
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_dmem : altsyncram
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
        clocken1 => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_iq,
        address_a => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_aa,
        data_a => ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_ia
    );
    ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_reset0 <= areset;
        ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_iq(22 downto 0);

	--fracRCompSin_uid102_fpTanTest(BITSELECT,101)@34
    fracRCompSin_uid102_fpTanTest_in <= expFracRSin_uid101_fpTanTest_q(23 downto 0);
    fracRCompSin_uid102_fpTanTest_b <= fracRCompSin_uid102_fpTanTest_in(23 downto 1);

	--reg_fracRCompSin_uid102_fpTanTest_0_to_fracRPostExcSin_uid121_fpTanTest_2(REG,711)@34
    reg_fracRCompSin_uid102_fpTanTest_0_to_fracRPostExcSin_uid121_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRCompSin_uid102_fpTanTest_0_to_fracRPostExcSin_uid121_fpTanTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRCompSin_uid102_fpTanTest_0_to_fracRPostExcSin_uid121_fpTanTest_2_q <= fracRCompSin_uid102_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExcSin_uid121_fpTanTest(MUX,120)@35
    fracRPostExcSin_uid121_fpTanTest_s <= excSelSin_uid118_fpTanTest_q;
    fracRPostExcSin_uid121_fpTanTest: PROCESS (fracRPostExcSin_uid121_fpTanTest_s, en, reg_fracRCompSin_uid102_fpTanTest_0_to_fracRPostExcSin_uid121_fpTanTest_2_q, ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_q, cstAllZWF_uid7_fpTanTest_q, cstNaNwF_uid32_fpTanTest_q)
    BEGIN
            CASE fracRPostExcSin_uid121_fpTanTest_s IS
                  WHEN "00" => fracRPostExcSin_uid121_fpTanTest_q <= reg_fracRCompSin_uid102_fpTanTest_0_to_fracRPostExcSin_uid121_fpTanTest_2_q;
                  WHEN "01" => fracRPostExcSin_uid121_fpTanTest_q <= ld_frac_uid13_fpTanTest_b_to_fracRPostExcSin_uid121_fpTanTest_d_replace_mem_q;
                  WHEN "10" => fracRPostExcSin_uid121_fpTanTest_q <= cstAllZWF_uid7_fpTanTest_q;
                  WHEN "11" => fracRPostExcSin_uid121_fpTanTest_q <= cstNaNwF_uid32_fpTanTest_q;
                  WHEN OTHERS => fracRPostExcSin_uid121_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fpSin_uid130_fpTanTest(BITJOIN,129)@35
    fpSin_uid130_fpTanTest_q <= ld_signR_uid129_fpTanTest_q_to_fpSin_uid130_fpTanTest_c_q & expRPostExcSin_uid125_fpTanTest_q & fracRPostExcSin_uid121_fpTanTest_q;

	--fracX_uid429_fpTanXComp_uid157_fpTanTest(BITSELECT,428)@35
    fracX_uid429_fpTanXComp_uid157_fpTanTest_in <= fpSin_uid130_fpTanTest_q(22 downto 0);
    fracX_uid429_fpTanXComp_uid157_fpTanTest_b <= fracX_uid429_fpTanXComp_uid157_fpTanTest_in(22 downto 0);

	--fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest(LOGICAL,442)@35
    fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_a <= fracX_uid429_fpTanXComp_uid157_fpTanTest_b;
    fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_b <= cstAllZWF_uid7_fpTanTest_q;
    fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_q <= "1" when fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_a = fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_b else "0";

	--expX_uid428_fpTanXComp_uid157_fpTanTest(BITSELECT,427)@35
    expX_uid428_fpTanXComp_uid157_fpTanTest_in <= fpSin_uid130_fpTanTest_q(30 downto 0);
    expX_uid428_fpTanXComp_uid157_fpTanTest_b <= expX_uid428_fpTanXComp_uid157_fpTanTest_in(30 downto 23);

	--expXIsMax_uid441_fpTanXComp_uid157_fpTanTest(LOGICAL,440)@35
    expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_a <= expX_uid428_fpTanXComp_uid157_fpTanTest_b;
    expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_b <= cstAllOWE_uid6_fpTanTest_q;
    expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_q <= "1" when expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_a = expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_b else "0";

	--exc_I_uid444_fpTanXComp_uid157_fpTanTest(LOGICAL,443)@35
    exc_I_uid444_fpTanXComp_uid157_fpTanTest_a <= expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_q;
    exc_I_uid444_fpTanXComp_uid157_fpTanTest_b <= fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_q;
    exc_I_uid444_fpTanXComp_uid157_fpTanTest_q <= exc_I_uid444_fpTanXComp_uid157_fpTanTest_a and exc_I_uid444_fpTanXComp_uid157_fpTanTest_b;

	--excXIYI_uid510_fpTanXComp_uid157_fpTanTest(LOGICAL,509)@35
    excXIYI_uid510_fpTanXComp_uid157_fpTanTest_a <= exc_I_uid444_fpTanXComp_uid157_fpTanTest_q;
    excXIYI_uid510_fpTanXComp_uid157_fpTanTest_b <= exc_I_uid460_fpTanXComp_uid157_fpTanTest_q;
    excXIYI_uid510_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excXIYI_uid510_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            excXIYI_uid510_fpTanXComp_uid157_fpTanTest_q <= excXIYI_uid510_fpTanXComp_uid157_fpTanTest_a and excXIYI_uid510_fpTanXComp_uid157_fpTanTest_b;
        END IF;
        END IF;
    END PROCESS;



	--InvFracXIsZero_uid461_fpTanXComp_uid157_fpTanTest(LOGICAL,460)@35
    InvFracXIsZero_uid461_fpTanXComp_uid157_fpTanTest_a <= fracXIsZero_uid459_fpTanXComp_uid157_fpTanTest_q;
    InvFracXIsZero_uid461_fpTanXComp_uid157_fpTanTest_q <= not InvFracXIsZero_uid461_fpTanXComp_uid157_fpTanTest_a;

	--exc_N_uid462_fpTanXComp_uid157_fpTanTest(LOGICAL,461)@35
    exc_N_uid462_fpTanXComp_uid157_fpTanTest_a <= expXIsMax_uid457_fpTanXComp_uid157_fpTanTest_q;
    exc_N_uid462_fpTanXComp_uid157_fpTanTest_b <= InvFracXIsZero_uid461_fpTanXComp_uid157_fpTanTest_q;
    exc_N_uid462_fpTanXComp_uid157_fpTanTest_q <= exc_N_uid462_fpTanXComp_uid157_fpTanTest_a and exc_N_uid462_fpTanXComp_uid157_fpTanTest_b;

	--reg_exc_N_uid462_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_3(REG,773)@35
    reg_exc_N_uid462_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_N_uid462_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_N_uid462_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_3_q <= exc_N_uid462_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--InvFracXIsZero_uid445_fpTanXComp_uid157_fpTanTest(LOGICAL,444)@35
    InvFracXIsZero_uid445_fpTanXComp_uid157_fpTanTest_a <= fracXIsZero_uid443_fpTanXComp_uid157_fpTanTest_q;
    InvFracXIsZero_uid445_fpTanXComp_uid157_fpTanTest_q <= not InvFracXIsZero_uid445_fpTanXComp_uid157_fpTanTest_a;

	--exc_N_uid446_fpTanXComp_uid157_fpTanTest(LOGICAL,445)@35
    exc_N_uid446_fpTanXComp_uid157_fpTanTest_a <= expXIsMax_uid441_fpTanXComp_uid157_fpTanTest_q;
    exc_N_uid446_fpTanXComp_uid157_fpTanTest_b <= InvFracXIsZero_uid445_fpTanXComp_uid157_fpTanTest_q;
    exc_N_uid446_fpTanXComp_uid157_fpTanTest_q <= exc_N_uid446_fpTanXComp_uid157_fpTanTest_a and exc_N_uid446_fpTanXComp_uid157_fpTanTest_b;

	--reg_exc_N_uid446_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_2(REG,772)@35
    reg_exc_N_uid446_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_N_uid446_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_N_uid446_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_2_q <= exc_N_uid446_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expXIsZero_uid455_fpTanXComp_uid157_fpTanTest(LOGICAL,454)@35
    expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_a <= expY_uid431_fpTanXComp_uid157_fpTanTest_b;
    expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_b <= cstAllZWE_uid8_fpTanTest_q;
    expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_q <= "1" when expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_a = expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_b else "0";

	--expXIsZero_uid439_fpTanXComp_uid157_fpTanTest(LOGICAL,438)@35
    expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_a <= expX_uid428_fpTanXComp_uid157_fpTanTest_b;
    expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_b <= cstAllZWE_uid8_fpTanTest_q;
    expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_q <= "1" when expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_a = expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_b else "0";

	--excXZYZ_uid509_fpTanXComp_uid157_fpTanTest(LOGICAL,508)@35
    excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_a <= expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_q;
    excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_b <= expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_q;
    excXZYZ_uid509_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_q <= excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_a and excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_b;
        END IF;
        END IF;
    END PROCESS;



	--excRNaN_uid511_fpTanXComp_uid157_fpTanTest(LOGICAL,510)@36
    excRNaN_uid511_fpTanXComp_uid157_fpTanTest_a <= excXZYZ_uid509_fpTanXComp_uid157_fpTanTest_q;
    excRNaN_uid511_fpTanXComp_uid157_fpTanTest_b <= reg_exc_N_uid446_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_2_q;
    excRNaN_uid511_fpTanXComp_uid157_fpTanTest_c <= reg_exc_N_uid462_fpTanXComp_uid157_fpTanTest_0_to_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_3_q;
    excRNaN_uid511_fpTanXComp_uid157_fpTanTest_d <= excXIYI_uid510_fpTanXComp_uid157_fpTanTest_q;
    excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q <= excRNaN_uid511_fpTanXComp_uid157_fpTanTest_a or excRNaN_uid511_fpTanXComp_uid157_fpTanTest_b or excRNaN_uid511_fpTanXComp_uid157_fpTanTest_c or excRNaN_uid511_fpTanXComp_uid157_fpTanTest_d;

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--InvExcRNaN_uid522_fpTanXComp_uid157_fpTanTest(LOGICAL,521)@36
    InvExcRNaN_uid522_fpTanXComp_uid157_fpTanTest_a <= excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q;
    InvExcRNaN_uid522_fpTanXComp_uid157_fpTanTest_q <= not InvExcRNaN_uid522_fpTanXComp_uid157_fpTanTest_a;

	--signY_uid433_fpTanXComp_uid157_fpTanTest(BITSELECT,432)@35
    signY_uid433_fpTanXComp_uid157_fpTanTest_in <= fpCos_uid155_fpTanTest_q;
    signY_uid433_fpTanXComp_uid157_fpTanTest_b <= signY_uid433_fpTanXComp_uid157_fpTanTest_in(31 downto 31);

	--signX_uid430_fpTanXComp_uid157_fpTanTest(BITSELECT,429)@35
    signX_uid430_fpTanXComp_uid157_fpTanTest_in <= fpSin_uid130_fpTanTest_q;
    signX_uid430_fpTanXComp_uid157_fpTanTest_b <= signX_uid430_fpTanXComp_uid157_fpTanTest_in(31 downto 31);

	--signR_uid467_fpTanXComp_uid157_fpTanTest(LOGICAL,466)@35
    signR_uid467_fpTanXComp_uid157_fpTanTest_a <= signX_uid430_fpTanXComp_uid157_fpTanTest_b;
    signR_uid467_fpTanXComp_uid157_fpTanTest_b <= signY_uid433_fpTanXComp_uid157_fpTanTest_b;
    signR_uid467_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid467_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            signR_uid467_fpTanXComp_uid157_fpTanTest_q <= signR_uid467_fpTanXComp_uid157_fpTanTest_a xor signR_uid467_fpTanXComp_uid157_fpTanTest_b;
        END IF;
        END IF;
    END PROCESS;



	--sRPostExc_uid523_fpTanXComp_uid157_fpTanTest(LOGICAL,522)@36
    sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_a <= signR_uid467_fpTanXComp_uid157_fpTanTest_q;
    sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_b <= InvExcRNaN_uid522_fpTanXComp_uid157_fpTanTest_q;
    sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_q <= sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_a and sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_b;

	--ld_sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_q_to_divR_uid524_fpTanXComp_uid157_fpTanTest_c(DELAY,1277)@36
    ld_sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_q_to_divR_uid524_fpTanXComp_uid157_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_q, xout => ld_sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_q_to_divR_uid524_fpTanXComp_uid157_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor(LOGICAL,1759)
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_b <= ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_sticky_ena_q;
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_q <= not (ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_a or ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_b);

	--ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_sticky_ena(REG,1760)
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_nor_q = "1") THEN
                ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_sticky_ena_q <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd(LOGICAL,1761)
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_a <= ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_sticky_ena_q;
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_b <= en;
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_q <= ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_a and ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_b;

	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor(LOGICAL,1748)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_b <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_q <= not (ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_a or ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_b);

	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_mem_top(CONSTANT,1744)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_mem_top_q <= "01000";

	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp(LOGICAL,1745)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_a <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_mem_top_q;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_q);
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_q <= "1" when ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_a = ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_b else "0";

	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmpReg(REG,1746)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmpReg_q <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_sticky_ena(REG,1749)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_nor_q = "1") THEN
                ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd(LOGICAL,1750)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_a <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_b <= en;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_q <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_a and ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_b;

	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_inputreg(DELAY,1738)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid429_fpTanXComp_uid157_fpTanTest_b, xout => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt(COUNTER,1740)
    -- every=1, low=0, high=8, step=1, init=1
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_i = 7 THEN
                      ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_eq = '1') THEN
                        ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_i <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_i - 8;
                    ELSE
                        ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_i <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_i,4));


	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdreg(REG,1741)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdreg_q <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux(MUX,1742)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_s <= en;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux: PROCESS (ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_s, ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdreg_q, ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_q <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdreg_q;
                  WHEN "1" => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_q <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem(DUALMEM,1739)
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_ia <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_inputreg_q;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_aa <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdreg_q;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_ab <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_rdmux_q;
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_iq,
        address_a => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_aa,
        data_a => ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_ia
    );
    ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_reset0 <= areset;
        ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_q <= ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_iq(22 downto 0);

	--lOAdded_uid477_fpTanXComp_uid157_fpTanTest(BITJOIN,476)@46
    lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q <= VCC_q & ld_fracX_uid429_fpTanXComp_uid157_fpTanTest_b_to_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_a_replace_mem_q;

	--ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_inputreg(DELAY,1751)
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q, xout => ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem(DUALMEM,1752)
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_ia <= ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_inputreg_q;
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_aa <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdreg_q;
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_ab <= ld_p_uid72_fpTanTest_q_to_mulSin_uid91_fpTanTest_a_replace_rdmux_q;
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_iq,
        address_a => ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_aa,
        data_a => ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_ia
    );
    ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_reset0 <= areset;
        ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_q <= ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_iq(23 downto 0);

	--oFracXExt_uid480_fpTanXComp_uid157_fpTanTest(BITJOIN,479)@50
    oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_q <= ld_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q_to_oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_b_replace_mem_q & leftShiftStage1Idx2Pad2_uid220_fxpX_uid48_fpTanTest_q;

	--reg_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_1(REG,764)@46
    reg_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_1_q <= lOAdded_uid477_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--fracYAddr_uid471_fpTanXComp_uid157_fpTanTest(BITSELECT,470)@35
    fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_in <= fpCos_uid155_fpTanTest_q(22 downto 0);
    fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b <= fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_in(22 downto 14);

	--reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC2_uid602_invTab_lutmem_0(REG,754)@35
    reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC2_uid602_invTab_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC2_uid602_invTab_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC2_uid602_invTab_lutmem_0_q <= fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid602_invTab_lutmem(DUALMEM,647)@36
    memoryC2_uid602_invTab_lutmem_ia <= (others => '0');
    memoryC2_uid602_invTab_lutmem_aa <= (others => '0');
    memoryC2_uid602_invTab_lutmem_ab <= reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC2_uid602_invTab_lutmem_0_q;
    memoryC2_uid602_invTab_lutmem_dmem : altsyncram
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
        init_file => "fp_tan_s5_memoryC2_uid602_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid602_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid602_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid602_invTab_lutmem_iq,
        address_a => memoryC2_uid602_invTab_lutmem_aa,
        data_a => memoryC2_uid602_invTab_lutmem_ia
    );
    memoryC2_uid602_invTab_lutmem_reset0 <= areset;
        memoryC2_uid602_invTab_lutmem_q <= memoryC2_uid602_invTab_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid602_invTab_lutmem_0_to_prodXY_uid620_pT1_uid605_invPE_1(REG,756)@38
    reg_memoryC2_uid602_invTab_lutmem_0_to_prodXY_uid620_pT1_uid605_invPE_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid602_invTab_lutmem_0_to_prodXY_uid620_pT1_uid605_invPE_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid602_invTab_lutmem_0_to_prodXY_uid620_pT1_uid605_invPE_1_q <= memoryC2_uid602_invTab_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--yPE_uid472_fpTanXComp_uid157_fpTanTest(BITSELECT,471)@35
    yPE_uid472_fpTanXComp_uid157_fpTanTest_in <= fpCos_uid155_fpTanTest_q(13 downto 0);
    yPE_uid472_fpTanXComp_uid157_fpTanTest_b <= yPE_uid472_fpTanXComp_uid157_fpTanTest_in(13 downto 0);

	--yT1_uid604_invPE(BITSELECT,603)@35
    yT1_uid604_invPE_in <= yPE_uid472_fpTanXComp_uid157_fpTanTest_b;
    yT1_uid604_invPE_b <= yT1_uid604_invPE_in(13 downto 2);

	--reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0(REG,755)@35
    reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q <= yT1_uid604_invPE_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a_inputreg(DELAY,1767)
    ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a_inputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q, xout => ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a(DELAY,1368)@36
    ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a : dspba_delay
    GENERIC MAP ( width => 12, depth => 2 )
    PORT MAP ( xin => ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a_inputreg_q, xout => ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid620_pT1_uid605_invPE(MULT,619)@39
    prodXY_uid620_pT1_uid605_invPE_pr <= signed(resize(UNSIGNED(prodXY_uid620_pT1_uid605_invPE_a),13)) * SIGNED(prodXY_uid620_pT1_uid605_invPE_b);
    prodXY_uid620_pT1_uid605_invPE_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid620_pT1_uid605_invPE_a <= (others => '0');
            prodXY_uid620_pT1_uid605_invPE_b <= (others => '0');
            prodXY_uid620_pT1_uid605_invPE_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid620_pT1_uid605_invPE_a <= ld_reg_yT1_uid604_invPE_0_to_prodXY_uid620_pT1_uid605_invPE_0_q_to_prodXY_uid620_pT1_uid605_invPE_a_q;
                prodXY_uid620_pT1_uid605_invPE_b <= reg_memoryC2_uid602_invTab_lutmem_0_to_prodXY_uid620_pT1_uid605_invPE_1_q;
                prodXY_uid620_pT1_uid605_invPE_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid620_pT1_uid605_invPE_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid620_pT1_uid605_invPE: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid620_pT1_uid605_invPE_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid620_pT1_uid605_invPE_q <= prodXY_uid620_pT1_uid605_invPE_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid621_pT1_uid605_invPE(BITSELECT,620)@42
    prodXYTruncFR_uid621_pT1_uid605_invPE_in <= prodXY_uid620_pT1_uid605_invPE_q;
    prodXYTruncFR_uid621_pT1_uid605_invPE_b <= prodXYTruncFR_uid621_pT1_uid605_invPE_in(23 downto 11);

	--highBBits_uid607_invPE(BITSELECT,606)@42
    highBBits_uid607_invPE_in <= prodXYTruncFR_uid621_pT1_uid605_invPE_b;
    highBBits_uid607_invPE_b <= highBBits_uid607_invPE_in(12 downto 1);

	--ld_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b_to_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_a(DELAY,1511)@35
    ld_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b_to_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 3 )
    PORT MAP ( xin => fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b, xout => ld_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b_to_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0(REG,757)@38
    reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_q <= ld_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_b_to_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid600_invTab_lutmem(DUALMEM,646)@39
    memoryC1_uid600_invTab_lutmem_ia <= (others => '0');
    memoryC1_uid600_invTab_lutmem_aa <= (others => '0');
    memoryC1_uid600_invTab_lutmem_ab <= reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC1_uid600_invTab_lutmem_0_q;
    memoryC1_uid600_invTab_lutmem_dmem : altsyncram
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
        init_file => "fp_tan_s5_memoryC1_uid600_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid600_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid600_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid600_invTab_lutmem_iq,
        address_a => memoryC1_uid600_invTab_lutmem_aa,
        data_a => memoryC1_uid600_invTab_lutmem_ia
    );
    memoryC1_uid600_invTab_lutmem_reset0 <= areset;
        memoryC1_uid600_invTab_lutmem_q <= memoryC1_uid600_invTab_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid600_invTab_lutmem_0_to_sumAHighB_uid608_invPE_0(REG,758)@41
    reg_memoryC1_uid600_invTab_lutmem_0_to_sumAHighB_uid608_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid600_invTab_lutmem_0_to_sumAHighB_uid608_invPE_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid600_invTab_lutmem_0_to_sumAHighB_uid608_invPE_0_q <= memoryC1_uid600_invTab_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid608_invPE(ADD,607)@42
    sumAHighB_uid608_invPE_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid600_invTab_lutmem_0_to_sumAHighB_uid608_invPE_0_q(20)) & reg_memoryC1_uid600_invTab_lutmem_0_to_sumAHighB_uid608_invPE_0_q);
    sumAHighB_uid608_invPE_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid607_invPE_b(11)) & highBBits_uid607_invPE_b);
            sumAHighB_uid608_invPE_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid608_invPE_a) + SIGNED(sumAHighB_uid608_invPE_b));
    sumAHighB_uid608_invPE_q <= sumAHighB_uid608_invPE_o(21 downto 0);


	--lowRangeB_uid606_invPE(BITSELECT,605)@42
    lowRangeB_uid606_invPE_in <= prodXYTruncFR_uid621_pT1_uid605_invPE_b(0 downto 0);
    lowRangeB_uid606_invPE_b <= lowRangeB_uid606_invPE_in(0 downto 0);

	--s1_uid606_uid609_invPE(BITJOIN,608)@42
    s1_uid606_uid609_invPE_q <= sumAHighB_uid608_invPE_q & lowRangeB_uid606_invPE_b;

	--reg_s1_uid606_uid609_invPE_0_to_prodXY_uid623_pT2_uid611_invPE_1(REG,760)@42
    reg_s1_uid606_uid609_invPE_0_to_prodXY_uid623_pT2_uid611_invPE_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid606_uid609_invPE_0_to_prodXY_uid623_pT2_uid611_invPE_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid606_uid609_invPE_0_to_prodXY_uid623_pT2_uid611_invPE_1_q <= s1_uid606_uid609_invPE_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor(LOGICAL,1870)
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_b <= ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_sticky_ena_q;
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_q <= not (ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_a or ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_b);

	--ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_sticky_ena(REG,1871)
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_nor_q = "1") THEN
                ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_sticky_ena_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd(LOGICAL,1872)
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_a <= ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_sticky_ena_q;
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_b <= en;
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_q <= ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_a and ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_b;

	--ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_inputreg(DELAY,1860)
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => yPE_uid472_fpTanXComp_uid157_fpTanTest_b, xout => ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem(DUALMEM,1861)
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_ia <= ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_inputreg_q;
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_aa <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q;
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_ab <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q;
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_iq,
        address_a => ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_aa,
        data_a => ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_ia
    );
    ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_reset0 <= areset;
        ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_q <= ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_iq(13 downto 0);

	--reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0(REG,759)@42
    reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_q <= ld_yPE_uid472_fpTanXComp_uid157_fpTanTest_b_to_reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid623_pT2_uid611_invPE(MULT,622)@43
    prodXY_uid623_pT2_uid611_invPE_pr <= signed(resize(UNSIGNED(prodXY_uid623_pT2_uid611_invPE_a),15)) * SIGNED(prodXY_uid623_pT2_uid611_invPE_b);
    prodXY_uid623_pT2_uid611_invPE_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid623_pT2_uid611_invPE_a <= (others => '0');
            prodXY_uid623_pT2_uid611_invPE_b <= (others => '0');
            prodXY_uid623_pT2_uid611_invPE_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid623_pT2_uid611_invPE_a <= reg_yPE_uid472_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid623_pT2_uid611_invPE_0_q;
                prodXY_uid623_pT2_uid611_invPE_b <= reg_s1_uid606_uid609_invPE_0_to_prodXY_uid623_pT2_uid611_invPE_1_q;
                prodXY_uid623_pT2_uid611_invPE_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid623_pT2_uid611_invPE_pr,37));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid623_pT2_uid611_invPE: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid623_pT2_uid611_invPE_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid623_pT2_uid611_invPE_q <= prodXY_uid623_pT2_uid611_invPE_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid624_pT2_uid611_invPE(BITSELECT,623)@46
    prodXYTruncFR_uid624_pT2_uid611_invPE_in <= prodXY_uid623_pT2_uid611_invPE_q;
    prodXYTruncFR_uid624_pT2_uid611_invPE_b <= prodXYTruncFR_uid624_pT2_uid611_invPE_in(36 downto 13);

	--highBBits_uid613_invPE(BITSELECT,612)@46
    highBBits_uid613_invPE_in <= prodXYTruncFR_uid624_pT2_uid611_invPE_b;
    highBBits_uid613_invPE_b <= highBBits_uid613_invPE_in(23 downto 2);

	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor(LOGICAL,1778)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_b <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_sticky_ena_q;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_q <= not (ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_a or ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_b);

	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_sticky_ena(REG,1779)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_nor_q = "1") THEN
                ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_sticky_ena_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd(LOGICAL,1780)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_a <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_sticky_ena_q;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_b <= en;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_a and ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_b;

	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_inputreg(DELAY,1768)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC2_uid602_invTab_lutmem_0_q, xout => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem(DUALMEM,1769)
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_ia <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_inputreg_q;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_aa <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdreg_q;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_ab <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_rdmux_q;
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_iq,
        address_a => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_aa,
        data_a => ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_ia
    );
    ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_q <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_iq(8 downto 0);

	--memoryC0_uid598_invTab_lutmem(DUALMEM,645)@43
    memoryC0_uid598_invTab_lutmem_ia <= (others => '0');
    memoryC0_uid598_invTab_lutmem_aa <= (others => '0');
    memoryC0_uid598_invTab_lutmem_ab <= ld_reg_fracYAddr_uid471_fpTanXComp_uid157_fpTanTest_0_to_memoryC0_uid598_invTab_lutmem_0_q_to_memoryC0_uid598_invTab_lutmem_a_replace_mem_q;
    memoryC0_uid598_invTab_lutmem_dmem : altsyncram
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
        init_file => "fp_tan_s5_memoryC0_uid598_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid598_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid598_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid598_invTab_lutmem_iq,
        address_a => memoryC0_uid598_invTab_lutmem_aa,
        data_a => memoryC0_uid598_invTab_lutmem_ia
    );
    memoryC0_uid598_invTab_lutmem_reset0 <= areset;
        memoryC0_uid598_invTab_lutmem_q <= memoryC0_uid598_invTab_lutmem_iq(30 downto 0);

	--reg_memoryC0_uid598_invTab_lutmem_0_to_sumAHighB_uid614_invPE_0(REG,762)@45
    reg_memoryC0_uid598_invTab_lutmem_0_to_sumAHighB_uid614_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid598_invTab_lutmem_0_to_sumAHighB_uid614_invPE_0_q <= "0000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid598_invTab_lutmem_0_to_sumAHighB_uid614_invPE_0_q <= memoryC0_uid598_invTab_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid614_invPE(ADD,613)@46
    sumAHighB_uid614_invPE_a <= STD_LOGIC_VECTOR((31 downto 31 => reg_memoryC0_uid598_invTab_lutmem_0_to_sumAHighB_uid614_invPE_0_q(30)) & reg_memoryC0_uid598_invTab_lutmem_0_to_sumAHighB_uid614_invPE_0_q);
    sumAHighB_uid614_invPE_b <= STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid613_invPE_b(21)) & highBBits_uid613_invPE_b);
            sumAHighB_uid614_invPE_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid614_invPE_a) + SIGNED(sumAHighB_uid614_invPE_b));
    sumAHighB_uid614_invPE_q <= sumAHighB_uid614_invPE_o(31 downto 0);


	--lowRangeB_uid612_invPE(BITSELECT,611)@46
    lowRangeB_uid612_invPE_in <= prodXYTruncFR_uid624_pT2_uid611_invPE_b(1 downto 0);
    lowRangeB_uid612_invPE_b <= lowRangeB_uid612_invPE_in(1 downto 0);

	--s2_uid612_uid615_invPE(BITJOIN,614)@46
    s2_uid612_uid615_invPE_q <= sumAHighB_uid614_invPE_q & lowRangeB_uid612_invPE_b;

	--invY_uid474_fpTanXComp_uid157_fpTanTest(BITSELECT,473)@46
    invY_uid474_fpTanXComp_uid157_fpTanTest_in <= s2_uid612_uid615_invPE_q(30 downto 0);
    invY_uid474_fpTanXComp_uid157_fpTanTest_b <= invY_uid474_fpTanXComp_uid157_fpTanTest_in(30 downto 5);

	--reg_invY_uid474_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_0(REG,763)@46
    reg_invY_uid474_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_invY_uid474_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_0_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_invY_uid474_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_0_q <= invY_uid474_fpTanXComp_uid157_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest(MULT,616)@47
    prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_pr <= UNSIGNED(prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_a) * UNSIGNED(prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_b);
    prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_a <= (others => '0');
            prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_b <= (others => '0');
            prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_a <= reg_invY_uid474_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_0_q;
                prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_b <= reg_lOAdded_uid477_fpTanXComp_uid157_fpTanTest_0_to_prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_1_q;
                prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_s1 <= STD_LOGIC_VECTOR(prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_q <= prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid618_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest(BITSELECT,617)@50
    prodXYTruncFR_uid618_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_in <= prodXY_uid617_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_q;
    prodXYTruncFR_uid618_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_b <= prodXYTruncFR_uid618_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_in(49 downto 24);

	--invYO_uid475_fpTanXComp_uid157_fpTanTest(BITSELECT,474)@46
    invYO_uid475_fpTanXComp_uid157_fpTanTest_in <= s2_uid612_uid615_invPE_q(31 downto 0);
    invYO_uid475_fpTanXComp_uid157_fpTanTest_b <= invYO_uid475_fpTanXComp_uid157_fpTanTest_in(31 downto 31);

	--fracYZero_uid434_fpTanXComp_uid157_fpTanTest(LOGICAL,433)@35
    fracYZero_uid434_fpTanXComp_uid157_fpTanTest_a <= fracY_uid432_fpTanXComp_uid157_fpTanTest_b;
    fracYZero_uid434_fpTanXComp_uid157_fpTanTest_b <= STD_LOGIC_VECTOR("0000000000000000000000" & GND_q);
    fracYZero_uid434_fpTanXComp_uid157_fpTanTest_q <= "1" when fracYZero_uid434_fpTanXComp_uid157_fpTanTest_a = fracYZero_uid434_fpTanXComp_uid157_fpTanTest_b else "0";

	--ld_fracYZero_uid434_fpTanXComp_uid157_fpTanTest_q_to_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_a(DELAY,1208)@35
    ld_fracYZero_uid434_fpTanXComp_uid157_fpTanTest_q_to_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => fracYZero_uid434_fpTanXComp_uid157_fpTanTest_q, xout => ld_fracYZero_uid434_fpTanXComp_uid157_fpTanTest_q_to_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest(LOGICAL,475)@46
    fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_a <= ld_fracYZero_uid434_fpTanXComp_uid157_fpTanTest_q_to_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_a_q;
    fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_b <= invYO_uid475_fpTanXComp_uid157_fpTanTest_b;
    fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q <= fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_a or fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_b;
        END IF;
        END IF;
    END PROCESS;



	--ld_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q_to_divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_b(DELAY,1212)@47
    ld_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q_to_divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q, xout => ld_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q_to_divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest(MUX,481)@50
    divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_s <= ld_fracYPostZ_uid476_fpTanXComp_uid157_fpTanTest_q_to_divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_b_q;
    divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest: PROCESS (divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_s, en, prodXYTruncFR_uid618_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_b, oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_q)
    BEGIN
            CASE divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_s IS
                  WHEN "0" => divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_q <= prodXYTruncFR_uid618_prodDivPreNormProd_uid478_fpTanXComp_uid157_fpTanTest_b;
                  WHEN "1" => divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_q <= oFracXExt_uid480_fpTanXComp_uid157_fpTanTest_q;
                  WHEN OTHERS => divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--norm_uid483_fpTanXComp_uid157_fpTanTest(BITSELECT,482)@50
    norm_uid483_fpTanXComp_uid157_fpTanTest_in <= divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_q;
    norm_uid483_fpTanXComp_uid157_fpTanTest_b <= norm_uid483_fpTanXComp_uid157_fpTanTest_in(25 downto 25);

	--ld_norm_uid483_fpTanXComp_uid157_fpTanTest_b_to_rndOp_uid489_fpTanXComp_uid157_fpTanTest_c(DELAY,1223)@50
    ld_norm_uid483_fpTanXComp_uid157_fpTanTest_b_to_rndOp_uid489_fpTanXComp_uid157_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => norm_uid483_fpTanXComp_uid157_fpTanTest_b, xout => ld_norm_uid483_fpTanXComp_uid157_fpTanTest_b_to_rndOp_uid489_fpTanXComp_uid157_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--rndOp_uid489_fpTanXComp_uid157_fpTanTest(BITJOIN,488)@51
    rndOp_uid489_fpTanXComp_uid157_fpTanTest_q <= ld_norm_uid483_fpTanXComp_uid157_fpTanTest_b_to_rndOp_uid489_fpTanXComp_uid157_fpTanTest_c_q & cstAllZWF_uid7_fpTanTest_q & VCC_q;

	--ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor(LOGICAL,1735)
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_a <= ld_expXRR_uid39_fpTanTest_b_to_expPSin_uid75_fpTanTest_d_notEnable_q;
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_b <= ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q;
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_q <= not (ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_a or ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_b);

	--ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_sticky_ena(REG,1736)
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_nor_q = "1") THEN
                ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd(LOGICAL,1737)
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_a <= ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_sticky_ena_q;
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_b <= en;
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_q <= ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_a and ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_b;

	--expXmY_uid468_fpTanXComp_uid157_fpTanTest(SUB,467)@35
    expXmY_uid468_fpTanXComp_uid157_fpTanTest_a <= STD_LOGIC_VECTOR("0" & expX_uid428_fpTanXComp_uid157_fpTanTest_b);
    expXmY_uid468_fpTanXComp_uid157_fpTanTest_b <= STD_LOGIC_VECTOR("0" & expY_uid431_fpTanXComp_uid157_fpTanTest_b);
    expXmY_uid468_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid468_fpTanXComp_uid157_fpTanTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expXmY_uid468_fpTanXComp_uid157_fpTanTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid468_fpTanXComp_uid157_fpTanTest_a) - UNSIGNED(expXmY_uid468_fpTanXComp_uid157_fpTanTest_b));
            END IF;
        END IF;
    END PROCESS;
    expXmY_uid468_fpTanXComp_uid157_fpTanTest_q <= expXmY_uid468_fpTanXComp_uid157_fpTanTest_o(8 downto 0);


	--ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_inputreg(DELAY,1725)
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expXmY_uid468_fpTanXComp_uid157_fpTanTest_q, xout => ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem(DUALMEM,1726)
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_ia <= ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_inputreg_q;
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_aa <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdreg_q;
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_ab <= ld_expX_uid179_rrx_uid34_fpTanTest_b_to_finalExp_uid202_rrx_uid34_fpTanTest_d_replace_rdmux_q;
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_iq,
        address_a => ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_aa,
        data_a => ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_ia
    );
    ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_reset0 <= areset;
        ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_q <= ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_iq(8 downto 0);

	--expR_uid469_fpTanXComp_uid157_fpTanTest(ADD,468)@49
    expR_uid469_fpTanXComp_uid157_fpTanTest_a <= STD_LOGIC_VECTOR((10 downto 9 => ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_q(8)) & ld_expXmY_uid468_fpTanXComp_uid157_fpTanTest_q_to_expR_uid469_fpTanXComp_uid157_fpTanTest_a_replace_mem_q);
    expR_uid469_fpTanXComp_uid157_fpTanTest_b <= STD_LOGIC_VECTOR('0' & "00" & cstBiasM1_uid23_fpTanTest_q);
    expR_uid469_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expR_uid469_fpTanXComp_uid157_fpTanTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expR_uid469_fpTanXComp_uid157_fpTanTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid469_fpTanXComp_uid157_fpTanTest_a) + SIGNED(expR_uid469_fpTanXComp_uid157_fpTanTest_b));
            END IF;
        END IF;
    END PROCESS;
    expR_uid469_fpTanXComp_uid157_fpTanTest_q <= expR_uid469_fpTanXComp_uid157_fpTanTest_o(9 downto 0);


	--divValPreNormHigh_uid484_fpTanXComp_uid157_fpTanTest(BITSELECT,483)@50
    divValPreNormHigh_uid484_fpTanXComp_uid157_fpTanTest_in <= divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_q(24 downto 0);
    divValPreNormHigh_uid484_fpTanXComp_uid157_fpTanTest_b <= divValPreNormHigh_uid484_fpTanXComp_uid157_fpTanTest_in(24 downto 1);

	--divValPreNormLow_uid485_fpTanXComp_uid157_fpTanTest(BITSELECT,484)@50
    divValPreNormLow_uid485_fpTanXComp_uid157_fpTanTest_in <= divValPreNormTrunc_uid482_fpTanXComp_uid157_fpTanTest_q(23 downto 0);
    divValPreNormLow_uid485_fpTanXComp_uid157_fpTanTest_b <= divValPreNormLow_uid485_fpTanXComp_uid157_fpTanTest_in(23 downto 0);

	--normFracRnd_uid486_fpTanXComp_uid157_fpTanTest(MUX,485)@50
    normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_s <= norm_uid483_fpTanXComp_uid157_fpTanTest_b;
    normFracRnd_uid486_fpTanXComp_uid157_fpTanTest: PROCESS (normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_s, en, divValPreNormLow_uid485_fpTanXComp_uid157_fpTanTest_b, divValPreNormHigh_uid484_fpTanXComp_uid157_fpTanTest_b)
    BEGIN
            CASE normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_s IS
                  WHEN "0" => normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_q <= divValPreNormLow_uid485_fpTanXComp_uid157_fpTanTest_b;
                  WHEN "1" => normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_q <= divValPreNormHigh_uid484_fpTanXComp_uid157_fpTanTest_b;
                  WHEN OTHERS => normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRnd_uid487_fpTanXComp_uid157_fpTanTest(BITJOIN,486)@50
    expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_q <= expR_uid469_fpTanXComp_uid157_fpTanTest_q & normFracRnd_uid486_fpTanXComp_uid157_fpTanTest_q;

	--reg_expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_0_to_expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_0(REG,765)@50
    reg_expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_0_to_expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_0_to_expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_0_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_0_to_expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_0_q <= expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest(ADD,489)@51
    expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_a <= STD_LOGIC_VECTOR((35 downto 34 => reg_expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_0_to_expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_0_q(33)) & reg_expFracRnd_uid487_fpTanXComp_uid157_fpTanTest_0_to_expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_0_q);
    expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & rndOp_uid489_fpTanXComp_uid157_fpTanTest_q);
            expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_a) + SIGNED(expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_b));
    expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_q <= expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_o(34 downto 0);


	--excRPreExc_uid493_fpTanXComp_uid157_fpTanTest(BITSELECT,492)@51
    excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_in <= expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_q(31 downto 0);
    excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b <= excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_in(31 downto 24);

	--ld_excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b_to_expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_d(DELAY,1271)@51
    ld_excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b_to_expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b, xout => ld_excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b_to_expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q_to_concExc_uid512_fpTanXComp_uid157_fpTanTest_c(DELAY,1266)@36
    ld_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q_to_concExc_uid512_fpTanXComp_uid157_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q, xout => ld_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q_to_concExc_uid512_fpTanXComp_uid157_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid463_fpTanXComp_uid157_fpTanTest(LOGICAL,462)@35
    InvExc_N_uid463_fpTanXComp_uid157_fpTanTest_a <= exc_N_uid462_fpTanXComp_uid157_fpTanTest_q;
    InvExc_N_uid463_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExc_N_uid463_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExc_N_uid463_fpTanXComp_uid157_fpTanTest_q <= not InvExc_N_uid463_fpTanXComp_uid157_fpTanTest_a;
        END IF;
    END PROCESS;



	--InvExc_I_uid464_fpTanXComp_uid157_fpTanTest(LOGICAL,463)@35
    InvExc_I_uid464_fpTanXComp_uid157_fpTanTest_a <= exc_I_uid460_fpTanXComp_uid157_fpTanTest_q;
    InvExc_I_uid464_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExc_I_uid464_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExc_I_uid464_fpTanXComp_uid157_fpTanTest_q <= not InvExc_I_uid464_fpTanXComp_uid157_fpTanTest_a;
        END IF;
    END PROCESS;



	--InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest(LOGICAL,464)@35
    InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest_a <= expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_q;
    InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest_q <= not InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid466_fpTanXComp_uid157_fpTanTest(LOGICAL,465)@36
    exc_R_uid466_fpTanXComp_uid157_fpTanTest_a <= InvExpXIsZero_uid465_fpTanXComp_uid157_fpTanTest_q;
    exc_R_uid466_fpTanXComp_uid157_fpTanTest_b <= InvExc_I_uid464_fpTanXComp_uid157_fpTanTest_q;
    exc_R_uid466_fpTanXComp_uid157_fpTanTest_c <= InvExc_N_uid463_fpTanXComp_uid157_fpTanTest_q;
    exc_R_uid466_fpTanXComp_uid157_fpTanTest_q <= exc_R_uid466_fpTanXComp_uid157_fpTanTest_a and exc_R_uid466_fpTanXComp_uid157_fpTanTest_b and exc_R_uid466_fpTanXComp_uid157_fpTanTest_c;

	--reg_exc_I_uid444_fpTanXComp_uid157_fpTanTest_0_to_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_1(REG,771)@35
    reg_exc_I_uid444_fpTanXComp_uid157_fpTanTest_0_to_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_I_uid444_fpTanXComp_uid157_fpTanTest_0_to_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_I_uid444_fpTanXComp_uid157_fpTanTest_0_to_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_1_q <= exc_I_uid444_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excXIYR_uid507_fpTanXComp_uid157_fpTanTest(LOGICAL,506)@36
    excXIYR_uid507_fpTanXComp_uid157_fpTanTest_a <= reg_exc_I_uid444_fpTanXComp_uid157_fpTanTest_0_to_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_1_q;
    excXIYR_uid507_fpTanXComp_uid157_fpTanTest_b <= exc_R_uid466_fpTanXComp_uid157_fpTanTest_q;
    excXIYR_uid507_fpTanXComp_uid157_fpTanTest_q <= excXIYR_uid507_fpTanXComp_uid157_fpTanTest_a and excXIYR_uid507_fpTanXComp_uid157_fpTanTest_b;

	--ld_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_d(DELAY,1255)@36
    ld_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => excXIYR_uid507_fpTanXComp_uid157_fpTanTest_q, xout => ld_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--excXIYZ_uid506_fpTanXComp_uid157_fpTanTest(LOGICAL,505)@35
    excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_a <= exc_I_uid444_fpTanXComp_uid157_fpTanTest_q;
    excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_b <= expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_q;
    excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_q <= excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_a and excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_b;

	--ld_excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_c(DELAY,1254)@35
    ld_excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 17 )
    PORT MAP ( xin => excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_q, xout => ld_excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--expRExt_uid494_fpTanXComp_uid157_fpTanTest(BITSELECT,493)@51
    expRExt_uid494_fpTanXComp_uid157_fpTanTest_in <= expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_q;
    expRExt_uid494_fpTanXComp_uid157_fpTanTest_b <= expRExt_uid494_fpTanXComp_uid157_fpTanTest_in(34 downto 24);

	--reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1(REG,766)@51
    reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1_q <= expRExt_uid494_fpTanXComp_uid157_fpTanTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid498_fpTanXComp_uid157_fpTanTest(COMPARE,497)@52
    expOvf_uid498_fpTanXComp_uid157_fpTanTest_cin <= GND_q;
    expOvf_uid498_fpTanXComp_uid157_fpTanTest_a <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1_q(10)) & reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1_q) & '0';
    expOvf_uid498_fpTanXComp_uid157_fpTanTest_b <= STD_LOGIC_VECTOR('0' & "0000" & cstAllOWE_uid6_fpTanTest_q) & expOvf_uid498_fpTanXComp_uid157_fpTanTest_cin(0);
            expOvf_uid498_fpTanXComp_uid157_fpTanTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid498_fpTanXComp_uid157_fpTanTest_a) - SIGNED(expOvf_uid498_fpTanXComp_uid157_fpTanTest_b));
    expOvf_uid498_fpTanXComp_uid157_fpTanTest_n(0) <= not expOvf_uid498_fpTanXComp_uid157_fpTanTest_o(13);


	--ld_exc_R_uid466_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c(DELAY,1235)@36
    ld_exc_R_uid466_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => exc_R_uid466_fpTanXComp_uid157_fpTanTest_q, xout => ld_exc_R_uid466_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid447_fpTanXComp_uid157_fpTanTest(LOGICAL,446)@35
    InvExc_N_uid447_fpTanXComp_uid157_fpTanTest_a <= exc_N_uid446_fpTanXComp_uid157_fpTanTest_q;
    InvExc_N_uid447_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExc_N_uid447_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExc_N_uid447_fpTanXComp_uid157_fpTanTest_q <= not InvExc_N_uid447_fpTanXComp_uid157_fpTanTest_a;
        END IF;
    END PROCESS;



	--InvExc_I_uid448_fpTanXComp_uid157_fpTanTest(LOGICAL,447)@35
    InvExc_I_uid448_fpTanXComp_uid157_fpTanTest_a <= exc_I_uid444_fpTanXComp_uid157_fpTanTest_q;
    InvExc_I_uid448_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExc_I_uid448_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExc_I_uid448_fpTanXComp_uid157_fpTanTest_q <= not InvExc_I_uid448_fpTanXComp_uid157_fpTanTest_a;
        END IF;
    END PROCESS;



	--InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest(LOGICAL,448)@35
    InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest_a <= expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_q;
    InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest_q <= not InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest_a;
        END IF;
    END PROCESS;



	--exc_R_uid450_fpTanXComp_uid157_fpTanTest(LOGICAL,449)@36
    exc_R_uid450_fpTanXComp_uid157_fpTanTest_a <= InvExpXIsZero_uid449_fpTanXComp_uid157_fpTanTest_q;
    exc_R_uid450_fpTanXComp_uid157_fpTanTest_b <= InvExc_I_uid448_fpTanXComp_uid157_fpTanTest_q;
    exc_R_uid450_fpTanXComp_uid157_fpTanTest_c <= InvExc_N_uid447_fpTanXComp_uid157_fpTanTest_q;
    exc_R_uid450_fpTanXComp_uid157_fpTanTest_q <= exc_R_uid450_fpTanXComp_uid157_fpTanTest_a and exc_R_uid450_fpTanXComp_uid157_fpTanTest_b and exc_R_uid450_fpTanXComp_uid157_fpTanTest_c;

	--ld_exc_R_uid450_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b(DELAY,1234)@36
    ld_exc_R_uid450_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => exc_R_uid450_fpTanXComp_uid157_fpTanTest_q, xout => ld_exc_R_uid450_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest(LOGICAL,504)@52
    excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_a <= ld_exc_R_uid450_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b_q;
    excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_b <= ld_exc_R_uid466_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c_q;
    excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_c <= expOvf_uid498_fpTanXComp_uid157_fpTanTest_n;
    excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_q <= excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_a and excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_b and excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_c;

	--reg_expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_0_to_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_2(REG,769)@35
    reg_expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_0_to_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_0_to_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_0_to_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_2_q <= expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excXRYZ_uid504_fpTanXComp_uid157_fpTanTest(LOGICAL,503)@36
    excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_a <= exc_R_uid450_fpTanXComp_uid157_fpTanTest_q;
    excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_b <= reg_expXIsZero_uid455_fpTanXComp_uid157_fpTanTest_0_to_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_2_q;
    excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_q <= excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_a and excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_b;

	--ld_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_a(DELAY,1252)@36
    ld_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_q, xout => ld_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid508_fpTanXComp_uid157_fpTanTest(LOGICAL,507)@52
    excRInf_uid508_fpTanXComp_uid157_fpTanTest_a <= ld_excXRYZ_uid504_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_a_q;
    excRInf_uid508_fpTanXComp_uid157_fpTanTest_b <= excXRYROvf_uid505_fpTanXComp_uid157_fpTanTest_q;
    excRInf_uid508_fpTanXComp_uid157_fpTanTest_c <= ld_excXIYZ_uid506_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_c_q;
    excRInf_uid508_fpTanXComp_uid157_fpTanTest_d <= ld_excXIYR_uid507_fpTanXComp_uid157_fpTanTest_q_to_excRInf_uid508_fpTanXComp_uid157_fpTanTest_d_q;
    excRInf_uid508_fpTanXComp_uid157_fpTanTest_q <= excRInf_uid508_fpTanXComp_uid157_fpTanTest_a or excRInf_uid508_fpTanXComp_uid157_fpTanTest_b or excRInf_uid508_fpTanXComp_uid157_fpTanTest_c or excRInf_uid508_fpTanXComp_uid157_fpTanTest_d;

	--reg_exc_I_uid460_fpTanXComp_uid157_fpTanTest_0_to_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_2(REG,768)@35
    reg_exc_I_uid460_fpTanXComp_uid157_fpTanTest_0_to_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_I_uid460_fpTanXComp_uid157_fpTanTest_0_to_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_I_uid460_fpTanXComp_uid157_fpTanTest_0_to_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_2_q <= exc_I_uid460_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_0_to_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_1(REG,753)@35
    reg_expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_0_to_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_0_to_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_0_to_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_1_q <= expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest(LOGICAL,500)@36
    xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_a <= exc_R_uid450_fpTanXComp_uid157_fpTanTest_q;
    xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_b <= reg_expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_0_to_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_1_q;
    xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_q <= xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_a or xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_b;

	--regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest(LOGICAL,501)@36
    regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_a <= xRegOrZero_uid501_fpTanXComp_uid157_fpTanTest_q;
    regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_b <= reg_exc_I_uid460_fpTanXComp_uid157_fpTanTest_0_to_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_2_q;
    regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_q <= regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_a and regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_b;

	--ld_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_c(DELAY,1242)@36
    ld_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_q, xout => ld_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--expUdf_uid495_fpTanXComp_uid157_fpTanTest(COMPARE,494)@52
    expUdf_uid495_fpTanXComp_uid157_fpTanTest_cin <= GND_q;
    expUdf_uid495_fpTanXComp_uid157_fpTanTest_a <= STD_LOGIC_VECTOR('0' & "00000000000" & GND_q) & '0';
    expUdf_uid495_fpTanXComp_uid157_fpTanTest_b <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1_q(10)) & reg_expRExt_uid494_fpTanXComp_uid157_fpTanTest_0_to_expUdf_uid495_fpTanXComp_uid157_fpTanTest_1_q) & expUdf_uid495_fpTanXComp_uid157_fpTanTest_cin(0);
            expUdf_uid495_fpTanXComp_uid157_fpTanTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid495_fpTanXComp_uid157_fpTanTest_a) - SIGNED(expUdf_uid495_fpTanXComp_uid157_fpTanTest_b));
    expUdf_uid495_fpTanXComp_uid157_fpTanTest_n(0) <= not expUdf_uid495_fpTanXComp_uid157_fpTanTest_o(13);


	--regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest(LOGICAL,499)@52
    regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_a <= expUdf_uid495_fpTanXComp_uid157_fpTanTest_n;
    regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b <= ld_exc_R_uid450_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b_q;
    regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c <= ld_exc_R_uid466_fpTanXComp_uid157_fpTanTest_q_to_regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c_q;
    regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_q <= regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_a and regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_b and regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_c;

	--zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest(LOGICAL,498)@36
    zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_a <= reg_expXIsZero_uid439_fpTanXComp_uid157_fpTanTest_0_to_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_1_q;
    zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_b <= exc_R_uid466_fpTanXComp_uid157_fpTanTest_q;
    zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_q <= zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_a and zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_b;

	--ld_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_a(DELAY,1240)@36
    ld_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_q, xout => ld_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRZero_uid503_fpTanXComp_uid157_fpTanTest(LOGICAL,502)@52
    excRZero_uid503_fpTanXComp_uid157_fpTanTest_a <= ld_zeroOverReg_uid499_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_a_q;
    excRZero_uid503_fpTanXComp_uid157_fpTanTest_b <= regOverRegWithUf_uid500_fpTanXComp_uid157_fpTanTest_q;
    excRZero_uid503_fpTanXComp_uid157_fpTanTest_c <= ld_regOrZeroOverInf_uid502_fpTanXComp_uid157_fpTanTest_q_to_excRZero_uid503_fpTanXComp_uid157_fpTanTest_c_q;
    excRZero_uid503_fpTanXComp_uid157_fpTanTest_q <= excRZero_uid503_fpTanXComp_uid157_fpTanTest_a or excRZero_uid503_fpTanXComp_uid157_fpTanTest_b or excRZero_uid503_fpTanXComp_uid157_fpTanTest_c;

	--concExc_uid512_fpTanXComp_uid157_fpTanTest(BITJOIN,511)@52
    concExc_uid512_fpTanXComp_uid157_fpTanTest_q <= ld_excRNaN_uid511_fpTanXComp_uid157_fpTanTest_q_to_concExc_uid512_fpTanXComp_uid157_fpTanTest_c_q & excRInf_uid508_fpTanXComp_uid157_fpTanTest_q & excRZero_uid503_fpTanXComp_uid157_fpTanTest_q;

	--reg_concExc_uid512_fpTanXComp_uid157_fpTanTest_0_to_excREnc_uid513_fpTanXComp_uid157_fpTanTest_0(REG,774)@52
    reg_concExc_uid512_fpTanXComp_uid157_fpTanTest_0_to_excREnc_uid513_fpTanXComp_uid157_fpTanTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid512_fpTanXComp_uid157_fpTanTest_0_to_excREnc_uid513_fpTanXComp_uid157_fpTanTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid512_fpTanXComp_uid157_fpTanTest_0_to_excREnc_uid513_fpTanXComp_uid157_fpTanTest_0_q <= concExc_uid512_fpTanXComp_uid157_fpTanTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid513_fpTanXComp_uid157_fpTanTest(LOOKUP,512)@53
    excREnc_uid513_fpTanXComp_uid157_fpTanTest: PROCESS (reg_concExc_uid512_fpTanXComp_uid157_fpTanTest_0_to_excREnc_uid513_fpTanXComp_uid157_fpTanTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid512_fpTanXComp_uid157_fpTanTest_0_to_excREnc_uid513_fpTanXComp_uid157_fpTanTest_0_q) IS
                WHEN "000" =>  excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= "01";
                WHEN "001" =>  excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= "00";
                WHEN "010" =>  excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= "10";
                WHEN "011" =>  excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= "00";
                WHEN "100" =>  excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= "11";
                WHEN "101" =>  excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= "00";
                WHEN "110" =>  excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= "00";
                WHEN "111" =>  excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid513_fpTanXComp_uid157_fpTanTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid521_fpTanXComp_uid157_fpTanTest(MUX,520)@53
    expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_s <= excREnc_uid513_fpTanXComp_uid157_fpTanTest_q;
    expRPostExc_uid521_fpTanXComp_uid157_fpTanTest: PROCESS (expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_s, en, cstAllZWE_uid8_fpTanTest_q, ld_excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b_to_expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_d_q, cstAllOWE_uid6_fpTanTest_q, cstAllOWE_uid6_fpTanTest_q)
    BEGIN
            CASE expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_s IS
                  WHEN "00" => expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_q <= cstAllZWE_uid8_fpTanTest_q;
                  WHEN "01" => expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_q <= ld_excRPreExc_uid493_fpTanXComp_uid157_fpTanTest_b_to_expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_d_q;
                  WHEN "10" => expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_q <= cstAllOWE_uid6_fpTanTest_q;
                  WHEN "11" => expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_q <= cstAllOWE_uid6_fpTanTest_q;
                  WHEN OTHERS => expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest(BITSELECT,491)@51
    fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_in <= expFracPostRnd_uid490_fpTanXComp_uid157_fpTanTest_q(23 downto 0);
    fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b <= fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_in(23 downto 1);

	--ld_fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b_to_fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_d(DELAY,1269)@51
    ld_fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b_to_fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b, xout => ld_fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b_to_fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest(MUX,516)@53
    fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_s <= excREnc_uid513_fpTanXComp_uid157_fpTanTest_q;
    fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest: PROCESS (fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_s, en, cstAllZWF_uid7_fpTanTest_q, ld_fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b_to_fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_d_q, cstAllZWF_uid7_fpTanTest_q, cstNaNwF_uid32_fpTanTest_q)
    BEGIN
            CASE fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_s IS
                  WHEN "00" => fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_q <= cstAllZWF_uid7_fpTanTest_q;
                  WHEN "01" => fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_q <= ld_fracRPreExc_uid492_fpTanXComp_uid157_fpTanTest_b_to_fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_d_q;
                  WHEN "10" => fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_q <= cstAllZWF_uid7_fpTanTest_q;
                  WHEN "11" => fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_q <= cstNaNwF_uid32_fpTanTest_q;
                  WHEN OTHERS => fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--divR_uid524_fpTanXComp_uid157_fpTanTest(BITJOIN,523)@53
    divR_uid524_fpTanXComp_uid157_fpTanTest_q <= ld_sRPostExc_uid523_fpTanXComp_uid157_fpTanTest_q_to_divR_uid524_fpTanXComp_uid157_fpTanTest_c_q & expRPostExc_uid521_fpTanXComp_uid157_fpTanTest_q & fracRPostExc_uid517_fpTanXComp_uid157_fpTanTest_q;

	--xOut(GPOUT,4)@53
    q <= divR_uid524_fpTanXComp_uid157_fpTanTest_q;


end normal;
