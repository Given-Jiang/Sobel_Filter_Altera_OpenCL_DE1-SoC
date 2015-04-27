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

-- VHDL created from fp_sincos_s5
-- VHDL created on Wed Mar 27 09:55:14 2013


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

entity fp_sincos_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        s : out std_logic_vector(31 downto 0);
        c : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_sincos_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid6_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid7_fpSinCosXTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid8_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal cstBias_uid22_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid23_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShift_uid24_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShiftM2_uid25_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwShiftM2_uid26_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal cstZwShiftP1_uid27_fpSinCosXTest_q : std_logic_vector (13 downto 0);
    signal cstNaNwF_uid32_fpSinCosXTest_q : std_logic_vector (22 downto 0);
    signal cstZmwFRRPwSM1_uid52_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal cPi_uid71_fpSinCosXTest_q : std_logic_vector (25 downto 0);
    signal p_uid73_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal p_uid73_fpSinCosXTest_q : std_logic_vector (25 downto 0);
    signal expPSin_uid76_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal expPSin_uid76_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal multSinOp2_uid91_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal multSinOp2_uid91_fpSinCosXTest_q : std_logic_vector (25 downto 0);
    signal mulSin_uid92_fpSinCosXTest_a : std_logic_vector (25 downto 0);
    signal mulSin_uid92_fpSinCosXTest_b : std_logic_vector (25 downto 0);
    signal mulSin_uid92_fpSinCosXTest_s1 : std_logic_vector (51 downto 0);
    signal mulSin_uid92_fpSinCosXTest_pr : UNSIGNED (51 downto 0);
    signal mulSin_uid92_fpSinCosXTest_q : std_logic_vector (51 downto 0);
    signal mulCos_uid105_fpSinCosXTest_a : std_logic_vector (25 downto 0);
    signal mulCos_uid105_fpSinCosXTest_b : std_logic_vector (25 downto 0);
    signal mulCos_uid105_fpSinCosXTest_s1 : std_logic_vector (51 downto 0);
    signal mulCos_uid105_fpSinCosXTest_pr : UNSIGNED (51 downto 0);
    signal mulCos_uid105_fpSinCosXTest_q : std_logic_vector (51 downto 0);
    signal excSelSin_uid119_fpSinCosXTest_q : std_logic_vector(1 downto 0);
    signal signRSinFull_uid133_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal signRSinFull_uid133_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal signRSinFull_uid133_fpSinCosXTest_c : std_logic_vector(0 downto 0);
    signal signRSinFull_uid133_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal signRSinFull_uid133_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal expSelectorCos_uid145_fpSinCosXTest_q : std_logic_vector(1 downto 0);
    signal signRCond2_uid152_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal signRCond2_uid152_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal signRCond2_uid152_fpSinCosXTest_c : std_logic_vector(0 downto 0);
    signal signRCond2_uid152_fpSinCosXTest_d : std_logic_vector(0 downto 0);
    signal signRCond2_uid152_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal signRCond2_uid152_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal signRCond1_uid157_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal signRCond1_uid157_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal signRCond1_uid157_fpSinCosXTest_c : std_logic_vector(0 downto 0);
    signal signRCond1_uid157_fpSinCosXTest_d : std_logic_vector(0 downto 0);
    signal signRCond1_uid157_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal signRCond1_uid157_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal ZerosGB_uid206_rrx_uid34_fpSinCosXTest_q : std_logic_vector (29 downto 0);
    signal leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid219_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1Idx3Pad3_uid230_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (2 downto 0);
    signal zs_uid236_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (63 downto 0);
    signal vCount_uid238_lzcZSin_uid66_fpSinCosXTest_a : std_logic_vector(63 downto 0);
    signal vCount_uid238_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector(63 downto 0);
    signal vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal mO_uid239_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (62 downto 0);
    signal zs_uid244_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid246_lzcZSin_uid66_fpSinCosXTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid246_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal zs_uid250_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid264_lzcZSin_uid66_fpSinCosXTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid264_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid264_lzcZSin_uid66_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid264_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1Idx3Pad24_uid293_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (23 downto 0);
    signal leftShiftStage2Idx3Pad6_uid304_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (5 downto 0);
    signal vCount_uid317_lzcZCos_uid69_fpSinCosXTest_a : std_logic_vector(63 downto 0);
    signal vCount_uid317_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector(63 downto 0);
    signal vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid325_lzcZCos_uid69_fpSinCosXTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid325_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid343_lzcZCos_uid69_fpSinCosXTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid343_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid343_lzcZCos_uid69_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid343_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal mO_uid435_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx3Pad48_uid474_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (47 downto 0);
    signal prodXY_uid502_pT1_uid407_polyEvalsinPiZ_a : std_logic_vector (12 downto 0);
    signal prodXY_uid502_pT1_uid407_polyEvalsinPiZ_b : std_logic_vector (12 downto 0);
    signal prodXY_uid502_pT1_uid407_polyEvalsinPiZ_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid502_pT1_uid407_polyEvalsinPiZ_pr : SIGNED (26 downto 0);
    signal prodXY_uid502_pT1_uid407_polyEvalsinPiZ_q : std_logic_vector (25 downto 0);
    signal prodXY_uid505_pT2_uid413_polyEvalsinPiZ_a : std_logic_vector (14 downto 0);
    signal prodXY_uid505_pT2_uid413_polyEvalsinPiZ_b : std_logic_vector (22 downto 0);
    signal prodXY_uid505_pT2_uid413_polyEvalsinPiZ_s1 : std_logic_vector (37 downto 0);
    signal prodXY_uid505_pT2_uid413_polyEvalsinPiZ_pr : SIGNED (38 downto 0);
    signal prodXY_uid505_pT2_uid413_polyEvalsinPiZ_q : std_logic_vector (37 downto 0);
    signal prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a : std_logic_vector (12 downto 0);
    signal prodXY_uid508_pT1_uid420_polyEvalcosPiZ_b : std_logic_vector (12 downto 0);
    signal prodXY_uid508_pT1_uid420_polyEvalcosPiZ_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid508_pT1_uid420_polyEvalcosPiZ_pr : SIGNED (26 downto 0);
    signal prodXY_uid508_pT1_uid420_polyEvalcosPiZ_q : std_logic_vector (25 downto 0);
    signal prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a : std_logic_vector (14 downto 0);
    signal prodXY_uid511_pT2_uid426_polyEvalcosPiZ_b : std_logic_vector (22 downto 0);
    signal prodXY_uid511_pT2_uid426_polyEvalcosPiZ_s1 : std_logic_vector (37 downto 0);
    signal prodXY_uid511_pT2_uid426_polyEvalcosPiZ_pr : SIGNED (38 downto 0);
    signal prodXY_uid511_pT2_uid426_polyEvalcosPiZ_q : std_logic_vector (37 downto 0);
    signal rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_reset0 : std_logic;
    signal rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_ia : std_logic_vector (39 downto 0);
    signal rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_iq : std_logic_vector (39 downto 0);
    signal rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_q : std_logic_vector (39 downto 0);
    signal rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_reset0 : std_logic;
    signal rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_ia : std_logic_vector (39 downto 0);
    signal rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_aa : std_logic_vector (7 downto 0);
    signal rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_ab : std_logic_vector (7 downto 0);
    signal rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_iq : std_logic_vector (39 downto 0);
    signal rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_q : std_logic_vector (39 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_a : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_b : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_s1 : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_pr : UNSIGNED (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_a : std_logic_vector(81 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_b : std_logic_vector(81 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_o : std_logic_vector (81 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_q : std_logic_vector (81 downto 0);
    signal memoryC0_uid394_tableGensinPiZ_lutmem_reset0 : std_logic;
    signal memoryC0_uid394_tableGensinPiZ_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid394_tableGensinPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid394_tableGensinPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid394_tableGensinPiZ_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid394_tableGensinPiZ_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid396_tableGensinPiZ_lutmem_reset0 : std_logic;
    signal memoryC1_uid396_tableGensinPiZ_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid396_tableGensinPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid396_tableGensinPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid396_tableGensinPiZ_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid396_tableGensinPiZ_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid398_tableGensinPiZ_lutmem_reset0 : std_logic;
    signal memoryC2_uid398_tableGensinPiZ_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid398_tableGensinPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid398_tableGensinPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid398_tableGensinPiZ_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid398_tableGensinPiZ_lutmem_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid400_tableGencosPiZ_lutmem_reset0 : std_logic;
    signal memoryC0_uid400_tableGencosPiZ_lutmem_ia : std_logic_vector (29 downto 0);
    signal memoryC0_uid400_tableGencosPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid400_tableGencosPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid400_tableGencosPiZ_lutmem_iq : std_logic_vector (29 downto 0);
    signal memoryC0_uid400_tableGencosPiZ_lutmem_q : std_logic_vector (29 downto 0);
    signal memoryC1_uid402_tableGencosPiZ_lutmem_reset0 : std_logic;
    signal memoryC1_uid402_tableGencosPiZ_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid402_tableGencosPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid402_tableGencosPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid402_tableGencosPiZ_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid402_tableGencosPiZ_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid404_tableGencosPiZ_lutmem_reset0 : std_logic;
    signal memoryC2_uid404_tableGencosPiZ_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid404_tableGencosPiZ_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid404_tableGencosPiZ_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid404_tableGencosPiZ_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid404_tableGencosPiZ_lutmem_q : std_logic_vector (12 downto 0);
    signal reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_q : std_logic_vector (2 downto 0);
    signal reg_expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_0_to_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_0_q : std_logic_vector (39 downto 0);
    signal reg_rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_1_q : std_logic_vector (39 downto 0);
    signal reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid198_rrx_uid34_fpSinCosXTest_b_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_1_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_2_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_0_to_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q : std_logic_vector (77 downto 0);
    signal reg_leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_3_q : std_logic_vector (77 downto 0);
    signal reg_leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_4_q : std_logic_vector (77 downto 0);
    signal reg_leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_5_q : std_logic_vector (77 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q : std_logic_vector (77 downto 0);
    signal reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expCompOut_uid205_rrx_uid34_fpSinCosXTest_0_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_2_q : std_logic_vector (7 downto 0);
    signal reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q : std_logic_vector (7 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_extendedFracX_uid47_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_2_q : std_logic_vector (67 downto 0);
    signal reg_leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_3_q : std_logic_vector (67 downto 0);
    signal reg_leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_4_q : std_logic_vector (67 downto 0);
    signal reg_leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_5_q : std_logic_vector (67 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_2_q : std_logic_vector (67 downto 0);
    signal reg_pad_one_uid55_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_0_q : std_logic_vector (66 downto 0);
    signal reg_y_uid50_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_1_q : std_logic_vector (65 downto 0);
    signal reg_oneMinusY_uid55_fpSinCosXTest_0_to_cmpYToOneMinusY_uid57_fpSinCosXTest_0_q : std_logic_vector (67 downto 0);
    signal reg_cmpYToOneMinusY_uid57_fpSinCosXTest_1_to_zSin_uid60_fpSinCosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2_q : std_logic_vector (64 downto 0);
    signal reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3_q : std_logic_vector (64 downto 0);
    signal reg_rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_0_to_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_1_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid259_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_2_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid265_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_2_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_3_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_4_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_5_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_2_q : std_logic_vector (64 downto 0);
    signal reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_pHigh_uid72_fpSinCosXTest_0_to_p_uid73_fpSinCosXTest_2_q : std_logic_vector (25 downto 0);
    signal reg_addr_uid81_fpSinCosXTest_0_to_memoryC2_uid398_tableGensinPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid398_tableGensinPiZ_lutmem_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_1_q : std_logic_vector (12 downto 0);
    signal reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid396_tableGensinPiZ_lutmem_0_to_sumAHighB_uid410_polyEvalsinPiZ_0_q : std_logic_vector (20 downto 0);
    signal reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid408_uid411_polyEvalsinPiZ_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_1_q : std_logic_vector (22 downto 0);
    signal reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid394_tableGensinPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalsinPiZ_0_q : std_logic_vector (29 downto 0);
    signal reg_r_uid277_lzcZSin_uid66_fpSinCosXTest_0_to_expSinHC_uid74_fpSinCosXTest_1_q : std_logic_vector (6 downto 0);
    signal reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_fracRCompSin_uid103_fpSinCosXTest_0_to_fracRPostExcSin_uid122_fpSinCosXTest_2_q : std_logic_vector (22 downto 0);
    signal reg_expRCompSin_uid104_fpSinCosXTest_0_to_expRPostExcSin_uid126_fpSinCosXTest_2_q : std_logic_vector (7 downto 0);
    signal reg_yHalfCosXNotOne_uid138_fpSinCosXTest_0_to_rZOrOne_uid140_fpSinCosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_sinXIsX_uid40_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_2_q : std_logic_vector (0 downto 0);
    signal reg_cosXIsOneXRR_uid42_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_3_q : std_logic_vector (0 downto 0);
    signal reg_excRNaN_uid117_fpSinCosXTest_0_to_join_uid141_fpSinCosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_InvCmpYToOneMinusY_uid61_fpSinCosXTest_0_to_zCos_uid64_fpSinCosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_0_to_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_1_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid338_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_2_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid344_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_2_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_3_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_4_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_5_q : std_logic_vector (64 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_2_q : std_logic_vector (64 downto 0);
    signal reg_addr_uid83_fpSinCosXTest_0_to_memoryC2_uid404_tableGencosPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid404_tableGencosPiZ_lutmem_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_1_q : std_logic_vector (12 downto 0);
    signal reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid402_tableGencosPiZ_lutmem_0_to_sumAHighB_uid423_polyEvalcosPiZ_0_q : std_logic_vector (20 downto 0);
    signal reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid421_uid424_polyEvalcosPiZ_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_1_q : std_logic_vector (22 downto 0);
    signal reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid400_tableGencosPiZ_lutmem_0_to_sumAHighB_uid429_polyEvalcosPiZ_0_q : std_logic_vector (29 downto 0);
    signal reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_q : std_logic_vector (25 downto 0);
    signal reg_polyEvalSigcosPiZ_uid89_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_1_q : std_logic_vector (25 downto 0);
    signal reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q : std_logic_vector (6 downto 0);
    signal reg_expPCos_uid79_fpSinCosXTest_0_to_expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_1_q : std_logic_vector (7 downto 0);
    signal reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q : std_logic_vector (1 downto 0);
    signal reg_fracRCompCos_uid115_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_2_q : std_logic_vector (22 downto 0);
    signal reg_expSelBitsCos_uid144_fpSinCosXTest_0_to_expSelectorCos_uid145_fpSinCosXTest_0_q : std_logic_vector (3 downto 0);
    signal reg_expRCompSin_uid116_fpSinCosXTest_0_to_expRPostExcCos_uid147_fpSinCosXTest_2_q : std_logic_vector (7 downto 0);
    signal reg_InvExc_N_uid132_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_1_q : std_logic_vector (0 downto 0);
    signal reg_InvExc_I_uid131_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_2_q : std_logic_vector (0 downto 0);
    signal ld_fracXRR_uid39_fpSinCosXTest_b_to_oFracXRR_uid43_uid43_fpSinCosXTest_a_q : std_logic_vector (52 downto 0);
    signal ld_y_uid50_fpSinCosXTest_b_to_cmpYToOneMinusY_uid57_fpSinCosXTest_b_q : std_logic_vector (65 downto 0);
    signal ld_oneMinusY_uid55_fpSinCosXTest_q_to_zSinOMyBottom_uid58_fpSinCosXTest_a_q : std_logic_vector (67 downto 0);
    signal ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_expPSin_uid76_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_multSinOp2_uid91_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid17_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid15_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid40_fpSinCosXTest_n_to_excSelBitsSin_uid118_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpSinCosXTest_q_to_excSelBitsSin_uid118_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid40_fpSinCosXTest_n_to_InvSinXIsX_uid127_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_InvSinXIsXRR_uid128_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid37_fpSinCosXTest_b_to_signR_uid130_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid15_fpSinCosXTest_q_to_InvExc_I_uid131_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid17_fpSinCosXTest_q_to_InvExc_N_uid132_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid130_fpSinCosXTest_q_to_signRSinFull_uid133_fpSinCosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_signRSinFull_uid133_fpSinCosXTest_q_to_fpSin_uid134_fpSinCosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_InvSinXIsX_uid127_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_InvCosXIsOneXRR_uid136_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_cosXIsOneXRR_uid42_fpSinCosXTest_n_to_join_uid143_fpSinCosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid40_fpSinCosXTest_n_to_cosXONe_uid148_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_cosXONe_uid148_fpSinCosXTest_q_to_InvCosXONe_uid149_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_yIsZero_uid51_fpSinCosXTest_q_to_InvYIsZero_uid151_fpSinCosXTest_a_q : std_logic_vector (0 downto 0);
    signal ld_intXParity_uid49_fpSinCosXTest_b_to_signRCond2_uid152_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_signRCosFull_uid161_fpSinCosXTest_q_to_fpCos_uid162_fpSinCosXTest_c_q : std_logic_vector (0 downto 0);
    signal ld_xBranch_uid191_rrx_uid34_fpSinCosXTest_n_to_finalFrac_uid208_rrx_uid34_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_finalExp_uid209_rrx_uid34_fpSinCosXTest_q_to_RRangeRed_uid210_rrx_uid34_fpSinCosXTest_b_q : std_logic_vector (7 downto 0);
    signal ld_LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_b_q : std_logic_vector (66 downto 0);
    signal ld_LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_b_q : std_logic_vector (65 downto 0);
    signal ld_LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_b_q : std_logic_vector (64 downto 0);
    signal ld_vStage_uid240_lzcZSin_uid66_fpSinCosXTest_b_to_cStage_uid241_lzcZSin_uid66_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_c_q : std_logic_vector (63 downto 0);
    signal ld_rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_d_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_g_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_b_q : std_logic_vector (62 downto 0);
    signal ld_LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_b_q : std_logic_vector (60 downto 0);
    signal ld_LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_b_q : std_logic_vector (58 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_vStage_uid319_lzcZCos_uid69_fpSinCosXTest_b_to_cStage_uid320_lzcZCos_uid69_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_c_q : std_logic_vector (63 downto 0);
    signal ld_rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_d_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_f_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_g_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_b_q : std_logic_vector (62 downto 0);
    signal ld_LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_b_q : std_logic_vector (60 downto 0);
    signal ld_LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_b_q : std_logic_vector (58 downto 0);
    signal ld_reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_b_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_b_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_e_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q : std_logic_vector (76 downto 0);
    signal ld_LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q : std_logic_vector (75 downto 0);
    signal ld_LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q : std_logic_vector (74 downto 0);
    signal ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a_q : std_logic_vector (12 downto 0);
    signal ld_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q_to_prod_uid198_rrx_uid34_fpSinCosXTest_align_2_a_q : std_logic_vector (53 downto 0);
    signal ld_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_a_q : std_logic_vector (0 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_b_to_reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a_q : std_logic_vector (12 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_reset0 : std_logic;
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_eq : std_logic;
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_sticky_ena_q : signal is true;
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_reset0 : std_logic;
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_eq : std_logic;
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_sticky_ena_q : signal is true;
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_reset0 : std_logic;
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_sticky_ena_q : signal is true;
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_reset0 : std_logic;
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_eq : std_logic;
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_sticky_ena_q : signal is true;
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_reset0 : std_logic;
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_sticky_ena_q : signal is true;
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_reset0 : std_logic;
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_reset0 : std_logic;
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_sticky_ena_q : signal is true;
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_inputreg_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_inputreg_q : std_logic_vector (64 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_reset0 : std_logic;
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_ia : std_logic_vector (64 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_iq : std_logic_vector (64 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_q : std_logic_vector (64 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_sticky_ena_q : signal is true;
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_inputreg_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_q : std_logic_vector (32 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_inputreg_q : std_logic_vector (64 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_reset0 : std_logic;
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_ia : std_logic_vector (64 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_iq : std_logic_vector (64 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_q : std_logic_vector (64 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_sticky_ena_q : signal is true;
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q : std_logic_vector (61 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (61 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (61 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q : std_logic_vector (61 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q : std_logic_vector (45 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (45 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (45 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q : std_logic_vector (45 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q : std_logic_vector (29 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0 : std_logic;
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia : std_logic_vector (29 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq : std_logic_vector (29 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q : std_logic_vector (29 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q : signal is true;
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_inputreg_q : std_logic_vector (77 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_reset0 : std_logic;
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_ia : std_logic_vector (77 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_iq : std_logic_vector (77 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_q : std_logic_vector (77 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_sticky_ena_q : signal is true;
    signal ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_sticky_ena_q : signal is true;
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_sticky_ena_q : signal is true;
    signal ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_reset0 : std_logic;
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_ia : std_logic_vector (25 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_iq : std_logic_vector (25 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_q : std_logic_vector (25 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_eq : std_logic;
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_sticky_ena_q : signal is true;
    signal sinXIsXRR_uid41_fpSinCosXTest_a : std_logic_vector(11 downto 0);
    signal sinXIsXRR_uid41_fpSinCosXTest_b : std_logic_vector(11 downto 0);
    signal sinXIsXRR_uid41_fpSinCosXTest_o : std_logic_vector (11 downto 0);
    signal sinXIsXRR_uid41_fpSinCosXTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsXRR_uid41_fpSinCosXTest_n : std_logic_vector (0 downto 0);
    signal cosXIsOneXRR_uid42_fpSinCosXTest_a : std_logic_vector(11 downto 0);
    signal cosXIsOneXRR_uid42_fpSinCosXTest_b : std_logic_vector(11 downto 0);
    signal cosXIsOneXRR_uid42_fpSinCosXTest_o : std_logic_vector (11 downto 0);
    signal cosXIsOneXRR_uid42_fpSinCosXTest_cin : std_logic_vector (0 downto 0);
    signal cosXIsOneXRR_uid42_fpSinCosXTest_n : std_logic_vector (0 downto 0);
    signal yIsZero_uid51_fpSinCosXTest_a : std_logic_vector(65 downto 0);
    signal yIsZero_uid51_fpSinCosXTest_b : std_logic_vector(65 downto 0);
    signal yIsZero_uid51_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal pad_one_uid55_fpSinCosXTest_q : std_logic_vector (66 downto 0);
    signal cmpYToOneMinusY_uid57_fpSinCosXTest_a : std_logic_vector(70 downto 0);
    signal cmpYToOneMinusY_uid57_fpSinCosXTest_b : std_logic_vector(70 downto 0);
    signal cmpYToOneMinusY_uid57_fpSinCosXTest_o : std_logic_vector (70 downto 0);
    signal cmpYToOneMinusY_uid57_fpSinCosXTest_cin : std_logic_vector (0 downto 0);
    signal cmpYToOneMinusY_uid57_fpSinCosXTest_c : std_logic_vector (0 downto 0);
    signal leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal InvCmpYToOneMinusY_uid61_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvCmpYToOneMinusY_uid61_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal InvSinXIsX_uid127_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsX_uid127_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal InvSinXIsXRR_uid128_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsXRR_uid128_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid131_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid131_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid132_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid132_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal InvCosXIsOneXRR_uid136_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvCosXIsOneXRR_uid136_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal InvCosXONe_uid149_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvCosXONe_uid149_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid151_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid151_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal InvIntXParity_uid155_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvIntXParity_uid155_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal oFracXRR_uid43_uid43_fpSinCosXTest_q : std_logic_vector (53 downto 0);
    signal half_uid53_fpSinCosXTest_q : std_logic_vector (65 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal exp_uid9_fpSinCosXTest_in : std_logic_vector (30 downto 0);
    signal exp_uid9_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal frac_uid13_fpSinCosXTest_in : std_logic_vector (22 downto 0);
    signal frac_uid13_fpSinCosXTest_b : std_logic_vector (22 downto 0);
    signal signX_uid37_fpSinCosXTest_in : std_logic_vector (31 downto 0);
    signal signX_uid37_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal expFracX_uid166_px_uid33_fpSinCosXTest_in : std_logic_vector (30 downto 0);
    signal expFracX_uid166_px_uid33_fpSinCosXTest_b : std_logic_vector (30 downto 0);
    signal expXIsZero_uid10_fpSinCosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpSinCosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid12_fpSinCosXTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpSinCosXTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid14_fpSinCosXTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpSinCosXTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid15_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal sinXIsX_uid40_fpSinCosXTest_a : std_logic_vector(10 downto 0);
    signal sinXIsX_uid40_fpSinCosXTest_b : std_logic_vector(10 downto 0);
    signal sinXIsX_uid40_fpSinCosXTest_o : std_logic_vector (10 downto 0);
    signal sinXIsX_uid40_fpSinCosXTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsX_uid40_fpSinCosXTest_n : std_logic_vector (0 downto 0);
    signal fxpXShiftValExt_uid45_fpSinCosXTest_a : std_logic_vector(10 downto 0);
    signal fxpXShiftValExt_uid45_fpSinCosXTest_b : std_logic_vector(10 downto 0);
    signal fxpXShiftValExt_uid45_fpSinCosXTest_o : std_logic_vector (10 downto 0);
    signal fxpXShiftValExt_uid45_fpSinCosXTest_q : std_logic_vector (9 downto 0);
    signal yIsHalf_uid54_fpSinCosXTest_a : std_logic_vector(65 downto 0);
    signal yIsHalf_uid54_fpSinCosXTest_b : std_logic_vector(65 downto 0);
    signal yIsHalf_uid54_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal oneMinusY_uid55_fpSinCosXTest_a : std_logic_vector(67 downto 0);
    signal oneMinusY_uid55_fpSinCosXTest_b : std_logic_vector(67 downto 0);
    signal oneMinusY_uid55_fpSinCosXTest_o : std_logic_vector (67 downto 0);
    signal oneMinusY_uid55_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal zSin_uid60_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal zSin_uid60_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal zCos_uid64_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal zCos_uid64_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal expSinHC_uid74_fpSinCosXTest_a : std_logic_vector(8 downto 0);
    signal expSinHC_uid74_fpSinCosXTest_b : std_logic_vector(8 downto 0);
    signal expSinHC_uid74_fpSinCosXTest_o : std_logic_vector (8 downto 0);
    signal expSinHC_uid74_fpSinCosXTest_q : std_logic_vector (8 downto 0);
    signal expHardCase_uid78_fpSinCosXTest_a : std_logic_vector(8 downto 0);
    signal expHardCase_uid78_fpSinCosXTest_b : std_logic_vector(8 downto 0);
    signal expHardCase_uid78_fpSinCosXTest_o : std_logic_vector (8 downto 0);
    signal expHardCase_uid78_fpSinCosXTest_q : std_logic_vector (8 downto 0);
    signal excRNaN_uid117_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid117_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid117_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExcSin_uid122_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExcSin_uid122_fpSinCosXTest_q : std_logic_vector (22 downto 0);
    signal expRPostExcSin_uid126_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExcSin_uid126_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal yHalfCosXNotOne_uid138_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal yHalfCosXNotOne_uid138_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal yHalfCosXNotOne_uid138_fpSinCosXTest_c : std_logic_vector(0 downto 0);
    signal yHalfCosXNotOne_uid138_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal rZOrOne_uid140_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal rZOrOne_uid140_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal rZOrOne_uid140_fpSinCosXTest_c : std_logic_vector(0 downto 0);
    signal rZOrOne_uid140_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExcCos_uid142_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExcCos_uid142_fpSinCosXTest_q : std_logic_vector (22 downto 0);
    signal expRPostExcCos_uid147_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal expRPostExcCos_uid147_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal cosXONe_uid148_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal cosXONe_uid148_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal cosXONe_uid148_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal signRCos_uid158_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal signRCos_uid158_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal signRCos_uid158_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal signRCosFull_uid161_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal signRCosFull_uid161_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal signRCosFull_uid161_fpSinCosXTest_c : std_logic_vector(0 downto 0);
    signal signRCosFull_uid161_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal finalExp_uid209_rrx_uid34_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal finalExp_uid209_rrx_uid34_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid258_lzcZSin_uid66_fpSinCosXTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid258_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid337_lzcZCos_uid69_fpSinCosXTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid337_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal extendedFracX_uid47_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal normBitSin_uid93_fpSinCosXTest_in : std_logic_vector (51 downto 0);
    signal normBitSin_uid93_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal fracRSinPreRndHigh_uid95_fpSinCosXTest_in : std_logic_vector (50 downto 0);
    signal fracRSinPreRndHigh_uid95_fpSinCosXTest_b : std_logic_vector (23 downto 0);
    signal fracRSinPreRndLow_uid96_fpSinCosXTest_in : std_logic_vector (49 downto 0);
    signal fracRSinPreRndLow_uid96_fpSinCosXTest_b : std_logic_vector (23 downto 0);
    signal normBitCos_uid106_fpSinCosXTest_in : std_logic_vector (51 downto 0);
    signal normBitCos_uid106_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal fracRCosPreRndHigh_uid108_fpSinCosXTest_in : std_logic_vector (50 downto 0);
    signal fracRCosPreRndHigh_uid108_fpSinCosXTest_b : std_logic_vector (23 downto 0);
    signal fracRCosPreRndLow_uid109_fpSinCosXTest_in : std_logic_vector (49 downto 0);
    signal fracRCosPreRndLow_uid109_fpSinCosXTest_b : std_logic_vector (23 downto 0);
    signal fracXRExt_uid207_rrx_uid34_fpSinCosXTest_q : std_logic_vector (52 downto 0);
    signal leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal cStage_uid241_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (63 downto 0);
    signal cStage_uid320_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector (63 downto 0);
    signal leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector (63 downto 0);
    signal leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal prodXYTruncFR_uid503_pT1_uid407_polyEvalsinPiZ_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid503_pT1_uid407_polyEvalsinPiZ_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid506_pT2_uid413_polyEvalsinPiZ_in : std_logic_vector (37 downto 0);
    signal prodXYTruncFR_uid506_pT2_uid413_polyEvalsinPiZ_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid509_pT1_uid420_polyEvalcosPiZ_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid509_pT1_uid420_polyEvalcosPiZ_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid512_pT2_uid426_polyEvalcosPiZ_in : std_logic_vector (37 downto 0);
    signal prodXYTruncFR_uid512_pT2_uid426_polyEvalcosPiZ_b : std_logic_vector (23 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_align_0_q_int : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_align_0_q : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_align_1_q_int : std_logic_vector (80 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_align_1_q : std_logic_vector (80 downto 0);
    signal os_uid196_rrx_uid34_fpSinCosXTest_q : std_logic_vector (79 downto 0);
    signal leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal join_uid99_fpSinCosXTest_q : std_logic_vector (1 downto 0);
    signal join_uid141_fpSinCosXTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal zSinYBottom_uid59_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal zSinYBottom_uid59_fpSinCosXTest_b : std_logic_vector (64 downto 0);
    signal zSinOMyBottom_uid58_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal zSinOMyBottom_uid58_fpSinCosXTest_b : std_logic_vector (64 downto 0);
    signal excSelBitsSin_uid118_fpSinCosXTest_q : std_logic_vector (2 downto 0);
    signal fpSin_uid134_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal join_uid143_fpSinCosXTest_q : std_logic_vector (2 downto 0);
    signal fpCos_uid162_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (63 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_align_2_q_int : std_logic_vector (107 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_align_2_q : std_logic_vector (107 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_a : std_logic_vector(6 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_b : std_logic_vector(6 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal fracX_uid187_rrx_uid34_fpSinCosXTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid187_rrx_uid34_fpSinCosXTest_b : std_logic_vector (22 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal oFracXRRSmallXRR_uid90_fpSinCosXTest_in : std_logic_vector (53 downto 0);
    signal oFracXRRSmallXRR_uid90_fpSinCosXTest_b : std_logic_vector (25 downto 0);
    signal R_uid167_px_uid33_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal InvFracXIsZero_uid16_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid16_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal fxpXShiftVal_uid46_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal fxpXShiftVal_uid46_fpSinCosXTest_b : std_logic_vector (3 downto 0);
    signal addr_uid81_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal addr_uid81_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal zPsinPiZ_uid84_fpSinCosXTest_in : std_logic_vector (56 downto 0);
    signal zPsinPiZ_uid84_fpSinCosXTest_b : std_logic_vector (14 downto 0);
    signal rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (63 downto 0);
    signal vStage_uid240_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (0 downto 0);
    signal vStage_uid240_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (32 downto 0);
    signal addr_uid83_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal addr_uid83_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal zPcosPiZ_uid87_fpSinCosXTest_in : std_logic_vector (56 downto 0);
    signal zPcosPiZ_uid87_fpSinCosXTest_b : std_logic_vector (14 downto 0);
    signal rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (63 downto 0);
    signal vStage_uid319_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (0 downto 0);
    signal vStage_uid319_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (32 downto 0);
    signal expSinHCR_uid75_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal expSinHCR_uid75_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal expPCos_uid79_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal expPCos_uid79_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_in : std_logic_vector (66 downto 0);
    signal LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_b : std_logic_vector (66 downto 0);
    signal LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_in : std_logic_vector (65 downto 0);
    signal LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_b : std_logic_vector (65 downto 0);
    signal LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_b : std_logic_vector (64 downto 0);
    signal rVStage_uid251_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid251_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid253_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid253_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid265_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid265_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid269_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid269_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid271_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid271_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (62 downto 0);
    signal LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (62 downto 0);
    signal LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (60 downto 0);
    signal LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (60 downto 0);
    signal LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (58 downto 0);
    signal LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (58 downto 0);
    signal rVStage_uid330_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid330_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid332_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid332_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid344_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid344_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid348_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid348_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid350_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid350_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (62 downto 0);
    signal LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (62 downto 0);
    signal LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (60 downto 0);
    signal LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (60 downto 0);
    signal LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (58 downto 0);
    signal LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (58 downto 0);
    signal rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid453_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid453_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid463_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid463_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (76 downto 0);
    signal LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (76 downto 0);
    signal LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (75 downto 0);
    signal LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (75 downto 0);
    signal LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (74 downto 0);
    signal LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (74 downto 0);
    signal X63dto0_uid214_fxpX_uid48_fpSinCosXTest_in : std_logic_vector (63 downto 0);
    signal X63dto0_uid214_fxpX_uid48_fpSinCosXTest_b : std_logic_vector (63 downto 0);
    signal X59dto0_uid217_fxpX_uid48_fpSinCosXTest_in : std_logic_vector (59 downto 0);
    signal X59dto0_uid217_fxpX_uid48_fpSinCosXTest_b : std_logic_vector (59 downto 0);
    signal X55dto0_uid220_fxpX_uid48_fpSinCosXTest_in : std_logic_vector (55 downto 0);
    signal X55dto0_uid220_fxpX_uid48_fpSinCosXTest_b : std_logic_vector (55 downto 0);
    signal fracRSinPreRnd_uid97_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal fracRSinPreRnd_uid97_fpSinCosXTest_q : std_logic_vector (23 downto 0);
    signal fracRCosPreRnd_uid110_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal fracRCosPreRnd_uid110_fpSinCosXTest_q : std_logic_vector (23 downto 0);
    signal cosRndOp_uid112_uid113_fpSinCosXTest_q : std_logic_vector (24 downto 0);
    signal rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (63 downto 0);
    signal rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid326_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (31 downto 0);
    signal vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (31 downto 0);
    signal lowRangeB_uid408_polyEvalsinPiZ_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid408_polyEvalsinPiZ_b : std_logic_vector (0 downto 0);
    signal highBBits_uid409_polyEvalsinPiZ_in : std_logic_vector (13 downto 0);
    signal highBBits_uid409_polyEvalsinPiZ_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid414_polyEvalsinPiZ_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid414_polyEvalsinPiZ_b : std_logic_vector (1 downto 0);
    signal highBBits_uid415_polyEvalsinPiZ_in : std_logic_vector (23 downto 0);
    signal highBBits_uid415_polyEvalsinPiZ_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid421_polyEvalcosPiZ_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid421_polyEvalcosPiZ_b : std_logic_vector (0 downto 0);
    signal highBBits_uid422_polyEvalcosPiZ_in : std_logic_vector (13 downto 0);
    signal highBBits_uid422_polyEvalcosPiZ_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid427_polyEvalcosPiZ_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid427_polyEvalcosPiZ_b : std_logic_vector (1 downto 0);
    signal highBBits_uid428_polyEvalcosPiZ_in : std_logic_vector (23 downto 0);
    signal highBBits_uid428_polyEvalcosPiZ_b : std_logic_vector (21 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a_0_in : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a_0_b : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a_1_in : std_logic_vector (53 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a_1_b : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a_2_in : std_logic_vector (80 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_a_2_b : std_logic_vector (26 downto 0);
    signal fracCompOut_uid203_rrx_uid34_fpSinCosXTest_in : std_logic_vector (76 downto 0);
    signal fracCompOut_uid203_rrx_uid34_fpSinCosXTest_b : std_logic_vector (52 downto 0);
    signal intXParity_uid49_fpSinCosXTest_in : std_logic_vector (67 downto 0);
    signal intXParity_uid49_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal y_uid50_fpSinCosXTest_in : std_logic_vector (66 downto 0);
    signal y_uid50_fpSinCosXTest_b : std_logic_vector (65 downto 0);
    signal LeftShiftStage263dto0_uid310_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (63 downto 0);
    signal LeftShiftStage263dto0_uid310_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (63 downto 0);
    signal sinRndOp_uid100_uid101_fpSinCosXTest_q : std_logic_vector (25 downto 0);
    signal LeftShiftStage263dto0_uid389_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (63 downto 0);
    signal LeftShiftStage263dto0_uid389_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (63 downto 0);
    signal expSelBitsCos_uid144_fpSinCosXTest_q : std_logic_vector (3 downto 0);
    signal rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (63 downto 0);
    signal rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid247_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (31 downto 0);
    signal vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (31 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_a : std_logic_vector(108 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_b : std_logic_vector(108 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_o : std_logic_vector (108 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_q : std_logic_vector (108 downto 0);
    signal oFracX_uid197_uid197_rrx_uid34_fpSinCosXTest_q : std_logic_vector (23 downto 0);
    signal expX_uid186_rrx_uid34_fpSinCosXTest_in : std_logic_vector (30 downto 0);
    signal expX_uid186_rrx_uid34_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal exc_N_uid17_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal yT1_uid406_polyEvalsinPiZ_in : std_logic_vector (14 downto 0);
    signal yT1_uid406_polyEvalsinPiZ_b : std_logic_vector (12 downto 0);
    signal yT1_uid419_polyEvalcosPiZ_in : std_logic_vector (14 downto 0);
    signal yT1_uid419_polyEvalcosPiZ_b : std_logic_vector (12 downto 0);
    signal vCount_uid252_lzcZSin_uid66_fpSinCosXTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid252_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid252_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid270_lzcZSin_uid66_fpSinCosXTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid270_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid270_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (1 downto 0);
    signal vCount_uid331_lzcZCos_uid69_fpSinCosXTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid331_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid331_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid349_lzcZCos_uid69_fpSinCosXTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid349_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid349_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector (1 downto 0);
    signal vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_q : std_logic_vector (67 downto 0);
    signal expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_q : std_logic_vector (31 downto 0);
    signal expFracRCos_uid114_fpSinCosXTest_a : std_logic_vector(32 downto 0);
    signal expFracRCos_uid114_fpSinCosXTest_b : std_logic_vector(32 downto 0);
    signal expFracRCos_uid114_fpSinCosXTest_o : std_logic_vector (32 downto 0);
    signal expFracRCos_uid114_fpSinCosXTest_q : std_logic_vector (32 downto 0);
    signal sumAHighB_uid410_polyEvalsinPiZ_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid410_polyEvalsinPiZ_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid410_polyEvalsinPiZ_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid410_polyEvalsinPiZ_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid416_polyEvalsinPiZ_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid416_polyEvalsinPiZ_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid416_polyEvalsinPiZ_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid416_polyEvalsinPiZ_q : std_logic_vector (30 downto 0);
    signal sumAHighB_uid423_polyEvalcosPiZ_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid423_polyEvalcosPiZ_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid423_polyEvalcosPiZ_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid423_polyEvalcosPiZ_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid429_polyEvalcosPiZ_a : std_logic_vector(30 downto 0);
    signal sumAHighB_uid429_polyEvalcosPiZ_b : std_logic_vector(30 downto 0);
    signal sumAHighB_uid429_polyEvalcosPiZ_o : std_logic_vector (30 downto 0);
    signal sumAHighB_uid429_polyEvalcosPiZ_q : std_logic_vector (30 downto 0);
    signal finalFrac_uid208_rrx_uid34_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal finalFrac_uid208_rrx_uid34_fpSinCosXTest_q : std_logic_vector (52 downto 0);
    signal signComp_uid129_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal signComp_uid129_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal signComp_uid129_fpSinCosXTest_c : std_logic_vector(0 downto 0);
    signal signComp_uid129_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage3Idx1_uid311_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal expFracRSin_uid102_fpSinCosXTest_a : std_logic_vector(32 downto 0);
    signal expFracRSin_uid102_fpSinCosXTest_b : std_logic_vector(32 downto 0);
    signal expFracRSin_uid102_fpSinCosXTest_o : std_logic_vector (32 downto 0);
    signal expFracRSin_uid102_fpSinCosXTest_q : std_logic_vector (32 downto 0);
    signal leftShiftStage3Idx1_uid390_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal multFracBits_uid199_rrx_uid34_fpSinCosXTest_in : std_logic_vector (77 downto 0);
    signal multFracBits_uid199_rrx_uid34_fpSinCosXTest_b : std_logic_vector (77 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_b_0_in : std_logic_vector (26 downto 0);
    signal prod_uid198_rrx_uid34_fpSinCosXTest_b_0_b : std_logic_vector (26 downto 0);
    signal xBranch_uid191_rrx_uid34_fpSinCosXTest_a : std_logic_vector(10 downto 0);
    signal xBranch_uid191_rrx_uid34_fpSinCosXTest_b : std_logic_vector(10 downto 0);
    signal xBranch_uid191_rrx_uid34_fpSinCosXTest_o : std_logic_vector (10 downto 0);
    signal xBranch_uid191_rrx_uid34_fpSinCosXTest_cin : std_logic_vector (0 downto 0);
    signal xBranch_uid191_rrx_uid34_fpSinCosXTest_n : std_logic_vector (0 downto 0);
    signal expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_a : std_logic_vector(8 downto 0);
    signal expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_b : std_logic_vector(8 downto 0);
    signal expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_o : std_logic_vector (8 downto 0);
    signal expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_q : std_logic_vector (8 downto 0);
    signal rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid259_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid259_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid275_lzcZSin_uid66_fpSinCosXTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid275_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid338_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid338_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid354_lzcZCos_uid69_fpSinCosXTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid354_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_q : std_logic_vector (5 downto 0);
    signal fracRCompCos_uid115_fpSinCosXTest_in : std_logic_vector (23 downto 0);
    signal fracRCompCos_uid115_fpSinCosXTest_b : std_logic_vector (22 downto 0);
    signal expRCompSin_uid116_fpSinCosXTest_in : std_logic_vector (31 downto 0);
    signal expRCompSin_uid116_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal s1_uid408_uid411_polyEvalsinPiZ_q : std_logic_vector (22 downto 0);
    signal s2_uid414_uid417_polyEvalsinPiZ_q : std_logic_vector (32 downto 0);
    signal s1_uid421_uid424_polyEvalcosPiZ_q : std_logic_vector (22 downto 0);
    signal s2_uid427_uid430_polyEvalcosPiZ_q : std_logic_vector (32 downto 0);
    signal RRangeRed_uid210_rrx_uid34_fpSinCosXTest_q : std_logic_vector (61 downto 0);
    signal signR_uid130_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal signR_uid130_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal signR_uid130_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal fracRCompSin_uid103_fpSinCosXTest_in : std_logic_vector (23 downto 0);
    signal fracRCompSin_uid103_fpSinCosXTest_b : std_logic_vector (22 downto 0);
    signal expRCompSin_uid104_fpSinCosXTest_in : std_logic_vector (31 downto 0);
    signal expRCompSin_uid104_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_in : std_logic_vector (77 downto 0);
    signal multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_b : std_logic_vector (31 downto 0);
    signal X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (61 downto 0);
    signal X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (61 downto 0);
    signal X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (45 downto 0);
    signal X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (45 downto 0);
    signal X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (29 downto 0);
    signal X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (29 downto 0);
    signal expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal vCount_uid276_lzcZSin_uid66_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid276_lzcZSin_uid66_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid276_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid355_lzcZCos_uid69_fpSinCosXTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid355_lzcZCos_uid69_fpSinCosXTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid355_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector(0 downto 0);
    signal expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_a : std_logic_vector(8 downto 0);
    signal expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_b : std_logic_vector(8 downto 0);
    signal expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_o : std_logic_vector (8 downto 0);
    signal expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_q : std_logic_vector (8 downto 0);
    signal leftShiftStageSel5Dto4_uid477_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid477_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal polyEvalSigsinPiZ_uid86_fpSinCosXTest_in : std_logic_vector (30 downto 0);
    signal polyEvalSigsinPiZ_uid86_fpSinCosXTest_b : std_logic_vector (25 downto 0);
    signal polyEvalSigcosPiZ_uid89_fpSinCosXTest_in : std_logic_vector (30 downto 0);
    signal polyEvalSigcosPiZ_uid89_fpSinCosXTest_b : std_logic_vector (25 downto 0);
    signal expXRR_uid38_fpSinCosXTest_in : std_logic_vector (60 downto 0);
    signal expXRR_uid38_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal fracXRR_uid39_fpSinCosXTest_in : std_logic_vector (52 downto 0);
    signal fracXRR_uid39_fpSinCosXTest_b : std_logic_vector (52 downto 0);
    signal pHigh_uid72_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal pHigh_uid72_fpSinCosXTest_b : std_logic_vector (25 downto 0);
    signal pCos_uid77_fpSinCosXTest_in : std_logic_vector (64 downto 0);
    signal pCos_uid77_fpSinCosXTest_b : std_logic_vector (25 downto 0);
    signal r_uid277_lzcZSin_uid66_fpSinCosXTest_q : std_logic_vector (6 downto 0);
    signal r_uid356_lzcZCos_uid69_fpSinCosXTest_q : std_logic_vector (6 downto 0);
    signal expCompOut_uid205_rrx_uid34_fpSinCosXTest_in : std_logic_vector (7 downto 0);
    signal expCompOut_uid205_rrx_uid34_fpSinCosXTest_b : std_logic_vector (7 downto 0);
    signal leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal leftShiftStageSel6Dto5_uid285_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid285_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal leftShiftStageSel6Dto5_uid364_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid364_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage073dto0_uid480_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (73 downto 0);
    signal LeftShiftStage073dto0_uid480_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (73 downto 0);
    signal LeftShiftStage069dto0_uid483_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (69 downto 0);
    signal LeftShiftStage069dto0_uid483_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (69 downto 0);
    signal LeftShiftStage065dto0_uid486_normMult_uid202_rrx_uid34_fpSinCosXTest_in : std_logic_vector (65 downto 0);
    signal LeftShiftStage065dto0_uid486_normMult_uid202_rrx_uid34_fpSinCosXTest_b : std_logic_vector (65 downto 0);
    signal leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_q : std_logic_vector (77 downto 0);
    signal LeftShiftStage056dto0_uid288_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (56 downto 0);
    signal LeftShiftStage056dto0_uid288_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (56 downto 0);
    signal LeftShiftStage048dto0_uid291_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (48 downto 0);
    signal LeftShiftStage048dto0_uid291_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (48 downto 0);
    signal LeftShiftStage040dto0_uid294_alignedZSin_uid67_fpSinCosXTest_in : std_logic_vector (40 downto 0);
    signal LeftShiftStage040dto0_uid294_alignedZSin_uid67_fpSinCosXTest_b : std_logic_vector (40 downto 0);
    signal LeftShiftStage056dto0_uid367_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (56 downto 0);
    signal LeftShiftStage056dto0_uid367_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (56 downto 0);
    signal LeftShiftStage048dto0_uid370_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (48 downto 0);
    signal LeftShiftStage048dto0_uid370_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (48 downto 0);
    signal LeftShiftStage040dto0_uid373_alignedZCos_uid70_fpSinCosXTest_in : std_logic_vector (40 downto 0);
    signal LeftShiftStage040dto0_uid373_alignedZCos_uid70_fpSinCosXTest_b : std_logic_vector (40 downto 0);
    signal leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
    signal leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_q : std_logic_vector (64 downto 0);
begin


	--xIn(GPIN,3)@0

	--GND(CONSTANT,0)
    GND_q <= "0";

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable(LOGICAL,1282)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_a <= en;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q <= not ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_a;

	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor(LOGICAL,1422)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_b <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_sticky_ena_q;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_q <= not (ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_a or ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_b);

	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_mem_top(CONSTANT,1418)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_mem_top_q <= "01011";

	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp(LOGICAL,1419)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_a <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_mem_top_q;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_q);
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_q <= "1" when ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_a = ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_b else "0";

	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmpReg(REG,1420)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmpReg_q <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_sticky_ena(REG,1423)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_nor_q = "1") THEN
                ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_sticky_ena_q <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd(LOGICAL,1424)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_a <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_sticky_ena_q;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_b <= en;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_q <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_a and ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_b;

	--expFracX_uid166_px_uid33_fpSinCosXTest(BITSELECT,165)@0
    expFracX_uid166_px_uid33_fpSinCosXTest_in <= a(30 downto 0);
    expFracX_uid166_px_uid33_fpSinCosXTest_b <= expFracX_uid166_px_uid33_fpSinCosXTest_in(30 downto 0);

	--R_uid167_px_uid33_fpSinCosXTest(BITJOIN,166)@0
    R_uid167_px_uid33_fpSinCosXTest_q <= GND_q & expFracX_uid166_px_uid33_fpSinCosXTest_b;

	--expX_uid186_rrx_uid34_fpSinCosXTest(BITSELECT,185)@0
    expX_uid186_rrx_uid34_fpSinCosXTest_in <= R_uid167_px_uid33_fpSinCosXTest_q(30 downto 0);
    expX_uid186_rrx_uid34_fpSinCosXTest_b <= expX_uid186_rrx_uid34_fpSinCosXTest_in(30 downto 23);

	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_inputreg(DELAY,1412)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid186_rrx_uid34_fpSinCosXTest_b, xout => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt(COUNTER,1414)
    -- every=1, low=0, high=11, step=1, init=1
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_i = 10 THEN
                      ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_i <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_i - 11;
                    ELSE
                        ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_i <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_i,4));


	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdreg(REG,1415)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdreg_q <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux(MUX,1416)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_s <= en;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux: PROCESS (ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_s, ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdreg_q, ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_q <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_q <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem(DUALMEM,1413)
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_ia <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_inputreg_q;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_aa <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdreg_q;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_ab <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_rdmux_q;
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 8,
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
        clocken1 => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_iq,
        address_a => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_aa,
        data_a => ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_ia
    );
    ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_reset0 <= areset;
        ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_q <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_iq(7 downto 0);

	--zs_uid244_lzcZSin_uid66_fpSinCosXTest(CONSTANT,243)
    zs_uid244_lzcZSin_uid66_fpSinCosXTest_q <= "00000000000000000000000000000000";

	--ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor(LOGICAL,1396)
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_b <= ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_sticky_ena_q;
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_q <= not (ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_a or ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_b);

	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg(REG,1318)
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_sticky_ena(REG,1397)
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_nor_q = "1") THEN
                ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd(LOGICAL,1398)
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_a <= ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_sticky_ena_q;
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_b <= en;
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_q <= ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_a and ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_b;

	--ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_inputreg(DELAY,1388)
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => R_uid167_px_uid33_fpSinCosXTest_q, xout => ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt(COUNTER,1314)
    -- every=1, low=0, high=1, step=1, init=1
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_i <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_i,1));


	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg(REG,1315)
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux(MUX,1316)
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_s <= en;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux: PROCESS (ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_s, ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q, ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
                  WHEN "1" => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem(DUALMEM,1389)
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_ia <= ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_inputreg_q;
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_iq,
        address_a => ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_aa,
        data_a => ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_ia
    );
    ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_reset0 <= areset;
        ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_q <= ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_iq(31 downto 0);

	--fracX_uid187_rrx_uid34_fpSinCosXTest(BITSELECT,186)@4
    fracX_uid187_rrx_uid34_fpSinCosXTest_in <= ld_R_uid167_px_uid33_fpSinCosXTest_q_to_fracX_uid187_rrx_uid34_fpSinCosXTest_a_replace_mem_q(22 downto 0);
    fracX_uid187_rrx_uid34_fpSinCosXTest_b <= fracX_uid187_rrx_uid34_fpSinCosXTest_in(22 downto 0);

	--oFracX_uid197_uid197_rrx_uid34_fpSinCosXTest(BITJOIN,196)@4
    oFracX_uid197_uid197_rrx_uid34_fpSinCosXTest_q <= VCC_q & fracX_uid187_rrx_uid34_fpSinCosXTest_b;

	--prod_uid198_rrx_uid34_fpSinCosXTest_b_0(BITSELECT,518)@4
    prod_uid198_rrx_uid34_fpSinCosXTest_b_0_in <= STD_LOGIC_VECTOR("000" & oFracX_uid197_uid197_rrx_uid34_fpSinCosXTest_q);
    prod_uid198_rrx_uid34_fpSinCosXTest_b_0_b <= prod_uid198_rrx_uid34_fpSinCosXTest_b_0_in(26 downto 0);

	--reg_prod_uid198_rrx_uid34_fpSinCosXTest_b_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_1(REG,539)@4
    reg_prod_uid198_rrx_uid34_fpSinCosXTest_b_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid198_rrx_uid34_fpSinCosXTest_b_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid198_rrx_uid34_fpSinCosXTest_b_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_1_q <= prod_uid198_rrx_uid34_fpSinCosXTest_b_0_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasMwShift_uid24_fpSinCosXTest(CONSTANT,23)
    cstBiasMwShift_uid24_fpSinCosXTest_q <= "01110011";

	--expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest(SUB,191)@0
    expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_a <= STD_LOGIC_VECTOR("0" & expX_uid186_rrx_uid34_fpSinCosXTest_b);
    expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_b <= STD_LOGIC_VECTOR("0" & cstBiasMwShift_uid24_fpSinCosXTest_q);
            expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_a) - UNSIGNED(expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_b));
    expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_q <= expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_o(8 downto 0);


	--expXTableAddr_uid193_rrx_uid34_fpSinCosXTest(BITSELECT,192)@0
    expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_in <= expXTableAddrExt_uid192_rrx_uid34_fpSinCosXTest_q(7 downto 0);
    expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_b <= expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_in(7 downto 0);

	--reg_expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_0_to_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0(REG,534)@0
    reg_expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_0_to_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_0_to_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_0_to_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_q <= expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem(DUALMEM,514)@1
    rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_ia <= (others => '0');
    rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_aa <= (others => '0');
    rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_ab <= reg_expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_0_to_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_q;
    rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_dmem : altsyncram
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
        init_file => "fp_sincos_s5_rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_reset0,
        clock0 => clk,
        address_b => rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_iq,
        address_a => rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_aa,
        data_a => rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_ia
    );
    rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_reset0 <= areset;
        rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_q <= rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_iq(39 downto 0);

	--reg_rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_1(REG,537)@3
    reg_rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_1_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_1_q <= rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem(DUALMEM,513)@1
    rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_ia <= (others => '0');
    rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_aa <= (others => '0');
    rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_ab <= reg_expXTableAddr_uid193_rrx_uid34_fpSinCosXTest_0_to_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_q;
    rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_dmem : altsyncram
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
        init_file => "fp_sincos_s5_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_reset0,
        clock0 => clk,
        address_b => rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_iq,
        address_a => rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_aa,
        data_a => rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_ia
    );
    rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_reset0 <= areset;
        rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_q <= rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_iq(39 downto 0);

	--reg_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_0(REG,536)@3
    reg_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_0_q <= rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid196_rrx_uid34_fpSinCosXTest(BITJOIN,195)@4
    os_uid196_rrx_uid34_fpSinCosXTest_q <= reg_rrTable_uid195_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_1_q & reg_rrTable_uid194_rrx_uid34_fpSinCosXTest_lutmem_0_to_os_uid196_rrx_uid34_fpSinCosXTest_0_q;

	--prod_uid198_rrx_uid34_fpSinCosXTest_a_2(BITSELECT,517)@4
    prod_uid198_rrx_uid34_fpSinCosXTest_a_2_in <= STD_LOGIC_VECTOR("0" & os_uid196_rrx_uid34_fpSinCosXTest_q);
    prod_uid198_rrx_uid34_fpSinCosXTest_a_2_b <= prod_uid198_rrx_uid34_fpSinCosXTest_a_2_in(80 downto 54);

	--reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_2_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_0(REG,542)@4
    reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_2_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_2_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_2_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_a_2_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0(MULT,521)@5
    prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_pr <= UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_a) * UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_b);
    prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_a <= (others => '0');
            prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_b <= (others => '0');
            prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_a <= reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_2_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_0_q;
                prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_b <= reg_prod_uid198_rrx_uid34_fpSinCosXTest_b_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_1_q;
                prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_s1 <= STD_LOGIC_VECTOR(prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q_to_prod_uid198_rrx_uid34_fpSinCosXTest_align_2_a(DELAY,1145)@8
    ld_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q_to_prod_uid198_rrx_uid34_fpSinCosXTest_align_2_a : dspba_delay
    GENERIC MAP ( width => 54, depth => 1 )
    PORT MAP ( xin => prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q, xout => ld_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q_to_prod_uid198_rrx_uid34_fpSinCosXTest_align_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--prod_uid198_rrx_uid34_fpSinCosXTest_align_2(BITSHIFT,524)@9
    prod_uid198_rrx_uid34_fpSinCosXTest_align_2_q_int <= ld_prod_uid198_rrx_uid34_fpSinCosXTest_a2_b0_q_to_prod_uid198_rrx_uid34_fpSinCosXTest_align_2_a_q & "000000000000000000000000000000000000000000000000000000";
    prod_uid198_rrx_uid34_fpSinCosXTest_align_2_q <= prod_uid198_rrx_uid34_fpSinCosXTest_align_2_q_int(107 downto 0);

	--prod_uid198_rrx_uid34_fpSinCosXTest_a_1(BITSELECT,516)@4
    prod_uid198_rrx_uid34_fpSinCosXTest_a_1_in <= os_uid196_rrx_uid34_fpSinCosXTest_q(53 downto 0);
    prod_uid198_rrx_uid34_fpSinCosXTest_a_1_b <= prod_uid198_rrx_uid34_fpSinCosXTest_a_1_in(53 downto 27);

	--reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_1_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_0(REG,540)@4
    reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_1_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_1_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_1_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_a_1_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0(MULT,520)@5
    prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_pr <= UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_a) * UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_b);
    prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_a <= (others => '0');
            prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_b <= (others => '0');
            prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_a <= reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_1_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_0_q;
                prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_b <= reg_prod_uid198_rrx_uid34_fpSinCosXTest_b_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_1_q;
                prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_s1 <= STD_LOGIC_VECTOR(prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prod_uid198_rrx_uid34_fpSinCosXTest_align_1(BITSHIFT,523)@8
    prod_uid198_rrx_uid34_fpSinCosXTest_align_1_q_int <= prod_uid198_rrx_uid34_fpSinCosXTest_a1_b0_q & "000000000000000000000000000";
    prod_uid198_rrx_uid34_fpSinCosXTest_align_1_q <= prod_uid198_rrx_uid34_fpSinCosXTest_align_1_q_int(80 downto 0);

	--prod_uid198_rrx_uid34_fpSinCosXTest_a_0(BITSELECT,515)@4
    prod_uid198_rrx_uid34_fpSinCosXTest_a_0_in <= os_uid196_rrx_uid34_fpSinCosXTest_q(26 downto 0);
    prod_uid198_rrx_uid34_fpSinCosXTest_a_0_b <= prod_uid198_rrx_uid34_fpSinCosXTest_a_0_in(26 downto 0);

	--reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_0(REG,538)@4
    reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_a_0_b;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0(MULT,519)@5
    prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_pr <= UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_a) * UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_b);
    prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_a <= (others => '0');
            prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_b <= (others => '0');
            prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_a <= reg_prod_uid198_rrx_uid34_fpSinCosXTest_a_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_0_q;
                prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_b <= reg_prod_uid198_rrx_uid34_fpSinCosXTest_b_0_0_to_prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_1_q;
                prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_s1 <= STD_LOGIC_VECTOR(prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--prod_uid198_rrx_uid34_fpSinCosXTest_align_0(BITSHIFT,522)@8
    prod_uid198_rrx_uid34_fpSinCosXTest_align_0_q_int <= prod_uid198_rrx_uid34_fpSinCosXTest_a0_b0_q;
    prod_uid198_rrx_uid34_fpSinCosXTest_align_0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_align_0_q_int(53 downto 0);

	--prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0(ADD,525)@8
    prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_a <= STD_LOGIC_VECTOR("0000000000000000000000000000" & prod_uid198_rrx_uid34_fpSinCosXTest_align_0_q);
    prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & prod_uid198_rrx_uid34_fpSinCosXTest_align_1_q);
    prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_a) + UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_b));
        END IF;
    END PROCESS;
    prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_o(81 downto 0);


	--prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0(ADD,526)@9
    prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_a <= STD_LOGIC_VECTOR("000000000000000000000000000" & prod_uid198_rrx_uid34_fpSinCosXTest_result_add_0_0_q);
    prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_b <= STD_LOGIC_VECTOR("0" & prod_uid198_rrx_uid34_fpSinCosXTest_align_2_q);
            prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_a) + UNSIGNED(prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_b));
    prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_q <= prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_o(108 downto 0);


	--multFracBits_uid199_rrx_uid34_fpSinCosXTest(BITSELECT,198)@9
    multFracBits_uid199_rrx_uid34_fpSinCosXTest_in <= prod_uid198_rrx_uid34_fpSinCosXTest_result_add_1_0_q(77 downto 0);
    multFracBits_uid199_rrx_uid34_fpSinCosXTest_b <= multFracBits_uid199_rrx_uid34_fpSinCosXTest_in(77 downto 0);

	--multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest(BITSELECT,199)@9
    multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_in <= multFracBits_uid199_rrx_uid34_fpSinCosXTest_b;
    multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_b <= multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_in(77 downto 46);

	--reg_multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_0_to_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_1(REG,544)@9
    reg_multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_0_to_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_0_to_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_0_to_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q <= multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest(LOGICAL,433)@10
    vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_a <= reg_multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_0_to_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q;
    vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= zs_uid244_lzcZSin_uid66_fpSinCosXTest_q;
    vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= "1" when vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_a = vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_b else "0";

	--ld_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_a(DELAY,1178)@10
    ld_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q, xout => ld_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5(REG,555)@12
    reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_q <= ld_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_a_q;
            END IF;
        END IF;
    END PROCESS;


	--zs_uid250_lzcZSin_uid66_fpSinCosXTest(CONSTANT,249)
    zs_uid250_lzcZSin_uid66_fpSinCosXTest_q <= "0000000000000000";

	--mO_uid435_zCount_uid201_rrx_uid34_fpSinCosXTest(CONSTANT,434)
    mO_uid435_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= "11111111111111111111111111111111";

	--vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest(MUX,436)@10
    vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_s <= vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest: PROCESS (vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_s, en, reg_multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_0_to_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q, mO_uid435_zCount_uid201_rrx_uid34_fpSinCosXTest_q)
    BEGIN
            CASE vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= reg_multFracBitsTop_uid200_rrx_uid34_fpSinCosXTest_0_to_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q;
                  WHEN "1" => vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= mO_uid435_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
                  WHEN OTHERS => vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,438)@10
    rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_in(31 downto 16);

	--reg_rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_1(REG,546)@10
    reg_rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q <= rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest(LOGICAL,439)@11
    vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_a <= reg_rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q;
    vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= zs_uid250_lzcZSin_uid66_fpSinCosXTest_q;
    vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= "1" when vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_a = vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_b else "0";

	--reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4(REG,554)@11
    reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q <= vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_e(DELAY,1081)@12
    ld_reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q, xout => ld_reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllZWE_uid8_fpSinCosXTest(CONSTANT,7)
    cstAllZWE_uid8_fpSinCosXTest_q <= "00000000";

	--vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,440)@10
    vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid437_zCount_uid201_rrx_uid34_fpSinCosXTest_q(15 downto 0);
    vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_in(15 downto 0);

	--reg_vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_3(REG,548)@10
    reg_vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q <= vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest(MUX,442)@11
    vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_s <= vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest: PROCESS (vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_s, en, reg_rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q, reg_vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q)
    BEGIN
            CASE vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= reg_rVStage_uid439_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_1_q;
                  WHEN "1" => vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= reg_vStage_uid441_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q;
                  WHEN OTHERS => vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,444)@11
    rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_in(15 downto 8);

	--vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest(LOGICAL,445)@11
    vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_a <= rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
    vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= cstAllZWE_uid8_fpSinCosXTest_q;
    vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q_i <= "1" when vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_a = vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_b else "0";
    vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q, xin => vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_d(DELAY,1080)@12
    ld_vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q, xout => ld_vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest(CONSTANT,212)
    leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q <= "0000";

	--vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,446)@11
    vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid443_zCount_uid201_rrx_uid34_fpSinCosXTest_q(7 downto 0);
    vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_in(7 downto 0);

	--reg_vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_3(REG,550)@11
    reg_vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q <= vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_2(REG,549)@11
    reg_rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q <= rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest(MUX,448)@12
    vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_s <= vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest: PROCESS (vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_s, en, reg_rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q, reg_vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q)
    BEGIN
            CASE vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= reg_rVStage_uid445_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q;
                  WHEN "1" => vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= reg_vStage_uid447_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q;
                  WHEN OTHERS => vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,450)@12
    rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest_in(7 downto 4);

	--vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest(LOGICAL,451)@12
    vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_a <= rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
    vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q;
    vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= "1" when vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_a = vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_b else "0";

	--reg_vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_2(REG,553)@12
    reg_vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q <= vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest(CONSTANT,226)
    leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q <= "00";

	--vStage_uid453_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,452)@12
    vStage_uid453_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid449_zCount_uid201_rrx_uid34_fpSinCosXTest_q(3 downto 0);
    vStage_uid453_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= vStage_uid453_zCount_uid201_rrx_uid34_fpSinCosXTest_in(3 downto 0);

	--vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest(MUX,454)@12
    vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_s <= vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest: PROCESS (vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_s, en, rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest_b, vStage_uid453_zCount_uid201_rrx_uid34_fpSinCosXTest_b)
    BEGIN
            CASE vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= rVStage_uid451_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
                  WHEN "1" => vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= vStage_uid453_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
                  WHEN OTHERS => vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,456)@12
    rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_in(3 downto 2);

	--vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest(LOGICAL,457)@12
    vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_a <= rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
    vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q;
    vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_q_i <= "1" when vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_a = vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_b else "0";
    vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_q, xin => vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,458)@12
    vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid455_zCount_uid201_rrx_uid34_fpSinCosXTest_q(1 downto 0);
    vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_in(1 downto 0);

	--reg_vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_3(REG,552)@12
    reg_vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q <= vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_2(REG,551)@12
    reg_rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q <= rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest(MUX,460)@13
    vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_s <= vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest: PROCESS (vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_s, en, reg_rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q, reg_vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q)
    BEGIN
            CASE vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= reg_rVStage_uid457_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q;
                  WHEN "1" => vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= reg_vStage_uid459_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_3_q;
                  WHEN OTHERS => vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid463_zCount_uid201_rrx_uid34_fpSinCosXTest(BITSELECT,462)@13
    rVStage_uid463_zCount_uid201_rrx_uid34_fpSinCosXTest_in <= vStagei_uid461_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    rVStage_uid463_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= rVStage_uid463_zCount_uid201_rrx_uid34_fpSinCosXTest_in(1 downto 1);

	--vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest(LOGICAL,463)@13
    vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_a <= rVStage_uid463_zCount_uid201_rrx_uid34_fpSinCosXTest_b;
    vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_b <= GND_q;
    vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= "1" when vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_a = vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_b else "0";

	--r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest(BITJOIN,464)@13
    r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_q <= reg_vCount_uid434_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_5_q & ld_reg_vCount_uid440_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_4_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_e_q & ld_vCount_uid446_zCount_uid201_rrx_uid34_fpSinCosXTest_q_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_d_q & reg_vCount_uid452_zCount_uid201_rrx_uid34_fpSinCosXTest_0_to_r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_2_q & vCount_uid458_zCount_uid201_rrx_uid34_fpSinCosXTest_q & vCount_uid464_zCount_uid201_rrx_uid34_fpSinCosXTest_q;

	--cstBiasM1_uid23_fpSinCosXTest(CONSTANT,22)
    cstBiasM1_uid23_fpSinCosXTest_q <= "01111110";

	--expCompOutExt_uid204_rrx_uid34_fpSinCosXTest(SUB,203)@13
    expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_fpSinCosXTest_q);
    expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_b <= STD_LOGIC_VECTOR("000" & r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_q);
            expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_a) - UNSIGNED(expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_b));
    expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_q <= expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_o(8 downto 0);


	--expCompOut_uid205_rrx_uid34_fpSinCosXTest(BITSELECT,204)@13
    expCompOut_uid205_rrx_uid34_fpSinCosXTest_in <= expCompOutExt_uid204_rrx_uid34_fpSinCosXTest_q(7 downto 0);
    expCompOut_uid205_rrx_uid34_fpSinCosXTest_b <= expCompOut_uid205_rrx_uid34_fpSinCosXTest_in(7 downto 0);

	--reg_expCompOut_uid205_rrx_uid34_fpSinCosXTest_0_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_2(REG,564)@13
    reg_expCompOut_uid205_rrx_uid34_fpSinCosXTest_0_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expCompOut_uid205_rrx_uid34_fpSinCosXTest_0_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expCompOut_uid205_rrx_uid34_fpSinCosXTest_0_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_2_q <= expCompOut_uid205_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--xBranch_uid191_rrx_uid34_fpSinCosXTest(COMPARE,190)@0
    xBranch_uid191_rrx_uid34_fpSinCosXTest_cin <= GND_q;
    xBranch_uid191_rrx_uid34_fpSinCosXTest_a <= STD_LOGIC_VECTOR("00" & cstBiasMwShift_uid24_fpSinCosXTest_q) & '0';
    xBranch_uid191_rrx_uid34_fpSinCosXTest_b <= STD_LOGIC_VECTOR("00" & expX_uid186_rrx_uid34_fpSinCosXTest_b) & xBranch_uid191_rrx_uid34_fpSinCosXTest_cin(0);
            xBranch_uid191_rrx_uid34_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xBranch_uid191_rrx_uid34_fpSinCosXTest_a) - UNSIGNED(xBranch_uid191_rrx_uid34_fpSinCosXTest_b));
    xBranch_uid191_rrx_uid34_fpSinCosXTest_n(0) <= not xBranch_uid191_rrx_uid34_fpSinCosXTest_o(10);


	--reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1(REG,563)@0
    reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q <= xBranch_uid191_rrx_uid34_fpSinCosXTest_n;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_b(DELAY,829)@1
    ld_reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q, xout => ld_reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalExp_uid209_rrx_uid34_fpSinCosXTest(MUX,208)@14
    finalExp_uid209_rrx_uid34_fpSinCosXTest_s <= ld_reg_xBranch_uid191_rrx_uid34_fpSinCosXTest_2_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_1_q_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_b_q;
    finalExp_uid209_rrx_uid34_fpSinCosXTest: PROCESS (finalExp_uid209_rrx_uid34_fpSinCosXTest_s, en, reg_expCompOut_uid205_rrx_uid34_fpSinCosXTest_0_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_2_q, ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_q)
    BEGIN
            CASE finalExp_uid209_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "0" => finalExp_uid209_rrx_uid34_fpSinCosXTest_q <= reg_expCompOut_uid205_rrx_uid34_fpSinCosXTest_0_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_2_q;
                  WHEN "1" => finalExp_uid209_rrx_uid34_fpSinCosXTest_q <= ld_expX_uid186_rrx_uid34_fpSinCosXTest_b_to_finalExp_uid209_rrx_uid34_fpSinCosXTest_d_replace_mem_q;
                  WHEN OTHERS => finalExp_uid209_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_finalExp_uid209_rrx_uid34_fpSinCosXTest_q_to_RRangeRed_uid210_rrx_uid34_fpSinCosXTest_b(DELAY,833)@14
    ld_finalExp_uid209_rrx_uid34_fpSinCosXTest_q_to_RRangeRed_uid210_rrx_uid34_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => finalExp_uid209_rrx_uid34_fpSinCosXTest_q, xout => ld_finalExp_uid209_rrx_uid34_fpSinCosXTest_q_to_RRangeRed_uid210_rrx_uid34_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor(LOGICAL,1409)
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_b <= ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_sticky_ena_q;
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_q <= not (ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_a or ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_b);

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_mem_top(CONSTANT,1279)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_mem_top_q <= "01000";

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp(LOGICAL,1280)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_mem_top_q;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_q);
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_q <= "1" when ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_a = ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_b else "0";

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmpReg(REG,1281)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmpReg_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_sticky_ena(REG,1410)
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_nor_q = "1") THEN
                ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_sticky_ena_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd(LOGICAL,1411)
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_a <= ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_sticky_ena_q;
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_b <= en;
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_q <= ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_a and ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_b;

	--ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_inputreg(DELAY,1399)
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid187_rrx_uid34_fpSinCosXTest_b, xout => ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt(COUNTER,1275)
    -- every=1, low=0, high=8, step=1, init=1
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_i = 7 THEN
                      ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_eq = '1') THEN
                        ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_i <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_i - 8;
                    ELSE
                        ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_i <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_i,4));


	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg(REG,1276)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux(MUX,1277)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_s <= en;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux: PROCESS (ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_s, ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg_q, ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg_q;
                  WHEN "1" => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem(DUALMEM,1400)
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_ia <= ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_inputreg_q;
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_aa <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg_q;
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_ab <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_q;
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_ia
    );
    ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_q <= ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_iq(22 downto 0);

	--ZerosGB_uid206_rrx_uid34_fpSinCosXTest(CONSTANT,205)
    ZerosGB_uid206_rrx_uid34_fpSinCosXTest_q <= "000000000000000000000000000000";

	--fracXRExt_uid207_rrx_uid34_fpSinCosXTest(BITJOIN,206)@15
    fracXRExt_uid207_rrx_uid34_fpSinCosXTest_q <= ld_fracX_uid187_rrx_uid34_fpSinCosXTest_b_to_fracXRExt_uid207_rrx_uid34_fpSinCosXTest_b_replace_mem_q & ZerosGB_uid206_rrx_uid34_fpSinCosXTest_q;

	--ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor(LOGICAL,1499)
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b <= ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q;
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q <= not (ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a or ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b);

	--ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena(REG,1500)
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q = "1") THEN
                ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd(LOGICAL,1501)
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a <= ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q;
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b <= en;
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q <= ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a and ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b;

	--X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,474)@9
    X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= multFracBits_uid199_rrx_uid34_fpSinCosXTest_b(29 downto 0);
    X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_in(29 downto 0);

	--ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg(DELAY,1491)
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b, xout => ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem(DUALMEM,1492)
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia <= ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q;
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 30,
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
        clocken1 => ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia
    );
    ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q <= ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq(29 downto 0);

	--leftShiftStage0Idx3Pad48_uid474_normMult_uid202_rrx_uid34_fpSinCosXTest(CONSTANT,473)
    leftShiftStage0Idx3Pad48_uid474_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= "000000000000000000000000000000000000000000000000";

	--leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,475)@13
    leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= ld_X29dto0_uid475_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q & leftShiftStage0Idx3Pad48_uid474_normMult_uid202_rrx_uid34_fpSinCosXTest_q;

	--ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor(LOGICAL,1488)
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b <= ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q;
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q <= not (ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a or ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b);

	--ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena(REG,1489)
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q = "1") THEN
                ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd(LOGICAL,1490)
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a <= ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q;
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b <= en;
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q <= ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a and ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b;

	--X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,471)@9
    X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= multFracBits_uid199_rrx_uid34_fpSinCosXTest_b(45 downto 0);
    X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_in(45 downto 0);

	--ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg(DELAY,1480)
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 46, depth => 1 )
    PORT MAP ( xin => X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b, xout => ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem(DUALMEM,1481)
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia <= ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q;
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia
    );
    ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q <= ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq(45 downto 0);

	--leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,472)@13
    leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= ld_X45dto0_uid472_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q & zs_uid244_lzcZSin_uid66_fpSinCosXTest_q;

	--ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor(LOGICAL,1477)
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b <= ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q;
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q <= not (ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_a or ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_b);

	--ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena(REG,1478)
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_nor_q = "1") THEN
                ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd(LOGICAL,1479)
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a <= ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_sticky_ena_q;
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b <= en;
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q <= ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_a and ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_b;

	--X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,468)@9
    X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= multFracBits_uid199_rrx_uid34_fpSinCosXTest_b(61 downto 0);
    X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_in(61 downto 0);

	--ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg(DELAY,1469)
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 62, depth => 1 )
    PORT MAP ( xin => X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b, xout => ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem(DUALMEM,1470)
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia <= ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_inputreg_q;
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 62,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 62,
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
        clocken1 => ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_ia
    );
    ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q <= ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_iq(61 downto 0);

	--leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,469)@13
    leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= ld_X61dto0_uid469_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_b_replace_mem_q & zs_uid250_lzcZSin_uid66_fpSinCosXTest_q;

	--ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor(LOGICAL,1510)
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_b <= ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_sticky_ena_q;
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_q <= not (ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_a or ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_b);

	--ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_sticky_ena(REG,1511)
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_nor_q = "1") THEN
                ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd(LOGICAL,1512)
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_a <= ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_sticky_ena_q;
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_b <= en;
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_q <= ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_a and ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_b;

	--ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_inputreg(DELAY,1502)
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 78, depth => 1 )
    PORT MAP ( xin => multFracBits_uid199_rrx_uid34_fpSinCosXTest_b, xout => ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem(DUALMEM,1503)
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_ia <= ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_inputreg_q;
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 78,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 78,
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
        clocken1 => ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_iq,
        address_a => ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_aa,
        data_a => ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_ia
    );
    ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_reset0 <= areset;
        ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_q <= ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_iq(77 downto 0);

	--leftShiftStageSel5Dto4_uid477_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,476)@13
    leftShiftStageSel5Dto4_uid477_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_q;
    leftShiftStageSel5Dto4_uid477_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= leftShiftStageSel5Dto4_uid477_normMult_uid202_rrx_uid34_fpSinCosXTest_in(5 downto 4);

	--leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest(MUX,477)@13
    leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_s <= leftShiftStageSel5Dto4_uid477_normMult_uid202_rrx_uid34_fpSinCosXTest_b;
    leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest: PROCESS (leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_s, en, ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_q, leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_q, leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_q, leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= ld_multFracBits_uid199_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= leftShiftStage0Idx1_uid470_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
                  WHEN "10" => leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= leftShiftStage0Idx2_uid473_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
                  WHEN "11" => leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= leftShiftStage0Idx3_uid476_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage065dto0_uid486_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,485)@13
    LeftShiftStage065dto0_uid486_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q(65 downto 0);
    LeftShiftStage065dto0_uid486_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= LeftShiftStage065dto0_uid486_normMult_uid202_rrx_uid34_fpSinCosXTest_in(65 downto 0);

	--leftShiftStage0Idx3Pad12_uid219_fxpX_uid48_fpSinCosXTest(CONSTANT,218)
    leftShiftStage0Idx3Pad12_uid219_fxpX_uid48_fpSinCosXTest_q <= "000000000000";

	--leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,486)@13
    leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= LeftShiftStage065dto0_uid486_normMult_uid202_rrx_uid34_fpSinCosXTest_b & leftShiftStage0Idx3Pad12_uid219_fxpX_uid48_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_5(REG,560)@13
    reg_leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_5_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_5_q <= leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage069dto0_uid483_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,482)@13
    LeftShiftStage069dto0_uid483_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q(69 downto 0);
    LeftShiftStage069dto0_uid483_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= LeftShiftStage069dto0_uid483_normMult_uid202_rrx_uid34_fpSinCosXTest_in(69 downto 0);

	--leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,483)@13
    leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= LeftShiftStage069dto0_uid483_normMult_uid202_rrx_uid34_fpSinCosXTest_b & cstAllZWE_uid8_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_4(REG,559)@13
    reg_leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_4_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_4_q <= leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage073dto0_uid480_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,479)@13
    LeftShiftStage073dto0_uid480_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q(73 downto 0);
    LeftShiftStage073dto0_uid480_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= LeftShiftStage073dto0_uid480_normMult_uid202_rrx_uid34_fpSinCosXTest_in(73 downto 0);

	--leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,480)@13
    leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= LeftShiftStage073dto0_uid480_normMult_uid202_rrx_uid34_fpSinCosXTest_b & leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_3(REG,558)@13
    reg_leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_3_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_3_q <= leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_2(REG,557)@13
    reg_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q <= leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,487)@13
    leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_1(REG,556)@13
    reg_leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_1_q <= leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest(MUX,488)@14
    leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_s <= reg_leftShiftStageSel3Dto2_uid488_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_1_q;
    leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest: PROCESS (leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_s, en, reg_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q, reg_leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_3_q, reg_leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_4_q, reg_leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= reg_leftShiftStage0_uid478_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q;
                  WHEN "01" => leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= reg_leftShiftStage1Idx1_uid481_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_3_q;
                  WHEN "10" => leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= reg_leftShiftStage1Idx2_uid484_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_4_q;
                  WHEN "11" => leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= reg_leftShiftStage1Idx3_uid487_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,496)@14
    LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q(74 downto 0);
    LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_in(74 downto 0);

	--ld_LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_b(DELAY,1112)@14
    ld_LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 75, depth => 1 )
    PORT MAP ( xin => LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_b, xout => ld_LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad3_uid230_fxpX_uid48_fpSinCosXTest(CONSTANT,229)
    leftShiftStage1Idx3Pad3_uid230_fxpX_uid48_fpSinCosXTest_q <= "000";

	--leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,497)@15
    leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= ld_LeftShiftStage174dto0_uid497_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q & leftShiftStage1Idx3Pad3_uid230_fxpX_uid48_fpSinCosXTest_q;

	--LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,493)@14
    LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q(75 downto 0);
    LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_in(75 downto 0);

	--ld_LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_b(DELAY,1110)@14
    ld_LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 76, depth => 1 )
    PORT MAP ( xin => LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_b, xout => ld_LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,494)@15
    leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= ld_LeftShiftStage175dto0_uid494_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q & leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q;

	--LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,490)@14
    LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q(76 downto 0);
    LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_in(76 downto 0);

	--ld_LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_b(DELAY,1108)@14
    ld_LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 77, depth => 1 )
    PORT MAP ( xin => LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_b, xout => ld_LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest(BITJOIN,491)@15
    leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= ld_LeftShiftStage176dto0_uid491_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_b_q & GND_q;

	--reg_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_2(REG,562)@14
    reg_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q <= leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest(BITSELECT,498)@13
    leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_in <= r_uid465_zCount_uid201_rrx_uid34_fpSinCosXTest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_b <= leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_a(DELAY,1184)@13
    ld_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_b, xout => ld_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1(REG,561)@14
    reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_q <= ld_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest(MUX,499)@15
    leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_s <= reg_leftShiftStageSel1Dto0_uid499_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_1_q;
    leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest: PROCESS (leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_s, en, reg_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q, leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_q, leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_q, leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= reg_leftShiftStage1_uid489_normMult_uid202_rrx_uid34_fpSinCosXTest_0_to_leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_2_q;
                  WHEN "01" => leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= leftShiftStage2Idx1_uid492_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
                  WHEN "10" => leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= leftShiftStage2Idx2_uid495_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
                  WHEN "11" => leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= leftShiftStage2Idx3_uid498_normMult_uid202_rrx_uid34_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracCompOut_uid203_rrx_uid34_fpSinCosXTest(BITSELECT,202)@15
    fracCompOut_uid203_rrx_uid34_fpSinCosXTest_in <= leftShiftStage2_uid500_normMult_uid202_rrx_uid34_fpSinCosXTest_q(76 downto 0);
    fracCompOut_uid203_rrx_uid34_fpSinCosXTest_b <= fracCompOut_uid203_rrx_uid34_fpSinCosXTest_in(76 downto 24);

	--ld_xBranch_uid191_rrx_uid34_fpSinCosXTest_n_to_finalFrac_uid208_rrx_uid34_fpSinCosXTest_b(DELAY,826)@0
    ld_xBranch_uid191_rrx_uid34_fpSinCosXTest_n_to_finalFrac_uid208_rrx_uid34_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => xBranch_uid191_rrx_uid34_fpSinCosXTest_n, xout => ld_xBranch_uid191_rrx_uid34_fpSinCosXTest_n_to_finalFrac_uid208_rrx_uid34_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalFrac_uid208_rrx_uid34_fpSinCosXTest(MUX,207)@15
    finalFrac_uid208_rrx_uid34_fpSinCosXTest_s <= ld_xBranch_uid191_rrx_uid34_fpSinCosXTest_n_to_finalFrac_uid208_rrx_uid34_fpSinCosXTest_b_q;
    finalFrac_uid208_rrx_uid34_fpSinCosXTest: PROCESS (finalFrac_uid208_rrx_uid34_fpSinCosXTest_s, en, fracCompOut_uid203_rrx_uid34_fpSinCosXTest_b, fracXRExt_uid207_rrx_uid34_fpSinCosXTest_q)
    BEGIN
            CASE finalFrac_uid208_rrx_uid34_fpSinCosXTest_s IS
                  WHEN "0" => finalFrac_uid208_rrx_uid34_fpSinCosXTest_q <= fracCompOut_uid203_rrx_uid34_fpSinCosXTest_b;
                  WHEN "1" => finalFrac_uid208_rrx_uid34_fpSinCosXTest_q <= fracXRExt_uid207_rrx_uid34_fpSinCosXTest_q;
                  WHEN OTHERS => finalFrac_uid208_rrx_uid34_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RRangeRed_uid210_rrx_uid34_fpSinCosXTest(BITJOIN,209)@15
    RRangeRed_uid210_rrx_uid34_fpSinCosXTest_q <= GND_q & ld_finalExp_uid209_rrx_uid34_fpSinCosXTest_q_to_RRangeRed_uid210_rrx_uid34_fpSinCosXTest_b_q & finalFrac_uid208_rrx_uid34_fpSinCosXTest_q;

	--expXRR_uid38_fpSinCosXTest(BITSELECT,37)@15
    expXRR_uid38_fpSinCosXTest_in <= RRangeRed_uid210_rrx_uid34_fpSinCosXTest_q(60 downto 0);
    expXRR_uid38_fpSinCosXTest_b <= expXRR_uid38_fpSinCosXTest_in(60 downto 53);

	--reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1(REG,565)@15
    reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q <= expXRR_uid38_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--cstBiasMwShiftM2_uid26_fpSinCosXTest(CONSTANT,25)
    cstBiasMwShiftM2_uid26_fpSinCosXTest_q <= "01110000";

	--cosXIsOneXRR_uid42_fpSinCosXTest(COMPARE,41)@16
    cosXIsOneXRR_uid42_fpSinCosXTest_cin <= GND_q;
    cosXIsOneXRR_uid42_fpSinCosXTest_a <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid26_fpSinCosXTest_q) & '0';
    cosXIsOneXRR_uid42_fpSinCosXTest_b <= STD_LOGIC_VECTOR((10 downto 8 => reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q(7)) & reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q) & cosXIsOneXRR_uid42_fpSinCosXTest_cin(0);
            cosXIsOneXRR_uid42_fpSinCosXTest_o <= STD_LOGIC_VECTOR(SIGNED(cosXIsOneXRR_uid42_fpSinCosXTest_a) - SIGNED(cosXIsOneXRR_uid42_fpSinCosXTest_b));
    cosXIsOneXRR_uid42_fpSinCosXTest_n(0) <= not cosXIsOneXRR_uid42_fpSinCosXTest_o(11);


	--exp_uid9_fpSinCosXTest(BITSELECT,8)@0
    exp_uid9_fpSinCosXTest_in <= a(30 downto 0);
    exp_uid9_fpSinCosXTest_b <= exp_uid9_fpSinCosXTest_in(30 downto 23);

	--sinXIsX_uid40_fpSinCosXTest(COMPARE,39)@0
    sinXIsX_uid40_fpSinCosXTest_cin <= GND_q;
    sinXIsX_uid40_fpSinCosXTest_a <= STD_LOGIC_VECTOR("00" & cstBiasMwShift_uid24_fpSinCosXTest_q) & '0';
    sinXIsX_uid40_fpSinCosXTest_b <= STD_LOGIC_VECTOR("00" & exp_uid9_fpSinCosXTest_b) & sinXIsX_uid40_fpSinCosXTest_cin(0);
            sinXIsX_uid40_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sinXIsX_uid40_fpSinCosXTest_a) - UNSIGNED(sinXIsX_uid40_fpSinCosXTest_b));
    sinXIsX_uid40_fpSinCosXTest_n(0) <= not sinXIsX_uid40_fpSinCosXTest_o(10);


	--ld_sinXIsX_uid40_fpSinCosXTest_n_to_cosXONe_uid148_fpSinCosXTest_a(DELAY,789)@0
    ld_sinXIsX_uid40_fpSinCosXTest_n_to_cosXONe_uid148_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => sinXIsX_uid40_fpSinCosXTest_n, xout => ld_sinXIsX_uid40_fpSinCosXTest_n_to_cosXONe_uid148_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--cosXONe_uid148_fpSinCosXTest(LOGICAL,147)@16
    cosXONe_uid148_fpSinCosXTest_a <= ld_sinXIsX_uid40_fpSinCosXTest_n_to_cosXONe_uid148_fpSinCosXTest_a_q;
    cosXONe_uid148_fpSinCosXTest_b <= cosXIsOneXRR_uid42_fpSinCosXTest_n;
    cosXONe_uid148_fpSinCosXTest_q <= cosXONe_uid148_fpSinCosXTest_a or cosXONe_uid148_fpSinCosXTest_b;

	--ld_cosXONe_uid148_fpSinCosXTest_q_to_InvCosXONe_uid149_fpSinCosXTest_a(DELAY,791)@16
    ld_cosXONe_uid148_fpSinCosXTest_q_to_InvCosXONe_uid149_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => cosXONe_uid148_fpSinCosXTest_q, xout => ld_cosXONe_uid148_fpSinCosXTest_q_to_InvCosXONe_uid149_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--InvCosXONe_uid149_fpSinCosXTest(LOGICAL,148)@20
    InvCosXONe_uid149_fpSinCosXTest_a <= ld_cosXONe_uid148_fpSinCosXTest_q_to_InvCosXONe_uid149_fpSinCosXTest_a_q;
    InvCosXONe_uid149_fpSinCosXTest_q <= not InvCosXONe_uid149_fpSinCosXTest_a;

	--cstZwShiftP1_uid27_fpSinCosXTest(CONSTANT,26)
    cstZwShiftP1_uid27_fpSinCosXTest_q <= "00000000000000";

	--fracXRR_uid39_fpSinCosXTest(BITSELECT,38)@15
    fracXRR_uid39_fpSinCosXTest_in <= RRangeRed_uid210_rrx_uid34_fpSinCosXTest_q(52 downto 0);
    fracXRR_uid39_fpSinCosXTest_b <= fracXRR_uid39_fpSinCosXTest_in(52 downto 0);

	--ld_fracXRR_uid39_fpSinCosXTest_b_to_oFracXRR_uid43_uid43_fpSinCosXTest_a(DELAY,668)@15
    ld_fracXRR_uid39_fpSinCosXTest_b_to_oFracXRR_uid43_uid43_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 53, depth => 1 )
    PORT MAP ( xin => fracXRR_uid39_fpSinCosXTest_b, xout => ld_fracXRR_uid39_fpSinCosXTest_b_to_oFracXRR_uid43_uid43_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracXRR_uid43_uid43_fpSinCosXTest(BITJOIN,42)@16
    oFracXRR_uid43_uid43_fpSinCosXTest_q <= VCC_q & ld_fracXRR_uid39_fpSinCosXTest_b_to_oFracXRR_uid43_uid43_fpSinCosXTest_a_q;

	--extendedFracX_uid47_fpSinCosXTest(BITJOIN,46)@16
    extendedFracX_uid47_fpSinCosXTest_q <= cstZwShiftP1_uid27_fpSinCosXTest_q & oFracXRR_uid43_uid43_fpSinCosXTest_q;

	--X55dto0_uid220_fxpX_uid48_fpSinCosXTest(BITSELECT,219)@16
    X55dto0_uid220_fxpX_uid48_fpSinCosXTest_in <= extendedFracX_uid47_fpSinCosXTest_q(55 downto 0);
    X55dto0_uid220_fxpX_uid48_fpSinCosXTest_b <= X55dto0_uid220_fxpX_uid48_fpSinCosXTest_in(55 downto 0);

	--leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest(BITJOIN,220)@16
    leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_q <= X55dto0_uid220_fxpX_uid48_fpSinCosXTest_b & leftShiftStage0Idx3Pad12_uid219_fxpX_uid48_fpSinCosXTest_q;

	--reg_leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_5(REG,571)@16
    reg_leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_5_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_5_q <= leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X59dto0_uid217_fxpX_uid48_fpSinCosXTest(BITSELECT,216)@16
    X59dto0_uid217_fxpX_uid48_fpSinCosXTest_in <= extendedFracX_uid47_fpSinCosXTest_q(59 downto 0);
    X59dto0_uid217_fxpX_uid48_fpSinCosXTest_b <= X59dto0_uid217_fxpX_uid48_fpSinCosXTest_in(59 downto 0);

	--leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest(BITJOIN,217)@16
    leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_q <= X59dto0_uid217_fxpX_uid48_fpSinCosXTest_b & cstAllZWE_uid8_fpSinCosXTest_q;

	--reg_leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_4(REG,570)@16
    reg_leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_4_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_4_q <= leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X63dto0_uid214_fxpX_uid48_fpSinCosXTest(BITSELECT,213)@16
    X63dto0_uid214_fxpX_uid48_fpSinCosXTest_in <= extendedFracX_uid47_fpSinCosXTest_q(63 downto 0);
    X63dto0_uid214_fxpX_uid48_fpSinCosXTest_b <= X63dto0_uid214_fxpX_uid48_fpSinCosXTest_in(63 downto 0);

	--leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest(BITJOIN,214)@16
    leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_q <= X63dto0_uid214_fxpX_uid48_fpSinCosXTest_b & leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q;

	--reg_leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_3(REG,569)@16
    reg_leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_3_q <= leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_extendedFracX_uid47_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_2(REG,568)@16
    reg_extendedFracX_uid47_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_extendedFracX_uid47_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_extendedFracX_uid47_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_2_q <= extendedFracX_uid47_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--fxpXShiftValExt_uid45_fpSinCosXTest(SUB,44)@16
    fxpXShiftValExt_uid45_fpSinCosXTest_a <= STD_LOGIC_VECTOR((10 downto 8 => reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q(7)) & reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q);
    fxpXShiftValExt_uid45_fpSinCosXTest_b <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid26_fpSinCosXTest_q);
            fxpXShiftValExt_uid45_fpSinCosXTest_o <= STD_LOGIC_VECTOR(SIGNED(fxpXShiftValExt_uid45_fpSinCosXTest_a) - SIGNED(fxpXShiftValExt_uid45_fpSinCosXTest_b));
    fxpXShiftValExt_uid45_fpSinCosXTest_q <= fxpXShiftValExt_uid45_fpSinCosXTest_o(9 downto 0);


	--fxpXShiftVal_uid46_fpSinCosXTest(BITSELECT,45)@16
    fxpXShiftVal_uid46_fpSinCosXTest_in <= fxpXShiftValExt_uid45_fpSinCosXTest_q(3 downto 0);
    fxpXShiftVal_uid46_fpSinCosXTest_b <= fxpXShiftVal_uid46_fpSinCosXTest_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest(BITSELECT,221)@16
    leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_in <= fxpXShiftVal_uid46_fpSinCosXTest_b;
    leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_b <= leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_1(REG,567)@16
    reg_leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_1_q <= leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest(MUX,222)@17
    leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_s <= reg_leftShiftStageSel3Dto2_uid222_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_1_q;
    leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest: PROCESS (leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_s, en, reg_extendedFracX_uid47_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_2_q, reg_leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_3_q, reg_leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_4_q, reg_leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_5_q)
    BEGIN
            CASE leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q <= reg_extendedFracX_uid47_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_2_q;
                  WHEN "01" => leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q <= reg_leftShiftStage0Idx1_uid215_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_3_q;
                  WHEN "10" => leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q <= reg_leftShiftStage0Idx2_uid218_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_4_q;
                  WHEN "11" => leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q <= reg_leftShiftStage0Idx3_uid221_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_5_q;
                  WHEN OTHERS => leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest(BITSELECT,230)@17
    LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_in <= leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q(64 downto 0);
    LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_b <= LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_in(64 downto 0);

	--ld_LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_b(DELAY,851)@17
    ld_LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_b, xout => ld_LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest(BITJOIN,231)@18
    leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_q <= ld_LeftShiftStage064dto0_uid231_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_b_q & leftShiftStage1Idx3Pad3_uid230_fxpX_uid48_fpSinCosXTest_q;

	--LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest(BITSELECT,227)@17
    LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_in <= leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q(65 downto 0);
    LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_b <= LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_in(65 downto 0);

	--ld_LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_b(DELAY,849)@17
    ld_LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 66, depth => 1 )
    PORT MAP ( xin => LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_b, xout => ld_LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest(BITJOIN,228)@18
    leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_q <= ld_LeftShiftStage065dto0_uid228_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_b_q & leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q;

	--LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest(BITSELECT,224)@17
    LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_in <= leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q(66 downto 0);
    LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_b <= LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_in(66 downto 0);

	--ld_LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_b(DELAY,847)@17
    ld_LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 67, depth => 1 )
    PORT MAP ( xin => LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_b, xout => ld_LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest(BITJOIN,225)@18
    leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_q <= ld_LeftShiftStage066dto0_uid225_fxpX_uid48_fpSinCosXTest_b_to_leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_b_q & GND_q;

	--reg_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_2(REG,573)@17
    reg_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_2_q <= leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest(BITSELECT,232)@16
    leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_in <= fxpXShiftVal_uid46_fpSinCosXTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_b <= leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_a(DELAY,1195)@16
    ld_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_b, xout => ld_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1(REG,572)@17
    reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_q <= ld_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_b_to_reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest(MUX,233)@18
    leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_s <= reg_leftShiftStageSel1Dto0_uid233_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_1_q;
    leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest: PROCESS (leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_s, en, reg_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_2_q, leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_q, leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_q, leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_q <= reg_leftShiftStage0_uid223_fxpX_uid48_fpSinCosXTest_0_to_leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_2_q;
                  WHEN "01" => leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_q <= leftShiftStage1Idx1_uid226_fxpX_uid48_fpSinCosXTest_q;
                  WHEN "10" => leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_q <= leftShiftStage1Idx2_uid229_fxpX_uid48_fpSinCosXTest_q;
                  WHEN "11" => leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_q <= leftShiftStage1Idx3_uid232_fxpX_uid48_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid50_fpSinCosXTest(BITSELECT,49)@18
    y_uid50_fpSinCosXTest_in <= leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_q(66 downto 0);
    y_uid50_fpSinCosXTest_b <= y_uid50_fpSinCosXTest_in(66 downto 1);

	--ld_y_uid50_fpSinCosXTest_b_to_cmpYToOneMinusY_uid57_fpSinCosXTest_b(DELAY,680)@18
    ld_y_uid50_fpSinCosXTest_b_to_cmpYToOneMinusY_uid57_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 66, depth => 2 )
    PORT MAP ( xin => y_uid50_fpSinCosXTest_b, xout => ld_y_uid50_fpSinCosXTest_b_to_cmpYToOneMinusY_uid57_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_y_uid50_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_1(REG,575)@18
    reg_y_uid50_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid50_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_1_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_y_uid50_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_1_q <= y_uid50_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--pad_one_uid55_fpSinCosXTest(BITJOIN,54)@18
    pad_one_uid55_fpSinCosXTest_q <= VCC_q & STD_LOGIC_VECTOR((65 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_one_uid55_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_0(REG,574)@18
    reg_pad_one_uid55_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_one_uid55_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_0_q <= "0000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_one_uid55_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_0_q <= pad_one_uid55_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oneMinusY_uid55_fpSinCosXTest(SUB,55)@19
    oneMinusY_uid55_fpSinCosXTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_one_uid55_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_0_q);
    oneMinusY_uid55_fpSinCosXTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid50_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_1_q);
            oneMinusY_uid55_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oneMinusY_uid55_fpSinCosXTest_a) - UNSIGNED(oneMinusY_uid55_fpSinCosXTest_b));
    oneMinusY_uid55_fpSinCosXTest_q <= oneMinusY_uid55_fpSinCosXTest_o(67 downto 0);


	--reg_oneMinusY_uid55_fpSinCosXTest_0_to_cmpYToOneMinusY_uid57_fpSinCosXTest_0(REG,576)@19
    reg_oneMinusY_uid55_fpSinCosXTest_0_to_cmpYToOneMinusY_uid57_fpSinCosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oneMinusY_uid55_fpSinCosXTest_0_to_cmpYToOneMinusY_uid57_fpSinCosXTest_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oneMinusY_uid55_fpSinCosXTest_0_to_cmpYToOneMinusY_uid57_fpSinCosXTest_0_q <= oneMinusY_uid55_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--cmpYToOneMinusY_uid57_fpSinCosXTest(COMPARE,56)@20
    cmpYToOneMinusY_uid57_fpSinCosXTest_cin <= GND_q;
    cmpYToOneMinusY_uid57_fpSinCosXTest_a <= STD_LOGIC_VECTOR("00" & reg_oneMinusY_uid55_fpSinCosXTest_0_to_cmpYToOneMinusY_uid57_fpSinCosXTest_0_q) & '0';
    cmpYToOneMinusY_uid57_fpSinCosXTest_b <= STD_LOGIC_VECTOR("0000" & ld_y_uid50_fpSinCosXTest_b_to_cmpYToOneMinusY_uid57_fpSinCosXTest_b_q) & cmpYToOneMinusY_uid57_fpSinCosXTest_cin(0);
            cmpYToOneMinusY_uid57_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpYToOneMinusY_uid57_fpSinCosXTest_a) - UNSIGNED(cmpYToOneMinusY_uid57_fpSinCosXTest_b));
    cmpYToOneMinusY_uid57_fpSinCosXTest_c(0) <= cmpYToOneMinusY_uid57_fpSinCosXTest_o(70);


	--InvCmpYToOneMinusY_uid61_fpSinCosXTest(LOGICAL,60)@20
    InvCmpYToOneMinusY_uid61_fpSinCosXTest_a <= cmpYToOneMinusY_uid57_fpSinCosXTest_c;
    InvCmpYToOneMinusY_uid61_fpSinCosXTest_q <= not InvCmpYToOneMinusY_uid61_fpSinCosXTest_a;

	--intXParity_uid49_fpSinCosXTest(BITSELECT,48)@18
    intXParity_uid49_fpSinCosXTest_in <= leftShiftStage1_uid234_fxpX_uid48_fpSinCosXTest_q;
    intXParity_uid49_fpSinCosXTest_b <= intXParity_uid49_fpSinCosXTest_in(67 downto 67);

	--ld_intXParity_uid49_fpSinCosXTest_b_to_signRCond2_uid152_fpSinCosXTest_b(DELAY,794)@18
    ld_intXParity_uid49_fpSinCosXTest_b_to_signRCond2_uid152_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => intXParity_uid49_fpSinCosXTest_b, xout => ld_intXParity_uid49_fpSinCosXTest_b_to_signRCond2_uid152_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--yIsZero_uid51_fpSinCosXTest(LOGICAL,50)@19
    yIsZero_uid51_fpSinCosXTest_a <= reg_y_uid50_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_1_q;
    yIsZero_uid51_fpSinCosXTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000000000000000000000000" & GND_q);
    yIsZero_uid51_fpSinCosXTest_q <= "1" when yIsZero_uid51_fpSinCosXTest_a = yIsZero_uid51_fpSinCosXTest_b else "0";

	--ld_yIsZero_uid51_fpSinCosXTest_q_to_InvYIsZero_uid151_fpSinCosXTest_a(DELAY,792)@19
    ld_yIsZero_uid51_fpSinCosXTest_q_to_InvYIsZero_uid151_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => yIsZero_uid51_fpSinCosXTest_q, xout => ld_yIsZero_uid51_fpSinCosXTest_q_to_InvYIsZero_uid151_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvYIsZero_uid151_fpSinCosXTest(LOGICAL,150)@20
    InvYIsZero_uid151_fpSinCosXTest_a <= ld_yIsZero_uid51_fpSinCosXTest_q_to_InvYIsZero_uid151_fpSinCosXTest_a_q;
    InvYIsZero_uid151_fpSinCosXTest_q <= not InvYIsZero_uid151_fpSinCosXTest_a;

	--signRCond2_uid152_fpSinCosXTest(LOGICAL,151)@20
    signRCond2_uid152_fpSinCosXTest_a <= InvYIsZero_uid151_fpSinCosXTest_q;
    signRCond2_uid152_fpSinCosXTest_b <= ld_intXParity_uid49_fpSinCosXTest_b_to_signRCond2_uid152_fpSinCosXTest_b_q;
    signRCond2_uid152_fpSinCosXTest_c <= InvCmpYToOneMinusY_uid61_fpSinCosXTest_q;
    signRCond2_uid152_fpSinCosXTest_d <= InvCosXONe_uid149_fpSinCosXTest_q;
    signRCond2_uid152_fpSinCosXTest_q_i <= signRCond2_uid152_fpSinCosXTest_a and signRCond2_uid152_fpSinCosXTest_b and signRCond2_uid152_fpSinCosXTest_c and signRCond2_uid152_fpSinCosXTest_d;
    signRCond2_uid152_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => signRCond2_uid152_fpSinCosXTest_q, xin => signRCond2_uid152_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--InvIntXParity_uid155_fpSinCosXTest(LOGICAL,154)@20
    InvIntXParity_uid155_fpSinCosXTest_a <= ld_intXParity_uid49_fpSinCosXTest_b_to_signRCond2_uid152_fpSinCosXTest_b_q;
    InvIntXParity_uid155_fpSinCosXTest_q <= not InvIntXParity_uid155_fpSinCosXTest_a;

	--signRCond1_uid157_fpSinCosXTest(LOGICAL,156)@20
    signRCond1_uid157_fpSinCosXTest_a <= InvYIsZero_uid151_fpSinCosXTest_q;
    signRCond1_uid157_fpSinCosXTest_b <= InvIntXParity_uid155_fpSinCosXTest_q;
    signRCond1_uid157_fpSinCosXTest_c <= cmpYToOneMinusY_uid57_fpSinCosXTest_c;
    signRCond1_uid157_fpSinCosXTest_d <= InvCosXONe_uid149_fpSinCosXTest_q;
    signRCond1_uid157_fpSinCosXTest_q_i <= signRCond1_uid157_fpSinCosXTest_a and signRCond1_uid157_fpSinCosXTest_b and signRCond1_uid157_fpSinCosXTest_c and signRCond1_uid157_fpSinCosXTest_d;
    signRCond1_uid157_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => signRCond1_uid157_fpSinCosXTest_q, xin => signRCond1_uid157_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--signRCos_uid158_fpSinCosXTest(LOGICAL,157)@21
    signRCos_uid158_fpSinCosXTest_a <= signRCond1_uid157_fpSinCosXTest_q;
    signRCos_uid158_fpSinCosXTest_b <= signRCond2_uid152_fpSinCosXTest_q;
    signRCos_uid158_fpSinCosXTest_q <= signRCos_uid158_fpSinCosXTest_a or signRCos_uid158_fpSinCosXTest_b;

	--cstAllZWF_uid7_fpSinCosXTest(CONSTANT,6)
    cstAllZWF_uid7_fpSinCosXTest_q <= "00000000000000000000000";

	--frac_uid13_fpSinCosXTest(BITSELECT,12)@0
    frac_uid13_fpSinCosXTest_in <= a(22 downto 0);
    frac_uid13_fpSinCosXTest_b <= frac_uid13_fpSinCosXTest_in(22 downto 0);

	--fracXIsZero_uid14_fpSinCosXTest(LOGICAL,13)@0
    fracXIsZero_uid14_fpSinCosXTest_a <= frac_uid13_fpSinCosXTest_b;
    fracXIsZero_uid14_fpSinCosXTest_b <= cstAllZWF_uid7_fpSinCosXTest_q;
    fracXIsZero_uid14_fpSinCosXTest_q <= "1" when fracXIsZero_uid14_fpSinCosXTest_a = fracXIsZero_uid14_fpSinCosXTest_b else "0";

	--cstAllOWE_uid6_fpSinCosXTest(CONSTANT,5)
    cstAllOWE_uid6_fpSinCosXTest_q <= "11111111";

	--expXIsMax_uid12_fpSinCosXTest(LOGICAL,11)@0
    expXIsMax_uid12_fpSinCosXTest_a <= exp_uid9_fpSinCosXTest_b;
    expXIsMax_uid12_fpSinCosXTest_b <= cstAllOWE_uid6_fpSinCosXTest_q;
    expXIsMax_uid12_fpSinCosXTest_q <= "1" when expXIsMax_uid12_fpSinCosXTest_a = expXIsMax_uid12_fpSinCosXTest_b else "0";

	--exc_I_uid15_fpSinCosXTest(LOGICAL,14)@0
    exc_I_uid15_fpSinCosXTest_a <= expXIsMax_uid12_fpSinCosXTest_q;
    exc_I_uid15_fpSinCosXTest_b <= fracXIsZero_uid14_fpSinCosXTest_q;
    exc_I_uid15_fpSinCosXTest_q <= exc_I_uid15_fpSinCosXTest_a and exc_I_uid15_fpSinCosXTest_b;

	--ld_exc_I_uid15_fpSinCosXTest_q_to_InvExc_I_uid131_fpSinCosXTest_a(DELAY,762)@0
    ld_exc_I_uid15_fpSinCosXTest_q_to_InvExc_I_uid131_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 20 )
    PORT MAP ( xin => exc_I_uid15_fpSinCosXTest_q, xout => ld_exc_I_uid15_fpSinCosXTest_q_to_InvExc_I_uid131_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_I_uid131_fpSinCosXTest(LOGICAL,130)@20
    InvExc_I_uid131_fpSinCosXTest_a <= ld_exc_I_uid15_fpSinCosXTest_q_to_InvExc_I_uid131_fpSinCosXTest_a_q;
    InvExc_I_uid131_fpSinCosXTest_q <= not InvExc_I_uid131_fpSinCosXTest_a;

	--reg_InvExc_I_uid131_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_2(REG,649)@20
    reg_InvExc_I_uid131_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_InvExc_I_uid131_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_InvExc_I_uid131_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_2_q <= InvExc_I_uid131_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--InvFracXIsZero_uid16_fpSinCosXTest(LOGICAL,15)@0
    InvFracXIsZero_uid16_fpSinCosXTest_a <= fracXIsZero_uid14_fpSinCosXTest_q;
    InvFracXIsZero_uid16_fpSinCosXTest_q <= not InvFracXIsZero_uid16_fpSinCosXTest_a;

	--exc_N_uid17_fpSinCosXTest(LOGICAL,16)@0
    exc_N_uid17_fpSinCosXTest_a <= expXIsMax_uid12_fpSinCosXTest_q;
    exc_N_uid17_fpSinCosXTest_b <= InvFracXIsZero_uid16_fpSinCosXTest_q;
    exc_N_uid17_fpSinCosXTest_q <= exc_N_uid17_fpSinCosXTest_a and exc_N_uid17_fpSinCosXTest_b;

	--ld_exc_N_uid17_fpSinCosXTest_q_to_InvExc_N_uid132_fpSinCosXTest_a(DELAY,763)@0
    ld_exc_N_uid17_fpSinCosXTest_q_to_InvExc_N_uid132_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 20 )
    PORT MAP ( xin => exc_N_uid17_fpSinCosXTest_q, xout => ld_exc_N_uid17_fpSinCosXTest_q_to_InvExc_N_uid132_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid132_fpSinCosXTest(LOGICAL,131)@20
    InvExc_N_uid132_fpSinCosXTest_a <= ld_exc_N_uid17_fpSinCosXTest_q_to_InvExc_N_uid132_fpSinCosXTest_a_q;
    InvExc_N_uid132_fpSinCosXTest_q <= not InvExc_N_uid132_fpSinCosXTest_a;

	--reg_InvExc_N_uid132_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_1(REG,648)@20
    reg_InvExc_N_uid132_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_InvExc_N_uid132_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_InvExc_N_uid132_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_1_q <= InvExc_N_uid132_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--signRCosFull_uid161_fpSinCosXTest(LOGICAL,160)@21
    signRCosFull_uid161_fpSinCosXTest_a <= reg_InvExc_N_uid132_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_1_q;
    signRCosFull_uid161_fpSinCosXTest_b <= reg_InvExc_I_uid131_fpSinCosXTest_0_to_signRCosFull_uid161_fpSinCosXTest_2_q;
    signRCosFull_uid161_fpSinCosXTest_c <= signRCos_uid158_fpSinCosXTest_q;
    signRCosFull_uid161_fpSinCosXTest_q <= signRCosFull_uid161_fpSinCosXTest_a and signRCosFull_uid161_fpSinCosXTest_b and signRCosFull_uid161_fpSinCosXTest_c;

	--ld_signRCosFull_uid161_fpSinCosXTest_q_to_fpCos_uid162_fpSinCosXTest_c(DELAY,809)@21
    ld_signRCosFull_uid161_fpSinCosXTest_q_to_fpCos_uid162_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => signRCosFull_uid161_fpSinCosXTest_q, xout => ld_signRCosFull_uid161_fpSinCosXTest_q_to_fpCos_uid162_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstBias_uid22_fpSinCosXTest(CONSTANT,21)
    cstBias_uid22_fpSinCosXTest_q <= "01111111";

	--ld_oneMinusY_uid55_fpSinCosXTest_q_to_zSinOMyBottom_uid58_fpSinCosXTest_a(DELAY,681)@19
    ld_oneMinusY_uid55_fpSinCosXTest_q_to_zSinOMyBottom_uid58_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 68, depth => 1 )
    PORT MAP ( xin => oneMinusY_uid55_fpSinCosXTest_q, xout => ld_oneMinusY_uid55_fpSinCosXTest_q_to_zSinOMyBottom_uid58_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--zSinOMyBottom_uid58_fpSinCosXTest(BITSELECT,57)@20
    zSinOMyBottom_uid58_fpSinCosXTest_in <= ld_oneMinusY_uid55_fpSinCosXTest_q_to_zSinOMyBottom_uid58_fpSinCosXTest_a_q(64 downto 0);
    zSinOMyBottom_uid58_fpSinCosXTest_b <= zSinOMyBottom_uid58_fpSinCosXTest_in(64 downto 0);

	--reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3(REG,579)@20
    reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3_q <= zSinOMyBottom_uid58_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--zSinYBottom_uid59_fpSinCosXTest(BITSELECT,58)@20
    zSinYBottom_uid59_fpSinCosXTest_in <= ld_y_uid50_fpSinCosXTest_b_to_cmpYToOneMinusY_uid57_fpSinCosXTest_b_q(64 downto 0);
    zSinYBottom_uid59_fpSinCosXTest_b <= zSinYBottom_uid59_fpSinCosXTest_in(64 downto 0);

	--reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2(REG,578)@20
    reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2_q <= zSinYBottom_uid59_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_InvCmpYToOneMinusY_uid61_fpSinCosXTest_0_to_zCos_uid64_fpSinCosXTest_1(REG,614)@20
    reg_InvCmpYToOneMinusY_uid61_fpSinCosXTest_0_to_zCos_uid64_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_InvCmpYToOneMinusY_uid61_fpSinCosXTest_0_to_zCos_uid64_fpSinCosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_InvCmpYToOneMinusY_uid61_fpSinCosXTest_0_to_zCos_uid64_fpSinCosXTest_1_q <= InvCmpYToOneMinusY_uid61_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--zCos_uid64_fpSinCosXTest(MUX,63)@21
    zCos_uid64_fpSinCosXTest_s <= reg_InvCmpYToOneMinusY_uid61_fpSinCosXTest_0_to_zCos_uid64_fpSinCosXTest_1_q;
    zCos_uid64_fpSinCosXTest: PROCESS (zCos_uid64_fpSinCosXTest_s, en, reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2_q, reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3_q)
    BEGIN
            CASE zCos_uid64_fpSinCosXTest_s IS
                  WHEN "0" => zCos_uid64_fpSinCosXTest_q <= reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2_q;
                  WHEN "1" => zCos_uid64_fpSinCosXTest_q <= reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3_q;
                  WHEN OTHERS => zCos_uid64_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--addr_uid83_fpSinCosXTest(BITSELECT,82)@21
    addr_uid83_fpSinCosXTest_in <= zCos_uid64_fpSinCosXTest_q;
    addr_uid83_fpSinCosXTest_b <= addr_uid83_fpSinCosXTest_in(64 downto 57);

	--reg_addr_uid83_fpSinCosXTest_0_to_memoryC2_uid404_tableGencosPiZ_lutmem_0(REG,630)@21
    reg_addr_uid83_fpSinCosXTest_0_to_memoryC2_uid404_tableGencosPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid83_fpSinCosXTest_0_to_memoryC2_uid404_tableGencosPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid83_fpSinCosXTest_0_to_memoryC2_uid404_tableGencosPiZ_lutmem_0_q <= addr_uid83_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid404_tableGencosPiZ_lutmem(DUALMEM,532)@22
    memoryC2_uid404_tableGencosPiZ_lutmem_ia <= (others => '0');
    memoryC2_uid404_tableGencosPiZ_lutmem_aa <= (others => '0');
    memoryC2_uid404_tableGencosPiZ_lutmem_ab <= reg_addr_uid83_fpSinCosXTest_0_to_memoryC2_uid404_tableGencosPiZ_lutmem_0_q;
    memoryC2_uid404_tableGencosPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_sincos_s5_memoryC2_uid404_tableGencosPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid404_tableGencosPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid404_tableGencosPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid404_tableGencosPiZ_lutmem_iq,
        address_a => memoryC2_uid404_tableGencosPiZ_lutmem_aa,
        data_a => memoryC2_uid404_tableGencosPiZ_lutmem_ia
    );
    memoryC2_uid404_tableGencosPiZ_lutmem_reset0 <= areset;
        memoryC2_uid404_tableGencosPiZ_lutmem_q <= memoryC2_uid404_tableGencosPiZ_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid404_tableGencosPiZ_lutmem_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_1(REG,632)@24
    reg_memoryC2_uid404_tableGencosPiZ_lutmem_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid404_tableGencosPiZ_lutmem_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid404_tableGencosPiZ_lutmem_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_1_q <= memoryC2_uid404_tableGencosPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--zPcosPiZ_uid87_fpSinCosXTest(BITSELECT,86)@21
    zPcosPiZ_uid87_fpSinCosXTest_in <= zCos_uid64_fpSinCosXTest_q(56 downto 0);
    zPcosPiZ_uid87_fpSinCosXTest_b <= zPcosPiZ_uid87_fpSinCosXTest_in(56 downto 42);

	--yT1_uid419_polyEvalcosPiZ(BITSELECT,418)@21
    yT1_uid419_polyEvalcosPiZ_in <= zPcosPiZ_uid87_fpSinCosXTest_b;
    yT1_uid419_polyEvalcosPiZ_b <= yT1_uid419_polyEvalcosPiZ_in(14 downto 2);

	--reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0(REG,631)@21
    reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q <= yT1_uid419_polyEvalcosPiZ_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a_inputreg(DELAY,1513)
    ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q, xout => ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a(DELAY,1125)@22
    ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a_inputreg_q, xout => ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid508_pT1_uid420_polyEvalcosPiZ(MULT,507)@25
    prodXY_uid508_pT1_uid420_polyEvalcosPiZ_pr <= signed(resize(UNSIGNED(prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a),14)) * SIGNED(prodXY_uid508_pT1_uid420_polyEvalcosPiZ_b);
    prodXY_uid508_pT1_uid420_polyEvalcosPiZ_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a <= (others => '0');
            prodXY_uid508_pT1_uid420_polyEvalcosPiZ_b <= (others => '0');
            prodXY_uid508_pT1_uid420_polyEvalcosPiZ_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a <= ld_reg_yT1_uid419_polyEvalcosPiZ_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_0_q_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_a_q;
                prodXY_uid508_pT1_uid420_polyEvalcosPiZ_b <= reg_memoryC2_uid404_tableGencosPiZ_lutmem_0_to_prodXY_uid508_pT1_uid420_polyEvalcosPiZ_1_q;
                prodXY_uid508_pT1_uid420_polyEvalcosPiZ_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid508_pT1_uid420_polyEvalcosPiZ_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid508_pT1_uid420_polyEvalcosPiZ: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid508_pT1_uid420_polyEvalcosPiZ_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid508_pT1_uid420_polyEvalcosPiZ_q <= prodXY_uid508_pT1_uid420_polyEvalcosPiZ_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid509_pT1_uid420_polyEvalcosPiZ(BITSELECT,508)@28
    prodXYTruncFR_uid509_pT1_uid420_polyEvalcosPiZ_in <= prodXY_uid508_pT1_uid420_polyEvalcosPiZ_q;
    prodXYTruncFR_uid509_pT1_uid420_polyEvalcosPiZ_b <= prodXYTruncFR_uid509_pT1_uid420_polyEvalcosPiZ_in(25 downto 12);

	--highBBits_uid422_polyEvalcosPiZ(BITSELECT,421)@28
    highBBits_uid422_polyEvalcosPiZ_in <= prodXYTruncFR_uid509_pT1_uid420_polyEvalcosPiZ_b;
    highBBits_uid422_polyEvalcosPiZ_b <= highBBits_uid422_polyEvalcosPiZ_in(13 downto 1);

	--ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_a(DELAY,1256)@21
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => addr_uid83_fpSinCosXTest_b, xout => ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0(REG,633)@24
    reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_q <= ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid402_tableGencosPiZ_lutmem(DUALMEM,531)@25
    memoryC1_uid402_tableGencosPiZ_lutmem_ia <= (others => '0');
    memoryC1_uid402_tableGencosPiZ_lutmem_aa <= (others => '0');
    memoryC1_uid402_tableGencosPiZ_lutmem_ab <= reg_addr_uid83_fpSinCosXTest_0_to_memoryC1_uid402_tableGencosPiZ_lutmem_0_q;
    memoryC1_uid402_tableGencosPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_sincos_s5_memoryC1_uid402_tableGencosPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid402_tableGencosPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid402_tableGencosPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid402_tableGencosPiZ_lutmem_iq,
        address_a => memoryC1_uid402_tableGencosPiZ_lutmem_aa,
        data_a => memoryC1_uid402_tableGencosPiZ_lutmem_ia
    );
    memoryC1_uid402_tableGencosPiZ_lutmem_reset0 <= areset;
        memoryC1_uid402_tableGencosPiZ_lutmem_q <= memoryC1_uid402_tableGencosPiZ_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid402_tableGencosPiZ_lutmem_0_to_sumAHighB_uid423_polyEvalcosPiZ_0(REG,634)@27
    reg_memoryC1_uid402_tableGencosPiZ_lutmem_0_to_sumAHighB_uid423_polyEvalcosPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid402_tableGencosPiZ_lutmem_0_to_sumAHighB_uid423_polyEvalcosPiZ_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid402_tableGencosPiZ_lutmem_0_to_sumAHighB_uid423_polyEvalcosPiZ_0_q <= memoryC1_uid402_tableGencosPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid423_polyEvalcosPiZ(ADD,422)@28
    sumAHighB_uid423_polyEvalcosPiZ_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid402_tableGencosPiZ_lutmem_0_to_sumAHighB_uid423_polyEvalcosPiZ_0_q(20)) & reg_memoryC1_uid402_tableGencosPiZ_lutmem_0_to_sumAHighB_uid423_polyEvalcosPiZ_0_q);
    sumAHighB_uid423_polyEvalcosPiZ_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid422_polyEvalcosPiZ_b(12)) & highBBits_uid422_polyEvalcosPiZ_b);
            sumAHighB_uid423_polyEvalcosPiZ_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid423_polyEvalcosPiZ_a) + SIGNED(sumAHighB_uid423_polyEvalcosPiZ_b));
    sumAHighB_uid423_polyEvalcosPiZ_q <= sumAHighB_uid423_polyEvalcosPiZ_o(21 downto 0);


	--lowRangeB_uid421_polyEvalcosPiZ(BITSELECT,420)@28
    lowRangeB_uid421_polyEvalcosPiZ_in <= prodXYTruncFR_uid509_pT1_uid420_polyEvalcosPiZ_b(0 downto 0);
    lowRangeB_uid421_polyEvalcosPiZ_b <= lowRangeB_uid421_polyEvalcosPiZ_in(0 downto 0);

	--s1_uid421_uid424_polyEvalcosPiZ(BITJOIN,423)@28
    s1_uid421_uid424_polyEvalcosPiZ_q <= sumAHighB_uid423_polyEvalcosPiZ_q & lowRangeB_uid421_polyEvalcosPiZ_b;

	--reg_s1_uid421_uid424_polyEvalcosPiZ_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_1(REG,636)@28
    reg_s1_uid421_uid424_polyEvalcosPiZ_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid421_uid424_polyEvalcosPiZ_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid421_uid424_polyEvalcosPiZ_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_1_q <= s1_uid421_uid424_polyEvalcosPiZ_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor(LOGICAL,1524)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_b <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_sticky_ena_q;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_q <= not (ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_a or ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_b);

	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_mem_top(CONSTANT,1520)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_mem_top_q <= "0100";

	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp(LOGICAL,1521)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_a <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_mem_top_q;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q);
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_q <= "1" when ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_a = ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_b else "0";

	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg(REG,1522)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_sticky_ena(REG,1525)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_nor_q = "1") THEN
                ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_sticky_ena_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd(LOGICAL,1526)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_a <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_sticky_ena_q;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_b <= en;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_a and ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_b;

	--reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0(REG,635)@21
    reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q <= zPcosPiZ_uid87_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_inputreg(DELAY,1514)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q, xout => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt(COUNTER,1516)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_i = 3 THEN
                      ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_i <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_i <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_i,3));


	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg(REG,1517)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux(MUX,1518)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_s <= en;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux: PROCESS (ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_s, ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q, ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem(DUALMEM,1515)
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_ia <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_inputreg_q;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_aa <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_ab <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q;
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_iq,
        address_a => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_aa,
        data_a => ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_ia
    );
    ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_reset0 <= areset;
        ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_iq(14 downto 0);

	--prodXY_uid511_pT2_uid426_polyEvalcosPiZ(MULT,510)@29
    prodXY_uid511_pT2_uid426_polyEvalcosPiZ_pr <= signed(resize(UNSIGNED(prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a),16)) * SIGNED(prodXY_uid511_pT2_uid426_polyEvalcosPiZ_b);
    prodXY_uid511_pT2_uid426_polyEvalcosPiZ_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a <= (others => '0');
            prodXY_uid511_pT2_uid426_polyEvalcosPiZ_b <= (others => '0');
            prodXY_uid511_pT2_uid426_polyEvalcosPiZ_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_mem_q;
                prodXY_uid511_pT2_uid426_polyEvalcosPiZ_b <= reg_s1_uid421_uid424_polyEvalcosPiZ_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_1_q;
                prodXY_uid511_pT2_uid426_polyEvalcosPiZ_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid511_pT2_uid426_polyEvalcosPiZ_pr,38));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid511_pT2_uid426_polyEvalcosPiZ: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid511_pT2_uid426_polyEvalcosPiZ_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid511_pT2_uid426_polyEvalcosPiZ_q <= prodXY_uid511_pT2_uid426_polyEvalcosPiZ_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid512_pT2_uid426_polyEvalcosPiZ(BITSELECT,511)@32
    prodXYTruncFR_uid512_pT2_uid426_polyEvalcosPiZ_in <= prodXY_uid511_pT2_uid426_polyEvalcosPiZ_q;
    prodXYTruncFR_uid512_pT2_uid426_polyEvalcosPiZ_b <= prodXYTruncFR_uid512_pT2_uid426_polyEvalcosPiZ_in(37 downto 14);

	--highBBits_uid428_polyEvalcosPiZ(BITSELECT,427)@32
    highBBits_uid428_polyEvalcosPiZ_in <= prodXYTruncFR_uid512_pT2_uid426_polyEvalcosPiZ_b;
    highBBits_uid428_polyEvalcosPiZ_b <= highBBits_uid428_polyEvalcosPiZ_in(23 downto 2);

	--ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor(LOGICAL,1577)
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_b <= ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_sticky_ena_q;
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_q <= not (ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_a or ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_b);

	--ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_sticky_ena(REG,1578)
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_nor_q = "1") THEN
                ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_sticky_ena_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd(LOGICAL,1579)
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_a <= ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_sticky_ena_q;
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_b <= en;
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_q <= ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_a and ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_b;

	--ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_inputreg(DELAY,1567)
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addr_uid83_fpSinCosXTest_b, xout => ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem(DUALMEM,1568)
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_ia <= ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_inputreg_q;
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_aa <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q;
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_ab <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q;
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_iq,
        address_a => ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_aa,
        data_a => ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_ia
    );
    ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_q <= ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0(REG,637)@28
    reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_q <= ld_addr_uid83_fpSinCosXTest_b_to_reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid400_tableGencosPiZ_lutmem(DUALMEM,530)@29
    memoryC0_uid400_tableGencosPiZ_lutmem_ia <= (others => '0');
    memoryC0_uid400_tableGencosPiZ_lutmem_aa <= (others => '0');
    memoryC0_uid400_tableGencosPiZ_lutmem_ab <= reg_addr_uid83_fpSinCosXTest_0_to_memoryC0_uid400_tableGencosPiZ_lutmem_0_q;
    memoryC0_uid400_tableGencosPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_sincos_s5_memoryC0_uid400_tableGencosPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid400_tableGencosPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid400_tableGencosPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid400_tableGencosPiZ_lutmem_iq,
        address_a => memoryC0_uid400_tableGencosPiZ_lutmem_aa,
        data_a => memoryC0_uid400_tableGencosPiZ_lutmem_ia
    );
    memoryC0_uid400_tableGencosPiZ_lutmem_reset0 <= areset;
        memoryC0_uid400_tableGencosPiZ_lutmem_q <= memoryC0_uid400_tableGencosPiZ_lutmem_iq(29 downto 0);

	--reg_memoryC0_uid400_tableGencosPiZ_lutmem_0_to_sumAHighB_uid429_polyEvalcosPiZ_0(REG,638)@31
    reg_memoryC0_uid400_tableGencosPiZ_lutmem_0_to_sumAHighB_uid429_polyEvalcosPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid400_tableGencosPiZ_lutmem_0_to_sumAHighB_uid429_polyEvalcosPiZ_0_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid400_tableGencosPiZ_lutmem_0_to_sumAHighB_uid429_polyEvalcosPiZ_0_q <= memoryC0_uid400_tableGencosPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid429_polyEvalcosPiZ(ADD,428)@32
    sumAHighB_uid429_polyEvalcosPiZ_a <= STD_LOGIC_VECTOR((30 downto 30 => reg_memoryC0_uid400_tableGencosPiZ_lutmem_0_to_sumAHighB_uid429_polyEvalcosPiZ_0_q(29)) & reg_memoryC0_uid400_tableGencosPiZ_lutmem_0_to_sumAHighB_uid429_polyEvalcosPiZ_0_q);
    sumAHighB_uid429_polyEvalcosPiZ_b <= STD_LOGIC_VECTOR((30 downto 22 => highBBits_uid428_polyEvalcosPiZ_b(21)) & highBBits_uid428_polyEvalcosPiZ_b);
            sumAHighB_uid429_polyEvalcosPiZ_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid429_polyEvalcosPiZ_a) + SIGNED(sumAHighB_uid429_polyEvalcosPiZ_b));
    sumAHighB_uid429_polyEvalcosPiZ_q <= sumAHighB_uid429_polyEvalcosPiZ_o(30 downto 0);


	--lowRangeB_uid427_polyEvalcosPiZ(BITSELECT,426)@32
    lowRangeB_uid427_polyEvalcosPiZ_in <= prodXYTruncFR_uid512_pT2_uid426_polyEvalcosPiZ_b(1 downto 0);
    lowRangeB_uid427_polyEvalcosPiZ_b <= lowRangeB_uid427_polyEvalcosPiZ_in(1 downto 0);

	--s2_uid427_uid430_polyEvalcosPiZ(BITJOIN,429)@32
    s2_uid427_uid430_polyEvalcosPiZ_q <= sumAHighB_uid429_polyEvalcosPiZ_q & lowRangeB_uid427_polyEvalcosPiZ_b;

	--polyEvalSigcosPiZ_uid89_fpSinCosXTest(BITSELECT,88)@32
    polyEvalSigcosPiZ_uid89_fpSinCosXTest_in <= s2_uid427_uid430_polyEvalcosPiZ_q(30 downto 0);
    polyEvalSigcosPiZ_uid89_fpSinCosXTest_b <= polyEvalSigcosPiZ_uid89_fpSinCosXTest_in(30 downto 5);

	--reg_polyEvalSigcosPiZ_uid89_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_1(REG,640)@32
    reg_polyEvalSigcosPiZ_uid89_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_polyEvalSigcosPiZ_uid89_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_polyEvalSigcosPiZ_uid89_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_1_q <= polyEvalSigcosPiZ_uid89_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor(LOGICAL,1590)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_b <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_sticky_ena_q;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_q <= not (ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_a or ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_b);

	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_mem_top(CONSTANT,1586)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_mem_top_q <= "010";

	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp(LOGICAL,1587)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_a <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_mem_top_q;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_q);
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_q <= "1" when ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_a = ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_b else "0";

	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmpReg(REG,1588)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmpReg_q <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_sticky_ena(REG,1591)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_nor_q = "1") THEN
                ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_sticky_ena_q <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd(LOGICAL,1592)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_a <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_sticky_ena_q;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_b <= en;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_q <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_a and ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_b;

	--LeftShiftStage263dto0_uid389_alignedZCos_uid70_fpSinCosXTest(BITSELECT,388)@27
    LeftShiftStage263dto0_uid389_alignedZCos_uid70_fpSinCosXTest_in <= leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q(63 downto 0);
    LeftShiftStage263dto0_uid389_alignedZCos_uid70_fpSinCosXTest_b <= LeftShiftStage263dto0_uid389_alignedZCos_uid70_fpSinCosXTest_in(63 downto 0);

	--leftShiftStage3Idx1_uid390_alignedZCos_uid70_fpSinCosXTest(BITJOIN,389)@27
    leftShiftStage3Idx1_uid390_alignedZCos_uid70_fpSinCosXTest_q <= LeftShiftStage263dto0_uid389_alignedZCos_uid70_fpSinCosXTest_b & GND_q;

	--cstZmwFRRPwSM1_uid52_fpSinCosXTest(CONSTANT,51)
    cstZmwFRRPwSM1_uid52_fpSinCosXTest_q <= "00000000000000000000000000000000000000000000000000000000000000000";

	--ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor(LOGICAL,1455)
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_b <= ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_sticky_ena_q;
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_q <= not (ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_a or ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_b);

	--ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_sticky_ena(REG,1456)
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_nor_q = "1") THEN
                ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd(LOGICAL,1457)
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_a <= ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_sticky_ena_q;
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_b <= en;
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_q <= ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_a and ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_b;

	--X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest(BITSELECT,359)@21
    X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_in <= zCos_uid64_fpSinCosXTest_q(32 downto 0);
    X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b <= X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_in(32 downto 0);

	--ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_inputreg(DELAY,1447)
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b, xout => ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem(DUALMEM,1448)
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_ia <= ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_inputreg_q;
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_ia
    );
    ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_q <= ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_iq(32 downto 0);

	--leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest(BITJOIN,360)@25
    leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_q <= ld_X32dto0_uid360_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_b_replace_mem_q & zs_uid244_lzcZSin_uid66_fpSinCosXTest_q;

	--ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor(LOGICAL,1466)
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_b <= ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_sticky_ena_q;
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_q <= not (ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_a or ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_b);

	--ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_sticky_ena(REG,1467)
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_nor_q = "1") THEN
                ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd(LOGICAL,1468)
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_a <= ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_sticky_ena_q;
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_b <= en;
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_q <= ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_a and ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_b;

	--ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_inputreg(DELAY,1458)
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => zCos_uid64_fpSinCosXTest_q, xout => ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem(DUALMEM,1459)
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_ia <= ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_inputreg_q;
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_iq,
        address_a => ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_aa,
        data_a => ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_ia
    );
    ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_reset0 <= areset;
        ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_q <= ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_iq(64 downto 0);

	--zs_uid236_lzcZSin_uid66_fpSinCosXTest(CONSTANT,235)
    zs_uid236_lzcZSin_uid66_fpSinCosXTest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

	--rVStage_uid316_lzcZCos_uid69_fpSinCosXTest(BITSELECT,315)@21
    rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_in <= zCos_uid64_fpSinCosXTest_q;
    rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b <= rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_in(64 downto 1);

	--vCount_uid317_lzcZCos_uid69_fpSinCosXTest(LOGICAL,316)@21
    vCount_uid317_lzcZCos_uid69_fpSinCosXTest_a <= rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b;
    vCount_uid317_lzcZCos_uid69_fpSinCosXTest_b <= zs_uid236_lzcZSin_uid66_fpSinCosXTest_q;
    vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q_i <= "1" when vCount_uid317_lzcZCos_uid69_fpSinCosXTest_a = vCount_uid317_lzcZCos_uid69_fpSinCosXTest_b else "0";
    vCount_uid317_lzcZCos_uid69_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q, xin => vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_g(DELAY,985)@22
    ld_vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_g : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q, xout => ld_vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_g_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid319_lzcZCos_uid69_fpSinCosXTest(BITSELECT,318)@21
    vStage_uid319_lzcZCos_uid69_fpSinCosXTest_in <= zCos_uid64_fpSinCosXTest_q(0 downto 0);
    vStage_uid319_lzcZCos_uid69_fpSinCosXTest_b <= vStage_uid319_lzcZCos_uid69_fpSinCosXTest_in(0 downto 0);

	--ld_vStage_uid319_lzcZCos_uid69_fpSinCosXTest_b_to_cStage_uid320_lzcZCos_uid69_fpSinCosXTest_b(DELAY,943)@21
    ld_vStage_uid319_lzcZCos_uid69_fpSinCosXTest_b_to_cStage_uid320_lzcZCos_uid69_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vStage_uid319_lzcZCos_uid69_fpSinCosXTest_b, xout => ld_vStage_uid319_lzcZCos_uid69_fpSinCosXTest_b_to_cStage_uid320_lzcZCos_uid69_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid239_lzcZSin_uid66_fpSinCosXTest(CONSTANT,238)
    mO_uid239_lzcZSin_uid66_fpSinCosXTest_q <= "111111111111111111111111111111111111111111111111111111111111111";

	--cStage_uid320_lzcZCos_uid69_fpSinCosXTest(BITJOIN,319)@22
    cStage_uid320_lzcZCos_uid69_fpSinCosXTest_q <= ld_vStage_uid319_lzcZCos_uid69_fpSinCosXTest_b_to_cStage_uid320_lzcZCos_uid69_fpSinCosXTest_b_q & mO_uid239_lzcZSin_uid66_fpSinCosXTest_q;

	--ld_rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_c(DELAY,945)@21
    ld_rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b, xout => ld_rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid322_lzcZCos_uid69_fpSinCosXTest(MUX,321)@22
    vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_s <= vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q;
    vStagei_uid322_lzcZCos_uid69_fpSinCosXTest: PROCESS (vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_s, en, ld_rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_c_q, cStage_uid320_lzcZCos_uid69_fpSinCosXTest_q)
    BEGIN
            CASE vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_q <= ld_rVStage_uid316_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_c_q;
                  WHEN "1" => vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_q <= cStage_uid320_lzcZCos_uid69_fpSinCosXTest_q;
                  WHEN OTHERS => vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid324_lzcZCos_uid69_fpSinCosXTest(BITSELECT,323)@22
    rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_q;
    rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b <= rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_in(63 downto 32);

	--vCount_uid325_lzcZCos_uid69_fpSinCosXTest(LOGICAL,324)@22
    vCount_uid325_lzcZCos_uid69_fpSinCosXTest_a <= rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b;
    vCount_uid325_lzcZCos_uid69_fpSinCosXTest_b <= zs_uid244_lzcZSin_uid66_fpSinCosXTest_q;
    vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q_i <= "1" when vCount_uid325_lzcZCos_uid69_fpSinCosXTest_a = vCount_uid325_lzcZCos_uid69_fpSinCosXTest_b else "0";
    vCount_uid325_lzcZCos_uid69_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q, xin => vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_f(DELAY,984)@23
    ld_vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q, xout => ld_vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid326_lzcZCos_uid69_fpSinCosXTest(BITSELECT,325)@22
    vStage_uid326_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid322_lzcZCos_uid69_fpSinCosXTest_q(31 downto 0);
    vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b <= vStage_uid326_lzcZCos_uid69_fpSinCosXTest_in(31 downto 0);

	--ld_vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_d(DELAY,952)@22
    ld_vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_d : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b, xout => ld_vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_c(DELAY,951)@22
    ld_rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b, xout => ld_rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid328_lzcZCos_uid69_fpSinCosXTest(MUX,327)@23
    vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_s <= vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q;
    vStagei_uid328_lzcZCos_uid69_fpSinCosXTest: PROCESS (vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_s, en, ld_rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_c_q, ld_vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_d_q)
    BEGIN
            CASE vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_q <= ld_rVStage_uid324_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_c_q;
                  WHEN "1" => vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_q <= ld_vStage_uid326_lzcZCos_uid69_fpSinCosXTest_b_to_vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_d_q;
                  WHEN OTHERS => vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid330_lzcZCos_uid69_fpSinCosXTest(BITSELECT,329)@23
    rVStage_uid330_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_q;
    rVStage_uid330_lzcZCos_uid69_fpSinCosXTest_b <= rVStage_uid330_lzcZCos_uid69_fpSinCosXTest_in(31 downto 16);

	--vCount_uid331_lzcZCos_uid69_fpSinCosXTest(LOGICAL,330)@23
    vCount_uid331_lzcZCos_uid69_fpSinCosXTest_a <= rVStage_uid330_lzcZCos_uid69_fpSinCosXTest_b;
    vCount_uid331_lzcZCos_uid69_fpSinCosXTest_b <= zs_uid250_lzcZSin_uid66_fpSinCosXTest_q;
    vCount_uid331_lzcZCos_uid69_fpSinCosXTest_q <= "1" when vCount_uid331_lzcZCos_uid69_fpSinCosXTest_a = vCount_uid331_lzcZCos_uid69_fpSinCosXTest_b else "0";

	--reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4(REG,622)@23
    reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q <= vCount_uid331_lzcZCos_uid69_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_e(DELAY,983)@24
    ld_reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q, xout => ld_reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid332_lzcZCos_uid69_fpSinCosXTest(BITSELECT,331)@23
    vStage_uid332_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid328_lzcZCos_uid69_fpSinCosXTest_q(15 downto 0);
    vStage_uid332_lzcZCos_uid69_fpSinCosXTest_b <= vStage_uid332_lzcZCos_uid69_fpSinCosXTest_in(15 downto 0);

	--vStagei_uid334_lzcZCos_uid69_fpSinCosXTest(MUX,333)@23
    vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_s <= vCount_uid331_lzcZCos_uid69_fpSinCosXTest_q;
    vStagei_uid334_lzcZCos_uid69_fpSinCosXTest: PROCESS (vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_s, en, rVStage_uid330_lzcZCos_uid69_fpSinCosXTest_b, vStage_uid332_lzcZCos_uid69_fpSinCosXTest_b)
    BEGIN
            CASE vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_q <= rVStage_uid330_lzcZCos_uid69_fpSinCosXTest_b;
                  WHEN "1" => vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_q <= vStage_uid332_lzcZCos_uid69_fpSinCosXTest_b;
                  WHEN OTHERS => vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid336_lzcZCos_uid69_fpSinCosXTest(BITSELECT,335)@23
    rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_q;
    rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_b <= rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_in(15 downto 8);

	--reg_rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_0_to_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_1(REG,617)@23
    reg_rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_0_to_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_0_to_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_0_to_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_1_q <= rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid337_lzcZCos_uid69_fpSinCosXTest(LOGICAL,336)@24
    vCount_uid337_lzcZCos_uid69_fpSinCosXTest_a <= reg_rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_0_to_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_1_q;
    vCount_uid337_lzcZCos_uid69_fpSinCosXTest_b <= cstAllZWE_uid8_fpSinCosXTest_q;
    vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q <= "1" when vCount_uid337_lzcZCos_uid69_fpSinCosXTest_a = vCount_uid337_lzcZCos_uid69_fpSinCosXTest_b else "0";

	--ld_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_d(DELAY,982)@24
    ld_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q, xout => ld_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid338_lzcZCos_uid69_fpSinCosXTest(BITSELECT,337)@23
    vStage_uid338_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid334_lzcZCos_uid69_fpSinCosXTest_q(7 downto 0);
    vStage_uid338_lzcZCos_uid69_fpSinCosXTest_b <= vStage_uid338_lzcZCos_uid69_fpSinCosXTest_in(7 downto 0);

	--reg_vStage_uid338_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_3(REG,619)@23
    reg_vStage_uid338_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid338_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid338_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_3_q <= vStage_uid338_lzcZCos_uid69_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid340_lzcZCos_uid69_fpSinCosXTest(MUX,339)@24
    vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_s <= vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q;
    vStagei_uid340_lzcZCos_uid69_fpSinCosXTest: PROCESS (vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_s, en, reg_rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_0_to_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_1_q, reg_vStage_uid338_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_3_q)
    BEGIN
            CASE vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_q <= reg_rVStage_uid336_lzcZCos_uid69_fpSinCosXTest_0_to_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_1_q;
                  WHEN "1" => vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_q <= reg_vStage_uid338_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_3_q;
                  WHEN OTHERS => vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid342_lzcZCos_uid69_fpSinCosXTest(BITSELECT,341)@24
    rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_q;
    rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_b <= rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_in(7 downto 4);

	--vCount_uid343_lzcZCos_uid69_fpSinCosXTest(LOGICAL,342)@24
    vCount_uid343_lzcZCos_uid69_fpSinCosXTest_a <= rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_b;
    vCount_uid343_lzcZCos_uid69_fpSinCosXTest_b <= leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q;
    vCount_uid343_lzcZCos_uid69_fpSinCosXTest_q_i <= "1" when vCount_uid343_lzcZCos_uid69_fpSinCosXTest_a = vCount_uid343_lzcZCos_uid69_fpSinCosXTest_b else "0";
    vCount_uid343_lzcZCos_uid69_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid343_lzcZCos_uid69_fpSinCosXTest_q, xin => vCount_uid343_lzcZCos_uid69_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--vStage_uid344_lzcZCos_uid69_fpSinCosXTest(BITSELECT,343)@24
    vStage_uid344_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid340_lzcZCos_uid69_fpSinCosXTest_q(3 downto 0);
    vStage_uid344_lzcZCos_uid69_fpSinCosXTest_b <= vStage_uid344_lzcZCos_uid69_fpSinCosXTest_in(3 downto 0);

	--reg_vStage_uid344_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_3(REG,621)@24
    reg_vStage_uid344_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid344_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid344_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_3_q <= vStage_uid344_lzcZCos_uid69_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_2(REG,620)@24
    reg_rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_2_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_2_q <= rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid346_lzcZCos_uid69_fpSinCosXTest(MUX,345)@25
    vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_s <= vCount_uid343_lzcZCos_uid69_fpSinCosXTest_q;
    vStagei_uid346_lzcZCos_uid69_fpSinCosXTest: PROCESS (vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_s, en, reg_rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_2_q, reg_vStage_uid344_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_3_q)
    BEGIN
            CASE vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_q <= reg_rVStage_uid342_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_2_q;
                  WHEN "1" => vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_q <= reg_vStage_uid344_lzcZCos_uid69_fpSinCosXTest_0_to_vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_3_q;
                  WHEN OTHERS => vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid348_lzcZCos_uid69_fpSinCosXTest(BITSELECT,347)@25
    rVStage_uid348_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_q;
    rVStage_uid348_lzcZCos_uid69_fpSinCosXTest_b <= rVStage_uid348_lzcZCos_uid69_fpSinCosXTest_in(3 downto 2);

	--vCount_uid349_lzcZCos_uid69_fpSinCosXTest(LOGICAL,348)@25
    vCount_uid349_lzcZCos_uid69_fpSinCosXTest_a <= rVStage_uid348_lzcZCos_uid69_fpSinCosXTest_b;
    vCount_uid349_lzcZCos_uid69_fpSinCosXTest_b <= leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q;
    vCount_uid349_lzcZCos_uid69_fpSinCosXTest_q <= "1" when vCount_uid349_lzcZCos_uid69_fpSinCosXTest_a = vCount_uid349_lzcZCos_uid69_fpSinCosXTest_b else "0";

	--vStage_uid350_lzcZCos_uid69_fpSinCosXTest(BITSELECT,349)@25
    vStage_uid350_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid346_lzcZCos_uid69_fpSinCosXTest_q(1 downto 0);
    vStage_uid350_lzcZCos_uid69_fpSinCosXTest_b <= vStage_uid350_lzcZCos_uid69_fpSinCosXTest_in(1 downto 0);

	--vStagei_uid352_lzcZCos_uid69_fpSinCosXTest(MUX,351)@25
    vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_s <= vCount_uid349_lzcZCos_uid69_fpSinCosXTest_q;
    vStagei_uid352_lzcZCos_uid69_fpSinCosXTest: PROCESS (vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_s, en, rVStage_uid348_lzcZCos_uid69_fpSinCosXTest_b, vStage_uid350_lzcZCos_uid69_fpSinCosXTest_b)
    BEGIN
            CASE vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_q <= rVStage_uid348_lzcZCos_uid69_fpSinCosXTest_b;
                  WHEN "1" => vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_q <= vStage_uid350_lzcZCos_uid69_fpSinCosXTest_b;
                  WHEN OTHERS => vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid354_lzcZCos_uid69_fpSinCosXTest(BITSELECT,353)@25
    rVStage_uid354_lzcZCos_uid69_fpSinCosXTest_in <= vStagei_uid352_lzcZCos_uid69_fpSinCosXTest_q;
    rVStage_uid354_lzcZCos_uid69_fpSinCosXTest_b <= rVStage_uid354_lzcZCos_uid69_fpSinCosXTest_in(1 downto 1);

	--vCount_uid355_lzcZCos_uid69_fpSinCosXTest(LOGICAL,354)@25
    vCount_uid355_lzcZCos_uid69_fpSinCosXTest_a <= rVStage_uid354_lzcZCos_uid69_fpSinCosXTest_b;
    vCount_uid355_lzcZCos_uid69_fpSinCosXTest_b <= GND_q;
    vCount_uid355_lzcZCos_uid69_fpSinCosXTest_q <= "1" when vCount_uid355_lzcZCos_uid69_fpSinCosXTest_a = vCount_uid355_lzcZCos_uid69_fpSinCosXTest_b else "0";

	--r_uid356_lzcZCos_uid69_fpSinCosXTest(BITJOIN,355)@25
    r_uid356_lzcZCos_uid69_fpSinCosXTest_q <= ld_vCount_uid317_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_g_q & ld_vCount_uid325_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_f_q & ld_reg_vCount_uid331_lzcZCos_uid69_fpSinCosXTest_0_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_4_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_e_q & ld_vCount_uid337_lzcZCos_uid69_fpSinCosXTest_q_to_r_uid356_lzcZCos_uid69_fpSinCosXTest_d_q & vCount_uid343_lzcZCos_uid69_fpSinCosXTest_q & vCount_uid349_lzcZCos_uid69_fpSinCosXTest_q & vCount_uid355_lzcZCos_uid69_fpSinCosXTest_q;

	--leftShiftStageSel6Dto5_uid364_alignedZCos_uid70_fpSinCosXTest(BITSELECT,363)@25
    leftShiftStageSel6Dto5_uid364_alignedZCos_uid70_fpSinCosXTest_in <= r_uid356_lzcZCos_uid69_fpSinCosXTest_q;
    leftShiftStageSel6Dto5_uid364_alignedZCos_uid70_fpSinCosXTest_b <= leftShiftStageSel6Dto5_uid364_alignedZCos_uid70_fpSinCosXTest_in(6 downto 5);

	--leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest(MUX,364)@25
    leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_s <= leftShiftStageSel6Dto5_uid364_alignedZCos_uid70_fpSinCosXTest_b;
    leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest: PROCESS (leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_s, en, ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_q, leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_q, cstZmwFRRPwSM1_uid52_fpSinCosXTest_q, cstZmwFRRPwSM1_uid52_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q <= ld_zCos_uid64_fpSinCosXTest_q_to_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q <= leftShiftStage0Idx1_uid361_alignedZCos_uid70_fpSinCosXTest_q;
                  WHEN "10" => leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q <= cstZmwFRRPwSM1_uid52_fpSinCosXTest_q;
                  WHEN "11" => leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q <= cstZmwFRRPwSM1_uid52_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage040dto0_uid373_alignedZCos_uid70_fpSinCosXTest(BITSELECT,372)@25
    LeftShiftStage040dto0_uid373_alignedZCos_uid70_fpSinCosXTest_in <= leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q(40 downto 0);
    LeftShiftStage040dto0_uid373_alignedZCos_uid70_fpSinCosXTest_b <= LeftShiftStage040dto0_uid373_alignedZCos_uid70_fpSinCosXTest_in(40 downto 0);

	--leftShiftStage1Idx3Pad24_uid293_alignedZSin_uid67_fpSinCosXTest(CONSTANT,292)
    leftShiftStage1Idx3Pad24_uid293_alignedZSin_uid67_fpSinCosXTest_q <= "000000000000000000000000";

	--leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest(BITJOIN,373)@25
    leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_q <= LeftShiftStage040dto0_uid373_alignedZCos_uid70_fpSinCosXTest_b & leftShiftStage1Idx3Pad24_uid293_alignedZSin_uid67_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_5(REG,627)@25
    reg_leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_5_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_5_q <= leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage048dto0_uid370_alignedZCos_uid70_fpSinCosXTest(BITSELECT,369)@25
    LeftShiftStage048dto0_uid370_alignedZCos_uid70_fpSinCosXTest_in <= leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q(48 downto 0);
    LeftShiftStage048dto0_uid370_alignedZCos_uid70_fpSinCosXTest_b <= LeftShiftStage048dto0_uid370_alignedZCos_uid70_fpSinCosXTest_in(48 downto 0);

	--leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest(BITJOIN,370)@25
    leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_q <= LeftShiftStage048dto0_uid370_alignedZCos_uid70_fpSinCosXTest_b & zs_uid250_lzcZSin_uid66_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_4(REG,626)@25
    reg_leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_4_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_4_q <= leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage056dto0_uid367_alignedZCos_uid70_fpSinCosXTest(BITSELECT,366)@25
    LeftShiftStage056dto0_uid367_alignedZCos_uid70_fpSinCosXTest_in <= leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q(56 downto 0);
    LeftShiftStage056dto0_uid367_alignedZCos_uid70_fpSinCosXTest_b <= LeftShiftStage056dto0_uid367_alignedZCos_uid70_fpSinCosXTest_in(56 downto 0);

	--leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest(BITJOIN,367)@25
    leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_q <= LeftShiftStage056dto0_uid367_alignedZCos_uid70_fpSinCosXTest_b & cstAllZWE_uid8_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_3(REG,625)@25
    reg_leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_3_q <= leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_2(REG,624)@25
    reg_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_2_q <= leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest(BITSELECT,374)@25
    leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_in <= r_uid356_lzcZCos_uid69_fpSinCosXTest_q(4 downto 0);
    leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_b <= leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_in(4 downto 3);

	--reg_leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_1(REG,623)@25
    reg_leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_1_q <= leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest(MUX,375)@26
    leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_s <= reg_leftShiftStageSel4Dto3_uid375_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_1_q;
    leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest: PROCESS (leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_s, en, reg_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_2_q, reg_leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_3_q, reg_leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_4_q, reg_leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q <= reg_leftShiftStage0_uid365_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_2_q;
                  WHEN "01" => leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q <= reg_leftShiftStage1Idx1_uid368_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_3_q;
                  WHEN "10" => leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q <= reg_leftShiftStage1Idx2_uid371_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_4_q;
                  WHEN "11" => leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q <= reg_leftShiftStage1Idx3_uid374_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest(BITSELECT,383)@26
    LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_in <= leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q(58 downto 0);
    LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_b <= LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_in(58 downto 0);

	--ld_LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_b(DELAY,1009)@26
    ld_LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 59, depth => 1 )
    PORT MAP ( xin => LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_b, xout => ld_LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3Pad6_uid304_alignedZSin_uid67_fpSinCosXTest(CONSTANT,303)
    leftShiftStage2Idx3Pad6_uid304_alignedZSin_uid67_fpSinCosXTest_q <= "000000";

	--leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest(BITJOIN,384)@27
    leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_q <= ld_LeftShiftStage158dto0_uid384_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_b_q & leftShiftStage2Idx3Pad6_uid304_alignedZSin_uid67_fpSinCosXTest_q;

	--LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest(BITSELECT,380)@26
    LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_in <= leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q(60 downto 0);
    LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_b <= LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_in(60 downto 0);

	--ld_LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_b(DELAY,1007)@26
    ld_LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 61, depth => 1 )
    PORT MAP ( xin => LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_b, xout => ld_LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest(BITJOIN,381)@27
    leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_q <= ld_LeftShiftStage160dto0_uid381_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_b_q & leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q;

	--LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest(BITSELECT,377)@26
    LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_in <= leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q(62 downto 0);
    LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_b <= LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_in(62 downto 0);

	--ld_LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_b(DELAY,1005)@26
    ld_LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 63, depth => 1 )
    PORT MAP ( xin => LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_b, xout => ld_LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest(BITJOIN,378)@27
    leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_q <= ld_LeftShiftStage162dto0_uid378_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_b_q & leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q;

	--reg_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_2(REG,629)@26
    reg_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_2_q <= leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest(BITSELECT,385)@25
    leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_in <= r_uid356_lzcZCos_uid69_fpSinCosXTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_b <= leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1(REG,628)@25
    reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q <= leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_b(DELAY,1011)@26
    ld_reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q, xout => ld_reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest(MUX,386)@27
    leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_s <= ld_reg_leftShiftStageSel2Dto1_uid386_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_1_q_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_b_q;
    leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest: PROCESS (leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_s, en, reg_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_2_q, leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_q, leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_q, leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q <= reg_leftShiftStage1_uid376_alignedZCos_uid70_fpSinCosXTest_0_to_leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_2_q;
                  WHEN "01" => leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q <= leftShiftStage2Idx1_uid379_alignedZCos_uid70_fpSinCosXTest_q;
                  WHEN "10" => leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q <= leftShiftStage2Idx2_uid382_alignedZCos_uid70_fpSinCosXTest_q;
                  WHEN "11" => leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q <= leftShiftStage2Idx3_uid385_alignedZCos_uid70_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest(BITSELECT,390)@25
    leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_in <= r_uid356_lzcZCos_uid69_fpSinCosXTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_b <= leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_b(DELAY,1019)@25
    ld_leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_b, xout => ld_leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest(MUX,391)@27
    leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_s <= ld_leftShiftStageSel0Dto0_uid391_alignedZCos_uid70_fpSinCosXTest_b_to_leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_b_q;
    leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest: PROCESS (leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_s, en, leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q, leftShiftStage3Idx1_uid390_alignedZCos_uid70_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_s IS
                  WHEN "0" => leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_q <= leftShiftStage2_uid387_alignedZCos_uid70_fpSinCosXTest_q;
                  WHEN "1" => leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_q <= leftShiftStage3Idx1_uid390_alignedZCos_uid70_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pCos_uid77_fpSinCosXTest(BITSELECT,76)@27
    pCos_uid77_fpSinCosXTest_in <= leftShiftStage3_uid392_alignedZCos_uid70_fpSinCosXTest_q;
    pCos_uid77_fpSinCosXTest_b <= pCos_uid77_fpSinCosXTest_in(64 downto 39);

	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_inputreg(DELAY,1580)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => pCos_uid77_fpSinCosXTest_b, xout => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt(COUNTER,1582)
    -- every=1, low=0, high=2, step=1, init=1
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_i = 1 THEN
                      ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_eq = '1') THEN
                        ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_i <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_i <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_i,2));


	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdreg(REG,1583)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdreg_q <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux(MUX,1584)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_s <= en;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux: PROCESS (ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_s, ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdreg_q, ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_q <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdreg_q;
                  WHEN "1" => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_q <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem(DUALMEM,1581)
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_ia <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_inputreg_q;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_aa <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdreg_q;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_ab <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_rdmux_q;
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_iq,
        address_a => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_aa,
        data_a => ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_ia
    );
    ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_reset0 <= areset;
        ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_q <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_iq(25 downto 0);

	--reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0(REG,639)@32
    reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_q <= ld_pCos_uid77_fpSinCosXTest_b_to_reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--mulCos_uid105_fpSinCosXTest(MULT,104)@33
    mulCos_uid105_fpSinCosXTest_pr <= UNSIGNED(mulCos_uid105_fpSinCosXTest_a) * UNSIGNED(mulCos_uid105_fpSinCosXTest_b);
    mulCos_uid105_fpSinCosXTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulCos_uid105_fpSinCosXTest_a <= (others => '0');
            mulCos_uid105_fpSinCosXTest_b <= (others => '0');
            mulCos_uid105_fpSinCosXTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulCos_uid105_fpSinCosXTest_a <= reg_pCos_uid77_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_0_q;
                mulCos_uid105_fpSinCosXTest_b <= reg_polyEvalSigcosPiZ_uid89_fpSinCosXTest_0_to_mulCos_uid105_fpSinCosXTest_1_q;
                mulCos_uid105_fpSinCosXTest_s1 <= STD_LOGIC_VECTOR(mulCos_uid105_fpSinCosXTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mulCos_uid105_fpSinCosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulCos_uid105_fpSinCosXTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulCos_uid105_fpSinCosXTest_q <= mulCos_uid105_fpSinCosXTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBitCos_uid106_fpSinCosXTest(BITSELECT,105)@36
    normBitCos_uid106_fpSinCosXTest_in <= mulCos_uid105_fpSinCosXTest_q;
    normBitCos_uid106_fpSinCosXTest_b <= normBitCos_uid106_fpSinCosXTest_in(51 downto 51);

	--cosRndOp_uid112_uid113_fpSinCosXTest(BITJOIN,112)@36
    cosRndOp_uid112_uid113_fpSinCosXTest_q <= normBitCos_uid106_fpSinCosXTest_b & cstAllZWF_uid7_fpSinCosXTest_q & VCC_q;

	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor(LOGICAL,1296)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_b <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_sticky_ena_q;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_q <= not (ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_a or ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_b);

	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_mem_top(CONSTANT,1292)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_mem_top_q <= "0110";

	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp(LOGICAL,1293)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_a <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_mem_top_q;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_q);
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_q <= "1" when ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_a = ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_b else "0";

	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmpReg(REG,1294)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmpReg_q <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_sticky_ena(REG,1297)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_nor_q = "1") THEN
                ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_sticky_ena_q <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd(LOGICAL,1298)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_a <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_sticky_ena_q;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_b <= en;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_q <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_a and ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_b;

	--reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1(REG,641)@25
    reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q <= r_uid356_lzcZCos_uid69_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_inputreg(DELAY,1286)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q, xout => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt(COUNTER,1288)
    -- every=1, low=0, high=6, step=1, init=1
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_i = 5 THEN
                      ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_i <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_i <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_i,3));


	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg(REG,1289)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg_q <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux(MUX,1290)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_s <= en;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux: PROCESS (ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_s, ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg_q, ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_q <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_q <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem(DUALMEM,1287)
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_ia <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_inputreg_q;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_aa <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg_q;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_ab <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_q;
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_ia
    );
    ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_q <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_iq(6 downto 0);

	--expHardCase_uid78_fpSinCosXTest(SUB,77)@35
    expHardCase_uid78_fpSinCosXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_fpSinCosXTest_q);
    expHardCase_uid78_fpSinCosXTest_b <= STD_LOGIC_VECTOR("00" & ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_mem_q);
            expHardCase_uid78_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid78_fpSinCosXTest_a) - UNSIGNED(expHardCase_uid78_fpSinCosXTest_b));
    expHardCase_uid78_fpSinCosXTest_q <= expHardCase_uid78_fpSinCosXTest_o(8 downto 0);


	--expPCos_uid79_fpSinCosXTest(BITSELECT,78)@35
    expPCos_uid79_fpSinCosXTest_in <= expHardCase_uid78_fpSinCosXTest_q(7 downto 0);
    expPCos_uid79_fpSinCosXTest_b <= expPCos_uid79_fpSinCosXTest_in(7 downto 0);

	--reg_expPCos_uid79_fpSinCosXTest_0_to_expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_1(REG,642)@35
    reg_expPCos_uid79_fpSinCosXTest_0_to_expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expPCos_uid79_fpSinCosXTest_0_to_expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expPCos_uid79_fpSinCosXTest_0_to_expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_1_q <= expPCos_uid79_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRCosPreRndHigh_uid108_fpSinCosXTest(BITSELECT,107)@36
    fracRCosPreRndHigh_uid108_fpSinCosXTest_in <= mulCos_uid105_fpSinCosXTest_q(50 downto 0);
    fracRCosPreRndHigh_uid108_fpSinCosXTest_b <= fracRCosPreRndHigh_uid108_fpSinCosXTest_in(50 downto 27);

	--fracRCosPreRndLow_uid109_fpSinCosXTest(BITSELECT,108)@36
    fracRCosPreRndLow_uid109_fpSinCosXTest_in <= mulCos_uid105_fpSinCosXTest_q(49 downto 0);
    fracRCosPreRndLow_uid109_fpSinCosXTest_b <= fracRCosPreRndLow_uid109_fpSinCosXTest_in(49 downto 26);

	--fracRCosPreRnd_uid110_fpSinCosXTest(MUX,109)@36
    fracRCosPreRnd_uid110_fpSinCosXTest_s <= normBitCos_uid106_fpSinCosXTest_b;
    fracRCosPreRnd_uid110_fpSinCosXTest: PROCESS (fracRCosPreRnd_uid110_fpSinCosXTest_s, en, fracRCosPreRndLow_uid109_fpSinCosXTest_b, fracRCosPreRndHigh_uid108_fpSinCosXTest_b)
    BEGIN
            CASE fracRCosPreRnd_uid110_fpSinCosXTest_s IS
                  WHEN "0" => fracRCosPreRnd_uid110_fpSinCosXTest_q <= fracRCosPreRndLow_uid109_fpSinCosXTest_b;
                  WHEN "1" => fracRCosPreRnd_uid110_fpSinCosXTest_q <= fracRCosPreRndHigh_uid108_fpSinCosXTest_b;
                  WHEN OTHERS => fracRCosPreRnd_uid110_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRCosPreRnd_uid111_uid111_fpSinCosXTest(BITJOIN,110)@36
    expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_q <= reg_expPCos_uid79_fpSinCosXTest_0_to_expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_1_q & fracRCosPreRnd_uid110_fpSinCosXTest_q;

	--expFracRCos_uid114_fpSinCosXTest(ADD,113)@36
    expFracRCos_uid114_fpSinCosXTest_a <= STD_LOGIC_VECTOR("0" & expFracRCosPreRnd_uid111_uid111_fpSinCosXTest_q);
    expFracRCos_uid114_fpSinCosXTest_b <= STD_LOGIC_VECTOR("00000000" & cosRndOp_uid112_uid113_fpSinCosXTest_q);
            expFracRCos_uid114_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRCos_uid114_fpSinCosXTest_a) + UNSIGNED(expFracRCos_uid114_fpSinCosXTest_b));
    expFracRCos_uid114_fpSinCosXTest_q <= expFracRCos_uid114_fpSinCosXTest_o(32 downto 0);


	--expRCompSin_uid116_fpSinCosXTest(BITSELECT,115)@36
    expRCompSin_uid116_fpSinCosXTest_in <= expFracRCos_uid114_fpSinCosXTest_q(31 downto 0);
    expRCompSin_uid116_fpSinCosXTest_b <= expRCompSin_uid116_fpSinCosXTest_in(31 downto 24);

	--reg_expRCompSin_uid116_fpSinCosXTest_0_to_expRPostExcCos_uid147_fpSinCosXTest_2(REG,646)@36
    reg_expRCompSin_uid116_fpSinCosXTest_0_to_expRPostExcCos_uid147_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRCompSin_uid116_fpSinCosXTest_0_to_expRPostExcCos_uid147_fpSinCosXTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRCompSin_uid116_fpSinCosXTest_0_to_expRPostExcCos_uid147_fpSinCosXTest_2_q <= expRCompSin_uid116_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor(LOGICAL,1385)
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_b <= ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_sticky_ena_q;
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_q <= not (ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_a or ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_b);

	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_mem_top(CONSTANT,1305)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_mem_top_q <= "01101";

	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp(LOGICAL,1306)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_a <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_mem_top_q;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q);
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_q <= "1" when ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_a = ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_b else "0";

	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg(REG,1307)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_sticky_ena(REG,1386)
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_nor_q = "1") THEN
                ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_sticky_ena_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd(LOGICAL,1387)
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_a <= ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_sticky_ena_q;
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_b <= en;
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_q <= ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_a and ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_b;

	--ld_sinXIsX_uid40_fpSinCosXTest_n_to_excSelBitsSin_uid118_fpSinCosXTest_a(DELAY,745)@0
    ld_sinXIsX_uid40_fpSinCosXTest_n_to_excSelBitsSin_uid118_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => sinXIsX_uid40_fpSinCosXTest_n, xout => ld_sinXIsX_uid40_fpSinCosXTest_n_to_excSelBitsSin_uid118_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_cosXIsOneXRR_uid42_fpSinCosXTest_n_to_join_uid143_fpSinCosXTest_c(DELAY,783)@16
    ld_cosXIsOneXRR_uid42_fpSinCosXTest_n_to_join_uid143_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => cosXIsOneXRR_uid42_fpSinCosXTest_n, xout => ld_cosXIsOneXRR_uid42_fpSinCosXTest_n_to_join_uid143_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvCosXIsOneXRR_uid136_fpSinCosXTest(LOGICAL,135)@16
    InvCosXIsOneXRR_uid136_fpSinCosXTest_a <= cosXIsOneXRR_uid42_fpSinCosXTest_n;
    InvCosXIsOneXRR_uid136_fpSinCosXTest_q <= not InvCosXIsOneXRR_uid136_fpSinCosXTest_a;

	--ld_InvCosXIsOneXRR_uid136_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_c(DELAY,773)@16
    ld_InvCosXIsOneXRR_uid136_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => InvCosXIsOneXRR_uid136_fpSinCosXTest_q, xout => ld_InvCosXIsOneXRR_uid136_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sinXIsX_uid40_fpSinCosXTest_n_to_InvSinXIsX_uid127_fpSinCosXTest_a(DELAY,755)@0
    ld_sinXIsX_uid40_fpSinCosXTest_n_to_InvSinXIsX_uid127_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => sinXIsX_uid40_fpSinCosXTest_n, xout => ld_sinXIsX_uid40_fpSinCosXTest_n_to_InvSinXIsX_uid127_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvSinXIsX_uid127_fpSinCosXTest(LOGICAL,126)@18
    InvSinXIsX_uid127_fpSinCosXTest_a <= ld_sinXIsX_uid40_fpSinCosXTest_n_to_InvSinXIsX_uid127_fpSinCosXTest_a_q;
    InvSinXIsX_uid127_fpSinCosXTest_q <= not InvSinXIsX_uid127_fpSinCosXTest_a;

	--ld_InvSinXIsX_uid127_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_b(DELAY,772)@18
    ld_InvSinXIsX_uid127_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvSinXIsX_uid127_fpSinCosXTest_q, xout => ld_InvSinXIsX_uid127_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--half_uid53_fpSinCosXTest(BITJOIN,52)@19
    half_uid53_fpSinCosXTest_q <= VCC_q & cstZmwFRRPwSM1_uid52_fpSinCosXTest_q;

	--yIsHalf_uid54_fpSinCosXTest(LOGICAL,53)@19
    yIsHalf_uid54_fpSinCosXTest_a <= reg_y_uid50_fpSinCosXTest_0_to_oneMinusY_uid55_fpSinCosXTest_1_q;
    yIsHalf_uid54_fpSinCosXTest_b <= half_uid53_fpSinCosXTest_q;
    yIsHalf_uid54_fpSinCosXTest_q <= "1" when yIsHalf_uid54_fpSinCosXTest_a = yIsHalf_uid54_fpSinCosXTest_b else "0";

	--yHalfCosXNotOne_uid138_fpSinCosXTest(LOGICAL,137)@19
    yHalfCosXNotOne_uid138_fpSinCosXTest_a <= yIsHalf_uid54_fpSinCosXTest_q;
    yHalfCosXNotOne_uid138_fpSinCosXTest_b <= ld_InvSinXIsX_uid127_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_b_q;
    yHalfCosXNotOne_uid138_fpSinCosXTest_c <= ld_InvCosXIsOneXRR_uid136_fpSinCosXTest_q_to_yHalfCosXNotOne_uid138_fpSinCosXTest_c_q;
    yHalfCosXNotOne_uid138_fpSinCosXTest_q <= yHalfCosXNotOne_uid138_fpSinCosXTest_a and yHalfCosXNotOne_uid138_fpSinCosXTest_b and yHalfCosXNotOne_uid138_fpSinCosXTest_c;

	--ld_exc_I_uid15_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_b(DELAY,744)@0
    ld_exc_I_uid15_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => exc_I_uid15_fpSinCosXTest_q, xout => ld_exc_I_uid15_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_N_uid17_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_a(DELAY,743)@0
    ld_exc_N_uid17_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => exc_N_uid17_fpSinCosXTest_q, xout => ld_exc_N_uid17_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRNaN_uid117_fpSinCosXTest(LOGICAL,116)@19
    excRNaN_uid117_fpSinCosXTest_a <= ld_exc_N_uid17_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_a_q;
    excRNaN_uid117_fpSinCosXTest_b <= ld_exc_I_uid15_fpSinCosXTest_q_to_excRNaN_uid117_fpSinCosXTest_b_q;
    excRNaN_uid117_fpSinCosXTest_q <= excRNaN_uid117_fpSinCosXTest_a or excRNaN_uid117_fpSinCosXTest_b;

	--join_uid143_fpSinCosXTest(BITJOIN,142)@19
    join_uid143_fpSinCosXTest_q <= ld_cosXIsOneXRR_uid42_fpSinCosXTest_n_to_join_uid143_fpSinCosXTest_c_q & yHalfCosXNotOne_uid138_fpSinCosXTest_q & excRNaN_uid117_fpSinCosXTest_q;

	--expSelBitsCos_uid144_fpSinCosXTest(BITJOIN,143)@19
    expSelBitsCos_uid144_fpSinCosXTest_q <= ld_sinXIsX_uid40_fpSinCosXTest_n_to_excSelBitsSin_uid118_fpSinCosXTest_a_q & join_uid143_fpSinCosXTest_q;

	--reg_expSelBitsCos_uid144_fpSinCosXTest_0_to_expSelectorCos_uid145_fpSinCosXTest_0(REG,645)@19
    reg_expSelBitsCos_uid144_fpSinCosXTest_0_to_expSelectorCos_uid145_fpSinCosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expSelBitsCos_uid144_fpSinCosXTest_0_to_expSelectorCos_uid145_fpSinCosXTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expSelBitsCos_uid144_fpSinCosXTest_0_to_expSelectorCos_uid145_fpSinCosXTest_0_q <= expSelBitsCos_uid144_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expSelectorCos_uid145_fpSinCosXTest(LOOKUP,144)@20
    expSelectorCos_uid145_fpSinCosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSelectorCos_uid145_fpSinCosXTest_q <= "00";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_expSelBitsCos_uid144_fpSinCosXTest_0_to_expSelectorCos_uid145_fpSinCosXTest_0_q) IS
                WHEN "0000" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "00";
                WHEN "0001" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "11";
                WHEN "0010" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "10";
                WHEN "0011" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "00";
                WHEN "0100" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "01";
                WHEN "0101" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "11";
                WHEN "0110" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "10";
                WHEN "0111" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "00";
                WHEN "1000" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "01";
                WHEN "1001" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "11";
                WHEN "1010" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "10";
                WHEN "1011" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "00";
                WHEN "1100" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "01";
                WHEN "1101" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "11";
                WHEN "1110" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "10";
                WHEN "1111" =>  expSelectorCos_uid145_fpSinCosXTest_q <= "00";
                WHEN OTHERS =>
                    expSelectorCos_uid145_fpSinCosXTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_inputreg(DELAY,1375)
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => expSelectorCos_uid145_fpSinCosXTest_q, xout => ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt(COUNTER,1301)
    -- every=1, low=0, high=13, step=1, init=1
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_i = 12 THEN
                      ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_eq = '1') THEN
                        ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_i <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_i - 13;
                    ELSE
                        ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_i <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_i,4));


	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg(REG,1302)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux(MUX,1303)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_s <= en;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux: PROCESS (ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_s, ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q, ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q;
                  WHEN "1" => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem(DUALMEM,1376)
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_ia <= ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_inputreg_q;
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_aa <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q;
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_ab <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q;
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_ia
    );
    ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_q <= ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_iq(1 downto 0);

	--expRPostExcCos_uid147_fpSinCosXTest(MUX,146)@37
    expRPostExcCos_uid147_fpSinCosXTest_s <= ld_expSelectorCos_uid145_fpSinCosXTest_q_to_expRPostExcCos_uid147_fpSinCosXTest_b_replace_mem_q;
    expRPostExcCos_uid147_fpSinCosXTest: PROCESS (expRPostExcCos_uid147_fpSinCosXTest_s, en, reg_expRCompSin_uid116_fpSinCosXTest_0_to_expRPostExcCos_uid147_fpSinCosXTest_2_q, cstBias_uid22_fpSinCosXTest_q, cstAllZWE_uid8_fpSinCosXTest_q, cstAllOWE_uid6_fpSinCosXTest_q)
    BEGIN
            CASE expRPostExcCos_uid147_fpSinCosXTest_s IS
                  WHEN "00" => expRPostExcCos_uid147_fpSinCosXTest_q <= reg_expRCompSin_uid116_fpSinCosXTest_0_to_expRPostExcCos_uid147_fpSinCosXTest_2_q;
                  WHEN "01" => expRPostExcCos_uid147_fpSinCosXTest_q <= cstBias_uid22_fpSinCosXTest_q;
                  WHEN "10" => expRPostExcCos_uid147_fpSinCosXTest_q <= cstAllZWE_uid8_fpSinCosXTest_q;
                  WHEN "11" => expRPostExcCos_uid147_fpSinCosXTest_q <= cstAllOWE_uid6_fpSinCosXTest_q;
                  WHEN OTHERS => expRPostExcCos_uid147_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstNaNwF_uid32_fpSinCosXTest(CONSTANT,31)
    cstNaNwF_uid32_fpSinCosXTest_q <= "00000000000000000000001";

	--fracRCompCos_uid115_fpSinCosXTest(BITSELECT,114)@36
    fracRCompCos_uid115_fpSinCosXTest_in <= expFracRCos_uid114_fpSinCosXTest_q(23 downto 0);
    fracRCompCos_uid115_fpSinCosXTest_b <= fracRCompCos_uid115_fpSinCosXTest_in(23 downto 1);

	--reg_fracRCompCos_uid115_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_2(REG,644)@36
    reg_fracRCompCos_uid115_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRCompCos_uid115_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRCompCos_uid115_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_2_q <= fracRCompCos_uid115_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor(LOGICAL,1372)
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_b <= ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_sticky_ena_q;
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_q <= not (ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_a or ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_b);

	--ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_sticky_ena(REG,1373)
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_nor_q = "1") THEN
                ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_sticky_ena_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd(LOGICAL,1374)
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_a <= ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_sticky_ena_q;
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_b <= en;
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_q <= ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_a and ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_b;

	--reg_excRNaN_uid117_fpSinCosXTest_0_to_join_uid141_fpSinCosXTest_1(REG,613)@19
    reg_excRNaN_uid117_fpSinCosXTest_0_to_join_uid141_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRNaN_uid117_fpSinCosXTest_0_to_join_uid141_fpSinCosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRNaN_uid117_fpSinCosXTest_0_to_join_uid141_fpSinCosXTest_1_q <= excRNaN_uid117_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_cosXIsOneXRR_uid42_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_3(REG,612)@19
    reg_cosXIsOneXRR_uid42_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cosXIsOneXRR_uid42_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cosXIsOneXRR_uid42_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_3_q <= ld_cosXIsOneXRR_uid42_fpSinCosXTest_n_to_join_uid143_fpSinCosXTest_c_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_sinXIsX_uid40_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_2(REG,611)@19
    reg_sinXIsX_uid40_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsX_uid40_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsX_uid40_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_2_q <= ld_sinXIsX_uid40_fpSinCosXTest_n_to_excSelBitsSin_uid118_fpSinCosXTest_a_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_yHalfCosXNotOne_uid138_fpSinCosXTest_0_to_rZOrOne_uid140_fpSinCosXTest_1(REG,610)@19
    reg_yHalfCosXNotOne_uid138_fpSinCosXTest_0_to_rZOrOne_uid140_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yHalfCosXNotOne_uid138_fpSinCosXTest_0_to_rZOrOne_uid140_fpSinCosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yHalfCosXNotOne_uid138_fpSinCosXTest_0_to_rZOrOne_uid140_fpSinCosXTest_1_q <= yHalfCosXNotOne_uid138_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rZOrOne_uid140_fpSinCosXTest(LOGICAL,139)@20
    rZOrOne_uid140_fpSinCosXTest_a <= reg_yHalfCosXNotOne_uid138_fpSinCosXTest_0_to_rZOrOne_uid140_fpSinCosXTest_1_q;
    rZOrOne_uid140_fpSinCosXTest_b <= reg_sinXIsX_uid40_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_2_q;
    rZOrOne_uid140_fpSinCosXTest_c <= reg_cosXIsOneXRR_uid42_fpSinCosXTest_2_to_rZOrOne_uid140_fpSinCosXTest_3_q;
    rZOrOne_uid140_fpSinCosXTest_q <= rZOrOne_uid140_fpSinCosXTest_a or rZOrOne_uid140_fpSinCosXTest_b or rZOrOne_uid140_fpSinCosXTest_c;

	--join_uid141_fpSinCosXTest(BITJOIN,140)@20
    join_uid141_fpSinCosXTest_q <= reg_excRNaN_uid117_fpSinCosXTest_0_to_join_uid141_fpSinCosXTest_1_q & rZOrOne_uid140_fpSinCosXTest_q;

	--reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1(REG,643)@20
    reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q <= join_uid141_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_inputreg(DELAY,1362)
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q, xout => ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem(DUALMEM,1363)
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_ia <= ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_inputreg_q;
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_aa <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q;
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_ab <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q;
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_ia
    );
    ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_q <= ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_iq(1 downto 0);

	--fracRPostExcCos_uid142_fpSinCosXTest(MUX,141)@37
    fracRPostExcCos_uid142_fpSinCosXTest_s <= ld_reg_join_uid141_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_1_q_to_fracRPostExcCos_uid142_fpSinCosXTest_b_replace_mem_q;
    fracRPostExcCos_uid142_fpSinCosXTest: PROCESS (fracRPostExcCos_uid142_fpSinCosXTest_s, en, reg_fracRCompCos_uid115_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_2_q, cstAllZWF_uid7_fpSinCosXTest_q, cstNaNwF_uid32_fpSinCosXTest_q, cstNaNwF_uid32_fpSinCosXTest_q)
    BEGIN
            CASE fracRPostExcCos_uid142_fpSinCosXTest_s IS
                  WHEN "00" => fracRPostExcCos_uid142_fpSinCosXTest_q <= reg_fracRCompCos_uid115_fpSinCosXTest_0_to_fracRPostExcCos_uid142_fpSinCosXTest_2_q;
                  WHEN "01" => fracRPostExcCos_uid142_fpSinCosXTest_q <= cstAllZWF_uid7_fpSinCosXTest_q;
                  WHEN "10" => fracRPostExcCos_uid142_fpSinCosXTest_q <= cstNaNwF_uid32_fpSinCosXTest_q;
                  WHEN "11" => fracRPostExcCos_uid142_fpSinCosXTest_q <= cstNaNwF_uid32_fpSinCosXTest_q;
                  WHEN OTHERS => fracRPostExcCos_uid142_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fpCos_uid162_fpSinCosXTest(BITJOIN,161)@37
    fpCos_uid162_fpSinCosXTest_q <= ld_signRCosFull_uid161_fpSinCosXTest_q_to_fpCos_uid162_fpSinCosXTest_c_q & expRPostExcCos_uid147_fpSinCosXTest_q & fracRPostExcCos_uid142_fpSinCosXTest_q;

	--cstBiasMwShiftM2_uid25_fpSinCosXTest(CONSTANT,24)
    cstBiasMwShiftM2_uid25_fpSinCosXTest_q <= "01110001";

	--sinXIsXRR_uid41_fpSinCosXTest(COMPARE,40)@16
    sinXIsXRR_uid41_fpSinCosXTest_cin <= GND_q;
    sinXIsXRR_uid41_fpSinCosXTest_a <= STD_LOGIC_VECTOR('0' & "00" & cstBiasMwShiftM2_uid25_fpSinCosXTest_q) & '0';
    sinXIsXRR_uid41_fpSinCosXTest_b <= STD_LOGIC_VECTOR((10 downto 8 => reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q(7)) & reg_expXRR_uid38_fpSinCosXTest_0_to_sinXIsXRR_uid41_fpSinCosXTest_1_q) & sinXIsXRR_uid41_fpSinCosXTest_cin(0);
            sinXIsXRR_uid41_fpSinCosXTest_o <= STD_LOGIC_VECTOR(SIGNED(sinXIsXRR_uid41_fpSinCosXTest_a) - SIGNED(sinXIsXRR_uid41_fpSinCosXTest_b));
    sinXIsXRR_uid41_fpSinCosXTest_n(0) <= not sinXIsXRR_uid41_fpSinCosXTest_o(11);


	--ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_InvSinXIsXRR_uid128_fpSinCosXTest_a(DELAY,756)@16
    ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_InvSinXIsXRR_uid128_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => sinXIsXRR_uid41_fpSinCosXTest_n, xout => ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_InvSinXIsXRR_uid128_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvSinXIsXRR_uid128_fpSinCosXTest(LOGICAL,127)@18
    InvSinXIsXRR_uid128_fpSinCosXTest_a <= ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_InvSinXIsXRR_uid128_fpSinCosXTest_a_q;
    InvSinXIsXRR_uid128_fpSinCosXTest_q <= not InvSinXIsXRR_uid128_fpSinCosXTest_a;

	--signComp_uid129_fpSinCosXTest(LOGICAL,128)@18
    signComp_uid129_fpSinCosXTest_a <= InvSinXIsXRR_uid128_fpSinCosXTest_q;
    signComp_uid129_fpSinCosXTest_b <= InvSinXIsX_uid127_fpSinCosXTest_q;
    signComp_uid129_fpSinCosXTest_c <= intXParity_uid49_fpSinCosXTest_b;
    signComp_uid129_fpSinCosXTest_q <= signComp_uid129_fpSinCosXTest_a and signComp_uid129_fpSinCosXTest_b and signComp_uid129_fpSinCosXTest_c;

	--signX_uid37_fpSinCosXTest(BITSELECT,36)@0
    signX_uid37_fpSinCosXTest_in <= a;
    signX_uid37_fpSinCosXTest_b <= signX_uid37_fpSinCosXTest_in(31 downto 31);

	--ld_signX_uid37_fpSinCosXTest_b_to_signR_uid130_fpSinCosXTest_a(DELAY,760)@0
    ld_signX_uid37_fpSinCosXTest_b_to_signR_uid130_fpSinCosXTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => signX_uid37_fpSinCosXTest_b, xout => ld_signX_uid37_fpSinCosXTest_b_to_signR_uid130_fpSinCosXTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid130_fpSinCosXTest(LOGICAL,129)@18
    signR_uid130_fpSinCosXTest_a <= ld_signX_uid37_fpSinCosXTest_b_to_signR_uid130_fpSinCosXTest_a_q;
    signR_uid130_fpSinCosXTest_b <= signComp_uid129_fpSinCosXTest_q;
    signR_uid130_fpSinCosXTest_q <= signR_uid130_fpSinCosXTest_a xor signR_uid130_fpSinCosXTest_b;

	--ld_signR_uid130_fpSinCosXTest_q_to_signRSinFull_uid133_fpSinCosXTest_c(DELAY,766)@18
    ld_signR_uid130_fpSinCosXTest_q_to_signRSinFull_uid133_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => signR_uid130_fpSinCosXTest_q, xout => ld_signR_uid130_fpSinCosXTest_q_to_signRSinFull_uid133_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--signRSinFull_uid133_fpSinCosXTest(LOGICAL,132)@20
    signRSinFull_uid133_fpSinCosXTest_a <= InvExc_N_uid132_fpSinCosXTest_q;
    signRSinFull_uid133_fpSinCosXTest_b <= InvExc_I_uid131_fpSinCosXTest_q;
    signRSinFull_uid133_fpSinCosXTest_c <= ld_signR_uid130_fpSinCosXTest_q_to_signRSinFull_uid133_fpSinCosXTest_c_q;
    signRSinFull_uid133_fpSinCosXTest_q_i <= signRSinFull_uid133_fpSinCosXTest_a and signRSinFull_uid133_fpSinCosXTest_b and signRSinFull_uid133_fpSinCosXTest_c;
    signRSinFull_uid133_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => signRSinFull_uid133_fpSinCosXTest_q, xin => signRSinFull_uid133_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_signRSinFull_uid133_fpSinCosXTest_q_to_fpSin_uid134_fpSinCosXTest_c(DELAY,769)@21
    ld_signRSinFull_uid133_fpSinCosXTest_q_to_fpSin_uid134_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => signRSinFull_uid133_fpSinCosXTest_q, xout => ld_signRSinFull_uid133_fpSinCosXTest_q_to_fpSin_uid134_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor(LOGICAL,1359)
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_b <= ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_sticky_ena_q;
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_q <= not (ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_a or ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_b);

	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_mem_top(CONSTANT,1342)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_mem_top_q <= "0100010";

	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp(LOGICAL,1343)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_a <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_mem_top_q;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_q);
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_q <= "1" when ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_a = ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_b else "0";

	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmpReg(REG,1344)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmpReg_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_sticky_ena(REG,1360)
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_nor_q = "1") THEN
                ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_sticky_ena_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd(LOGICAL,1361)
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_a <= ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_sticky_ena_q;
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_b <= en;
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_q <= ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_a and ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_b;

	--ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_inputreg(DELAY,1349)
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => exp_uid9_fpSinCosXTest_b, xout => ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt(COUNTER,1338)
    -- every=1, low=0, high=34, step=1, init=1
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_i = 33 THEN
                      ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_eq = '1') THEN
                        ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_i <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_i - 34;
                    ELSE
                        ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_i <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_i,6));


	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg(REG,1339)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux(MUX,1340)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_s <= en;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux: PROCESS (ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_s, ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg_q, ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg_q;
                  WHEN "1" => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem(DUALMEM,1350)
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_ia <= ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_inputreg_q;
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_aa <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg_q;
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_ab <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_q;
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 6,
        numwords_a => 35,
        width_b => 8,
        widthad_b => 6,
        numwords_b => 35,
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
        clocken1 => ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_iq,
        address_a => ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_aa,
        data_a => ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_ia
    );
    ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_reset0 <= areset;
        ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_q <= ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_iq(7 downto 0);

	--ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_a(DELAY,1228)@16
    ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => sinXIsXRR_uid41_fpSinCosXTest_n, xout => ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1(REG,605)@35
    reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_q <= ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor(LOGICAL,1309)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_b <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_sticky_ena_q;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_q <= not (ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_a or ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_b);

	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_sticky_ena(REG,1310)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_nor_q = "1") THEN
                ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_sticky_ena_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd(LOGICAL,1311)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_a <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_sticky_ena_q;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_b <= en;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_a and ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_b;

	--oFracXRRSmallXRR_uid90_fpSinCosXTest(BITSELECT,89)@16
    oFracXRRSmallXRR_uid90_fpSinCosXTest_in <= oFracXRR_uid43_uid43_fpSinCosXTest_q;
    oFracXRRSmallXRR_uid90_fpSinCosXTest_b <= oFracXRRSmallXRR_uid90_fpSinCosXTest_in(53 downto 28);

	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_inputreg(DELAY,1299)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => oFracXRRSmallXRR_uid90_fpSinCosXTest_b, xout => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem(DUALMEM,1300)
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_ia <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_inputreg_q;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_aa <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_ab <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q;
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 26,
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
        clocken1 => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_iq,
        address_a => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_aa,
        data_a => ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_ia
    );
    ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_reset0 <= areset;
        ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_iq(25 downto 0);

	--reg_cmpYToOneMinusY_uid57_fpSinCosXTest_1_to_zSin_uid60_fpSinCosXTest_1(REG,577)@20
    reg_cmpYToOneMinusY_uid57_fpSinCosXTest_1_to_zSin_uid60_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cmpYToOneMinusY_uid57_fpSinCosXTest_1_to_zSin_uid60_fpSinCosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cmpYToOneMinusY_uid57_fpSinCosXTest_1_to_zSin_uid60_fpSinCosXTest_1_q <= cmpYToOneMinusY_uid57_fpSinCosXTest_c;
            END IF;
        END IF;
    END PROCESS;


	--zSin_uid60_fpSinCosXTest(MUX,59)@21
    zSin_uid60_fpSinCosXTest_s <= reg_cmpYToOneMinusY_uid57_fpSinCosXTest_1_to_zSin_uid60_fpSinCosXTest_1_q;
    zSin_uid60_fpSinCosXTest: PROCESS (zSin_uid60_fpSinCosXTest_s, en, reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2_q, reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3_q)
    BEGIN
            CASE zSin_uid60_fpSinCosXTest_s IS
                  WHEN "0" => zSin_uid60_fpSinCosXTest_q <= reg_zSinYBottom_uid59_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_2_q;
                  WHEN "1" => zSin_uid60_fpSinCosXTest_q <= reg_zSinOMyBottom_uid58_fpSinCosXTest_0_to_zSin_uid60_fpSinCosXTest_3_q;
                  WHEN OTHERS => zSin_uid60_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--addr_uid81_fpSinCosXTest(BITSELECT,80)@21
    addr_uid81_fpSinCosXTest_in <= zSin_uid60_fpSinCosXTest_q;
    addr_uid81_fpSinCosXTest_b <= addr_uid81_fpSinCosXTest_in(64 downto 57);

	--reg_addr_uid81_fpSinCosXTest_0_to_memoryC2_uid398_tableGensinPiZ_lutmem_0(REG,595)@21
    reg_addr_uid81_fpSinCosXTest_0_to_memoryC2_uid398_tableGensinPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid81_fpSinCosXTest_0_to_memoryC2_uid398_tableGensinPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid81_fpSinCosXTest_0_to_memoryC2_uid398_tableGensinPiZ_lutmem_0_q <= addr_uid81_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid398_tableGensinPiZ_lutmem(DUALMEM,529)@22
    memoryC2_uid398_tableGensinPiZ_lutmem_ia <= (others => '0');
    memoryC2_uid398_tableGensinPiZ_lutmem_aa <= (others => '0');
    memoryC2_uid398_tableGensinPiZ_lutmem_ab <= reg_addr_uid81_fpSinCosXTest_0_to_memoryC2_uid398_tableGensinPiZ_lutmem_0_q;
    memoryC2_uid398_tableGensinPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_sincos_s5_memoryC2_uid398_tableGensinPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid398_tableGensinPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid398_tableGensinPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid398_tableGensinPiZ_lutmem_iq,
        address_a => memoryC2_uid398_tableGensinPiZ_lutmem_aa,
        data_a => memoryC2_uid398_tableGensinPiZ_lutmem_ia
    );
    memoryC2_uid398_tableGensinPiZ_lutmem_reset0 <= areset;
        memoryC2_uid398_tableGensinPiZ_lutmem_q <= memoryC2_uid398_tableGensinPiZ_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid398_tableGensinPiZ_lutmem_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_1(REG,597)@24
    reg_memoryC2_uid398_tableGensinPiZ_lutmem_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid398_tableGensinPiZ_lutmem_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid398_tableGensinPiZ_lutmem_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_1_q <= memoryC2_uid398_tableGensinPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--zPsinPiZ_uid84_fpSinCosXTest(BITSELECT,83)@21
    zPsinPiZ_uid84_fpSinCosXTest_in <= zSin_uid60_fpSinCosXTest_q(56 downto 0);
    zPsinPiZ_uid84_fpSinCosXTest_b <= zPsinPiZ_uid84_fpSinCosXTest_in(56 downto 42);

	--yT1_uid406_polyEvalsinPiZ(BITSELECT,405)@21
    yT1_uid406_polyEvalsinPiZ_in <= zPsinPiZ_uid84_fpSinCosXTest_b;
    yT1_uid406_polyEvalsinPiZ_b <= yT1_uid406_polyEvalsinPiZ_in(14 downto 2);

	--ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a_inputreg(DELAY,1540)
    ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => yT1_uid406_polyEvalsinPiZ_b, xout => ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a(DELAY,1219)@21
    ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a_inputreg_q, xout => ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0(REG,596)@24
    reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_q <= ld_yT1_uid406_polyEvalsinPiZ_b_to_reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid502_pT1_uid407_polyEvalsinPiZ(MULT,501)@25
    prodXY_uid502_pT1_uid407_polyEvalsinPiZ_pr <= signed(resize(UNSIGNED(prodXY_uid502_pT1_uid407_polyEvalsinPiZ_a),14)) * SIGNED(prodXY_uid502_pT1_uid407_polyEvalsinPiZ_b);
    prodXY_uid502_pT1_uid407_polyEvalsinPiZ_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid502_pT1_uid407_polyEvalsinPiZ_a <= (others => '0');
            prodXY_uid502_pT1_uid407_polyEvalsinPiZ_b <= (others => '0');
            prodXY_uid502_pT1_uid407_polyEvalsinPiZ_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid502_pT1_uid407_polyEvalsinPiZ_a <= reg_yT1_uid406_polyEvalsinPiZ_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_0_q;
                prodXY_uid502_pT1_uid407_polyEvalsinPiZ_b <= reg_memoryC2_uid398_tableGensinPiZ_lutmem_0_to_prodXY_uid502_pT1_uid407_polyEvalsinPiZ_1_q;
                prodXY_uid502_pT1_uid407_polyEvalsinPiZ_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid502_pT1_uid407_polyEvalsinPiZ_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid502_pT1_uid407_polyEvalsinPiZ: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid502_pT1_uid407_polyEvalsinPiZ_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid502_pT1_uid407_polyEvalsinPiZ_q <= prodXY_uid502_pT1_uid407_polyEvalsinPiZ_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid503_pT1_uid407_polyEvalsinPiZ(BITSELECT,502)@28
    prodXYTruncFR_uid503_pT1_uid407_polyEvalsinPiZ_in <= prodXY_uid502_pT1_uid407_polyEvalsinPiZ_q;
    prodXYTruncFR_uid503_pT1_uid407_polyEvalsinPiZ_b <= prodXYTruncFR_uid503_pT1_uid407_polyEvalsinPiZ_in(25 downto 12);

	--highBBits_uid409_polyEvalsinPiZ(BITSELECT,408)@28
    highBBits_uid409_polyEvalsinPiZ_in <= prodXYTruncFR_uid503_pT1_uid407_polyEvalsinPiZ_b;
    highBBits_uid409_polyEvalsinPiZ_b <= highBBits_uid409_polyEvalsinPiZ_in(13 downto 1);

	--ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_a(DELAY,1221)@21
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => addr_uid81_fpSinCosXTest_b, xout => ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0(REG,598)@24
    reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_q <= ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid396_tableGensinPiZ_lutmem(DUALMEM,528)@25
    memoryC1_uid396_tableGensinPiZ_lutmem_ia <= (others => '0');
    memoryC1_uid396_tableGensinPiZ_lutmem_aa <= (others => '0');
    memoryC1_uid396_tableGensinPiZ_lutmem_ab <= reg_addr_uid81_fpSinCosXTest_0_to_memoryC1_uid396_tableGensinPiZ_lutmem_0_q;
    memoryC1_uid396_tableGensinPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_sincos_s5_memoryC1_uid396_tableGensinPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid396_tableGensinPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid396_tableGensinPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid396_tableGensinPiZ_lutmem_iq,
        address_a => memoryC1_uid396_tableGensinPiZ_lutmem_aa,
        data_a => memoryC1_uid396_tableGensinPiZ_lutmem_ia
    );
    memoryC1_uid396_tableGensinPiZ_lutmem_reset0 <= areset;
        memoryC1_uid396_tableGensinPiZ_lutmem_q <= memoryC1_uid396_tableGensinPiZ_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid396_tableGensinPiZ_lutmem_0_to_sumAHighB_uid410_polyEvalsinPiZ_0(REG,599)@27
    reg_memoryC1_uid396_tableGensinPiZ_lutmem_0_to_sumAHighB_uid410_polyEvalsinPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid396_tableGensinPiZ_lutmem_0_to_sumAHighB_uid410_polyEvalsinPiZ_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid396_tableGensinPiZ_lutmem_0_to_sumAHighB_uid410_polyEvalsinPiZ_0_q <= memoryC1_uid396_tableGensinPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid410_polyEvalsinPiZ(ADD,409)@28
    sumAHighB_uid410_polyEvalsinPiZ_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid396_tableGensinPiZ_lutmem_0_to_sumAHighB_uid410_polyEvalsinPiZ_0_q(20)) & reg_memoryC1_uid396_tableGensinPiZ_lutmem_0_to_sumAHighB_uid410_polyEvalsinPiZ_0_q);
    sumAHighB_uid410_polyEvalsinPiZ_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid409_polyEvalsinPiZ_b(12)) & highBBits_uid409_polyEvalsinPiZ_b);
            sumAHighB_uid410_polyEvalsinPiZ_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid410_polyEvalsinPiZ_a) + SIGNED(sumAHighB_uid410_polyEvalsinPiZ_b));
    sumAHighB_uid410_polyEvalsinPiZ_q <= sumAHighB_uid410_polyEvalsinPiZ_o(21 downto 0);


	--lowRangeB_uid408_polyEvalsinPiZ(BITSELECT,407)@28
    lowRangeB_uid408_polyEvalsinPiZ_in <= prodXYTruncFR_uid503_pT1_uid407_polyEvalsinPiZ_b(0 downto 0);
    lowRangeB_uid408_polyEvalsinPiZ_b <= lowRangeB_uid408_polyEvalsinPiZ_in(0 downto 0);

	--s1_uid408_uid411_polyEvalsinPiZ(BITJOIN,410)@28
    s1_uid408_uid411_polyEvalsinPiZ_q <= sumAHighB_uid410_polyEvalsinPiZ_q & lowRangeB_uid408_polyEvalsinPiZ_b;

	--reg_s1_uid408_uid411_polyEvalsinPiZ_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_1(REG,601)@28
    reg_s1_uid408_uid411_polyEvalsinPiZ_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid408_uid411_polyEvalsinPiZ_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid408_uid411_polyEvalsinPiZ_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_1_q <= s1_uid408_uid411_polyEvalsinPiZ_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor(LOGICAL,1551)
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_b <= ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_sticky_ena_q;
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_q <= not (ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_a or ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_b);

	--ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_sticky_ena(REG,1552)
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_nor_q = "1") THEN
                ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_sticky_ena_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd(LOGICAL,1553)
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_a <= ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_sticky_ena_q;
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_b <= en;
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_q <= ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_a and ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_b;

	--ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_inputreg(DELAY,1541)
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => zPsinPiZ_uid84_fpSinCosXTest_b, xout => ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem(DUALMEM,1542)
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_ia <= ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_inputreg_q;
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_aa <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q;
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_ab <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q;
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_iq,
        address_a => ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_aa,
        data_a => ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_ia
    );
    ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_reset0 <= areset;
        ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_q <= ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_iq(14 downto 0);

	--reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0(REG,600)@28
    reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_q <= ld_zPsinPiZ_uid84_fpSinCosXTest_b_to_reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid505_pT2_uid413_polyEvalsinPiZ(MULT,504)@29
    prodXY_uid505_pT2_uid413_polyEvalsinPiZ_pr <= signed(resize(UNSIGNED(prodXY_uid505_pT2_uid413_polyEvalsinPiZ_a),16)) * SIGNED(prodXY_uid505_pT2_uid413_polyEvalsinPiZ_b);
    prodXY_uid505_pT2_uid413_polyEvalsinPiZ_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid505_pT2_uid413_polyEvalsinPiZ_a <= (others => '0');
            prodXY_uid505_pT2_uid413_polyEvalsinPiZ_b <= (others => '0');
            prodXY_uid505_pT2_uid413_polyEvalsinPiZ_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid505_pT2_uid413_polyEvalsinPiZ_a <= reg_zPsinPiZ_uid84_fpSinCosXTest_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_0_q;
                prodXY_uid505_pT2_uid413_polyEvalsinPiZ_b <= reg_s1_uid408_uid411_polyEvalsinPiZ_0_to_prodXY_uid505_pT2_uid413_polyEvalsinPiZ_1_q;
                prodXY_uid505_pT2_uid413_polyEvalsinPiZ_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid505_pT2_uid413_polyEvalsinPiZ_pr,38));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid505_pT2_uid413_polyEvalsinPiZ: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid505_pT2_uid413_polyEvalsinPiZ_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid505_pT2_uid413_polyEvalsinPiZ_q <= prodXY_uid505_pT2_uid413_polyEvalsinPiZ_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid506_pT2_uid413_polyEvalsinPiZ(BITSELECT,505)@32
    prodXYTruncFR_uid506_pT2_uid413_polyEvalsinPiZ_in <= prodXY_uid505_pT2_uid413_polyEvalsinPiZ_q;
    prodXYTruncFR_uid506_pT2_uid413_polyEvalsinPiZ_b <= prodXYTruncFR_uid506_pT2_uid413_polyEvalsinPiZ_in(37 downto 14);

	--highBBits_uid415_polyEvalsinPiZ(BITSELECT,414)@32
    highBBits_uid415_polyEvalsinPiZ_in <= prodXYTruncFR_uid506_pT2_uid413_polyEvalsinPiZ_b;
    highBBits_uid415_polyEvalsinPiZ_b <= highBBits_uid415_polyEvalsinPiZ_in(23 downto 2);

	--ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor(LOGICAL,1564)
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_b <= ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_sticky_ena_q;
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_q <= not (ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_a or ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_b);

	--ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_sticky_ena(REG,1565)
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_nor_q = "1") THEN
                ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_sticky_ena_q <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd(LOGICAL,1566)
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_a <= ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_sticky_ena_q;
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_b <= en;
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_q <= ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_a and ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_b;

	--ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_inputreg(DELAY,1554)
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => addr_uid81_fpSinCosXTest_b, xout => ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem(DUALMEM,1555)
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_ia <= ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_inputreg_q;
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_aa <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdreg_q;
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_ab <= ld_reg_zPcosPiZ_uid87_fpSinCosXTest_0_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_0_q_to_prodXY_uid511_pT2_uid426_polyEvalcosPiZ_a_replace_rdmux_q;
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_iq,
        address_a => ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_aa,
        data_a => ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_ia
    );
    ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_q <= ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0(REG,602)@28
    reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_q <= ld_addr_uid81_fpSinCosXTest_b_to_reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid394_tableGensinPiZ_lutmem(DUALMEM,527)@29
    memoryC0_uid394_tableGensinPiZ_lutmem_ia <= (others => '0');
    memoryC0_uid394_tableGensinPiZ_lutmem_aa <= (others => '0');
    memoryC0_uid394_tableGensinPiZ_lutmem_ab <= reg_addr_uid81_fpSinCosXTest_0_to_memoryC0_uid394_tableGensinPiZ_lutmem_0_q;
    memoryC0_uid394_tableGensinPiZ_lutmem_dmem : altsyncram
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
        init_file => "fp_sincos_s5_memoryC0_uid394_tableGensinPiZ_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid394_tableGensinPiZ_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid394_tableGensinPiZ_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid394_tableGensinPiZ_lutmem_iq,
        address_a => memoryC0_uid394_tableGensinPiZ_lutmem_aa,
        data_a => memoryC0_uid394_tableGensinPiZ_lutmem_ia
    );
    memoryC0_uid394_tableGensinPiZ_lutmem_reset0 <= areset;
        memoryC0_uid394_tableGensinPiZ_lutmem_q <= memoryC0_uid394_tableGensinPiZ_lutmem_iq(29 downto 0);

	--reg_memoryC0_uid394_tableGensinPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalsinPiZ_0(REG,603)@31
    reg_memoryC0_uid394_tableGensinPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalsinPiZ_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid394_tableGensinPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalsinPiZ_0_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid394_tableGensinPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalsinPiZ_0_q <= memoryC0_uid394_tableGensinPiZ_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid416_polyEvalsinPiZ(ADD,415)@32
    sumAHighB_uid416_polyEvalsinPiZ_a <= STD_LOGIC_VECTOR((30 downto 30 => reg_memoryC0_uid394_tableGensinPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalsinPiZ_0_q(29)) & reg_memoryC0_uid394_tableGensinPiZ_lutmem_0_to_sumAHighB_uid416_polyEvalsinPiZ_0_q);
    sumAHighB_uid416_polyEvalsinPiZ_b <= STD_LOGIC_VECTOR((30 downto 22 => highBBits_uid415_polyEvalsinPiZ_b(21)) & highBBits_uid415_polyEvalsinPiZ_b);
            sumAHighB_uid416_polyEvalsinPiZ_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid416_polyEvalsinPiZ_a) + SIGNED(sumAHighB_uid416_polyEvalsinPiZ_b));
    sumAHighB_uid416_polyEvalsinPiZ_q <= sumAHighB_uid416_polyEvalsinPiZ_o(30 downto 0);


	--lowRangeB_uid414_polyEvalsinPiZ(BITSELECT,413)@32
    lowRangeB_uid414_polyEvalsinPiZ_in <= prodXYTruncFR_uid506_pT2_uid413_polyEvalsinPiZ_b(1 downto 0);
    lowRangeB_uid414_polyEvalsinPiZ_b <= lowRangeB_uid414_polyEvalsinPiZ_in(1 downto 0);

	--s2_uid414_uid417_polyEvalsinPiZ(BITJOIN,416)@32
    s2_uid414_uid417_polyEvalsinPiZ_q <= sumAHighB_uid416_polyEvalsinPiZ_q & lowRangeB_uid414_polyEvalsinPiZ_b;

	--polyEvalSigsinPiZ_uid86_fpSinCosXTest(BITSELECT,85)@32
    polyEvalSigsinPiZ_uid86_fpSinCosXTest_in <= s2_uid414_uid417_polyEvalsinPiZ_q(30 downto 0);
    polyEvalSigsinPiZ_uid86_fpSinCosXTest_b <= polyEvalSigsinPiZ_uid86_fpSinCosXTest_in(30 downto 5);

	--ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_multSinOp2_uid91_fpSinCosXTest_b(DELAY,708)@16
    ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_multSinOp2_uid91_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 16 )
    PORT MAP ( xin => sinXIsXRR_uid41_fpSinCosXTest_n, xout => ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_multSinOp2_uid91_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--multSinOp2_uid91_fpSinCosXTest(MUX,90)@32
    multSinOp2_uid91_fpSinCosXTest_s <= ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_multSinOp2_uid91_fpSinCosXTest_b_q;
    multSinOp2_uid91_fpSinCosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSinOp2_uid91_fpSinCosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE multSinOp2_uid91_fpSinCosXTest_s IS
                      WHEN "0" => multSinOp2_uid91_fpSinCosXTest_q <= polyEvalSigsinPiZ_uid86_fpSinCosXTest_b;
                      WHEN "1" => multSinOp2_uid91_fpSinCosXTest_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_mem_q;
                      WHEN OTHERS => multSinOp2_uid91_fpSinCosXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor(LOGICAL,1320)
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_b <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_sticky_ena_q;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_q <= not (ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_a or ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_b);

	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_sticky_ena(REG,1321)
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_nor_q = "1") THEN
                ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd(LOGICAL,1322)
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_a <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_sticky_ena_q;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_b <= en;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_a and ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_b;

	--cPi_uid71_fpSinCosXTest(CONSTANT,70)
    cPi_uid71_fpSinCosXTest_q <= "11001001000011111101101011";

	--LeftShiftStage263dto0_uid310_alignedZSin_uid67_fpSinCosXTest(BITSELECT,309)@27
    LeftShiftStage263dto0_uid310_alignedZSin_uid67_fpSinCosXTest_in <= leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q(63 downto 0);
    LeftShiftStage263dto0_uid310_alignedZSin_uid67_fpSinCosXTest_b <= LeftShiftStage263dto0_uid310_alignedZSin_uid67_fpSinCosXTest_in(63 downto 0);

	--leftShiftStage3Idx1_uid311_alignedZSin_uid67_fpSinCosXTest(BITJOIN,310)@27
    leftShiftStage3Idx1_uid311_alignedZSin_uid67_fpSinCosXTest_q <= LeftShiftStage263dto0_uid310_alignedZSin_uid67_fpSinCosXTest_b & GND_q;

	--ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor(LOGICAL,1433)
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_b <= ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_sticky_ena_q;
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_q <= not (ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_a or ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_b);

	--ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_sticky_ena(REG,1434)
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_nor_q = "1") THEN
                ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd(LOGICAL,1435)
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_a <= ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_sticky_ena_q;
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_b <= en;
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_q <= ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_a and ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_b;

	--X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest(BITSELECT,280)@21
    X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_in <= zSin_uid60_fpSinCosXTest_q(32 downto 0);
    X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b <= X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_in(32 downto 0);

	--ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_inputreg(DELAY,1425)
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 33, depth => 1 )
    PORT MAP ( xin => X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b, xout => ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem(DUALMEM,1426)
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_ia <= ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_inputreg_q;
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_ia
    );
    ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_q <= ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_iq(32 downto 0);

	--leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest(BITJOIN,281)@25
    leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_q <= ld_X32dto0_uid281_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_b_replace_mem_q & zs_uid244_lzcZSin_uid66_fpSinCosXTest_q;

	--ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor(LOGICAL,1444)
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_b <= ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_sticky_ena_q;
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_q <= not (ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_a or ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_b);

	--ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_sticky_ena(REG,1445)
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_nor_q = "1") THEN
                ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_sticky_ena_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd(LOGICAL,1446)
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_a <= ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_sticky_ena_q;
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_b <= en;
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_q <= ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_a and ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_b;

	--ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_inputreg(DELAY,1436)
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 65, depth => 1 )
    PORT MAP ( xin => zSin_uid60_fpSinCosXTest_q, xout => ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem(DUALMEM,1437)
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_ia <= ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_inputreg_q;
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_iq,
        address_a => ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_aa,
        data_a => ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_ia
    );
    ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_reset0 <= areset;
        ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_q <= ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_iq(64 downto 0);

	--rVStage_uid237_lzcZSin_uid66_fpSinCosXTest(BITSELECT,236)@21
    rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_in <= zSin_uid60_fpSinCosXTest_q;
    rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b <= rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_in(64 downto 1);

	--vCount_uid238_lzcZSin_uid66_fpSinCosXTest(LOGICAL,237)@21
    vCount_uid238_lzcZSin_uid66_fpSinCosXTest_a <= rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b;
    vCount_uid238_lzcZSin_uid66_fpSinCosXTest_b <= zs_uid236_lzcZSin_uid66_fpSinCosXTest_q;
    vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q_i <= "1" when vCount_uid238_lzcZSin_uid66_fpSinCosXTest_a = vCount_uid238_lzcZSin_uid66_fpSinCosXTest_b else "0";
    vCount_uid238_lzcZSin_uid66_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q, xin => vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_g(DELAY,903)@22
    ld_vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_g : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q, xout => ld_vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_g_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid240_lzcZSin_uid66_fpSinCosXTest(BITSELECT,239)@21
    vStage_uid240_lzcZSin_uid66_fpSinCosXTest_in <= zSin_uid60_fpSinCosXTest_q(0 downto 0);
    vStage_uid240_lzcZSin_uid66_fpSinCosXTest_b <= vStage_uid240_lzcZSin_uid66_fpSinCosXTest_in(0 downto 0);

	--ld_vStage_uid240_lzcZSin_uid66_fpSinCosXTest_b_to_cStage_uid241_lzcZSin_uid66_fpSinCosXTest_b(DELAY,861)@21
    ld_vStage_uid240_lzcZSin_uid66_fpSinCosXTest_b_to_cStage_uid241_lzcZSin_uid66_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vStage_uid240_lzcZSin_uid66_fpSinCosXTest_b, xout => ld_vStage_uid240_lzcZSin_uid66_fpSinCosXTest_b_to_cStage_uid241_lzcZSin_uid66_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cStage_uid241_lzcZSin_uid66_fpSinCosXTest(BITJOIN,240)@22
    cStage_uid241_lzcZSin_uid66_fpSinCosXTest_q <= ld_vStage_uid240_lzcZSin_uid66_fpSinCosXTest_b_to_cStage_uid241_lzcZSin_uid66_fpSinCosXTest_b_q & mO_uid239_lzcZSin_uid66_fpSinCosXTest_q;

	--ld_rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_c(DELAY,863)@21
    ld_rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b, xout => ld_rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid243_lzcZSin_uid66_fpSinCosXTest(MUX,242)@22
    vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_s <= vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q;
    vStagei_uid243_lzcZSin_uid66_fpSinCosXTest: PROCESS (vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_s, en, ld_rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_c_q, cStage_uid241_lzcZSin_uid66_fpSinCosXTest_q)
    BEGIN
            CASE vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_q <= ld_rVStage_uid237_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_c_q;
                  WHEN "1" => vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_q <= cStage_uid241_lzcZSin_uid66_fpSinCosXTest_q;
                  WHEN OTHERS => vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid245_lzcZSin_uid66_fpSinCosXTest(BITSELECT,244)@22
    rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_q;
    rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b <= rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_in(63 downto 32);

	--vCount_uid246_lzcZSin_uid66_fpSinCosXTest(LOGICAL,245)@22
    vCount_uid246_lzcZSin_uid66_fpSinCosXTest_a <= rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b;
    vCount_uid246_lzcZSin_uid66_fpSinCosXTest_b <= zs_uid244_lzcZSin_uid66_fpSinCosXTest_q;
    vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q_i <= "1" when vCount_uid246_lzcZSin_uid66_fpSinCosXTest_a = vCount_uid246_lzcZSin_uid66_fpSinCosXTest_b else "0";
    vCount_uid246_lzcZSin_uid66_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q, xin => vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_f(DELAY,902)@23
    ld_vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q, xout => ld_vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid247_lzcZSin_uid66_fpSinCosXTest(BITSELECT,246)@22
    vStage_uid247_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid243_lzcZSin_uid66_fpSinCosXTest_q(31 downto 0);
    vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b <= vStage_uid247_lzcZSin_uid66_fpSinCosXTest_in(31 downto 0);

	--ld_vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_d(DELAY,870)@22
    ld_vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_d : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b, xout => ld_vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_c(DELAY,869)@22
    ld_rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b, xout => ld_rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid249_lzcZSin_uid66_fpSinCosXTest(MUX,248)@23
    vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_s <= vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q;
    vStagei_uid249_lzcZSin_uid66_fpSinCosXTest: PROCESS (vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_s, en, ld_rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_c_q, ld_vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_d_q)
    BEGIN
            CASE vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_q <= ld_rVStage_uid245_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_c_q;
                  WHEN "1" => vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_q <= ld_vStage_uid247_lzcZSin_uid66_fpSinCosXTest_b_to_vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_d_q;
                  WHEN OTHERS => vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid251_lzcZSin_uid66_fpSinCosXTest(BITSELECT,250)@23
    rVStage_uid251_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_q;
    rVStage_uid251_lzcZSin_uid66_fpSinCosXTest_b <= rVStage_uid251_lzcZSin_uid66_fpSinCosXTest_in(31 downto 16);

	--vCount_uid252_lzcZSin_uid66_fpSinCosXTest(LOGICAL,251)@23
    vCount_uid252_lzcZSin_uid66_fpSinCosXTest_a <= rVStage_uid251_lzcZSin_uid66_fpSinCosXTest_b;
    vCount_uid252_lzcZSin_uid66_fpSinCosXTest_b <= zs_uid250_lzcZSin_uid66_fpSinCosXTest_q;
    vCount_uid252_lzcZSin_uid66_fpSinCosXTest_q <= "1" when vCount_uid252_lzcZSin_uid66_fpSinCosXTest_a = vCount_uid252_lzcZSin_uid66_fpSinCosXTest_b else "0";

	--reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4(REG,585)@23
    reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q <= vCount_uid252_lzcZSin_uid66_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_e(DELAY,901)@24
    ld_reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q, xout => ld_reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid253_lzcZSin_uid66_fpSinCosXTest(BITSELECT,252)@23
    vStage_uid253_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid249_lzcZSin_uid66_fpSinCosXTest_q(15 downto 0);
    vStage_uid253_lzcZSin_uid66_fpSinCosXTest_b <= vStage_uid253_lzcZSin_uid66_fpSinCosXTest_in(15 downto 0);

	--vStagei_uid255_lzcZSin_uid66_fpSinCosXTest(MUX,254)@23
    vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_s <= vCount_uid252_lzcZSin_uid66_fpSinCosXTest_q;
    vStagei_uid255_lzcZSin_uid66_fpSinCosXTest: PROCESS (vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_s, en, rVStage_uid251_lzcZSin_uid66_fpSinCosXTest_b, vStage_uid253_lzcZSin_uid66_fpSinCosXTest_b)
    BEGIN
            CASE vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_q <= rVStage_uid251_lzcZSin_uid66_fpSinCosXTest_b;
                  WHEN "1" => vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_q <= vStage_uid253_lzcZSin_uid66_fpSinCosXTest_b;
                  WHEN OTHERS => vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid257_lzcZSin_uid66_fpSinCosXTest(BITSELECT,256)@23
    rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_q;
    rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_b <= rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_in(15 downto 8);

	--reg_rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_0_to_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_1(REG,580)@23
    reg_rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_0_to_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_0_to_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_0_to_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_1_q <= rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid258_lzcZSin_uid66_fpSinCosXTest(LOGICAL,257)@24
    vCount_uid258_lzcZSin_uid66_fpSinCosXTest_a <= reg_rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_0_to_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_1_q;
    vCount_uid258_lzcZSin_uid66_fpSinCosXTest_b <= cstAllZWE_uid8_fpSinCosXTest_q;
    vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q <= "1" when vCount_uid258_lzcZSin_uid66_fpSinCosXTest_a = vCount_uid258_lzcZSin_uid66_fpSinCosXTest_b else "0";

	--ld_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_d(DELAY,900)@24
    ld_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q, xout => ld_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid259_lzcZSin_uid66_fpSinCosXTest(BITSELECT,258)@23
    vStage_uid259_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid255_lzcZSin_uid66_fpSinCosXTest_q(7 downto 0);
    vStage_uid259_lzcZSin_uid66_fpSinCosXTest_b <= vStage_uid259_lzcZSin_uid66_fpSinCosXTest_in(7 downto 0);

	--reg_vStage_uid259_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_3(REG,582)@23
    reg_vStage_uid259_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid259_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid259_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_3_q <= vStage_uid259_lzcZSin_uid66_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid261_lzcZSin_uid66_fpSinCosXTest(MUX,260)@24
    vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_s <= vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q;
    vStagei_uid261_lzcZSin_uid66_fpSinCosXTest: PROCESS (vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_s, en, reg_rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_0_to_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_1_q, reg_vStage_uid259_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_3_q)
    BEGIN
            CASE vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_q <= reg_rVStage_uid257_lzcZSin_uid66_fpSinCosXTest_0_to_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_1_q;
                  WHEN "1" => vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_q <= reg_vStage_uid259_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_3_q;
                  WHEN OTHERS => vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid263_lzcZSin_uid66_fpSinCosXTest(BITSELECT,262)@24
    rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_q;
    rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_b <= rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_in(7 downto 4);

	--vCount_uid264_lzcZSin_uid66_fpSinCosXTest(LOGICAL,263)@24
    vCount_uid264_lzcZSin_uid66_fpSinCosXTest_a <= rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_b;
    vCount_uid264_lzcZSin_uid66_fpSinCosXTest_b <= leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q;
    vCount_uid264_lzcZSin_uid66_fpSinCosXTest_q_i <= "1" when vCount_uid264_lzcZSin_uid66_fpSinCosXTest_a = vCount_uid264_lzcZSin_uid66_fpSinCosXTest_b else "0";
    vCount_uid264_lzcZSin_uid66_fpSinCosXTest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid264_lzcZSin_uid66_fpSinCosXTest_q, xin => vCount_uid264_lzcZSin_uid66_fpSinCosXTest_q_i, clk => clk, ena => en(0), aclr => areset);

	--vStage_uid265_lzcZSin_uid66_fpSinCosXTest(BITSELECT,264)@24
    vStage_uid265_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid261_lzcZSin_uid66_fpSinCosXTest_q(3 downto 0);
    vStage_uid265_lzcZSin_uid66_fpSinCosXTest_b <= vStage_uid265_lzcZSin_uid66_fpSinCosXTest_in(3 downto 0);

	--reg_vStage_uid265_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_3(REG,584)@24
    reg_vStage_uid265_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid265_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid265_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_3_q <= vStage_uid265_lzcZSin_uid66_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_2(REG,583)@24
    reg_rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_2_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_2_q <= rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid267_lzcZSin_uid66_fpSinCosXTest(MUX,266)@25
    vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_s <= vCount_uid264_lzcZSin_uid66_fpSinCosXTest_q;
    vStagei_uid267_lzcZSin_uid66_fpSinCosXTest: PROCESS (vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_s, en, reg_rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_2_q, reg_vStage_uid265_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_3_q)
    BEGIN
            CASE vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_q <= reg_rVStage_uid263_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_2_q;
                  WHEN "1" => vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_q <= reg_vStage_uid265_lzcZSin_uid66_fpSinCosXTest_0_to_vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_3_q;
                  WHEN OTHERS => vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid269_lzcZSin_uid66_fpSinCosXTest(BITSELECT,268)@25
    rVStage_uid269_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_q;
    rVStage_uid269_lzcZSin_uid66_fpSinCosXTest_b <= rVStage_uid269_lzcZSin_uid66_fpSinCosXTest_in(3 downto 2);

	--vCount_uid270_lzcZSin_uid66_fpSinCosXTest(LOGICAL,269)@25
    vCount_uid270_lzcZSin_uid66_fpSinCosXTest_a <= rVStage_uid269_lzcZSin_uid66_fpSinCosXTest_b;
    vCount_uid270_lzcZSin_uid66_fpSinCosXTest_b <= leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q;
    vCount_uid270_lzcZSin_uid66_fpSinCosXTest_q <= "1" when vCount_uid270_lzcZSin_uid66_fpSinCosXTest_a = vCount_uid270_lzcZSin_uid66_fpSinCosXTest_b else "0";

	--vStage_uid271_lzcZSin_uid66_fpSinCosXTest(BITSELECT,270)@25
    vStage_uid271_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid267_lzcZSin_uid66_fpSinCosXTest_q(1 downto 0);
    vStage_uid271_lzcZSin_uid66_fpSinCosXTest_b <= vStage_uid271_lzcZSin_uid66_fpSinCosXTest_in(1 downto 0);

	--vStagei_uid273_lzcZSin_uid66_fpSinCosXTest(MUX,272)@25
    vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_s <= vCount_uid270_lzcZSin_uid66_fpSinCosXTest_q;
    vStagei_uid273_lzcZSin_uid66_fpSinCosXTest: PROCESS (vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_s, en, rVStage_uid269_lzcZSin_uid66_fpSinCosXTest_b, vStage_uid271_lzcZSin_uid66_fpSinCosXTest_b)
    BEGIN
            CASE vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_s IS
                  WHEN "0" => vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_q <= rVStage_uid269_lzcZSin_uid66_fpSinCosXTest_b;
                  WHEN "1" => vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_q <= vStage_uid271_lzcZSin_uid66_fpSinCosXTest_b;
                  WHEN OTHERS => vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid275_lzcZSin_uid66_fpSinCosXTest(BITSELECT,274)@25
    rVStage_uid275_lzcZSin_uid66_fpSinCosXTest_in <= vStagei_uid273_lzcZSin_uid66_fpSinCosXTest_q;
    rVStage_uid275_lzcZSin_uid66_fpSinCosXTest_b <= rVStage_uid275_lzcZSin_uid66_fpSinCosXTest_in(1 downto 1);

	--vCount_uid276_lzcZSin_uid66_fpSinCosXTest(LOGICAL,275)@25
    vCount_uid276_lzcZSin_uid66_fpSinCosXTest_a <= rVStage_uid275_lzcZSin_uid66_fpSinCosXTest_b;
    vCount_uid276_lzcZSin_uid66_fpSinCosXTest_b <= GND_q;
    vCount_uid276_lzcZSin_uid66_fpSinCosXTest_q <= "1" when vCount_uid276_lzcZSin_uid66_fpSinCosXTest_a = vCount_uid276_lzcZSin_uid66_fpSinCosXTest_b else "0";

	--r_uid277_lzcZSin_uid66_fpSinCosXTest(BITJOIN,276)@25
    r_uid277_lzcZSin_uid66_fpSinCosXTest_q <= ld_vCount_uid238_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_g_q & ld_vCount_uid246_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_f_q & ld_reg_vCount_uid252_lzcZSin_uid66_fpSinCosXTest_0_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_4_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_e_q & ld_vCount_uid258_lzcZSin_uid66_fpSinCosXTest_q_to_r_uid277_lzcZSin_uid66_fpSinCosXTest_d_q & vCount_uid264_lzcZSin_uid66_fpSinCosXTest_q & vCount_uid270_lzcZSin_uid66_fpSinCosXTest_q & vCount_uid276_lzcZSin_uid66_fpSinCosXTest_q;

	--leftShiftStageSel6Dto5_uid285_alignedZSin_uid67_fpSinCosXTest(BITSELECT,284)@25
    leftShiftStageSel6Dto5_uid285_alignedZSin_uid67_fpSinCosXTest_in <= r_uid277_lzcZSin_uid66_fpSinCosXTest_q;
    leftShiftStageSel6Dto5_uid285_alignedZSin_uid67_fpSinCosXTest_b <= leftShiftStageSel6Dto5_uid285_alignedZSin_uid67_fpSinCosXTest_in(6 downto 5);

	--leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest(MUX,285)@25
    leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_s <= leftShiftStageSel6Dto5_uid285_alignedZSin_uid67_fpSinCosXTest_b;
    leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest: PROCESS (leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_s, en, ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_q, leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_q, cstZmwFRRPwSM1_uid52_fpSinCosXTest_q, cstZmwFRRPwSM1_uid52_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q <= ld_zSin_uid60_fpSinCosXTest_q_to_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q <= leftShiftStage0Idx1_uid282_alignedZSin_uid67_fpSinCosXTest_q;
                  WHEN "10" => leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q <= cstZmwFRRPwSM1_uid52_fpSinCosXTest_q;
                  WHEN "11" => leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q <= cstZmwFRRPwSM1_uid52_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage040dto0_uid294_alignedZSin_uid67_fpSinCosXTest(BITSELECT,293)@25
    LeftShiftStage040dto0_uid294_alignedZSin_uid67_fpSinCosXTest_in <= leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q(40 downto 0);
    LeftShiftStage040dto0_uid294_alignedZSin_uid67_fpSinCosXTest_b <= LeftShiftStage040dto0_uid294_alignedZSin_uid67_fpSinCosXTest_in(40 downto 0);

	--leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest(BITJOIN,294)@25
    leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_q <= LeftShiftStage040dto0_uid294_alignedZSin_uid67_fpSinCosXTest_b & leftShiftStage1Idx3Pad24_uid293_alignedZSin_uid67_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_5(REG,590)@25
    reg_leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_5_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_5_q <= leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage048dto0_uid291_alignedZSin_uid67_fpSinCosXTest(BITSELECT,290)@25
    LeftShiftStage048dto0_uid291_alignedZSin_uid67_fpSinCosXTest_in <= leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q(48 downto 0);
    LeftShiftStage048dto0_uid291_alignedZSin_uid67_fpSinCosXTest_b <= LeftShiftStage048dto0_uid291_alignedZSin_uid67_fpSinCosXTest_in(48 downto 0);

	--leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest(BITJOIN,291)@25
    leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_q <= LeftShiftStage048dto0_uid291_alignedZSin_uid67_fpSinCosXTest_b & zs_uid250_lzcZSin_uid66_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_4(REG,589)@25
    reg_leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_4_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_4_q <= leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage056dto0_uid288_alignedZSin_uid67_fpSinCosXTest(BITSELECT,287)@25
    LeftShiftStage056dto0_uid288_alignedZSin_uid67_fpSinCosXTest_in <= leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q(56 downto 0);
    LeftShiftStage056dto0_uid288_alignedZSin_uid67_fpSinCosXTest_b <= LeftShiftStage056dto0_uid288_alignedZSin_uid67_fpSinCosXTest_in(56 downto 0);

	--leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest(BITJOIN,288)@25
    leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_q <= LeftShiftStage056dto0_uid288_alignedZSin_uid67_fpSinCosXTest_b & cstAllZWE_uid8_fpSinCosXTest_q;

	--reg_leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_3(REG,588)@25
    reg_leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_3_q <= leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_2(REG,587)@25
    reg_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_2_q <= leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest(BITSELECT,295)@25
    leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_in <= r_uid277_lzcZSin_uid66_fpSinCosXTest_q(4 downto 0);
    leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_b <= leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_in(4 downto 3);

	--reg_leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_1(REG,586)@25
    reg_leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_1_q <= leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest(MUX,296)@26
    leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_s <= reg_leftShiftStageSel4Dto3_uid296_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_1_q;
    leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest: PROCESS (leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_s, en, reg_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_2_q, reg_leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_3_q, reg_leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_4_q, reg_leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q <= reg_leftShiftStage0_uid286_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_2_q;
                  WHEN "01" => leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q <= reg_leftShiftStage1Idx1_uid289_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_3_q;
                  WHEN "10" => leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q <= reg_leftShiftStage1Idx2_uid292_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_4_q;
                  WHEN "11" => leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q <= reg_leftShiftStage1Idx3_uid295_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest(BITSELECT,304)@26
    LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_in <= leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q(58 downto 0);
    LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_b <= LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_in(58 downto 0);

	--ld_LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_b(DELAY,927)@26
    ld_LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 59, depth => 1 )
    PORT MAP ( xin => LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_b, xout => ld_LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest(BITJOIN,305)@27
    leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_q <= ld_LeftShiftStage158dto0_uid305_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_b_q & leftShiftStage2Idx3Pad6_uid304_alignedZSin_uid67_fpSinCosXTest_q;

	--LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest(BITSELECT,301)@26
    LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_in <= leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q(60 downto 0);
    LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_b <= LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_in(60 downto 0);

	--ld_LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_b(DELAY,925)@26
    ld_LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 61, depth => 1 )
    PORT MAP ( xin => LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_b, xout => ld_LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest(BITJOIN,302)@27
    leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_q <= ld_LeftShiftStage160dto0_uid302_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_b_q & leftShiftStage0Idx1Pad4_uid213_fxpX_uid48_fpSinCosXTest_q;

	--LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest(BITSELECT,298)@26
    LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_in <= leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q(62 downto 0);
    LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_b <= LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_in(62 downto 0);

	--ld_LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_b(DELAY,923)@26
    ld_LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 63, depth => 1 )
    PORT MAP ( xin => LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_b, xout => ld_LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest(BITJOIN,299)@27
    leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_q <= ld_LeftShiftStage162dto0_uid299_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_b_q & leftShiftStage1Idx2Pad2_uid227_fxpX_uid48_fpSinCosXTest_q;

	--reg_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_2(REG,592)@26
    reg_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_2_q <= leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest(BITSELECT,306)@25
    leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_in <= r_uid277_lzcZSin_uid66_fpSinCosXTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_b <= leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_in(2 downto 1);

	--ld_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_b_to_reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_a(DELAY,1214)@25
    ld_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_b_to_reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_b, xout => ld_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_b_to_reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1(REG,591)@26
    reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_q <= ld_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_b_to_reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest(MUX,307)@27
    leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_s <= reg_leftShiftStageSel2Dto1_uid307_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_1_q;
    leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest: PROCESS (leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_s, en, reg_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_2_q, leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_q, leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_q, leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_s IS
                  WHEN "00" => leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q <= reg_leftShiftStage1_uid297_alignedZSin_uid67_fpSinCosXTest_0_to_leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_2_q;
                  WHEN "01" => leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q <= leftShiftStage2Idx1_uid300_alignedZSin_uid67_fpSinCosXTest_q;
                  WHEN "10" => leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q <= leftShiftStage2Idx2_uid303_alignedZSin_uid67_fpSinCosXTest_q;
                  WHEN "11" => leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q <= leftShiftStage2Idx3_uid306_alignedZSin_uid67_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest(BITSELECT,311)@25
    leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_in <= r_uid277_lzcZSin_uid66_fpSinCosXTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_b <= leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_b(DELAY,937)@25
    ld_leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_b, xout => ld_leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest(MUX,312)@27
    leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_s <= ld_leftShiftStageSel0Dto0_uid312_alignedZSin_uid67_fpSinCosXTest_b_to_leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_b_q;
    leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest: PROCESS (leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_s, en, leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q, leftShiftStage3Idx1_uid311_alignedZSin_uid67_fpSinCosXTest_q)
    BEGIN
            CASE leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_s IS
                  WHEN "0" => leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_q <= leftShiftStage2_uid308_alignedZSin_uid67_fpSinCosXTest_q;
                  WHEN "1" => leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_q <= leftShiftStage3Idx1_uid311_alignedZSin_uid67_fpSinCosXTest_q;
                  WHEN OTHERS => leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pHigh_uid72_fpSinCosXTest(BITSELECT,71)@27
    pHigh_uid72_fpSinCosXTest_in <= leftShiftStage3_uid313_alignedZSin_uid67_fpSinCosXTest_q;
    pHigh_uid72_fpSinCosXTest_b <= pHigh_uid72_fpSinCosXTest_in(64 downto 39);

	--reg_pHigh_uid72_fpSinCosXTest_0_to_p_uid73_fpSinCosXTest_2(REG,594)@27
    reg_pHigh_uid72_fpSinCosXTest_0_to_p_uid73_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pHigh_uid72_fpSinCosXTest_0_to_p_uid73_fpSinCosXTest_2_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pHigh_uid72_fpSinCosXTest_0_to_p_uid73_fpSinCosXTest_2_q <= pHigh_uid72_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_a(DELAY,1216)@16
    ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => sinXIsXRR_uid41_fpSinCosXTest_n, xout => ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1(REG,593)@27
    reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_q <= ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p_uid73_fpSinCosXTest(MUX,72)@28
    p_uid73_fpSinCosXTest_s <= reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_p_uid73_fpSinCosXTest_1_q;
    p_uid73_fpSinCosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p_uid73_fpSinCosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE p_uid73_fpSinCosXTest_s IS
                      WHEN "0" => p_uid73_fpSinCosXTest_q <= reg_pHigh_uid72_fpSinCosXTest_0_to_p_uid73_fpSinCosXTest_2_q;
                      WHEN "1" => p_uid73_fpSinCosXTest_q <= cPi_uid71_fpSinCosXTest_q;
                      WHEN OTHERS => p_uid73_fpSinCosXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_inputreg(DELAY,1312)
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => p_uid73_fpSinCosXTest_q, xout => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem(DUALMEM,1313)
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_ia <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_inputreg_q;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_aa <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdreg_q;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_ab <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_rdmux_q;
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_iq,
        address_a => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_aa,
        data_a => ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_ia
    );
    ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_reset0 <= areset;
        ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_q <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_iq(25 downto 0);

	--mulSin_uid92_fpSinCosXTest(MULT,91)@33
    mulSin_uid92_fpSinCosXTest_pr <= UNSIGNED(mulSin_uid92_fpSinCosXTest_a) * UNSIGNED(mulSin_uid92_fpSinCosXTest_b);
    mulSin_uid92_fpSinCosXTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulSin_uid92_fpSinCosXTest_a <= (others => '0');
            mulSin_uid92_fpSinCosXTest_b <= (others => '0');
            mulSin_uid92_fpSinCosXTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulSin_uid92_fpSinCosXTest_a <= ld_p_uid73_fpSinCosXTest_q_to_mulSin_uid92_fpSinCosXTest_a_replace_mem_q;
                mulSin_uid92_fpSinCosXTest_b <= multSinOp2_uid91_fpSinCosXTest_q;
                mulSin_uid92_fpSinCosXTest_s1 <= STD_LOGIC_VECTOR(mulSin_uid92_fpSinCosXTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mulSin_uid92_fpSinCosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulSin_uid92_fpSinCosXTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulSin_uid92_fpSinCosXTest_q <= mulSin_uid92_fpSinCosXTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBitSin_uid93_fpSinCosXTest(BITSELECT,92)@36
    normBitSin_uid93_fpSinCosXTest_in <= mulSin_uid92_fpSinCosXTest_q;
    normBitSin_uid93_fpSinCosXTest_b <= normBitSin_uid93_fpSinCosXTest_in(51 downto 51);

	--join_uid99_fpSinCosXTest(BITJOIN,98)@36
    join_uid99_fpSinCosXTest_q <= reg_sinXIsXRR_uid41_fpSinCosXTest_2_to_join_uid99_fpSinCosXTest_1_q & normBitSin_uid93_fpSinCosXTest_b;

	--sinRndOp_uid100_uid101_fpSinCosXTest(BITJOIN,100)@36
    sinRndOp_uid100_uid101_fpSinCosXTest_q <= join_uid99_fpSinCosXTest_q & cstAllZWF_uid7_fpSinCosXTest_q & VCC_q;

	--ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor(LOGICAL,1333)
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_b <= ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_sticky_ena_q;
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_q <= not (ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_a or ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_b);

	--ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_sticky_ena(REG,1334)
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_nor_q = "1") THEN
                ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_sticky_ena_q <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd(LOGICAL,1335)
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_a <= ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_sticky_ena_q;
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_b <= en;
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_q <= ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_a and ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_b;

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor(LOGICAL,1283)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_b <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_sticky_ena_q;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_q <= not (ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_a or ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_b);

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_sticky_ena(REG,1284)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_nor_q = "1") THEN
                ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_sticky_ena_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd(LOGICAL,1285)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_sticky_ena_q;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_b <= en;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_a and ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_b;

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_inputreg(DELAY,1273)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expXRR_uid38_fpSinCosXTest_b, xout => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem(DUALMEM,1274)
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_ia <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_inputreg_q;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_aa <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdreg_q;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_ab <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_rdmux_q;
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_iq,
        address_a => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_aa,
        data_a => ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_ia
    );
    ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_reset0 <= areset;
        ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_iq(7 downto 0);

	--reg_r_uid277_lzcZSin_uid66_fpSinCosXTest_0_to_expSinHC_uid74_fpSinCosXTest_1(REG,604)@25
    reg_r_uid277_lzcZSin_uid66_fpSinCosXTest_0_to_expSinHC_uid74_fpSinCosXTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid277_lzcZSin_uid66_fpSinCosXTest_0_to_expSinHC_uid74_fpSinCosXTest_1_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid277_lzcZSin_uid66_fpSinCosXTest_0_to_expSinHC_uid74_fpSinCosXTest_1_q <= r_uid277_lzcZSin_uid66_fpSinCosXTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expSinHC_uid74_fpSinCosXTest(SUB,73)@26
    expSinHC_uid74_fpSinCosXTest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid23_fpSinCosXTest_q);
    expSinHC_uid74_fpSinCosXTest_b <= STD_LOGIC_VECTOR("00" & reg_r_uid277_lzcZSin_uid66_fpSinCosXTest_0_to_expSinHC_uid74_fpSinCosXTest_1_q);
            expSinHC_uid74_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSinHC_uid74_fpSinCosXTest_a) - UNSIGNED(expSinHC_uid74_fpSinCosXTest_b));
    expSinHC_uid74_fpSinCosXTest_q <= expSinHC_uid74_fpSinCosXTest_o(8 downto 0);


	--expSinHCR_uid75_fpSinCosXTest(BITSELECT,74)@26
    expSinHCR_uid75_fpSinCosXTest_in <= expSinHC_uid74_fpSinCosXTest_q(7 downto 0);
    expSinHCR_uid75_fpSinCosXTest_b <= expSinHCR_uid75_fpSinCosXTest_in(7 downto 0);

	--ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_expPSin_uid76_fpSinCosXTest_b(DELAY,695)@16
    ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_expPSin_uid76_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => sinXIsXRR_uid41_fpSinCosXTest_n, xout => ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_expPSin_uid76_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expPSin_uid76_fpSinCosXTest(MUX,75)@26
    expPSin_uid76_fpSinCosXTest_s <= ld_sinXIsXRR_uid41_fpSinCosXTest_n_to_expPSin_uid76_fpSinCosXTest_b_q;
    expPSin_uid76_fpSinCosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPSin_uid76_fpSinCosXTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expPSin_uid76_fpSinCosXTest_s IS
                      WHEN "0" => expPSin_uid76_fpSinCosXTest_q <= expSinHCR_uid75_fpSinCosXTest_b;
                      WHEN "1" => expPSin_uid76_fpSinCosXTest_q <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_replace_mem_q;
                      WHEN OTHERS => expPSin_uid76_fpSinCosXTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_inputreg(DELAY,1323)
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expPSin_uid76_fpSinCosXTest_q, xout => ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem(DUALMEM,1324)
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_ia <= ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_inputreg_q;
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_aa <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdreg_q;
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_ab <= ld_reg_r_uid356_lzcZCos_uid69_fpSinCosXTest_0_to_expHardCase_uid78_fpSinCosXTest_1_q_to_expHardCase_uid78_fpSinCosXTest_b_replace_rdmux_q;
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_iq,
        address_a => ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_aa,
        data_a => ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_ia
    );
    ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_reset0 <= areset;
        ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_q <= ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_iq(7 downto 0);

	--fracRSinPreRndHigh_uid95_fpSinCosXTest(BITSELECT,94)@36
    fracRSinPreRndHigh_uid95_fpSinCosXTest_in <= mulSin_uid92_fpSinCosXTest_q(50 downto 0);
    fracRSinPreRndHigh_uid95_fpSinCosXTest_b <= fracRSinPreRndHigh_uid95_fpSinCosXTest_in(50 downto 27);

	--fracRSinPreRndLow_uid96_fpSinCosXTest(BITSELECT,95)@36
    fracRSinPreRndLow_uid96_fpSinCosXTest_in <= mulSin_uid92_fpSinCosXTest_q(49 downto 0);
    fracRSinPreRndLow_uid96_fpSinCosXTest_b <= fracRSinPreRndLow_uid96_fpSinCosXTest_in(49 downto 26);

	--fracRSinPreRnd_uid97_fpSinCosXTest(MUX,96)@36
    fracRSinPreRnd_uid97_fpSinCosXTest_s <= normBitSin_uid93_fpSinCosXTest_b;
    fracRSinPreRnd_uid97_fpSinCosXTest: PROCESS (fracRSinPreRnd_uid97_fpSinCosXTest_s, en, fracRSinPreRndLow_uid96_fpSinCosXTest_b, fracRSinPreRndHigh_uid95_fpSinCosXTest_b)
    BEGIN
            CASE fracRSinPreRnd_uid97_fpSinCosXTest_s IS
                  WHEN "0" => fracRSinPreRnd_uid97_fpSinCosXTest_q <= fracRSinPreRndLow_uid96_fpSinCosXTest_b;
                  WHEN "1" => fracRSinPreRnd_uid97_fpSinCosXTest_q <= fracRSinPreRndHigh_uid95_fpSinCosXTest_b;
                  WHEN OTHERS => fracRSinPreRnd_uid97_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRSinPreRnd_uid98_uid98_fpSinCosXTest(BITJOIN,97)@36
    expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_q <= ld_expPSin_uid76_fpSinCosXTest_q_to_expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_b_replace_mem_q & fracRSinPreRnd_uid97_fpSinCosXTest_q;

	--expFracRSin_uid102_fpSinCosXTest(ADD,101)@36
    expFracRSin_uid102_fpSinCosXTest_a <= STD_LOGIC_VECTOR("0" & expFracRSinPreRnd_uid98_uid98_fpSinCosXTest_q);
    expFracRSin_uid102_fpSinCosXTest_b <= STD_LOGIC_VECTOR("0000000" & sinRndOp_uid100_uid101_fpSinCosXTest_q);
            expFracRSin_uid102_fpSinCosXTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRSin_uid102_fpSinCosXTest_a) + UNSIGNED(expFracRSin_uid102_fpSinCosXTest_b));
    expFracRSin_uid102_fpSinCosXTest_q <= expFracRSin_uid102_fpSinCosXTest_o(32 downto 0);


	--expRCompSin_uid104_fpSinCosXTest(BITSELECT,103)@36
    expRCompSin_uid104_fpSinCosXTest_in <= expFracRSin_uid102_fpSinCosXTest_q(31 downto 0);
    expRCompSin_uid104_fpSinCosXTest_b <= expRCompSin_uid104_fpSinCosXTest_in(31 downto 24);

	--reg_expRCompSin_uid104_fpSinCosXTest_0_to_expRPostExcSin_uid126_fpSinCosXTest_2(REG,607)@36
    reg_expRCompSin_uid104_fpSinCosXTest_0_to_expRPostExcSin_uid126_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRCompSin_uid104_fpSinCosXTest_0_to_expRPostExcSin_uid126_fpSinCosXTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRCompSin_uid104_fpSinCosXTest_0_to_expRPostExcSin_uid126_fpSinCosXTest_2_q <= expRCompSin_uid104_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor(LOGICAL,1537)
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_b <= ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_sticky_ena_q;
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_q <= not (ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_a or ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_b);

	--ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_sticky_ena(REG,1538)
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_nor_q = "1") THEN
                ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_sticky_ena_q <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd(LOGICAL,1539)
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_a <= ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_sticky_ena_q;
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_b <= en;
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_q <= ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_a and ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_b;

	--expXIsZero_uid10_fpSinCosXTest(LOGICAL,9)@0
    expXIsZero_uid10_fpSinCosXTest_a <= exp_uid9_fpSinCosXTest_b;
    expXIsZero_uid10_fpSinCosXTest_b <= cstAllZWE_uid8_fpSinCosXTest_q;
    expXIsZero_uid10_fpSinCosXTest_q <= "1" when expXIsZero_uid10_fpSinCosXTest_a = expXIsZero_uid10_fpSinCosXTest_b else "0";

	--ld_expXIsZero_uid10_fpSinCosXTest_q_to_excSelBitsSin_uid118_fpSinCosXTest_b(DELAY,746)@0
    ld_expXIsZero_uid10_fpSinCosXTest_q_to_excSelBitsSin_uid118_fpSinCosXTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 19 )
    PORT MAP ( xin => expXIsZero_uid10_fpSinCosXTest_q, xout => ld_expXIsZero_uid10_fpSinCosXTest_q_to_excSelBitsSin_uid118_fpSinCosXTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excSelBitsSin_uid118_fpSinCosXTest(BITJOIN,117)@19
    excSelBitsSin_uid118_fpSinCosXTest_q <= excRNaN_uid117_fpSinCosXTest_q & ld_expXIsZero_uid10_fpSinCosXTest_q_to_excSelBitsSin_uid118_fpSinCosXTest_b_q & ld_sinXIsX_uid40_fpSinCosXTest_n_to_excSelBitsSin_uid118_fpSinCosXTest_a_q;

	--ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_inputreg(DELAY,1527)
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => excSelBitsSin_uid118_fpSinCosXTest_q, xout => ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem(DUALMEM,1528)
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_ia <= ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_inputreg_q;
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_aa <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdreg_q;
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_ab <= ld_oFracXRRSmallXRR_uid90_fpSinCosXTest_b_to_multSinOp2_uid91_fpSinCosXTest_d_replace_rdmux_q;
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_iq,
        address_a => ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_aa,
        data_a => ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_ia
    );
    ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_reset0 <= areset;
        ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_q <= ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_iq(2 downto 0);

	--reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0(REG,533)@35
    reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_q <= ld_excSelBitsSin_uid118_fpSinCosXTest_q_to_reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--excSelSin_uid119_fpSinCosXTest(LOOKUP,118)@36
    excSelSin_uid119_fpSinCosXTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excSelSin_uid119_fpSinCosXTest_q <= "00";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_excSelBitsSin_uid118_fpSinCosXTest_0_to_excSelSin_uid119_fpSinCosXTest_0_q) IS
                WHEN "000" =>  excSelSin_uid119_fpSinCosXTest_q <= "00";
                WHEN "001" =>  excSelSin_uid119_fpSinCosXTest_q <= "01";
                WHEN "010" =>  excSelSin_uid119_fpSinCosXTest_q <= "10";
                WHEN "011" =>  excSelSin_uid119_fpSinCosXTest_q <= "10";
                WHEN "100" =>  excSelSin_uid119_fpSinCosXTest_q <= "11";
                WHEN "101" =>  excSelSin_uid119_fpSinCosXTest_q <= "11";
                WHEN "110" =>  excSelSin_uid119_fpSinCosXTest_q <= "00";
                WHEN "111" =>  excSelSin_uid119_fpSinCosXTest_q <= "00";
                WHEN OTHERS =>
                    excSelSin_uid119_fpSinCosXTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--expRPostExcSin_uid126_fpSinCosXTest(MUX,125)@37
    expRPostExcSin_uid126_fpSinCosXTest_s <= excSelSin_uid119_fpSinCosXTest_q;
    expRPostExcSin_uid126_fpSinCosXTest: PROCESS (expRPostExcSin_uid126_fpSinCosXTest_s, en, reg_expRCompSin_uid104_fpSinCosXTest_0_to_expRPostExcSin_uid126_fpSinCosXTest_2_q, ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_q, cstAllZWE_uid8_fpSinCosXTest_q, cstAllOWE_uid6_fpSinCosXTest_q)
    BEGIN
            CASE expRPostExcSin_uid126_fpSinCosXTest_s IS
                  WHEN "00" => expRPostExcSin_uid126_fpSinCosXTest_q <= reg_expRCompSin_uid104_fpSinCosXTest_0_to_expRPostExcSin_uid126_fpSinCosXTest_2_q;
                  WHEN "01" => expRPostExcSin_uid126_fpSinCosXTest_q <= ld_exp_uid9_fpSinCosXTest_b_to_expRPostExcSin_uid126_fpSinCosXTest_d_replace_mem_q;
                  WHEN "10" => expRPostExcSin_uid126_fpSinCosXTest_q <= cstAllZWE_uid8_fpSinCosXTest_q;
                  WHEN "11" => expRPostExcSin_uid126_fpSinCosXTest_q <= cstAllOWE_uid6_fpSinCosXTest_q;
                  WHEN OTHERS => expRPostExcSin_uid126_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor(LOGICAL,1346)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_a <= ld_expXRR_uid38_fpSinCosXTest_b_to_expPSin_uid76_fpSinCosXTest_d_notEnable_q;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_b <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_sticky_ena_q;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_q <= not (ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_a or ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_b);

	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_sticky_ena(REG,1347)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_nor_q = "1") THEN
                ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_sticky_ena_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd(LOGICAL,1348)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_a <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_sticky_ena_q;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_b <= en;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_a and ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_b;

	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_inputreg(DELAY,1336)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => frac_uid13_fpSinCosXTest_b, xout => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem(DUALMEM,1337)
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_ia <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_inputreg_q;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_aa <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdreg_q;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_ab <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_rdmux_q;
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 6,
        numwords_a => 35,
        width_b => 23,
        widthad_b => 6,
        numwords_b => 35,
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
        clocken1 => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_iq,
        address_a => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_aa,
        data_a => ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_ia
    );
    ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_reset0 <= areset;
        ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_iq(22 downto 0);

	--fracRCompSin_uid103_fpSinCosXTest(BITSELECT,102)@36
    fracRCompSin_uid103_fpSinCosXTest_in <= expFracRSin_uid102_fpSinCosXTest_q(23 downto 0);
    fracRCompSin_uid103_fpSinCosXTest_b <= fracRCompSin_uid103_fpSinCosXTest_in(23 downto 1);

	--reg_fracRCompSin_uid103_fpSinCosXTest_0_to_fracRPostExcSin_uid122_fpSinCosXTest_2(REG,606)@36
    reg_fracRCompSin_uid103_fpSinCosXTest_0_to_fracRPostExcSin_uid122_fpSinCosXTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRCompSin_uid103_fpSinCosXTest_0_to_fracRPostExcSin_uid122_fpSinCosXTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRCompSin_uid103_fpSinCosXTest_0_to_fracRPostExcSin_uid122_fpSinCosXTest_2_q <= fracRCompSin_uid103_fpSinCosXTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExcSin_uid122_fpSinCosXTest(MUX,121)@37
    fracRPostExcSin_uid122_fpSinCosXTest_s <= excSelSin_uid119_fpSinCosXTest_q;
    fracRPostExcSin_uid122_fpSinCosXTest: PROCESS (fracRPostExcSin_uid122_fpSinCosXTest_s, en, reg_fracRCompSin_uid103_fpSinCosXTest_0_to_fracRPostExcSin_uid122_fpSinCosXTest_2_q, ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_q, cstAllZWF_uid7_fpSinCosXTest_q, cstNaNwF_uid32_fpSinCosXTest_q)
    BEGIN
            CASE fracRPostExcSin_uid122_fpSinCosXTest_s IS
                  WHEN "00" => fracRPostExcSin_uid122_fpSinCosXTest_q <= reg_fracRCompSin_uid103_fpSinCosXTest_0_to_fracRPostExcSin_uid122_fpSinCosXTest_2_q;
                  WHEN "01" => fracRPostExcSin_uid122_fpSinCosXTest_q <= ld_frac_uid13_fpSinCosXTest_b_to_fracRPostExcSin_uid122_fpSinCosXTest_d_replace_mem_q;
                  WHEN "10" => fracRPostExcSin_uid122_fpSinCosXTest_q <= cstAllZWF_uid7_fpSinCosXTest_q;
                  WHEN "11" => fracRPostExcSin_uid122_fpSinCosXTest_q <= cstNaNwF_uid32_fpSinCosXTest_q;
                  WHEN OTHERS => fracRPostExcSin_uid122_fpSinCosXTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fpSin_uid134_fpSinCosXTest(BITJOIN,133)@37
    fpSin_uid134_fpSinCosXTest_q <= ld_signRSinFull_uid133_fpSinCosXTest_q_to_fpSin_uid134_fpSinCosXTest_c_q & expRPostExcSin_uid126_fpSinCosXTest_q & fracRPostExcSin_uid122_fpSinCosXTest_q;

	--xOut(GPOUT,4)@37
    s <= fpSin_uid134_fpSinCosXTest_q;
    c <= fpCos_uid162_fpSinCosXTest_q;


end normal;
