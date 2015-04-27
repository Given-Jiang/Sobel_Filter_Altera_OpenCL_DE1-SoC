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

-- VHDL created from fp_ln1px_s5
-- VHDL created on Mon Mar 11 11:48:38 2013


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

-- Text written from /data/tczajkow/polyeval/p4/ip/aion/src/mip_common/hw_model.cpp:1303
entity fp_ln1px_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_ln1px_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllZWF_uid8_fpLogE1pxTest_q : std_logic_vector (22 downto 0);
    signal cstBias_uid9_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMO_uid10_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal cstBiasPWFP1_uid13_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMWFP1_uid14_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal cstAllOWE_uid15_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWE_uid17_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal padConst_uid36_fpLogE1pxTest_q : std_logic_vector (23 downto 0);
    signal maskIncrementTable_uid52_fpLogE1pxTest_q : std_logic_vector(23 downto 0);
    signal eUpdateOPOFracX_uid55_fpLogE1pxTest_a : std_logic_vector(8 downto 0);
    signal eUpdateOPOFracX_uid55_fpLogE1pxTest_b : std_logic_vector(8 downto 0);
    signal eUpdateOPOFracX_uid55_fpLogE1pxTest_o : std_logic_vector (8 downto 0);
    signal eUpdateOPOFracX_uid55_fpLogE1pxTest_q : std_logic_vector (8 downto 0);
    signal oPlusOFracXNorm_uid61_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal oPlusOFracXNorm_uid61_fpLogE1pxTest_q : std_logic_vector (23 downto 0);
    signal branEnc_uid77_fpLogE1pxTest_q : std_logic_vector(1 downto 0);
    signal expB_uid79_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal expB_uid79_fpLogE1pxTest_q : std_logic_vector (8 downto 0);
    signal branch3OrC_uid94_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch3OrC_uid94_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch3OrC_uid94_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal o2_uid97_fpLogE1pxTest_q : std_logic_vector (1 downto 0);
    signal z2_uid100_fpLogE1pxTest_q : std_logic_vector (1 downto 0);
    signal sEz_uid102_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal sEz_uid102_fpLogE1pxTest_q : std_logic_vector (24 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_a : std_logic_vector (24 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_s1 : std_logic_vector (51 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_pr : SIGNED (51 downto 0);
    signal postPEMul_uid103_fpLogE1pxTest_q : std_logic_vector (51 downto 0);
    signal wideZero_uid104_fpLogE1pxTest_q : std_logic_vector (34 downto 0);
    signal finalSumOneComp_uid112_fpLogE1pxTest_a : std_logic_vector(57 downto 0);
    signal finalSumOneComp_uid112_fpLogE1pxTest_b : std_logic_vector(57 downto 0);
    signal finalSumOneComp_uid112_fpLogE1pxTest_q : std_logic_vector(57 downto 0);
    signal cstMSBFinalSumPBias_uid116_fpLogE1pxTest_q : std_logic_vector (8 downto 0);
    signal expRExt_uid121_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal expRExt_uid121_fpLogE1pxTest_q : std_logic_vector (9 downto 0);
    signal fracR_uid126_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal fracR_uid126_fpLogE1pxTest_q : std_logic_vector (22 downto 0);
    signal expR_uid128_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal expR_uid128_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal InvExcRNaN_uid141_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid141_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid144_fpLogE1pxTest_q : std_logic_vector(1 downto 0);
    signal oneFracRPostExc2_uid145_fpLogE1pxTest_q : std_logic_vector (22 downto 0);
    signal rightShiftStage0Idx2Pad16_uid160_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (15 downto 0);
    signal rightShiftStage1Idx2Pad4_uid171_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (3 downto 0);
    signal rightShiftStage1Idx3Pad6_uid174_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (5 downto 0);
    signal mO_uid187_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal p1_uid246_constMult_q : std_logic_vector(36 downto 0);
    signal zs_uid267_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal mO_uid270_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (4 downto 0);
    signal vCount_uid283_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid283_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid283_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid295_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid295_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid295_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx3Pad48_uid311_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal leftShiftStage1Idx3Pad12_uid322_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage2Idx3Pad3_uid333_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (2 downto 0);
    signal prodXY_uid339_pT1_uid255_natLogPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid339_pT1_uid255_natLogPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid339_pT1_uid255_natLogPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid339_pT1_uid255_natLogPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid339_pT1_uid255_natLogPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid342_pT2_uid261_natLogPolyEval_a : std_logic_vector (15 downto 0);
    signal prodXY_uid342_pT2_uid261_natLogPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid342_pT2_uid261_natLogPolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid342_pT2_uid261_natLogPolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid342_pT2_uid261_natLogPolyEval_q : std_logic_vector (38 downto 0);
    signal memoryC0_uid251_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid251_natLogTabGen_lutmem_ia : std_logic_vector (30 downto 0);
    signal memoryC0_uid251_natLogTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC0_uid251_natLogTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC0_uid251_natLogTabGen_lutmem_iq : std_logic_vector (30 downto 0);
    signal memoryC0_uid251_natLogTabGen_lutmem_q : std_logic_vector (30 downto 0);
    signal memoryC1_uid252_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid252_natLogTabGen_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid252_natLogTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC1_uid252_natLogTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC1_uid252_natLogTabGen_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid252_natLogTabGen_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid253_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid253_natLogTabGen_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid253_natLogTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC2_uid253_natLogTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC2_uid253_natLogTabGen_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid253_natLogTabGen_lutmem_q : std_logic_vector (12 downto 0);
    signal reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_q : std_logic_vector (2 downto 0);
    signal reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q : std_logic_vector (3 downto 0);
    signal reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0_q : std_logic_vector (4 downto 0);
    signal reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0_q : std_logic_vector (23 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q : std_logic_vector (47 downto 0);
    signal reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0_q : std_logic_vector (47 downto 0);
    signal reg_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1_q : std_logic_vector (47 downto 0);
    signal reg_rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_1_q : std_logic_vector (15 downto 0);
    signal reg_cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q : std_logic_vector (46 downto 0);
    signal reg_leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q : std_logic_vector (46 downto 0);
    signal reg_leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q : std_logic_vector (46 downto 0);
    signal reg_leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q : std_logic_vector (46 downto 0);
    signal reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q : std_logic_vector (23 downto 0);
    signal reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q : std_logic_vector (23 downto 0);
    signal reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q : std_logic_vector (23 downto 0);
    signal reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q : std_logic_vector (0 downto 0);
    signal reg_addr_uid90_fpLogE1pxTest_0_to_memoryC2_uid253_natLogTabGen_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_yT1_uid254_natLogPolyEval_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid253_natLogTabGen_lutmem_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_memoryC1_uid252_natLogTabGen_lutmem_0_to_sumAHighB_uid258_natLogPolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid256_uid259_natLogPolyEval_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_memoryC0_uid251_natLogTabGen_lutmem_0_to_sumAHighB_uid264_natLogPolyEval_0_q : std_logic_vector (30 downto 0);
    signal reg_peOR_uid93_fpLogE1pxTest_0_to_postPEMul_uid103_fpLogE1pxTest_1_q : std_logic_vector (26 downto 0);
    signal reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q : std_logic_vector (7 downto 0);
    signal reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5_q : std_logic_vector (7 downto 0);
    signal reg_xv1_uid245_constMult_0_to_p1_uid246_constMult_0_q : std_logic_vector (2 downto 0);
    signal reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_sR_uid249_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q : std_logic_vector (34 downto 0);
    signal reg_rVStage_uid268_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid269_countZ_uid114_fpLogE1pxTest_1_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid276_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid277_countZ_uid114_fpLogE1pxTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid278_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid280_countZ_uid114_fpLogE1pxTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid282_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid284_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid294_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid296_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid289_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_2_q : std_logic_vector (58 downto 0);
    signal reg_leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_3_q : std_logic_vector (58 downto 0);
    signal reg_leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_4_q : std_logic_vector (58 downto 0);
    signal reg_leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_5_q : std_logic_vector (58 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_2_q : std_logic_vector (58 downto 0);
    signal reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q : std_logic_vector (4 downto 0);
    signal reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q : std_logic_vector (9 downto 0);
    signal reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0_q : std_logic_vector (33 downto 0);
    signal ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a_q : std_logic_vector (31 downto 0);
    signal ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_q : std_logic_vector (48 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_a_q : std_logic_vector (7 downto 0);
    signal ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_q : std_logic_vector (3 downto 0);
    signal ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_q : std_logic_vector (8 downto 0);
    signal ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b_q : std_logic_vector (1 downto 0);
    signal ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_q : std_logic_vector (23 downto 0);
    signal ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_FullSumAB57_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c_q : std_logic_vector (9 downto 0);
    signal ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a_q : std_logic_vector (0 downto 0);
    signal ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (45 downto 0);
    signal ld_RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (43 downto 0);
    signal ld_RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a_q : std_logic_vector (41 downto 0);
    signal ld_reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_b_q : std_logic_vector (1 downto 0);
    signal ld_rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_d_q : std_logic_vector (0 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q_to_p0_uid247_constMult_a_q : std_logic_vector (5 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid272_countZ_uid114_fpLogE1pxTest_b_q : std_logic_vector (26 downto 0);
    signal ld_rVStage_uid268_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid274_countZ_uid114_fpLogE1pxTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid283_countZ_uid114_fpLogE1pxTest_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_f_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_b_q : std_logic_vector (57 downto 0);
    signal ld_LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_b_q : std_logic_vector (56 downto 0);
    signal ld_LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_b_q : std_logic_vector (55 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC1_uid252_natLogTabGen_lutmem_0_q_to_memoryC1_uid252_natLogTabGen_lutmem_a_q : std_logic_vector (8 downto 0);
    signal ld_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q_to_reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_a_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid277_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_a_q : std_logic_vector (0 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_b_to_reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg_q : std_logic_vector (48 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_reset0 : std_logic;
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_sticky_ena_q : signal is true;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_reset0 : std_logic;
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_eq : std_logic;
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q : signal is true;
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq : std_logic;
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_eq : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_inputreg_q : std_logic_vector (24 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_reset0 : std_logic;
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_ia : std_logic_vector (24 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_iq : std_logic_vector (24 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_q : std_logic_vector (24 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_eq : std_logic;
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_sticky_ena_q : signal is true;
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg_q : std_logic_vector (5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq : std_logic;
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq : std_logic;
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_reset0 : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_eq : std_logic;
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q : signal is true;
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q : signal is true;
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_reset0 : std_logic;
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q : signal is true;
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_inputreg_q : std_logic_vector (42 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (42 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (42 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (42 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (26 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (26 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (26 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_inputreg_q : std_logic_vector (10 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 : std_logic;
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q : signal is true;
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_inputreg_q : std_logic_vector (58 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_reset0 : std_logic;
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_ia : std_logic_vector (58 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_iq : std_logic_vector (58 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_q : std_logic_vector (58 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_eq : std_logic;
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_sticky_ena_q : signal is true;
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_reset0 : std_logic;
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_sticky_ena_q : signal is true;
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_inputreg_q : std_logic_vector (15 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_inputreg_q : std_logic_vector (4 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_ia : std_logic_vector (4 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_iq : std_logic_vector (4 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_q : std_logic_vector (4 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_sticky_ena_q : signal is true;
    signal pad_o_uid12_uid40_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal fracXz_uid82_fpLogE1pxTest_q : std_logic_vector (23 downto 0);
    signal leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal InvExpXIsZero_uid29_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid29_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal expFracPostRnd_uid124_fpLogE1pxTest_a : std_logic_vector(34 downto 0);
    signal expFracPostRnd_uid124_fpLogE1pxTest_b : std_logic_vector(34 downto 0);
    signal expFracPostRnd_uid124_fpLogE1pxTest_o : std_logic_vector (34 downto 0);
    signal expFracPostRnd_uid124_fpLogE1pxTest_q : std_logic_vector (34 downto 0);
    signal mO_uid130_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal expX_uid6_fpLogE1pxTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal signX_uid7_fpLogE1pxTest_in : std_logic_vector (31 downto 0);
    signal signX_uid7_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal xM1_uid131_fpLogE1pxTest_a : std_logic_vector(31 downto 0);
    signal xM1_uid131_fpLogE1pxTest_b : std_logic_vector(31 downto 0);
    signal xM1_uid131_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_a : std_logic_vector(34 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_b : std_logic_vector(34 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_o : std_logic_vector (34 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal xLTM1_uid133_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal expXIsZero_uid19_fpLogE1pxTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid19_fpLogE1pxTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid19_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid21_fpLogE1pxTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid21_fpLogE1pxTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid21_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal shifterAddrExt_uid34_fpLogE1pxTest_a : std_logic_vector(8 downto 0);
    signal shifterAddrExt_uid34_fpLogE1pxTest_b : std_logic_vector(8 downto 0);
    signal shifterAddrExt_uid34_fpLogE1pxTest_o : std_logic_vector (8 downto 0);
    signal shifterAddrExt_uid34_fpLogE1pxTest_q : std_logic_vector (8 downto 0);
    signal oMfracXRSExt_uid40_fpLogE1pxTest_a : std_logic_vector(48 downto 0);
    signal oMfracXRSExt_uid40_fpLogE1pxTest_b : std_logic_vector(48 downto 0);
    signal oMfracXRSExt_uid40_fpLogE1pxTest_o : std_logic_vector (48 downto 0);
    signal oMfracXRSExt_uid40_fpLogE1pxTest_q : std_logic_vector (48 downto 0);
    signal addrMaskExt_uid50_fpLogE1pxTest_a : std_logic_vector(8 downto 0);
    signal addrMaskExt_uid50_fpLogE1pxTest_b : std_logic_vector(8 downto 0);
    signal addrMaskExt_uid50_fpLogE1pxTest_o : std_logic_vector (8 downto 0);
    signal addrMaskExt_uid50_fpLogE1pxTest_q : std_logic_vector (8 downto 0);
    signal oPlusOFracX_uid53_fpLogE1pxTest_a : std_logic_vector(24 downto 0);
    signal oPlusOFracX_uid53_fpLogE1pxTest_b : std_logic_vector(24 downto 0);
    signal oPlusOFracX_uid53_fpLogE1pxTest_o : std_logic_vector (24 downto 0);
    signal oPlusOFracX_uid53_fpLogE1pxTest_q : std_logic_vector (24 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_a : std_logic_vector(10 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_b : std_logic_vector(10 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_o : std_logic_vector (10 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal resIsX_uid62_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal branch12_uid63_fpLogE1pxTest_a : std_logic_vector(10 downto 0);
    signal branch12_uid63_fpLogE1pxTest_b : std_logic_vector(10 downto 0);
    signal branch12_uid63_fpLogE1pxTest_o : std_logic_vector (10 downto 0);
    signal branch12_uid63_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal branch12_uid63_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal branch12_uid63_fpLogE1pxTest_n : std_logic_vector (0 downto 0);
    signal branch22_uid66_fpLogE1pxTest_a : std_logic_vector(10 downto 0);
    signal branch22_uid66_fpLogE1pxTest_b : std_logic_vector(10 downto 0);
    signal branch22_uid66_fpLogE1pxTest_o : std_logic_vector (10 downto 0);
    signal branch22_uid66_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal branch22_uid66_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal branch22_uid66_fpLogE1pxTest_n : std_logic_vector (0 downto 0);
    signal fracB_uid83_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal fracB_uid83_fpLogE1pxTest_q : std_logic_vector (23 downto 0);
    signal e_uid84_fpLogE1pxTest_a : std_logic_vector(9 downto 0);
    signal e_uid84_fpLogE1pxTest_b : std_logic_vector(9 downto 0);
    signal e_uid84_fpLogE1pxTest_o : std_logic_vector (9 downto 0);
    signal e_uid84_fpLogE1pxTest_q : std_logic_vector (9 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_a : std_logic_vector(10 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_b : std_logic_vector(10 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_o : std_logic_vector (10 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_cin : std_logic_vector (0 downto 0);
    signal expXIsMo_uid86_fpLogE1pxTest_c : std_logic_vector (0 downto 0);
    signal c_uid87_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal c_uid87_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal c_uid87_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal addTermOne_uid105_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal addTermOne_uid105_fpLogE1pxTest_q : std_logic_vector (34 downto 0);
    signal finalSumAbs_uid113_fpLogE1pxTest_a : std_logic_vector(58 downto 0);
    signal finalSumAbs_uid113_fpLogE1pxTest_b : std_logic_vector(58 downto 0);
    signal finalSumAbs_uid113_fpLogE1pxTest_o : std_logic_vector (58 downto 0);
    signal finalSumAbs_uid113_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal branch4ExpCorrection_uid118_fpLogE1pxTest_a : std_logic_vector(5 downto 0);
    signal branch4ExpCorrection_uid118_fpLogE1pxTest_b : std_logic_vector(5 downto 0);
    signal branch4ExpCorrection_uid118_fpLogE1pxTest_o : std_logic_vector (5 downto 0);
    signal branch4ExpCorrection_uid118_fpLogE1pxTest_q : std_logic_vector (5 downto 0);
    signal expRExt1_uid119_fpLogE1pxTest_a : std_logic_vector(10 downto 0);
    signal expRExt1_uid119_fpLogE1pxTest_b : std_logic_vector(10 downto 0);
    signal expRExt1_uid119_fpLogE1pxTest_o : std_logic_vector (10 downto 0);
    signal expRExt1_uid119_fpLogE1pxTest_q : std_logic_vector (10 downto 0);
    signal signRFull_uid142_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal signRFull_uid142_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal signRFull_uid142_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid148_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid148_fpLogE1pxTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid152_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid152_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal p0_uid247_constMult_q : std_logic_vector(33 downto 0);
    signal lev1_a0_uid248_constMult_a : std_logic_vector(38 downto 0);
    signal lev1_a0_uid248_constMult_b : std_logic_vector(38 downto 0);
    signal lev1_a0_uid248_constMult_o : std_logic_vector (38 downto 0);
    signal lev1_a0_uid248_constMult_q : std_logic_vector (37 downto 0);
    signal vCount_uid269_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid269_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid269_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vCount_uid277_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid277_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid277_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid280_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid280_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid286_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid286_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid298_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid298_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal sEz_uid98_fpLogE1pxTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal lowRangeB_uid106_fpLogE1pxTest_in : std_logic_vector (21 downto 0);
    signal lowRangeB_uid106_fpLogE1pxTest_b : std_logic_vector (21 downto 0);
    signal highBBits_uid107_fpLogE1pxTest_in : std_logic_vector (51 downto 0);
    signal highBBits_uid107_fpLogE1pxTest_b : std_logic_vector (29 downto 0);
    signal leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal cStage_uid272_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal prodXYTruncFR_uid340_pT1_uid255_natLogPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid340_pT1_uid255_natLogPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid343_pT2_uid261_natLogPolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid343_pT2_uid261_natLogPolyEval_b : std_logic_vector (23 downto 0);
    signal rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal frac_uid22_fpLogE1pxTest_in : std_logic_vector (22 downto 0);
    signal frac_uid22_fpLogE1pxTest_b : std_logic_vector (22 downto 0);
    signal redLO_uid47_fpLogE1pxTest_in : std_logic_vector (46 downto 0);
    signal redLO_uid47_fpLogE1pxTest_b : std_logic_vector (46 downto 0);
    signal zPPolyEval_uid91_fpLogE1pxTest_in : std_logic_vector (15 downto 0);
    signal zPPolyEval_uid91_fpLogE1pxTest_b : std_logic_vector (15 downto 0);
    signal vStagei_uid274_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid274_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_a : std_logic_vector(2 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_b : std_logic_vector(2 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_a : std_logic_vector(2 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_b : std_logic_vector(2 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_a : std_logic_vector(5 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_b : std_logic_vector(5 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_q : std_logic_vector(0 downto 0);
    signal RLn_uid153_fpLogE1pxTest_q : std_logic_vector (31 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal fracR0_uid125_fpLogE1pxTest_in : std_logic_vector (23 downto 0);
    signal fracR0_uid125_fpLogE1pxTest_b : std_logic_vector (22 downto 0);
    signal expR_uid127_fpLogE1pxTest_in : std_logic_vector (31 downto 0);
    signal expR_uid127_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal branch11_uid64_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch11_uid64_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal shifterAddr_uid35_fpLogE1pxTest_in : std_logic_vector (4 downto 0);
    signal shifterAddr_uid35_fpLogE1pxTest_b : std_logic_vector (4 downto 0);
    signal oMfracXRSLZCIn_uid43_fpLogE1pxTest_in : std_logic_vector (46 downto 0);
    signal oMfracXRSLZCIn_uid43_fpLogE1pxTest_b : std_logic_vector (23 downto 0);
    signal addrMask_uid51_fpLogE1pxTest_in : std_logic_vector (4 downto 0);
    signal addrMask_uid51_fpLogE1pxTest_b : std_logic_vector (4 downto 0);
    signal msbUoPlusOFracX_uid54_fpLogE1pxTest_in : std_logic_vector (24 downto 0);
    signal msbUoPlusOFracX_uid54_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal oPlusOFracXNormLow_uid57_fpLogE1pxTest_in : std_logic_vector (22 downto 0);
    signal oPlusOFracXNormLow_uid57_fpLogE1pxTest_b : std_logic_vector (22 downto 0);
    signal oPlusOFracXNormHigh_uid59_fpLogE1pxTest_in : std_logic_vector (23 downto 0);
    signal oPlusOFracXNormHigh_uid59_fpLogE1pxTest_b : std_logic_vector (23 downto 0);
    signal InvResIsX_uid72_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvResIsX_uid72_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal branch2_uid69_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch2_uid69_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch2_uid69_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal branch2_uid69_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal branch1_uid65_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch1_uid65_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch1_uid65_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal branch3_uid73_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch3_uid73_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch3_uid73_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal branch3_uid73_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal branch4_uid75_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal branch4_uid75_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal branch4_uid75_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal branch4_uid75_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal zAddrLow_uid89_fpLogE1pxTest_in : std_logic_vector (23 downto 0);
    signal zAddrLow_uid89_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal fracBRed_uid99_fpLogE1pxTest_in : std_logic_vector (23 downto 0);
    signal fracBRed_uid99_fpLogE1pxTest_b : std_logic_vector (22 downto 0);
    signal xv0_uid244_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid244_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid245_constMult_in : std_logic_vector (8 downto 0);
    signal xv1_uid245_constMult_b : std_logic_vector (2 downto 0);
    signal sumAHighB_uid108_fpLogE1pxTest_a : std_logic_vector(35 downto 0);
    signal sumAHighB_uid108_fpLogE1pxTest_b : std_logic_vector(35 downto 0);
    signal sumAHighB_uid108_fpLogE1pxTest_o : std_logic_vector (35 downto 0);
    signal sumAHighB_uid108_fpLogE1pxTest_q : std_logic_vector (35 downto 0);
    signal rVStage_uid268_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (58 downto 0);
    signal rVStage_uid268_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid271_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (26 downto 0);
    signal vStage_uid271_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (26 downto 0);
    signal X42dto0_uid306_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (42 downto 0);
    signal X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (42 downto 0);
    signal X10dto0_uid312_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (10 downto 0);
    signal X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (10 downto 0);
    signal expRExt1Red_uid120_fpLogE1pxTest_in : std_logic_vector (9 downto 0);
    signal expRExt1Red_uid120_fpLogE1pxTest_b : std_logic_vector (9 downto 0);
    signal rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage145dto0_uid239_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (45 downto 0);
    signal LeftShiftStage145dto0_uid239_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (45 downto 0);
    signal sR_uid249_constMult_in : std_logic_vector (36 downto 0);
    signal sR_uid249_constMult_b : std_logic_vector (34 downto 0);
    signal rVStage_uid282_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid282_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid284_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid284_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid288_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid288_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid290_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid290_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid300_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid300_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (57 downto 0);
    signal LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (57 downto 0);
    signal LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (56 downto 0);
    signal LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (56 downto 0);
    signal LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (55 downto 0);
    signal LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (55 downto 0);
    signal finalSum_uid106_uid109_fpLogE1pxTest_q : std_logic_vector (57 downto 0);
    signal lowRangeB_uid256_natLogPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid256_natLogPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid257_natLogPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid257_natLogPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid262_natLogPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid262_natLogPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid263_natLogPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid263_natLogPolyEval_b : std_logic_vector (21 downto 0);
    signal RightShiftStage147dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (47 downto 0);
    signal RightShiftStage147dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (46 downto 0);
    signal fracR_uid122_fpLogE1pxTest_in : std_logic_vector (57 downto 0);
    signal fracR_uid122_fpLogE1pxTest_b : std_logic_vector (23 downto 0);
    signal fracXIsZero_uid23_fpLogE1pxTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid23_fpLogE1pxTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid23_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal oFracX_uid32_fpLogE1pxTest_q : std_logic_vector (23 downto 0);
    signal X38dto0_uid217_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (38 downto 0);
    signal X38dto0_uid217_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (38 downto 0);
    signal X30dto0_uid220_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (30 downto 0);
    signal X30dto0_uid220_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (30 downto 0);
    signal X22dto0_uid223_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (22 downto 0);
    signal X22dto0_uid223_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (22 downto 0);
    signal yT1_uid254_natLogPolyEval_in : std_logic_vector (15 downto 0);
    signal yT1_uid254_natLogPolyEval_b : std_logic_vector (12 downto 0);
    signal rVStage_uid276_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid276_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid278_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid278_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (15 downto 0);
    signal rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (23 downto 0);
    signal rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid188_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid188_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal join_uid58_fpLogE1pxTest_q : std_logic_vector (23 downto 0);
    signal concBranch_uid76_fpLogE1pxTest_q : std_logic_vector (3 downto 0);
    signal addr_uid90_fpLogE1pxTest_q : std_logic_vector (8 downto 0);
    signal sEz_uid101_fpLogE1pxTest_q : std_logic_vector (24 downto 0);
    signal vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage2Idx1_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal vCount_uid289_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid289_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid289_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid292_countZ_uid114_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid292_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (3 downto 0);
    signal vCount_uid301_countZ_uid114_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid301_countZ_uid114_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid301_countZ_uid114_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal FullSumAB57_uid110_fpLogE1pxTest_in : std_logic_vector (57 downto 0);
    signal FullSumAB57_uid110_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal sumAHighB_uid258_natLogPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid258_natLogPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid258_natLogPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid258_natLogPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid264_natLogPolyEval_a : std_logic_vector(31 downto 0);
    signal sumAHighB_uid264_natLogPolyEval_b : std_logic_vector(31 downto 0);
    signal sumAHighB_uid264_natLogPolyEval_o : std_logic_vector (31 downto 0);
    signal sumAHighB_uid264_natLogPolyEval_q : std_logic_vector (31 downto 0);
    signal rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal expFracConc_uid123_fpLogE1pxTest_q : std_logic_vector (33 downto 0);
    signal exc_I_uid24_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid24_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid25_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid25_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal rightPaddedIn_uid37_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal leftShiftStage0Idx1_uid218_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal leftShiftStage0Idx2_uid221_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal leftShiftStage0Idx3_uid224_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (15 downto 0);
    signal rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal r_uid213_leadingZeros_uid44_fpLogE1pxTest_q : std_logic_vector (4 downto 0);
    signal leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal rVStage_uid294_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid294_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid296_countZ_uid114_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid296_countZ_uid114_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal r_uid302_countZ_uid114_fpLogE1pxTest_q : std_logic_vector (5 downto 0);
    signal s1_uid256_uid259_natLogPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid262_uid265_natLogPolyEval_q : std_logic_vector (33 downto 0);
    signal rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal InvExc_I_uid28_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid28_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal posInf_uid136_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal posInf_uid136_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal posInf_uid136_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal negInf_uid138_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal negInf_uid138_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal negInf_uid138_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid26_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal X47dto8_uid156_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (47 downto 0);
    signal X47dto8_uid156_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (39 downto 0);
    signal X47dto16_uid159_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (47 downto 0);
    signal X47dto16_uid159_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (31 downto 0);
    signal X47dto24_uid162_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (47 downto 0);
    signal X47dto24_uid162_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (23 downto 0);
    signal expBran3PreExt_uid45_fpLogE1pxTest_a : std_logic_vector(8 downto 0);
    signal expBran3PreExt_uid45_fpLogE1pxTest_b : std_logic_vector(8 downto 0);
    signal expBran3PreExt_uid45_fpLogE1pxTest_o : std_logic_vector (8 downto 0);
    signal expBran3PreExt_uid45_fpLogE1pxTest_q : std_logic_vector (8 downto 0);
    signal leftShiftStageSel4Dto3_uid225_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid225_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (0 downto 0);
    signal fracXBranch4_uid49_fpLogE1pxTest_in : std_logic_vector (46 downto 0);
    signal fracXBranch4_uid49_fpLogE1pxTest_b : std_logic_vector (24 downto 0);
    signal expRExt0_uid117_fpLogE1pxTest_a : std_logic_vector(9 downto 0);
    signal expRExt0_uid117_fpLogE1pxTest_b : std_logic_vector(9 downto 0);
    signal expRExt0_uid117_fpLogE1pxTest_o : std_logic_vector (9 downto 0);
    signal expRExt0_uid117_fpLogE1pxTest_q : std_logic_vector (9 downto 0);
    signal leftShiftStageSel5Dto4_uid314_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid314_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (1 downto 0);
    signal peOR_uid93_fpLogE1pxTest_in : std_logic_vector (32 downto 0);
    signal peOR_uid93_fpLogE1pxTest_b : std_logic_vector (26 downto 0);
    signal fracXRS_uid39_fpLogE1pxTest_in : std_logic_vector (47 downto 0);
    signal fracXRS_uid39_fpLogE1pxTest_b : std_logic_vector (24 downto 0);
    signal InvExc_N_uid27_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid27_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal expBran3Pre_uid46_fpLogE1pxTest_in : std_logic_vector (7 downto 0);
    signal expBran3Pre_uid46_fpLogE1pxTest_b : std_logic_vector (7 downto 0);
    signal leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal fracXBranch4Red_uid80_fpLogE1pxTest_in : std_logic_vector (23 downto 0);
    signal fracXBranch4Red_uid80_fpLogE1pxTest_b : std_logic_vector (23 downto 0);
    signal leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal fracXRSRange_uid81_fpLogE1pxTest_in : std_logic_vector (23 downto 0);
    signal fracXRSRange_uid81_fpLogE1pxTest_b : std_logic_vector (23 downto 0);
    signal exc_R_uid30_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid30_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q : std_logic_vector (47 downto 0);
    signal LeftShiftStage044dto0_uid228_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (44 downto 0);
    signal LeftShiftStage044dto0_uid228_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (44 downto 0);
    signal LeftShiftStage042dto0_uid231_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (42 downto 0);
    signal LeftShiftStage042dto0_uid231_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (42 downto 0);
    signal LeftShiftStage040dto0_uid234_fracXBranch4Ext_uid48_fpLogE1pxTest_in : std_logic_vector (40 downto 0);
    signal LeftShiftStage040dto0_uid234_fracXBranch4Ext_uid48_fpLogE1pxTest_b : std_logic_vector (40 downto 0);
    signal LeftShiftStage054dto0_uid317_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (54 downto 0);
    signal LeftShiftStage054dto0_uid317_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (54 downto 0);
    signal LeftShiftStage050dto0_uid320_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (50 downto 0);
    signal LeftShiftStage050dto0_uid320_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (50 downto 0);
    signal LeftShiftStage046dto0_uid323_normVal_uid115_fpLogE1pxTest_in : std_logic_vector (46 downto 0);
    signal LeftShiftStage046dto0_uid323_normVal_uid115_fpLogE1pxTest_b : std_logic_vector (46 downto 0);
    signal excRInf0_uid134_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal excRInf0_uid134_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal excRInf0_uid134_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal excRNaN0_uid139_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal excRNaN0_uid139_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal excRNaN0_uid139_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (47 downto 0);
    signal RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (45 downto 0);
    signal RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (47 downto 0);
    signal RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (43 downto 0);
    signal RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_in : std_logic_vector (47 downto 0);
    signal RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_b : std_logic_vector (41 downto 0);
    signal leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_q : std_logic_vector (46 downto 0);
    signal leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_q : std_logic_vector (58 downto 0);
    signal excRInf0_uid137_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal excRInf0_uid137_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal excRInf0_uid137_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid140_fpLogE1pxTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid140_fpLogE1pxTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid140_fpLogE1pxTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid140_fpLogE1pxTest_q : std_logic_vector(0 downto 0);
    signal concExc_uid143_fpLogE1pxTest_q : std_logic_vector (2 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable(LOGICAL,845)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_a <= en;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q <= not ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_a;

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor(LOGICAL,978)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_b <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_q <= not (ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_a or ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_b);

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_mem_top(CONSTANT,948)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_mem_top_q <= "011011";

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp(LOGICAL,949)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_a <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_mem_top_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_q);
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_q <= "1" when ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_a = ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_b else "0";

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg(REG,950)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena(REG,979)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_nor_q = "1") THEN
                ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd(LOGICAL,980)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_a <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_sticky_ena_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_b <= en;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_a and ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_b;

	--signX_uid7_fpLogE1pxTest(BITSELECT,6)@0
    signX_uid7_fpLogE1pxTest_in <= a;
    signX_uid7_fpLogE1pxTest_b <= signX_uid7_fpLogE1pxTest_in(31 downto 31);

	--ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b(DELAY,562)@0
    ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => signX_uid7_fpLogE1pxTest_b, xout => ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstAllZWF_uid8_fpLogE1pxTest(CONSTANT,7)
    cstAllZWF_uid8_fpLogE1pxTest_q <= "00000000000000000000000";

	--ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a(DELAY,418)@0
    ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => a, xout => ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--frac_uid22_fpLogE1pxTest(BITSELECT,21)@1
    frac_uid22_fpLogE1pxTest_in <= ld_xIn_a_to_frac_uid22_fpLogE1pxTest_a_q(22 downto 0);
    frac_uid22_fpLogE1pxTest_b <= frac_uid22_fpLogE1pxTest_in(22 downto 0);

	--fracXIsZero_uid23_fpLogE1pxTest(LOGICAL,22)@1
    fracXIsZero_uid23_fpLogE1pxTest_a <= frac_uid22_fpLogE1pxTest_b;
    fracXIsZero_uid23_fpLogE1pxTest_b <= cstAllZWF_uid8_fpLogE1pxTest_q;
    fracXIsZero_uid23_fpLogE1pxTest_q <= "1" when fracXIsZero_uid23_fpLogE1pxTest_a = fracXIsZero_uid23_fpLogE1pxTest_b else "0";

	--cstAllOWE_uid15_fpLogE1pxTest(CONSTANT,14)
    cstAllOWE_uid15_fpLogE1pxTest_q <= "11111111";

	--expX_uid6_fpLogE1pxTest(BITSELECT,5)@0
    expX_uid6_fpLogE1pxTest_in <= a(30 downto 0);
    expX_uid6_fpLogE1pxTest_b <= expX_uid6_fpLogE1pxTest_in(30 downto 23);

	--expXIsMax_uid21_fpLogE1pxTest(LOGICAL,20)@0
    expXIsMax_uid21_fpLogE1pxTest_a <= expX_uid6_fpLogE1pxTest_b;
    expXIsMax_uid21_fpLogE1pxTest_b <= cstAllOWE_uid15_fpLogE1pxTest_q;
    expXIsMax_uid21_fpLogE1pxTest_q <= "1" when expXIsMax_uid21_fpLogE1pxTest_a = expXIsMax_uid21_fpLogE1pxTest_b else "0";

	--ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a(DELAY,420)@0
    ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid21_fpLogE1pxTest_q, xout => ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_I_uid24_fpLogE1pxTest(LOGICAL,23)@1
    exc_I_uid24_fpLogE1pxTest_a <= ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a_q;
    exc_I_uid24_fpLogE1pxTest_b <= fracXIsZero_uid23_fpLogE1pxTest_q;
    exc_I_uid24_fpLogE1pxTest_q <= exc_I_uid24_fpLogE1pxTest_a and exc_I_uid24_fpLogE1pxTest_b;

	--ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a(DELAY,553)@0
    ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid7_fpLogE1pxTest_b, xout => ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--negInf_uid138_fpLogE1pxTest(LOGICAL,137)@1
    negInf_uid138_fpLogE1pxTest_a <= ld_signX_uid7_fpLogE1pxTest_b_to_negInf_uid138_fpLogE1pxTest_a_q;
    negInf_uid138_fpLogE1pxTest_b <= exc_I_uid24_fpLogE1pxTest_q;
    negInf_uid138_fpLogE1pxTest_q <= negInf_uid138_fpLogE1pxTest_a and negInf_uid138_fpLogE1pxTest_b;

	--GND(CONSTANT,0)
    GND_q <= "0";

	--cstBias_uid9_fpLogE1pxTest(CONSTANT,8)
    cstBias_uid9_fpLogE1pxTest_q <= "01111111";

	--mO_uid130_fpLogE1pxTest(BITJOIN,129)@0
    mO_uid130_fpLogE1pxTest_q <= VCC_q & cstBias_uid9_fpLogE1pxTest_q & cstAllZWF_uid8_fpLogE1pxTest_q;

	--xLTM1_uid133_fpLogE1pxTest(COMPARE,132)@0
    xLTM1_uid133_fpLogE1pxTest_cin <= GND_q;
    xLTM1_uid133_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & mO_uid130_fpLogE1pxTest_q) & '0';
    xLTM1_uid133_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & a) & xLTM1_uid133_fpLogE1pxTest_cin(0);
            xLTM1_uid133_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xLTM1_uid133_fpLogE1pxTest_a) - UNSIGNED(xLTM1_uid133_fpLogE1pxTest_b));
    xLTM1_uid133_fpLogE1pxTest_c(0) <= xLTM1_uid133_fpLogE1pxTest_o(34);


	--ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b(DELAY,556)@0
    ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xLTM1_uid133_fpLogE1pxTest_c, xout => ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid27_fpLogE1pxTest(LOGICAL,26)@1
    InvExc_N_uid27_fpLogE1pxTest_a <= exc_N_uid26_fpLogE1pxTest_q;
    InvExc_N_uid27_fpLogE1pxTest_q <= not InvExc_N_uid27_fpLogE1pxTest_a;

	--InvExc_I_uid28_fpLogE1pxTest(LOGICAL,27)@1
    InvExc_I_uid28_fpLogE1pxTest_a <= exc_I_uid24_fpLogE1pxTest_q;
    InvExc_I_uid28_fpLogE1pxTest_q <= not InvExc_I_uid28_fpLogE1pxTest_a;

	--cstAllZWE_uid17_fpLogE1pxTest(CONSTANT,16)
    cstAllZWE_uid17_fpLogE1pxTest_q <= "00000000";

	--expXIsZero_uid19_fpLogE1pxTest(LOGICAL,18)@0
    expXIsZero_uid19_fpLogE1pxTest_a <= expX_uid6_fpLogE1pxTest_b;
    expXIsZero_uid19_fpLogE1pxTest_b <= cstAllZWE_uid17_fpLogE1pxTest_q;
    expXIsZero_uid19_fpLogE1pxTest_q <= "1" when expXIsZero_uid19_fpLogE1pxTest_a = expXIsZero_uid19_fpLogE1pxTest_b else "0";

	--ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a(DELAY,427)@0
    ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid19_fpLogE1pxTest_q, xout => ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExpXIsZero_uid29_fpLogE1pxTest(LOGICAL,28)@1
    InvExpXIsZero_uid29_fpLogE1pxTest_a <= ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a_q;
    InvExpXIsZero_uid29_fpLogE1pxTest_q <= not InvExpXIsZero_uid29_fpLogE1pxTest_a;

	--exc_R_uid30_fpLogE1pxTest(LOGICAL,29)@1
    exc_R_uid30_fpLogE1pxTest_a <= InvExpXIsZero_uid29_fpLogE1pxTest_q;
    exc_R_uid30_fpLogE1pxTest_b <= InvExc_I_uid28_fpLogE1pxTest_q;
    exc_R_uid30_fpLogE1pxTest_c <= InvExc_N_uid27_fpLogE1pxTest_q;
    exc_R_uid30_fpLogE1pxTest_q <= exc_R_uid30_fpLogE1pxTest_a and exc_R_uid30_fpLogE1pxTest_b and exc_R_uid30_fpLogE1pxTest_c;

	--excRNaN0_uid139_fpLogE1pxTest(LOGICAL,138)@1
    excRNaN0_uid139_fpLogE1pxTest_a <= exc_R_uid30_fpLogE1pxTest_q;
    excRNaN0_uid139_fpLogE1pxTest_b <= ld_xLTM1_uid133_fpLogE1pxTest_c_to_excRNaN0_uid139_fpLogE1pxTest_b_q;
    excRNaN0_uid139_fpLogE1pxTest_q <= excRNaN0_uid139_fpLogE1pxTest_a and excRNaN0_uid139_fpLogE1pxTest_b;

	--InvFracXIsZero_uid25_fpLogE1pxTest(LOGICAL,24)@1
    InvFracXIsZero_uid25_fpLogE1pxTest_a <= fracXIsZero_uid23_fpLogE1pxTest_q;
    InvFracXIsZero_uid25_fpLogE1pxTest_q <= not InvFracXIsZero_uid25_fpLogE1pxTest_a;

	--exc_N_uid26_fpLogE1pxTest(LOGICAL,25)@1
    exc_N_uid26_fpLogE1pxTest_a <= ld_expXIsMax_uid21_fpLogE1pxTest_q_to_exc_I_uid24_fpLogE1pxTest_a_q;
    exc_N_uid26_fpLogE1pxTest_b <= InvFracXIsZero_uid25_fpLogE1pxTest_q;
    exc_N_uid26_fpLogE1pxTest_q <= exc_N_uid26_fpLogE1pxTest_a and exc_N_uid26_fpLogE1pxTest_b;

	--excRNaN_uid140_fpLogE1pxTest(LOGICAL,139)@1
    excRNaN_uid140_fpLogE1pxTest_a <= exc_N_uid26_fpLogE1pxTest_q;
    excRNaN_uid140_fpLogE1pxTest_b <= excRNaN0_uid139_fpLogE1pxTest_q;
    excRNaN_uid140_fpLogE1pxTest_c <= negInf_uid138_fpLogE1pxTest_q;
    excRNaN_uid140_fpLogE1pxTest_q <= excRNaN_uid140_fpLogE1pxTest_a or excRNaN_uid140_fpLogE1pxTest_b or excRNaN_uid140_fpLogE1pxTest_c;

	--InvExcRNaN_uid141_fpLogE1pxTest(LOGICAL,140)@1
    InvExcRNaN_uid141_fpLogE1pxTest_a <= excRNaN_uid140_fpLogE1pxTest_q;
    InvExcRNaN_uid141_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExcRNaN_uid141_fpLogE1pxTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExcRNaN_uid141_fpLogE1pxTest_q <= not InvExcRNaN_uid141_fpLogE1pxTest_a;
        END IF;
    END PROCESS;



	--signRFull_uid142_fpLogE1pxTest(LOGICAL,141)@2
    signRFull_uid142_fpLogE1pxTest_a <= InvExcRNaN_uid141_fpLogE1pxTest_q;
    signRFull_uid142_fpLogE1pxTest_b <= ld_signX_uid7_fpLogE1pxTest_b_to_signRFull_uid142_fpLogE1pxTest_b_q;
    signRFull_uid142_fpLogE1pxTest_q <= signRFull_uid142_fpLogE1pxTest_a and signRFull_uid142_fpLogE1pxTest_b;

	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg(DELAY,968)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signRFull_uid142_fpLogE1pxTest_q, xout => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt(COUNTER,944)
    -- every=1, low=0, high=27, step=1, init=1
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_i = 26 THEN
                      ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_eq = '1') THEN
                        ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_i <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_i - 27;
                    ELSE
                        ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_i <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_i,5));


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg(REG,945)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--xIn(GPIN,3)@0

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux(MUX,946)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_s <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux: PROCESS (ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_s, ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg_q, ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg_q;
                  WHEN "1" => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem(DUALMEM,969)
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ia <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_inputreg_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_aa <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ab <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_q;
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 28,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 28,
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
        clocken1 => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_iq,
        address_a => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_aa,
        data_a => ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_ia
    );
    ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_reset0 <= areset;
        ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_iq(0 downto 0);

	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor(LOGICAL,965)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_b <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_q <= not (ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_a or ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_b);

	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_mem_top(CONSTANT,935)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_mem_top_q <= "011100";

	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp(LOGICAL,936)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_a <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_mem_top_q;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q);
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_q <= "1" when ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_a = ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_b else "0";

	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmpReg(REG,937)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena(REG,966)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_nor_q = "1") THEN
                ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd(LOGICAL,967)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_a <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_sticky_ena_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_b <= en;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_a and ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_b;

	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg(DELAY,955)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid6_fpLogE1pxTest_b, xout => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt(COUNTER,931)
    -- every=1, low=0, high=28, step=1, init=1
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i = 27 THEN
                      ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_eq = '1') THEN
                        ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i - 28;
                    ELSE
                        ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_i,5));


	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg(REG,932)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux(MUX,933)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_s <= en;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux: PROCESS (ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_s, ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q, ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q;
                  WHEN "1" => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem(DUALMEM,956)
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ia <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_inputreg_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_aa <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ab <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q;
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 29,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 29,
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
        clocken1 => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_iq,
        address_a => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_aa,
        data_a => ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_ia
    );
    ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_reset0 <= areset;
        ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_iq(7 downto 0);

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor(LOGICAL,925)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_b <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_q <= not (ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_a or ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_b);

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_mem_top(CONSTANT,921)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_mem_top_q <= "010010";

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp(LOGICAL,922)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_a <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_mem_top_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q);
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_q <= "1" when ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_a = ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_b else "0";

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg(REG,923)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena(REG,926)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd(LOGICAL,927)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_a <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_sticky_ena_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_a and ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_b;

	--cstBiasMO_uid10_fpLogE1pxTest(CONSTANT,9)
    cstBiasMO_uid10_fpLogE1pxTest_q <= "01111110";

	--expXIsMo_uid86_fpLogE1pxTest(COMPARE,85)@0
    expXIsMo_uid86_fpLogE1pxTest_cin <= GND_q;
    expXIsMo_uid86_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpLogE1pxTest_b) & '0';
    expXIsMo_uid86_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBiasMO_uid10_fpLogE1pxTest_q) & expXIsMo_uid86_fpLogE1pxTest_cin(0);
            expXIsMo_uid86_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXIsMo_uid86_fpLogE1pxTest_a) - UNSIGNED(expXIsMo_uid86_fpLogE1pxTest_b));
    expXIsMo_uid86_fpLogE1pxTest_c(0) <= expXIsMo_uid86_fpLogE1pxTest_o(10);


	--ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b(DELAY,493)@0
    ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 7 )
    PORT MAP ( xin => expXIsMo_uid86_fpLogE1pxTest_c, xout => ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstBiasMWFP1_uid14_fpLogE1pxTest(CONSTANT,13)
    cstBiasMWFP1_uid14_fpLogE1pxTest_q <= "01100111";

	--resIsX_uid62_fpLogE1pxTest(COMPARE,61)@0
    resIsX_uid62_fpLogE1pxTest_cin <= GND_q;
    resIsX_uid62_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpLogE1pxTest_b) & '0';
    resIsX_uid62_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBiasMWFP1_uid14_fpLogE1pxTest_q) & resIsX_uid62_fpLogE1pxTest_cin(0);
            resIsX_uid62_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(resIsX_uid62_fpLogE1pxTest_a) - UNSIGNED(resIsX_uid62_fpLogE1pxTest_b));
    resIsX_uid62_fpLogE1pxTest_c(0) <= resIsX_uid62_fpLogE1pxTest_o(10);


	--InvResIsX_uid72_fpLogE1pxTest(LOGICAL,71)@0
    InvResIsX_uid72_fpLogE1pxTest_a <= resIsX_uid62_fpLogE1pxTest_c;
    InvResIsX_uid72_fpLogE1pxTest_q <= not InvResIsX_uid72_fpLogE1pxTest_a;

	--branch22_uid66_fpLogE1pxTest(COMPARE,65)@0
    branch22_uid66_fpLogE1pxTest_cin <= GND_q;
    branch22_uid66_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpLogE1pxTest_b) & '0';
    branch22_uid66_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBias_uid9_fpLogE1pxTest_q) & branch22_uid66_fpLogE1pxTest_cin(0);
            branch22_uid66_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(branch22_uid66_fpLogE1pxTest_a) - UNSIGNED(branch22_uid66_fpLogE1pxTest_b));
    branch22_uid66_fpLogE1pxTest_c(0) <= branch22_uid66_fpLogE1pxTest_o(10);
    branch22_uid66_fpLogE1pxTest_n(0) <= not branch22_uid66_fpLogE1pxTest_o(10);


	--branch4_uid75_fpLogE1pxTest(LOGICAL,74)@0
    branch4_uid75_fpLogE1pxTest_a <= branch22_uid66_fpLogE1pxTest_c;
    branch4_uid75_fpLogE1pxTest_b <= InvResIsX_uid72_fpLogE1pxTest_q;
    branch4_uid75_fpLogE1pxTest_c <= signX_uid7_fpLogE1pxTest_b;
    branch4_uid75_fpLogE1pxTest_q <= branch4_uid75_fpLogE1pxTest_a and branch4_uid75_fpLogE1pxTest_b and branch4_uid75_fpLogE1pxTest_c;

	--ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a(DELAY,492)@0
    ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 7 )
    PORT MAP ( xin => branch4_uid75_fpLogE1pxTest_q, xout => ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--c_uid87_fpLogE1pxTest(LOGICAL,86)@7
    c_uid87_fpLogE1pxTest_a <= ld_branch4_uid75_fpLogE1pxTest_q_to_c_uid87_fpLogE1pxTest_a_q;
    c_uid87_fpLogE1pxTest_b <= ld_expXIsMo_uid86_fpLogE1pxTest_c_to_c_uid87_fpLogE1pxTest_b_q;
    c_uid87_fpLogE1pxTest_q <= c_uid87_fpLogE1pxTest_a and c_uid87_fpLogE1pxTest_b;

	--reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1(REG,373)@7
    reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q <= c_uid87_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor(LOGICAL,1085)
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_b <= ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_sticky_ena_q;
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_q <= not (ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_a or ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_b);

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_mem_top(CONSTANT,895)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_mem_top_q <= "0100";

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp(LOGICAL,896)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_a <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_mem_top_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_q);
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_q <= "1" when ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_a = ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_b else "0";

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg(REG,897)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_sticky_ena(REG,1086)
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_nor_q = "1") THEN
                ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd(LOGICAL,1087)
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_a <= ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_sticky_ena_q;
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_b <= en;
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_q <= ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_a and ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_b;

	--shifterAddrExt_uid34_fpLogE1pxTest(SUB,33)@0
    shifterAddrExt_uid34_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & cstBias_uid9_fpLogE1pxTest_q);
    shifterAddrExt_uid34_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpLogE1pxTest_b);
            shifterAddrExt_uid34_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shifterAddrExt_uid34_fpLogE1pxTest_a) - UNSIGNED(shifterAddrExt_uid34_fpLogE1pxTest_b));
    shifterAddrExt_uid34_fpLogE1pxTest_q <= shifterAddrExt_uid34_fpLogE1pxTest_o(8 downto 0);


	--shifterAddr_uid35_fpLogE1pxTest(BITSELECT,34)@0
    shifterAddr_uid35_fpLogE1pxTest_in <= shifterAddrExt_uid34_fpLogE1pxTest_q(4 downto 0);
    shifterAddr_uid35_fpLogE1pxTest_b <= shifterAddr_uid35_fpLogE1pxTest_in(4 downto 0);

	--ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_inputreg(DELAY,1075)
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 5, depth => 1 )
    PORT MAP ( xin => shifterAddr_uid35_fpLogE1pxTest_b, xout => ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt(COUNTER,891)
    -- every=1, low=0, high=4, step=1, init=1
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_i = 3 THEN
                      ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_eq = '1') THEN
                        ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_i <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_i <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_i,3));


	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg(REG,892)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux(MUX,893)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_s, ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg_q, ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem(DUALMEM,1076)
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_ia <= ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_inputreg_q;
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_aa <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg_q;
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_ab <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_q;
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 5,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 5,
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
        clocken1 => ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_iq,
        address_a => ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_aa,
        data_a => ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_ia
    );
    ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_reset0 <= areset;
        ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_q <= ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_iq(4 downto 0);

	--reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0(REG,409)@7
    reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q <= ld_shifterAddr_uid35_fpLogE1pxTest_b_to_reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--branch4ExpCorrection_uid118_fpLogE1pxTest(SUB,117)@8
    branch4ExpCorrection_uid118_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & reg_shifterAddr_uid35_fpLogE1pxTest_0_to_branch4ExpCorrection_uid118_fpLogE1pxTest_0_q);
    branch4ExpCorrection_uid118_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00000" & reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q);
            branch4ExpCorrection_uid118_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(branch4ExpCorrection_uid118_fpLogE1pxTest_a) - UNSIGNED(branch4ExpCorrection_uid118_fpLogE1pxTest_b));
    branch4ExpCorrection_uid118_fpLogE1pxTest_q <= branch4ExpCorrection_uid118_fpLogE1pxTest_o(5 downto 0);


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg(DELAY,915)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => branch4ExpCorrection_uid118_fpLogE1pxTest_q, xout => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt(COUNTER,917)
    -- every=1, low=0, high=18, step=1, init=1
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i = 17 THEN
                      ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_eq = '1') THEN
                        ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i - 18;
                    ELSE
                        ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_i,5));


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg(REG,918)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux(MUX,919)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_s <= en;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux: PROCESS (ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_s, ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q, ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q;
                  WHEN "1" => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem(DUALMEM,916)
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ia <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_inputreg_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_aa <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdreg_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ab <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_rdmux_q;
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 6,
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
        clocken1 => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_q <= ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_iq(5 downto 0);

	--zs_uid267_countZ_uid114_fpLogE1pxTest(CONSTANT,266)
    zs_uid267_countZ_uid114_fpLogE1pxTest_q <= "00000000000000000000000000000000";

	--LeftShiftStage145dto0_uid239_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,238)@7
    LeftShiftStage145dto0_uid239_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q(45 downto 0);
    LeftShiftStage145dto0_uid239_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage145dto0_uid239_fracXBranch4Ext_uid48_fpLogE1pxTest_in(45 downto 0);

	--leftShiftStage2Idx1_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,239)@7
    leftShiftStage2Idx1_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= LeftShiftStage145dto0_uid239_fracXBranch4Ext_uid48_fpLogE1pxTest_b & GND_q;

	--X22dto0_uid223_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,222)@6
    X22dto0_uid223_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= redLO_uid47_fpLogE1pxTest_b(22 downto 0);
    X22dto0_uid223_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= X22dto0_uid223_fracXBranch4Ext_uid48_fpLogE1pxTest_in(22 downto 0);

	--padConst_uid36_fpLogE1pxTest(CONSTANT,35)
    padConst_uid36_fpLogE1pxTest_q <= "000000000000000000000000";

	--leftShiftStage0Idx3_uid224_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,223)@6
    leftShiftStage0Idx3_uid224_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= X22dto0_uid223_fracXBranch4Ext_uid48_fpLogE1pxTest_b & padConst_uid36_fpLogE1pxTest_q;

	--X30dto0_uid220_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,219)@6
    X30dto0_uid220_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= redLO_uid47_fpLogE1pxTest_b(30 downto 0);
    X30dto0_uid220_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= X30dto0_uid220_fracXBranch4Ext_uid48_fpLogE1pxTest_in(30 downto 0);

	--rightShiftStage0Idx2Pad16_uid160_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,159)
    rightShiftStage0Idx2Pad16_uid160_fracXRSExt_uid36_fpLogE1pxTest_q <= "0000000000000000";

	--leftShiftStage0Idx2_uid221_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,220)@6
    leftShiftStage0Idx2_uid221_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= X30dto0_uid220_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage0Idx2Pad16_uid160_fracXRSExt_uid36_fpLogE1pxTest_q;

	--X38dto0_uid217_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,216)@6
    X38dto0_uid217_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= redLO_uid47_fpLogE1pxTest_b(38 downto 0);
    X38dto0_uid217_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= X38dto0_uid217_fracXBranch4Ext_uid48_fpLogE1pxTest_in(38 downto 0);

	--leftShiftStage0Idx1_uid218_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,217)@6
    leftShiftStage0Idx1_uid218_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= X38dto0_uid217_fracXBranch4Ext_uid48_fpLogE1pxTest_b & cstAllZWE_uid17_fpLogE1pxTest_q;

	--RightShiftStage147dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,177)@2
    RightShiftStage147dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage147dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage147dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_in(47 downto 1);

	--rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,179)@2
    rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_q <= GND_q & RightShiftStage147dto1_uid178_fracXRSExt_uid36_fpLogE1pxTest_b;

	--X47dto24_uid162_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,161)@1
    X47dto24_uid162_fracXRSExt_uid36_fpLogE1pxTest_in <= rightPaddedIn_uid37_fpLogE1pxTest_q;
    X47dto24_uid162_fracXRSExt_uid36_fpLogE1pxTest_b <= X47dto24_uid162_fracXRSExt_uid36_fpLogE1pxTest_in(47 downto 24);

	--rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,163)@1
    rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest_q <= padConst_uid36_fpLogE1pxTest_q & X47dto24_uid162_fracXRSExt_uid36_fpLogE1pxTest_b;

	--X47dto16_uid159_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,158)@1
    X47dto16_uid159_fracXRSExt_uid36_fpLogE1pxTest_in <= rightPaddedIn_uid37_fpLogE1pxTest_q;
    X47dto16_uid159_fracXRSExt_uid36_fpLogE1pxTest_b <= X47dto16_uid159_fracXRSExt_uid36_fpLogE1pxTest_in(47 downto 16);

	--rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,160)@1
    rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx2Pad16_uid160_fracXRSExt_uid36_fpLogE1pxTest_q & X47dto16_uid159_fracXRSExt_uid36_fpLogE1pxTest_b;

	--X47dto8_uid156_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,155)@1
    X47dto8_uid156_fracXRSExt_uid36_fpLogE1pxTest_in <= rightPaddedIn_uid37_fpLogE1pxTest_q;
    X47dto8_uid156_fracXRSExt_uid36_fpLogE1pxTest_b <= X47dto8_uid156_fracXRSExt_uid36_fpLogE1pxTest_in(47 downto 8);

	--rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,157)@1
    rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest_q <= cstAllZWE_uid17_fpLogE1pxTest_q & X47dto8_uid156_fracXRSExt_uid36_fpLogE1pxTest_b;

	--oFracX_uid32_fpLogE1pxTest(BITJOIN,31)@1
    oFracX_uid32_fpLogE1pxTest_q <= VCC_q & frac_uid22_fpLogE1pxTest_b;

	--rightPaddedIn_uid37_fpLogE1pxTest(BITJOIN,36)@1
    rightPaddedIn_uid37_fpLogE1pxTest_q <= oFracX_uid32_fpLogE1pxTest_q & padConst_uid36_fpLogE1pxTest_q;

	--rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,164)@0
    rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_in <= shifterAddr_uid35_fpLogE1pxTest_b;
    rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_b <= rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1(REG,351)@0
    reg_rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1_q <= rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest(MUX,165)@1
    rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_s <= reg_rightShiftStageSel4Dto3_uid165_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_1_q;
    rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest: PROCESS (rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_s, en, rightPaddedIn_uid37_fpLogE1pxTest_q, rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest_q)
    BEGIN
            CASE rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_s IS
                  WHEN "00" => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= rightPaddedIn_uid37_fpLogE1pxTest_q;
                  WHEN "01" => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx1_uid158_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "10" => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx2_uid161_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "11" => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage0Idx3_uid164_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN OTHERS => rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,172)@1
    RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_in(47 downto 6);

	--ld_RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,591)@1
    ld_RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 42, depth => 1 )
    PORT MAP ( xin => RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,174)@2
    rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx3Pad6_uid174_fracXRSExt_uid36_fpLogE1pxTest_q & ld_RightShiftStage047dto6_uid173_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--rightShiftStage1Idx2Pad4_uid171_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,170)
    rightShiftStage1Idx2Pad4_uid171_fracXRSExt_uid36_fpLogE1pxTest_q <= "0000";

	--RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,169)@1
    RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_in(47 downto 4);

	--ld_RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,589)@1
    ld_RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 44, depth => 1 )
    PORT MAP ( xin => RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,171)@2
    rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx2Pad4_uid171_fracXRSExt_uid36_fpLogE1pxTest_q & ld_RightShiftStage047dto4_uid170_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--z2_uid100_fpLogE1pxTest(CONSTANT,99)
    z2_uid100_fpLogE1pxTest_q <= "00";

	--RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,166)@1
    RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_in <= rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q;
    RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_b <= RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_in(47 downto 2);

	--ld_RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a(DELAY,587)@1
    ld_RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 46, depth => 1 )
    PORT MAP ( xin => RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest(BITJOIN,168)@2
    rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_q <= z2_uid100_fpLogE1pxTest_q & ld_RightShiftStage047dto2_uid167_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_a_q;

	--reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2(REG,353)@1
    reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q <= "000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q <= rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,175)@0
    rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_in <= shifterAddr_uid35_fpLogE1pxTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_b <= rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_in(2 downto 1);

	--reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1(REG,352)@0
    reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q <= rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_b(DELAY,593)@1
    ld_reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q, xout => ld_reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest(MUX,176)@2
    rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_s <= ld_reg_rightShiftStageSel2Dto1_uid176_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_1_q_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_b_q;
    rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest: PROCESS (rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_s, en, reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q, rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_q)
    BEGIN
            CASE rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_s IS
                  WHEN "00" => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= reg_rightShiftStage0_uid166_fracXRSExt_uid36_fpLogE1pxTest_0_to_rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_2_q;
                  WHEN "01" => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx1_uid169_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "10" => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx2_uid172_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "11" => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1Idx3_uid175_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN OTHERS => rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest(BITSELECT,180)@0
    rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_in <= shifterAddr_uid35_fpLogE1pxTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_b <= rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_in(0 downto 0);

	--ld_rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_b(DELAY,601)@0
    ld_rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_b, xout => ld_rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest(MUX,181)@2
    rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_s <= ld_rightShiftStageSel0Dto0_uid181_fracXRSExt_uid36_fpLogE1pxTest_b_to_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_b_q;
    rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest: PROCESS (rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_s, en, rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q, rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_q)
    BEGIN
            CASE rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_s IS
                  WHEN "0" => rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage1_uid177_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN "1" => rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_q <= rightShiftStage2Idx1_uid180_fracXRSExt_uid36_fpLogE1pxTest_q;
                  WHEN OTHERS => rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--reg_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1(REG,355)@2
    reg_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1_q <= "000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1_q <= rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--pad_o_uid12_uid40_fpLogE1pxTest(BITJOIN,39)@2
    pad_o_uid12_uid40_fpLogE1pxTest_q <= VCC_q & STD_LOGIC_VECTOR((46 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0(REG,354)@2
    reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0_q <= "000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0_q <= pad_o_uid12_uid40_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oMfracXRSExt_uid40_fpLogE1pxTest(SUB,40)@3
    oMfracXRSExt_uid40_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_o_uid12_uid40_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_0_q);
    oMfracXRSExt_uid40_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0" & reg_rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_0_to_oMfracXRSExt_uid40_fpLogE1pxTest_1_q);
            oMfracXRSExt_uid40_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMfracXRSExt_uid40_fpLogE1pxTest_a) - UNSIGNED(oMfracXRSExt_uid40_fpLogE1pxTest_b));
    oMfracXRSExt_uid40_fpLogE1pxTest_q <= oMfracXRSExt_uid40_fpLogE1pxTest_o(48 downto 0);


	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg(DELAY,835)
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 49, depth => 1 )
    PORT MAP ( xin => oMfracXRSExt_uid40_fpLogE1pxTest_q, xout => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a(DELAY,441)@3
    ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 49, depth => 2 )
    PORT MAP ( xin => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_inputreg_q, xout => ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--redLO_uid47_fpLogE1pxTest(BITSELECT,46)@6
    redLO_uid47_fpLogE1pxTest_in <= ld_oMfracXRSExt_uid40_fpLogE1pxTest_q_to_redLO_uid47_fpLogE1pxTest_a_q(46 downto 0);
    redLO_uid47_fpLogE1pxTest_b <= redLO_uid47_fpLogE1pxTest_in(46 downto 0);

	--oMfracXRSLZCIn_uid43_fpLogE1pxTest(BITSELECT,42)@3
    oMfracXRSLZCIn_uid43_fpLogE1pxTest_in <= oMfracXRSExt_uid40_fpLogE1pxTest_q(46 downto 0);
    oMfracXRSLZCIn_uid43_fpLogE1pxTest_b <= oMfracXRSLZCIn_uid43_fpLogE1pxTest_in(46 downto 23);

	--rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,184)@3
    rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_in <= oMfracXRSLZCIn_uid43_fpLogE1pxTest_b;
    rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_in(23 downto 8);

	--reg_rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_1(REG,356)@3
    reg_rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_1_q <= rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid186_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,185)@4
    vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_a <= reg_rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_1_q;
    vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_b <= rightShiftStage0Idx2Pad16_uid160_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q <= "1" when vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_b else "0";

	--ld_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q_to_reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_a(DELAY,786)@4
    ld_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q_to_reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q, xout => ld_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q_to_reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4(REG,364)@5
    reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_q <= ld_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q_to_reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid188_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,187)@3
    vStage_uid188_leadingZeros_uid44_fpLogE1pxTest_in <= oMfracXRSLZCIn_uid43_fpLogE1pxTest_b(7 downto 0);
    vStage_uid188_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid188_leadingZeros_uid44_fpLogE1pxTest_in(7 downto 0);

	--mO_uid187_leadingZeros_uid44_fpLogE1pxTest(CONSTANT,186)
    mO_uid187_leadingZeros_uid44_fpLogE1pxTest_q <= "11111111";

	--cStage_uid189_leadingZeros_uid44_fpLogE1pxTest(BITJOIN,188)@3
    cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_q <= vStage_uid188_leadingZeros_uid44_fpLogE1pxTest_b & mO_uid187_leadingZeros_uid44_fpLogE1pxTest_q;

	--reg_cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_3(REG,358)@3
    reg_cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_3_q <= cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest(MUX,190)@4
    vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_s, en, reg_rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_1_q, reg_cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_q <= reg_rVStage_uid185_leadingZeros_uid44_fpLogE1pxTest_0_to_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_1_q;
                  WHEN "1" => vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_q <= reg_cStage_uid189_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,192)@4
    rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_in(15 downto 8);

	--vCount_uid194_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,193)@4
    vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_a <= rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_b;
    vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_b <= cstAllZWE_uid17_fpLogE1pxTest_q;
    vCount_uid194_leadingZeros_uid44_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_b) THEN
                vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q <= "1";
            ELSE
                vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_d(DELAY,634)@5
    ld_vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q, xout => ld_vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid195_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,194)@4
    vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid191_leadingZeros_uid44_fpLogE1pxTest_q(7 downto 0);
    vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_in(7 downto 0);

	--reg_vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3(REG,360)@4
    reg_vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q <= vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_2(REG,359)@4
    reg_rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_2_q <= rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest(MUX,196)@5
    vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_s, en, reg_rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_2_q, reg_vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q <= reg_rVStage_uid193_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_2_q;
                  WHEN "1" => vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q <= reg_vStage_uid195_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,198)@5
    rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_in(7 downto 4);

	--vCount_uid200_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,199)@5
    vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_a <= rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_b;
    vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_b <= rightShiftStage1Idx2Pad4_uid171_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_q <= "1" when vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_b else "0";

	--reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_2(REG,363)@5
    reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_2_q <= vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid201_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,200)@5
    vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid197_leadingZeros_uid44_fpLogE1pxTest_q(3 downto 0);
    vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_in(3 downto 0);

	--vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest(MUX,202)@5
    vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_s, en, rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_b, vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_b)
    BEGIN
            CASE vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q <= rVStage_uid199_leadingZeros_uid44_fpLogE1pxTest_b;
                  WHEN "1" => vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q <= vStage_uid201_leadingZeros_uid44_fpLogE1pxTest_b;
                  WHEN OTHERS => vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,204)@5
    rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_in(3 downto 2);

	--vCount_uid206_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,205)@5
    vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_a <= rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_b;
    vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_b <= z2_uid100_fpLogE1pxTest_q;
    vCount_uid206_leadingZeros_uid44_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_b) THEN
                vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q <= "1";
            ELSE
                vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid207_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,206)@5
    vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid203_leadingZeros_uid44_fpLogE1pxTest_q(1 downto 0);
    vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_b <= vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_in(1 downto 0);

	--reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3(REG,362)@5
    reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q <= vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2(REG,361)@5
    reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q <= rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest(MUX,208)@6
    vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_s <= vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q;
    vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest: PROCESS (vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_s, en, reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q, reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q <= reg_rVStage_uid205_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_2_q;
                  WHEN "1" => vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q <= reg_vStage_uid207_leadingZeros_uid44_fpLogE1pxTest_0_to_vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest(BITSELECT,210)@6
    rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_in <= vStagei_uid209_leadingZeros_uid44_fpLogE1pxTest_q;
    rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_b <= rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_in(1 downto 1);

	--vCount_uid212_leadingZeros_uid44_fpLogE1pxTest(LOGICAL,211)@6
    vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_a <= rVStage_uid211_leadingZeros_uid44_fpLogE1pxTest_b;
    vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_b <= GND_q;
    vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_q <= "1" when vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_a = vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_b else "0";

	--r_uid213_leadingZeros_uid44_fpLogE1pxTest(BITJOIN,212)@6
    r_uid213_leadingZeros_uid44_fpLogE1pxTest_q <= reg_vCount_uid186_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_4_q & ld_vCount_uid194_leadingZeros_uid44_fpLogE1pxTest_q_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_d_q & reg_vCount_uid200_leadingZeros_uid44_fpLogE1pxTest_0_to_r_uid213_leadingZeros_uid44_fpLogE1pxTest_2_q & vCount_uid206_leadingZeros_uid44_fpLogE1pxTest_q & vCount_uid212_leadingZeros_uid44_fpLogE1pxTest_q;

	--leftShiftStageSel4Dto3_uid225_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,224)@6
    leftShiftStageSel4Dto3_uid225_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= r_uid213_leadingZeros_uid44_fpLogE1pxTest_q;
    leftShiftStageSel4Dto3_uid225_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= leftShiftStageSel4Dto3_uid225_fracXBranch4Ext_uid48_fpLogE1pxTest_in(4 downto 3);

	--leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest(MUX,225)@6
    leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_s <= leftShiftStageSel4Dto3_uid225_fracXBranch4Ext_uid48_fpLogE1pxTest_b;
    leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest: PROCESS (leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_s, en, redLO_uid47_fpLogE1pxTest_b, leftShiftStage0Idx1_uid218_fracXBranch4Ext_uid48_fpLogE1pxTest_q, leftShiftStage0Idx2_uid221_fracXBranch4Ext_uid48_fpLogE1pxTest_q, leftShiftStage0Idx3_uid224_fracXBranch4Ext_uid48_fpLogE1pxTest_q)
    BEGIN
            CASE leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= redLO_uid47_fpLogE1pxTest_b;
                  WHEN "01" => leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage0Idx1_uid218_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN "10" => leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage0Idx2_uid221_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN "11" => leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage0Idx3_uid224_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN OTHERS => leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage040dto0_uid234_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,233)@6
    LeftShiftStage040dto0_uid234_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q(40 downto 0);
    LeftShiftStage040dto0_uid234_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage040dto0_uid234_fracXBranch4Ext_uid48_fpLogE1pxTest_in(40 downto 0);

	--rightShiftStage1Idx3Pad6_uid174_fracXRSExt_uid36_fpLogE1pxTest(CONSTANT,173)
    rightShiftStage1Idx3Pad6_uid174_fracXRSExt_uid36_fpLogE1pxTest_q <= "000000";

	--leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,234)@6
    leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= LeftShiftStage040dto0_uid234_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage1Idx3Pad6_uid174_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_5(REG,369)@6
    reg_leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q <= "00000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q <= leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage042dto0_uid231_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,230)@6
    LeftShiftStage042dto0_uid231_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q(42 downto 0);
    LeftShiftStage042dto0_uid231_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage042dto0_uid231_fracXBranch4Ext_uid48_fpLogE1pxTest_in(42 downto 0);

	--leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,231)@6
    leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= LeftShiftStage042dto0_uid231_fracXBranch4Ext_uid48_fpLogE1pxTest_b & rightShiftStage1Idx2Pad4_uid171_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_4(REG,368)@6
    reg_leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q <= "00000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q <= leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage044dto0_uid228_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,227)@6
    LeftShiftStage044dto0_uid228_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q(44 downto 0);
    LeftShiftStage044dto0_uid228_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= LeftShiftStage044dto0_uid228_fracXBranch4Ext_uid48_fpLogE1pxTest_in(44 downto 0);

	--leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest(BITJOIN,228)@6
    leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= LeftShiftStage044dto0_uid228_fracXBranch4Ext_uid48_fpLogE1pxTest_b & z2_uid100_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_3(REG,367)@6
    reg_leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q <= "00000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q <= leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_2(REG,366)@6
    reg_leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q <= "00000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q <= leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,235)@6
    leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= r_uid213_leadingZeros_uid44_fpLogE1pxTest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_1(REG,365)@6
    reg_leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q <= leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest(MUX,236)@7
    leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_s <= reg_leftShiftStageSel2Dto1_uid236_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_1_q;
    leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest: PROCESS (leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_s, en, reg_leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q, reg_leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q, reg_leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q, reg_leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage0_uid226_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_2_q;
                  WHEN "01" => leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage1Idx1_uid229_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_3_q;
                  WHEN "10" => leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage1Idx2_uid232_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_4_q;
                  WHEN "11" => leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= reg_leftShiftStage1Idx3_uid235_fracXBranch4Ext_uid48_fpLogE1pxTest_0_to_leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest(BITSELECT,240)@6
    leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_in <= r_uid213_leadingZeros_uid44_fpLogE1pxTest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_b <= leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_b(DELAY,663)@6
    ld_leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_b, xout => ld_leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest(MUX,241)@7
    leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_s <= ld_leftShiftStageSel0Dto0_uid241_fracXBranch4Ext_uid48_fpLogE1pxTest_b_to_leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_b_q;
    leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest: PROCESS (leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_s, en, leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q, leftShiftStage2Idx1_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_q)
    BEGIN
            CASE leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_s IS
                  WHEN "0" => leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage1_uid237_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN "1" => leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= leftShiftStage2Idx1_uid240_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
                  WHEN OTHERS => leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracXBranch4_uid49_fpLogE1pxTest(BITSELECT,48)@7
    fracXBranch4_uid49_fpLogE1pxTest_in <= leftShiftStage2_uid242_fracXBranch4Ext_uid48_fpLogE1pxTest_q;
    fracXBranch4_uid49_fpLogE1pxTest_b <= fracXBranch4_uid49_fpLogE1pxTest_in(46 downto 22);

	--fracXBranch4Red_uid80_fpLogE1pxTest(BITSELECT,79)@7
    fracXBranch4Red_uid80_fpLogE1pxTest_in <= fracXBranch4_uid49_fpLogE1pxTest_b(23 downto 0);
    fracXBranch4Red_uid80_fpLogE1pxTest_b <= fracXBranch4Red_uid80_fpLogE1pxTest_in(23 downto 0);

	--reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5(REG,372)@7
    reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q <= fracXBranch4Red_uid80_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor(LOGICAL,1061)
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_b <= ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_sticky_ena_q;
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_q <= not (ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_a or ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_b);

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_mem_top(CONSTANT,868)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_mem_top_q <= "010";

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp(LOGICAL,869)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_a <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_mem_top_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_q);
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_q <= "1" when ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_a = ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_b else "0";

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmpReg(REG,870)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmpReg_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_sticky_ena(REG,1062)
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_nor_q = "1") THEN
                ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_sticky_ena_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd(LOGICAL,1063)
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_a <= ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_sticky_ena_q;
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_b <= en;
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_q <= ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_a and ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_b;

	--fracXRS_uid39_fpLogE1pxTest(BITSELECT,38)@2
    fracXRS_uid39_fpLogE1pxTest_in <= rightShiftStage2_uid182_fracXRSExt_uid36_fpLogE1pxTest_q;
    fracXRS_uid39_fpLogE1pxTest_b <= fracXRS_uid39_fpLogE1pxTest_in(47 downto 23);

	--fracXRSRange_uid81_fpLogE1pxTest(BITSELECT,80)@2
    fracXRSRange_uid81_fpLogE1pxTest_in <= fracXRS_uid39_fpLogE1pxTest_b(23 downto 0);
    fracXRSRange_uid81_fpLogE1pxTest_b <= fracXRSRange_uid81_fpLogE1pxTest_in(23 downto 0);

	--ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_inputreg(DELAY,1051)
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => fracXRSRange_uid81_fpLogE1pxTest_b, xout => ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt(COUNTER,864)
    -- every=1, low=0, high=2, step=1, init=1
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_i = 1 THEN
                      ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_eq = '1') THEN
                        ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_i <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_i - 2;
                    ELSE
                        ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_i <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_i,2));


	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg(REG,865)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux(MUX,866)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_s <= en;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux: PROCESS (ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_s, ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg_q, ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg_q;
                  WHEN "1" => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem(DUALMEM,1052)
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_ia <= ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_inputreg_q;
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_aa <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg_q;
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_ab <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_q;
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 24,
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
        clocken1 => ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_iq,
        address_a => ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_aa,
        data_a => ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_ia
    );
    ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_reset0 <= areset;
        ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_q <= ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_iq(23 downto 0);

	--reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4(REG,371)@7
    reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q <= ld_fracXRSRange_uid81_fpLogE1pxTest_b_to_reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor(LOGICAL,872)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_b <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_q <= not (ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_a or ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_b);

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena(REG,873)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_nor_q = "1") THEN
                ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd(LOGICAL,874)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_a <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_sticky_ena_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_b <= en;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_a and ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_b;

	--addrMaskExt_uid50_fpLogE1pxTest(SUB,49)@0
    addrMaskExt_uid50_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpLogE1pxTest_b);
    addrMaskExt_uid50_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid9_fpLogE1pxTest_q);
            addrMaskExt_uid50_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(addrMaskExt_uid50_fpLogE1pxTest_a) - UNSIGNED(addrMaskExt_uid50_fpLogE1pxTest_b));
    addrMaskExt_uid50_fpLogE1pxTest_q <= addrMaskExt_uid50_fpLogE1pxTest_o(8 downto 0);


	--addrMask_uid51_fpLogE1pxTest(BITSELECT,50)@0
    addrMask_uid51_fpLogE1pxTest_in <= addrMaskExt_uid50_fpLogE1pxTest_q(4 downto 0);
    addrMask_uid51_fpLogE1pxTest_b <= addrMask_uid51_fpLogE1pxTest_in(4 downto 0);

	--reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0(REG,349)@0
    reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0_q <= addrMask_uid51_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--maskIncrementTable_uid52_fpLogE1pxTest(LOOKUP,51)@1
    maskIncrementTable_uid52_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            maskIncrementTable_uid52_fpLogE1pxTest_q <= "100000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_addrMask_uid51_fpLogE1pxTest_0_to_maskIncrementTable_uid52_fpLogE1pxTest_0_q) IS
                WHEN "00000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "100000000000000000000000";
                WHEN "00001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "010000000000000000000000";
                WHEN "00010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "001000000000000000000000";
                WHEN "00011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000100000000000000000000";
                WHEN "00100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000010000000000000000000";
                WHEN "00101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000001000000000000000000";
                WHEN "00110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000100000000000000000";
                WHEN "00111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000010000000000000000";
                WHEN "01000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000001000000000000000";
                WHEN "01001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000100000000000000";
                WHEN "01010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000010000000000000";
                WHEN "01011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000001000000000000";
                WHEN "01100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000100000000000";
                WHEN "01101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000010000000000";
                WHEN "01110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000001000000000";
                WHEN "01111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000100000000";
                WHEN "10000" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000010000000";
                WHEN "10001" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000001000000";
                WHEN "10010" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000000100000";
                WHEN "10011" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000000010000";
                WHEN "10100" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000000001000";
                WHEN "10101" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000000000100";
                WHEN "10110" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000000000010";
                WHEN "10111" =>  maskIncrementTable_uid52_fpLogE1pxTest_q <= "000000000000000000000001";
                WHEN OTHERS =>
                    maskIncrementTable_uid52_fpLogE1pxTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0(REG,350)@1
    reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0_q <= oFracX_uid32_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oPlusOFracX_uid53_fpLogE1pxTest(ADD,52)@2
    oPlusOFracX_uid53_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & reg_oFracX_uid32_fpLogE1pxTest_0_to_oPlusOFracX_uid53_fpLogE1pxTest_0_q);
    oPlusOFracX_uid53_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0" & maskIncrementTable_uid52_fpLogE1pxTest_q);
            oPlusOFracX_uid53_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oPlusOFracX_uid53_fpLogE1pxTest_a) + UNSIGNED(oPlusOFracX_uid53_fpLogE1pxTest_b));
    oPlusOFracX_uid53_fpLogE1pxTest_q <= oPlusOFracX_uid53_fpLogE1pxTest_o(24 downto 0);


	--oPlusOFracXNormHigh_uid59_fpLogE1pxTest(BITSELECT,58)@2
    oPlusOFracXNormHigh_uid59_fpLogE1pxTest_in <= oPlusOFracX_uid53_fpLogE1pxTest_q(23 downto 0);
    oPlusOFracXNormHigh_uid59_fpLogE1pxTest_b <= oPlusOFracXNormHigh_uid59_fpLogE1pxTest_in(23 downto 0);

	--oPlusOFracXNormLow_uid57_fpLogE1pxTest(BITSELECT,56)@2
    oPlusOFracXNormLow_uid57_fpLogE1pxTest_in <= oPlusOFracX_uid53_fpLogE1pxTest_q(22 downto 0);
    oPlusOFracXNormLow_uid57_fpLogE1pxTest_b <= oPlusOFracXNormLow_uid57_fpLogE1pxTest_in(22 downto 0);

	--join_uid58_fpLogE1pxTest(BITJOIN,57)@2
    join_uid58_fpLogE1pxTest_q <= oPlusOFracXNormLow_uid57_fpLogE1pxTest_b & GND_q;

	--msbUoPlusOFracX_uid54_fpLogE1pxTest(BITSELECT,53)@2
    msbUoPlusOFracX_uid54_fpLogE1pxTest_in <= oPlusOFracX_uid53_fpLogE1pxTest_q;
    msbUoPlusOFracX_uid54_fpLogE1pxTest_b <= msbUoPlusOFracX_uid54_fpLogE1pxTest_in(24 downto 24);

	--oPlusOFracXNorm_uid61_fpLogE1pxTest(MUX,60)@2
    oPlusOFracXNorm_uid61_fpLogE1pxTest_s <= msbUoPlusOFracX_uid54_fpLogE1pxTest_b;
    oPlusOFracXNorm_uid61_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oPlusOFracXNorm_uid61_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE oPlusOFracXNorm_uid61_fpLogE1pxTest_s IS
                      WHEN "0" => oPlusOFracXNorm_uid61_fpLogE1pxTest_q <= join_uid58_fpLogE1pxTest_q;
                      WHEN "1" => oPlusOFracXNorm_uid61_fpLogE1pxTest_q <= oPlusOFracXNormHigh_uid59_fpLogE1pxTest_b;
                      WHEN OTHERS => oPlusOFracXNorm_uid61_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg(DELAY,862)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => oPlusOFracXNorm_uid61_fpLogE1pxTest_q, xout => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem(DUALMEM,863)
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ia <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_inputreg_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_aa <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdreg_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ab <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_rdmux_q;
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 24,
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
        clocken1 => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_iq,
        address_a => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_aa,
        data_a => ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_ia
    );
    ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_reset0 <= areset;
        ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_iq(23 downto 0);

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor(LOGICAL,859)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_b <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_q <= not (ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_a or ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_b);

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_mem_top(CONSTANT,842)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_mem_top_q <= "011";

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp(LOGICAL,843)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_mem_top_q;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_q);
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_q <= "1" when ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_a = ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_b else "0";

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmpReg(REG,844)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmpReg_q <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena(REG,860)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd(LOGICAL,861)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_a <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_a and ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_b;

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg(DELAY,849)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => frac_uid22_fpLogE1pxTest_b, xout => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt(COUNTER,838)
    -- every=1, low=0, high=3, step=1, init=1
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_i <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_i,2));


	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg(REG,839)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg_q <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux(MUX,840)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_s <= en;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux: PROCESS (ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_s, ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg_q, ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_q <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg_q;
                  WHEN "1" => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_q <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem(DUALMEM,850)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ia <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_aa <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ab <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 23,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_iq(22 downto 0);

	--fracXz_uid82_fpLogE1pxTest(BITJOIN,81)@7
    fracXz_uid82_fpLogE1pxTest_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_replace_mem_q & GND_q;

	--reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2(REG,370)@7
    reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q <= fracXz_uid82_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--branch11_uid64_fpLogE1pxTest(LOGICAL,63)@0
    branch11_uid64_fpLogE1pxTest_a <= signX_uid7_fpLogE1pxTest_b;
    branch11_uid64_fpLogE1pxTest_q <= not branch11_uid64_fpLogE1pxTest_a;

	--branch3_uid73_fpLogE1pxTest(LOGICAL,72)@0
    branch3_uid73_fpLogE1pxTest_a <= branch22_uid66_fpLogE1pxTest_c;
    branch3_uid73_fpLogE1pxTest_b <= InvResIsX_uid72_fpLogE1pxTest_q;
    branch3_uid73_fpLogE1pxTest_c <= branch11_uid64_fpLogE1pxTest_q;
    branch3_uid73_fpLogE1pxTest_q <= branch3_uid73_fpLogE1pxTest_a and branch3_uid73_fpLogE1pxTest_b and branch3_uid73_fpLogE1pxTest_c;

	--cstBiasPWFP1_uid13_fpLogE1pxTest(CONSTANT,12)
    cstBiasPWFP1_uid13_fpLogE1pxTest_q <= "10010111";

	--branch12_uid63_fpLogE1pxTest(COMPARE,62)@0
    branch12_uid63_fpLogE1pxTest_cin <= GND_q;
    branch12_uid63_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("00" & expX_uid6_fpLogE1pxTest_b) & '0';
    branch12_uid63_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBiasPWFP1_uid13_fpLogE1pxTest_q) & branch12_uid63_fpLogE1pxTest_cin(0);
            branch12_uid63_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(branch12_uid63_fpLogE1pxTest_a) - UNSIGNED(branch12_uid63_fpLogE1pxTest_b));
    branch12_uid63_fpLogE1pxTest_c(0) <= branch12_uid63_fpLogE1pxTest_o(10);
    branch12_uid63_fpLogE1pxTest_n(0) <= not branch12_uid63_fpLogE1pxTest_o(10);


	--branch2_uid69_fpLogE1pxTest(LOGICAL,68)@0
    branch2_uid69_fpLogE1pxTest_a <= branch11_uid64_fpLogE1pxTest_q;
    branch2_uid69_fpLogE1pxTest_b <= branch12_uid63_fpLogE1pxTest_c;
    branch2_uid69_fpLogE1pxTest_c <= branch22_uid66_fpLogE1pxTest_n;
    branch2_uid69_fpLogE1pxTest_q <= branch2_uid69_fpLogE1pxTest_a and branch2_uid69_fpLogE1pxTest_b and branch2_uid69_fpLogE1pxTest_c;

	--branch1_uid65_fpLogE1pxTest(LOGICAL,64)@0
    branch1_uid65_fpLogE1pxTest_a <= branch11_uid64_fpLogE1pxTest_q;
    branch1_uid65_fpLogE1pxTest_b <= branch12_uid63_fpLogE1pxTest_n;
    branch1_uid65_fpLogE1pxTest_q <= branch1_uid65_fpLogE1pxTest_a and branch1_uid65_fpLogE1pxTest_b;

	--concBranch_uid76_fpLogE1pxTest(BITJOIN,75)@0
    concBranch_uid76_fpLogE1pxTest_q <= branch4_uid75_fpLogE1pxTest_q & branch3_uid73_fpLogE1pxTest_q & branch2_uid69_fpLogE1pxTest_q & branch1_uid65_fpLogE1pxTest_q;

	--reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0(REG,348)@0
    reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q <= concBranch_uid76_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a(DELAY,477)@1
    ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 4, depth => 5 )
    PORT MAP ( xin => reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q, xout => ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--branEnc_uid77_fpLogE1pxTest(LOOKUP,76)@6
    branEnc_uid77_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            branEnc_uid77_fpLogE1pxTest_q <= "00";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_concBranch_uid76_fpLogE1pxTest_0_to_branEnc_uid77_fpLogE1pxTest_0_q_to_branEnc_uid77_fpLogE1pxTest_a_q) IS
                WHEN "0000" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0001" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0010" =>  branEnc_uid77_fpLogE1pxTest_q <= "01";
                WHEN "0011" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0100" =>  branEnc_uid77_fpLogE1pxTest_q <= "10";
                WHEN "0101" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0110" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "0111" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1000" =>  branEnc_uid77_fpLogE1pxTest_q <= "11";
                WHEN "1001" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1010" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1011" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1100" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1101" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1110" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN "1111" =>  branEnc_uid77_fpLogE1pxTest_q <= "00";
                WHEN OTHERS =>
                    branEnc_uid77_fpLogE1pxTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b(DELAY,485)@7
    ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => branEnc_uid77_fpLogE1pxTest_q, xout => ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracB_uid83_fpLogE1pxTest(MUX,82)@8
    fracB_uid83_fpLogE1pxTest_s <= ld_branEnc_uid77_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_b_q;
    fracB_uid83_fpLogE1pxTest: PROCESS (fracB_uid83_fpLogE1pxTest_s, en, reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q, ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_q, reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q, reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q)
    BEGIN
            CASE fracB_uid83_fpLogE1pxTest_s IS
                  WHEN "00" => fracB_uid83_fpLogE1pxTest_q <= reg_fracXz_uid82_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_2_q;
                  WHEN "01" => fracB_uid83_fpLogE1pxTest_q <= ld_oPlusOFracXNorm_uid61_fpLogE1pxTest_q_to_fracB_uid83_fpLogE1pxTest_d_replace_mem_q;
                  WHEN "10" => fracB_uid83_fpLogE1pxTest_q <= reg_fracXRSRange_uid81_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_4_q;
                  WHEN "11" => fracB_uid83_fpLogE1pxTest_q <= reg_fracXBranch4Red_uid80_fpLogE1pxTest_0_to_fracB_uid83_fpLogE1pxTest_5_q;
                  WHEN OTHERS => fracB_uid83_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--zAddrLow_uid89_fpLogE1pxTest(BITSELECT,88)@8
    zAddrLow_uid89_fpLogE1pxTest_in <= fracB_uid83_fpLogE1pxTest_q;
    zAddrLow_uid89_fpLogE1pxTest_b <= zAddrLow_uid89_fpLogE1pxTest_in(23 downto 16);

	--addr_uid90_fpLogE1pxTest(BITJOIN,89)@8
    addr_uid90_fpLogE1pxTest_q <= reg_c_uid87_fpLogE1pxTest_0_to_addr_uid90_fpLogE1pxTest_1_q & zAddrLow_uid89_fpLogE1pxTest_b;

	--reg_addr_uid90_fpLogE1pxTest_0_to_memoryC2_uid253_natLogTabGen_lutmem_0(REG,374)@8
    reg_addr_uid90_fpLogE1pxTest_0_to_memoryC2_uid253_natLogTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid90_fpLogE1pxTest_0_to_memoryC2_uid253_natLogTabGen_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid90_fpLogE1pxTest_0_to_memoryC2_uid253_natLogTabGen_lutmem_0_q <= addr_uid90_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid253_natLogTabGen_lutmem(DUALMEM,346)@9
    memoryC2_uid253_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid253_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid253_natLogTabGen_lutmem_ab <= reg_addr_uid90_fpLogE1pxTest_0_to_memoryC2_uid253_natLogTabGen_lutmem_0_q;
    memoryC2_uid253_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 13,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 13,
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
        init_file => "fp_ln1px_s5_memoryC2_uid253_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid253_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid253_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid253_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid253_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid253_natLogTabGen_lutmem_ia
    );
    memoryC2_uid253_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid253_natLogTabGen_lutmem_q <= memoryC2_uid253_natLogTabGen_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid253_natLogTabGen_lutmem_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_1(REG,376)@11
    reg_memoryC2_uid253_natLogTabGen_lutmem_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid253_natLogTabGen_lutmem_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid253_natLogTabGen_lutmem_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_1_q <= memoryC2_uid253_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg(DELAY,888)
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => fracB_uid83_fpLogE1pxTest_q, xout => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a(DELAY,497)@8
    ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_inputreg_q, xout => ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--zPPolyEval_uid91_fpLogE1pxTest(BITSELECT,90)@11
    zPPolyEval_uid91_fpLogE1pxTest_in <= ld_fracB_uid83_fpLogE1pxTest_q_to_zPPolyEval_uid91_fpLogE1pxTest_a_q(15 downto 0);
    zPPolyEval_uid91_fpLogE1pxTest_b <= zPPolyEval_uid91_fpLogE1pxTest_in(15 downto 0);

	--yT1_uid254_natLogPolyEval(BITSELECT,253)@11
    yT1_uid254_natLogPolyEval_in <= zPPolyEval_uid91_fpLogE1pxTest_b;
    yT1_uid254_natLogPolyEval_b <= yT1_uid254_natLogPolyEval_in(15 downto 3);

	--reg_yT1_uid254_natLogPolyEval_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_0(REG,375)@11
    reg_yT1_uid254_natLogPolyEval_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid254_natLogPolyEval_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid254_natLogPolyEval_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_0_q <= yT1_uid254_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid339_pT1_uid255_natLogPolyEval(MULT,338)@12
    prodXY_uid339_pT1_uid255_natLogPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid339_pT1_uid255_natLogPolyEval_a),14)) * SIGNED(prodXY_uid339_pT1_uid255_natLogPolyEval_b);
    prodXY_uid339_pT1_uid255_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid339_pT1_uid255_natLogPolyEval_a <= (others => '0');
            prodXY_uid339_pT1_uid255_natLogPolyEval_b <= (others => '0');
            prodXY_uid339_pT1_uid255_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid339_pT1_uid255_natLogPolyEval_a <= reg_yT1_uid254_natLogPolyEval_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_0_q;
                prodXY_uid339_pT1_uid255_natLogPolyEval_b <= reg_memoryC2_uid253_natLogTabGen_lutmem_0_to_prodXY_uid339_pT1_uid255_natLogPolyEval_1_q;
                prodXY_uid339_pT1_uid255_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid339_pT1_uid255_natLogPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid339_pT1_uid255_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid339_pT1_uid255_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid339_pT1_uid255_natLogPolyEval_q <= prodXY_uid339_pT1_uid255_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid340_pT1_uid255_natLogPolyEval(BITSELECT,339)@15
    prodXYTruncFR_uid340_pT1_uid255_natLogPolyEval_in <= prodXY_uid339_pT1_uid255_natLogPolyEval_q;
    prodXYTruncFR_uid340_pT1_uid255_natLogPolyEval_b <= prodXYTruncFR_uid340_pT1_uid255_natLogPolyEval_in(25 downto 12);

	--highBBits_uid257_natLogPolyEval(BITSELECT,256)@15
    highBBits_uid257_natLogPolyEval_in <= prodXYTruncFR_uid340_pT1_uid255_natLogPolyEval_b;
    highBBits_uid257_natLogPolyEval_b <= highBBits_uid257_natLogPolyEval_in(13 downto 1);

	--ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC1_uid252_natLogTabGen_lutmem_0_q_to_memoryC1_uid252_natLogTabGen_lutmem_a(DELAY,767)@9
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC1_uid252_natLogTabGen_lutmem_0_q_to_memoryC1_uid252_natLogTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 3 )
    PORT MAP ( xin => reg_addr_uid90_fpLogE1pxTest_0_to_memoryC2_uid253_natLogTabGen_lutmem_0_q, xout => ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC1_uid252_natLogTabGen_lutmem_0_q_to_memoryC1_uid252_natLogTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid252_natLogTabGen_lutmem(DUALMEM,345)@12
    memoryC1_uid252_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid252_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid252_natLogTabGen_lutmem_ab <= ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC1_uid252_natLogTabGen_lutmem_0_q_to_memoryC1_uid252_natLogTabGen_lutmem_a_q;
    memoryC1_uid252_natLogTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_ln1px_s5_memoryC1_uid252_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid252_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid252_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid252_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid252_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid252_natLogTabGen_lutmem_ia
    );
    memoryC1_uid252_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid252_natLogTabGen_lutmem_q <= memoryC1_uid252_natLogTabGen_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid252_natLogTabGen_lutmem_0_to_sumAHighB_uid258_natLogPolyEval_0(REG,378)@14
    reg_memoryC1_uid252_natLogTabGen_lutmem_0_to_sumAHighB_uid258_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid252_natLogTabGen_lutmem_0_to_sumAHighB_uid258_natLogPolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid252_natLogTabGen_lutmem_0_to_sumAHighB_uid258_natLogPolyEval_0_q <= memoryC1_uid252_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid258_natLogPolyEval(ADD,257)@15
    sumAHighB_uid258_natLogPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid252_natLogTabGen_lutmem_0_to_sumAHighB_uid258_natLogPolyEval_0_q(20)) & reg_memoryC1_uid252_natLogTabGen_lutmem_0_to_sumAHighB_uid258_natLogPolyEval_0_q);
    sumAHighB_uid258_natLogPolyEval_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid257_natLogPolyEval_b(12)) & highBBits_uid257_natLogPolyEval_b);
            sumAHighB_uid258_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid258_natLogPolyEval_a) + SIGNED(sumAHighB_uid258_natLogPolyEval_b));
    sumAHighB_uid258_natLogPolyEval_q <= sumAHighB_uid258_natLogPolyEval_o(21 downto 0);


	--lowRangeB_uid256_natLogPolyEval(BITSELECT,255)@15
    lowRangeB_uid256_natLogPolyEval_in <= prodXYTruncFR_uid340_pT1_uid255_natLogPolyEval_b(0 downto 0);
    lowRangeB_uid256_natLogPolyEval_b <= lowRangeB_uid256_natLogPolyEval_in(0 downto 0);

	--s1_uid256_uid259_natLogPolyEval(BITJOIN,258)@15
    s1_uid256_uid259_natLogPolyEval_q <= sumAHighB_uid258_natLogPolyEval_q & lowRangeB_uid256_natLogPolyEval_b;

	--reg_s1_uid256_uid259_natLogPolyEval_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_1(REG,380)@15
    reg_s1_uid256_uid259_natLogPolyEval_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid256_uid259_natLogPolyEval_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid256_uid259_natLogPolyEval_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_1_q <= s1_uid256_uid259_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor(LOGICAL,1072)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_b <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_sticky_ena_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_q <= not (ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_a or ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_b);

	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg(REG,987)
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_sticky_ena(REG,1073)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_nor_q = "1") THEN
                ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_sticky_ena_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd(LOGICAL,1074)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_a <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_sticky_ena_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_b <= en;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_a and ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_b;

	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_inputreg(DELAY,1064)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => zPPolyEval_uid91_fpLogE1pxTest_b, xout => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt(COUNTER,983)
    -- every=1, low=0, high=1, step=1, init=1
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_i <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_i,1));


	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg(REG,984)
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux(MUX,985)
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_s <= en;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux: PROCESS (ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_s, ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q, ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q;
                  WHEN "1" => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem(DUALMEM,1065)
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_ia <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_inputreg_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_aa <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_ab <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q;
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_ia
    );
    ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_reset0 <= areset;
        ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_iq(15 downto 0);

	--reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0(REG,379)@15
    reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_q <= ld_zPPolyEval_uid91_fpLogE1pxTest_b_to_reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid342_pT2_uid261_natLogPolyEval(MULT,341)@16
    prodXY_uid342_pT2_uid261_natLogPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid342_pT2_uid261_natLogPolyEval_a),17)) * SIGNED(prodXY_uid342_pT2_uid261_natLogPolyEval_b);
    prodXY_uid342_pT2_uid261_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid342_pT2_uid261_natLogPolyEval_a <= (others => '0');
            prodXY_uid342_pT2_uid261_natLogPolyEval_b <= (others => '0');
            prodXY_uid342_pT2_uid261_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid342_pT2_uid261_natLogPolyEval_a <= reg_zPPolyEval_uid91_fpLogE1pxTest_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_0_q;
                prodXY_uid342_pT2_uid261_natLogPolyEval_b <= reg_s1_uid256_uid259_natLogPolyEval_0_to_prodXY_uid342_pT2_uid261_natLogPolyEval_1_q;
                prodXY_uid342_pT2_uid261_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid342_pT2_uid261_natLogPolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid342_pT2_uid261_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid342_pT2_uid261_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid342_pT2_uid261_natLogPolyEval_q <= prodXY_uid342_pT2_uid261_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid343_pT2_uid261_natLogPolyEval(BITSELECT,342)@19
    prodXYTruncFR_uid343_pT2_uid261_natLogPolyEval_in <= prodXY_uid342_pT2_uid261_natLogPolyEval_q;
    prodXYTruncFR_uid343_pT2_uid261_natLogPolyEval_b <= prodXYTruncFR_uid343_pT2_uid261_natLogPolyEval_in(38 downto 15);

	--highBBits_uid263_natLogPolyEval(BITSELECT,262)@19
    highBBits_uid263_natLogPolyEval_in <= prodXYTruncFR_uid343_pT2_uid261_natLogPolyEval_b;
    highBBits_uid263_natLogPolyEval_b <= highBBits_uid263_natLogPolyEval_in(23 downto 2);

	--ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor(LOGICAL,1035)
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_b <= ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_sticky_ena_q;
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_q <= not (ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_a or ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_b);

	--ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_sticky_ena(REG,1036)
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd(LOGICAL,1037)
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_a <= ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_sticky_ena_q;
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_q <= ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_a and ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_b;

	--ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_inputreg(DELAY,1025)
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => reg_addr_uid90_fpLogE1pxTest_0_to_memoryC2_uid253_natLogTabGen_lutmem_0_q, xout => ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem(DUALMEM,1026)
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_ia <= ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_inputreg_q;
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_aa <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg_q;
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_ab <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_q;
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_ia
    );
    ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_q <= ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_iq(8 downto 0);

	--memoryC0_uid251_natLogTabGen_lutmem(DUALMEM,344)@16
    memoryC0_uid251_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid251_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid251_natLogTabGen_lutmem_ab <= ld_reg_addr_uid90_fpLogE1pxTest_0_to_memoryC0_uid251_natLogTabGen_lutmem_0_q_to_memoryC0_uid251_natLogTabGen_lutmem_a_replace_mem_q;
    memoryC0_uid251_natLogTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_ln1px_s5_memoryC0_uid251_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid251_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid251_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid251_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid251_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid251_natLogTabGen_lutmem_ia
    );
    memoryC0_uid251_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid251_natLogTabGen_lutmem_q <= memoryC0_uid251_natLogTabGen_lutmem_iq(30 downto 0);

	--reg_memoryC0_uid251_natLogTabGen_lutmem_0_to_sumAHighB_uid264_natLogPolyEval_0(REG,382)@18
    reg_memoryC0_uid251_natLogTabGen_lutmem_0_to_sumAHighB_uid264_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid251_natLogTabGen_lutmem_0_to_sumAHighB_uid264_natLogPolyEval_0_q <= "0000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid251_natLogTabGen_lutmem_0_to_sumAHighB_uid264_natLogPolyEval_0_q <= memoryC0_uid251_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid264_natLogPolyEval(ADD,263)@19
    sumAHighB_uid264_natLogPolyEval_a <= STD_LOGIC_VECTOR((31 downto 31 => reg_memoryC0_uid251_natLogTabGen_lutmem_0_to_sumAHighB_uid264_natLogPolyEval_0_q(30)) & reg_memoryC0_uid251_natLogTabGen_lutmem_0_to_sumAHighB_uid264_natLogPolyEval_0_q);
    sumAHighB_uid264_natLogPolyEval_b <= STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid263_natLogPolyEval_b(21)) & highBBits_uid263_natLogPolyEval_b);
            sumAHighB_uid264_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid264_natLogPolyEval_a) + SIGNED(sumAHighB_uid264_natLogPolyEval_b));
    sumAHighB_uid264_natLogPolyEval_q <= sumAHighB_uid264_natLogPolyEval_o(31 downto 0);


	--lowRangeB_uid262_natLogPolyEval(BITSELECT,261)@19
    lowRangeB_uid262_natLogPolyEval_in <= prodXYTruncFR_uid343_pT2_uid261_natLogPolyEval_b(1 downto 0);
    lowRangeB_uid262_natLogPolyEval_b <= lowRangeB_uid262_natLogPolyEval_in(1 downto 0);

	--s2_uid262_uid265_natLogPolyEval(BITJOIN,264)@19
    s2_uid262_uid265_natLogPolyEval_q <= sumAHighB_uid264_natLogPolyEval_q & lowRangeB_uid262_natLogPolyEval_b;

	--peOR_uid93_fpLogE1pxTest(BITSELECT,92)@19
    peOR_uid93_fpLogE1pxTest_in <= s2_uid262_uid265_natLogPolyEval_q(32 downto 0);
    peOR_uid93_fpLogE1pxTest_b <= peOR_uid93_fpLogE1pxTest_in(32 downto 6);

	--reg_peOR_uid93_fpLogE1pxTest_0_to_postPEMul_uid103_fpLogE1pxTest_1(REG,383)@19
    reg_peOR_uid93_fpLogE1pxTest_0_to_postPEMul_uid103_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_peOR_uid93_fpLogE1pxTest_0_to_postPEMul_uid103_fpLogE1pxTest_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_peOR_uid93_fpLogE1pxTest_0_to_postPEMul_uid103_fpLogE1pxTest_1_q <= peOR_uid93_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor(LOGICAL,912)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_b <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_sticky_ena_q;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_q <= not (ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_a or ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_b);

	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_mem_top(CONSTANT,908)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_mem_top_q <= "01000";

	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp(LOGICAL,909)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_a <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_mem_top_q;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_q);
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_q <= "1" when ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_a = ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_b else "0";

	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmpReg(REG,910)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmpReg_q <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_sticky_ena(REG,913)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_sticky_ena_q <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd(LOGICAL,914)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_a <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_sticky_ena_q;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_q <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_a and ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_b;

	--o2_uid97_fpLogE1pxTest(CONSTANT,96)
    o2_uid97_fpLogE1pxTest_q <= "01";

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor(LOGICAL,899)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_b <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_q <= not (ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_a or ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_b);

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena(REG,900)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd(LOGICAL,901)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_a <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_a and ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_b;

	--ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem(DUALMEM,890)
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ia <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_aa <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ab <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_rdmux_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 23,
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
        clocken1 => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_q <= ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_iq(22 downto 0);

	--sEz_uid98_fpLogE1pxTest(BITJOIN,97)@8
    sEz_uid98_fpLogE1pxTest_q <= o2_uid97_fpLogE1pxTest_q & ld_frac_uid22_fpLogE1pxTest_b_to_sEz_uid98_fpLogE1pxTest_a_replace_mem_q;

	--fracBRed_uid99_fpLogE1pxTest(BITSELECT,98)@8
    fracBRed_uid99_fpLogE1pxTest_in <= fracB_uid83_fpLogE1pxTest_q;
    fracBRed_uid99_fpLogE1pxTest_b <= fracBRed_uid99_fpLogE1pxTest_in(23 downto 1);

	--sEz_uid101_fpLogE1pxTest(BITJOIN,100)@8
    sEz_uid101_fpLogE1pxTest_q <= z2_uid100_fpLogE1pxTest_q & fracBRed_uid99_fpLogE1pxTest_b;

	--ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a(DELAY,499)@0
    ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 7 )
    PORT MAP ( xin => branch3_uid73_fpLogE1pxTest_q, xout => ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--branch3OrC_uid94_fpLogE1pxTest(LOGICAL,93)@7
    branch3OrC_uid94_fpLogE1pxTest_a <= ld_branch3_uid73_fpLogE1pxTest_q_to_branch3OrC_uid94_fpLogE1pxTest_a_q;
    branch3OrC_uid94_fpLogE1pxTest_b <= c_uid87_fpLogE1pxTest_q;
    branch3OrC_uid94_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            branch3OrC_uid94_fpLogE1pxTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            branch3OrC_uid94_fpLogE1pxTest_q <= branch3OrC_uid94_fpLogE1pxTest_a or branch3OrC_uid94_fpLogE1pxTest_b;
        END IF;
        END IF;
    END PROCESS;



	--sEz_uid102_fpLogE1pxTest(MUX,101)@8
    sEz_uid102_fpLogE1pxTest_s <= branch3OrC_uid94_fpLogE1pxTest_q;
    sEz_uid102_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sEz_uid102_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE sEz_uid102_fpLogE1pxTest_s IS
                      WHEN "0" => sEz_uid102_fpLogE1pxTest_q <= sEz_uid101_fpLogE1pxTest_q;
                      WHEN "1" => sEz_uid102_fpLogE1pxTest_q <= sEz_uid98_fpLogE1pxTest_q;
                      WHEN OTHERS => sEz_uid102_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_inputreg(DELAY,902)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => sEz_uid102_fpLogE1pxTest_q, xout => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt(COUNTER,904)
    -- every=1, low=0, high=8, step=1, init=1
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_i = 7 THEN
                      ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_eq = '1') THEN
                        ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_i <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_i - 8;
                    ELSE
                        ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_i <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_i,4));


	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdreg(REG,905)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdreg_q <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux(MUX,906)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_s, ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdreg_q, ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_q <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_q <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem(DUALMEM,903)
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_ia <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_inputreg_q;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_aa <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdreg_q;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_ab <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_rdmux_q;
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 25,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 25,
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
        clocken1 => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_q <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_iq(24 downto 0);

	--postPEMul_uid103_fpLogE1pxTest(MULT,102)@20
    postPEMul_uid103_fpLogE1pxTest_pr <= SIGNED(postPEMul_uid103_fpLogE1pxTest_a) * SIGNED(postPEMul_uid103_fpLogE1pxTest_b);
    postPEMul_uid103_fpLogE1pxTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_a <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_b <= (others => '0');
            postPEMul_uid103_fpLogE1pxTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_a <= ld_sEz_uid102_fpLogE1pxTest_q_to_postPEMul_uid103_fpLogE1pxTest_a_replace_mem_q;
                postPEMul_uid103_fpLogE1pxTest_b <= reg_peOR_uid93_fpLogE1pxTest_0_to_postPEMul_uid103_fpLogE1pxTest_1_q;
                postPEMul_uid103_fpLogE1pxTest_s1 <= STD_LOGIC_VECTOR(postPEMul_uid103_fpLogE1pxTest_pr);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid103_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid103_fpLogE1pxTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid103_fpLogE1pxTest_q <= postPEMul_uid103_fpLogE1pxTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--highBBits_uid107_fpLogE1pxTest(BITSELECT,106)@23
    highBBits_uid107_fpLogE1pxTest_in <= postPEMul_uid103_fpLogE1pxTest_q;
    highBBits_uid107_fpLogE1pxTest_b <= highBBits_uid107_fpLogE1pxTest_in(51 downto 22);

	--wideZero_uid104_fpLogE1pxTest(CONSTANT,103)
    wideZero_uid104_fpLogE1pxTest_q <= "00000000000000000000000000000000000";

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor(LOGICAL,885)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_b <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_q <= not (ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_a or ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_b);

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_mem_top(CONSTANT,881)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_mem_top_q <= "01001";

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp(LOGICAL,882)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_a <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_mem_top_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q);
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_q <= "1" when ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_a = ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_b else "0";

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg(REG,883)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena(REG,886)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_nor_q = "1") THEN
                ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd(LOGICAL,887)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_a <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_sticky_ena_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_b <= en;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_a and ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_b;

	--expBran3PreExt_uid45_fpLogE1pxTest(SUB,44)@6
    expBran3PreExt_uid45_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & cstBiasMO_uid10_fpLogE1pxTest_q);
    expBran3PreExt_uid45_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0000" & r_uid213_leadingZeros_uid44_fpLogE1pxTest_q);
            expBran3PreExt_uid45_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expBran3PreExt_uid45_fpLogE1pxTest_a) - UNSIGNED(expBran3PreExt_uid45_fpLogE1pxTest_b));
    expBran3PreExt_uid45_fpLogE1pxTest_q <= expBran3PreExt_uid45_fpLogE1pxTest_o(8 downto 0);


	--expBran3Pre_uid46_fpLogE1pxTest(BITSELECT,45)@6
    expBran3Pre_uid46_fpLogE1pxTest_in <= expBran3PreExt_uid45_fpLogE1pxTest_q(7 downto 0);
    expBran3Pre_uid46_fpLogE1pxTest_b <= expBran3Pre_uid46_fpLogE1pxTest_in(7 downto 0);

	--reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5(REG,387)@6
    reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5_q <= expBran3Pre_uid46_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_1(REG,385)@2
    reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_1_q <= msbUoPlusOFracX_uid54_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0(REG,384)@0
    reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q <= expX_uid6_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_a(DELAY,449)@1
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q, xout => ld_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--eUpdateOPOFracX_uid55_fpLogE1pxTest(ADD,54)@3
    eUpdateOPOFracX_uid55_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & ld_reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_a_q);
    eUpdateOPOFracX_uid55_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00000000" & reg_msbUoPlusOFracX_uid54_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_1_q);
    eUpdateOPOFracX_uid55_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            eUpdateOPOFracX_uid55_fpLogE1pxTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                eUpdateOPOFracX_uid55_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(eUpdateOPOFracX_uid55_fpLogE1pxTest_a) + UNSIGNED(eUpdateOPOFracX_uid55_fpLogE1pxTest_b));
            END IF;
        END IF;
    END PROCESS;
    eUpdateOPOFracX_uid55_fpLogE1pxTest_q <= eUpdateOPOFracX_uid55_fpLogE1pxTest_o(8 downto 0);


	--ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d(DELAY,480)@4
    ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d : dspba_delay
    GENERIC MAP ( width => 9, depth => 3 )
    PORT MAP ( xin => eUpdateOPOFracX_uid55_fpLogE1pxTest_q, xout => ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor(LOGICAL,846)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_b <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_sticky_ena_q;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_q <= not (ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_a or ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_b);

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_sticky_ena(REG,847)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_nor_q = "1") THEN
                ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_sticky_ena_q <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd(LOGICAL,848)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_sticky_ena_q;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_b <= en;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_q <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_a and ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_b;

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_inputreg(DELAY,836)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_expX_uid6_fpLogE1pxTest_0_to_eUpdateOPOFracX_uid55_fpLogE1pxTest_0_q, xout => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem(DUALMEM,837)
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_ia <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_inputreg_q;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_aa <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdreg_q;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_ab <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_rdmux_q;
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 8,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_iq,
        address_a => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_aa,
        data_a => ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_ia
    );
    ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_reset0 <= areset;
        ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_q <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_iq(7 downto 0);

	--expB_uid79_fpLogE1pxTest(MUX,78)@7
    expB_uid79_fpLogE1pxTest_s <= branEnc_uid77_fpLogE1pxTest_q;
    expB_uid79_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expB_uid79_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expB_uid79_fpLogE1pxTest_s IS
                      WHEN "00" => expB_uid79_fpLogE1pxTest_q <= STD_LOGIC_VECTOR("0" & ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_replace_mem_q);
                      WHEN "01" => expB_uid79_fpLogE1pxTest_q <= ld_eUpdateOPOFracX_uid55_fpLogE1pxTest_q_to_expB_uid79_fpLogE1pxTest_d_q;
                      WHEN "10" => expB_uid79_fpLogE1pxTest_q <= STD_LOGIC_VECTOR("0" & cstBias_uid9_fpLogE1pxTest_q);
                      WHEN "11" => expB_uid79_fpLogE1pxTest_q <= STD_LOGIC_VECTOR("0" & reg_expBran3Pre_uid46_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_5_q);
                      WHEN OTHERS => expB_uid79_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg(DELAY,875)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expB_uid79_fpLogE1pxTest_q, xout => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt(COUNTER,877)
    -- every=1, low=0, high=9, step=1, init=1
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i = 8 THEN
                      ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_eq = '1') THEN
                        ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i - 9;
                    ELSE
                        ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_i,4));


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg(REG,878)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux(MUX,879)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_s <= en;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux: PROCESS (ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_s, ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q, ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem(DUALMEM,876)
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ia <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_inputreg_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_aa <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdreg_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ab <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_rdmux_q;
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 9,
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
        clocken1 => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_iq,
        address_a => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_aa,
        data_a => ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_ia
    );
    ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_reset0 <= areset;
        ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_q <= ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_iq(8 downto 0);

	--e_uid84_fpLogE1pxTest(SUB,83)@20
    e_uid84_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & ld_expB_uid79_fpLogE1pxTest_q_to_e_uid84_fpLogE1pxTest_a_replace_mem_q);
    e_uid84_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("00" & cstBias_uid9_fpLogE1pxTest_q);
            e_uid84_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(e_uid84_fpLogE1pxTest_a) - UNSIGNED(e_uid84_fpLogE1pxTest_b));
    e_uid84_fpLogE1pxTest_q <= e_uid84_fpLogE1pxTest_o(9 downto 0);


	--xv0_uid244_constMult(BITSELECT,243)@20
    xv0_uid244_constMult_in <= e_uid84_fpLogE1pxTest_q(5 downto 0);
    xv0_uid244_constMult_b <= xv0_uid244_constMult_in(5 downto 0);

	--reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0(REG,389)@20
    reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q <= xv0_uid244_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q_to_p0_uid247_constMult_a(DELAY,669)@21
    ld_reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q_to_p0_uid247_constMult_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q, xout => ld_reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q_to_p0_uid247_constMult_a_q, ena => en(0), clk => clk, aclr => areset );

	--p0_uid247_constMult(LOOKUP,246)@22
    p0_uid247_constMult: PROCESS (ld_reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q_to_p0_uid247_constMult_a_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_xv0_uid244_constMult_0_to_p0_uid247_constMult_0_q_to_p0_uid247_constMult_a_q) IS
                WHEN "000000" =>  p0_uid247_constMult_q <= "0000000000000000000000000000000000";
                WHEN "000001" =>  p0_uid247_constMult_q <= "0000001011000101110010000110000000";
                WHEN "000010" =>  p0_uid247_constMult_q <= "0000010110001011100100001100000000";
                WHEN "000011" =>  p0_uid247_constMult_q <= "0000100001010001010110010010000000";
                WHEN "000100" =>  p0_uid247_constMult_q <= "0000101100010111001000011000000000";
                WHEN "000101" =>  p0_uid247_constMult_q <= "0000110111011100111010011110000000";
                WHEN "000110" =>  p0_uid247_constMult_q <= "0001000010100010101100100100000000";
                WHEN "000111" =>  p0_uid247_constMult_q <= "0001001101101000011110101010000000";
                WHEN "001000" =>  p0_uid247_constMult_q <= "0001011000101110010000110000000000";
                WHEN "001001" =>  p0_uid247_constMult_q <= "0001100011110100000010110110000000";
                WHEN "001010" =>  p0_uid247_constMult_q <= "0001101110111001110100111100000000";
                WHEN "001011" =>  p0_uid247_constMult_q <= "0001111001111111100111000010000000";
                WHEN "001100" =>  p0_uid247_constMult_q <= "0010000101000101011001001000000000";
                WHEN "001101" =>  p0_uid247_constMult_q <= "0010010000001011001011001110000000";
                WHEN "001110" =>  p0_uid247_constMult_q <= "0010011011010000111101010100000000";
                WHEN "001111" =>  p0_uid247_constMult_q <= "0010100110010110101111011010000000";
                WHEN "010000" =>  p0_uid247_constMult_q <= "0010110001011100100001100000000000";
                WHEN "010001" =>  p0_uid247_constMult_q <= "0010111100100010010011100110000000";
                WHEN "010010" =>  p0_uid247_constMult_q <= "0011000111101000000101101100000000";
                WHEN "010011" =>  p0_uid247_constMult_q <= "0011010010101101110111110010000000";
                WHEN "010100" =>  p0_uid247_constMult_q <= "0011011101110011101001111000000000";
                WHEN "010101" =>  p0_uid247_constMult_q <= "0011101000111001011011111110000000";
                WHEN "010110" =>  p0_uid247_constMult_q <= "0011110011111111001110000100000000";
                WHEN "010111" =>  p0_uid247_constMult_q <= "0011111111000101000000001010000000";
                WHEN "011000" =>  p0_uid247_constMult_q <= "0100001010001010110010010000000000";
                WHEN "011001" =>  p0_uid247_constMult_q <= "0100010101010000100100010110000000";
                WHEN "011010" =>  p0_uid247_constMult_q <= "0100100000010110010110011100000000";
                WHEN "011011" =>  p0_uid247_constMult_q <= "0100101011011100001000100010000000";
                WHEN "011100" =>  p0_uid247_constMult_q <= "0100110110100001111010101000000000";
                WHEN "011101" =>  p0_uid247_constMult_q <= "0101000001100111101100101110000000";
                WHEN "011110" =>  p0_uid247_constMult_q <= "0101001100101101011110110100000000";
                WHEN "011111" =>  p0_uid247_constMult_q <= "0101010111110011010000111010000000";
                WHEN "100000" =>  p0_uid247_constMult_q <= "0101100010111001000011000000000000";
                WHEN "100001" =>  p0_uid247_constMult_q <= "0101101101111110110101000110000000";
                WHEN "100010" =>  p0_uid247_constMult_q <= "0101111001000100100111001100000000";
                WHEN "100011" =>  p0_uid247_constMult_q <= "0110000100001010011001010010000000";
                WHEN "100100" =>  p0_uid247_constMult_q <= "0110001111010000001011011000000000";
                WHEN "100101" =>  p0_uid247_constMult_q <= "0110011010010101111101011110000000";
                WHEN "100110" =>  p0_uid247_constMult_q <= "0110100101011011101111100100000000";
                WHEN "100111" =>  p0_uid247_constMult_q <= "0110110000100001100001101010000000";
                WHEN "101000" =>  p0_uid247_constMult_q <= "0110111011100111010011110000000000";
                WHEN "101001" =>  p0_uid247_constMult_q <= "0111000110101101000101110110000000";
                WHEN "101010" =>  p0_uid247_constMult_q <= "0111010001110010110111111100000000";
                WHEN "101011" =>  p0_uid247_constMult_q <= "0111011100111000101010000010000000";
                WHEN "101100" =>  p0_uid247_constMult_q <= "0111100111111110011100001000000000";
                WHEN "101101" =>  p0_uid247_constMult_q <= "0111110011000100001110001110000000";
                WHEN "101110" =>  p0_uid247_constMult_q <= "0111111110001010000000010100000000";
                WHEN "101111" =>  p0_uid247_constMult_q <= "1000001001001111110010011010000000";
                WHEN "110000" =>  p0_uid247_constMult_q <= "1000010100010101100100100000000000";
                WHEN "110001" =>  p0_uid247_constMult_q <= "1000011111011011010110100110000000";
                WHEN "110010" =>  p0_uid247_constMult_q <= "1000101010100001001000101100000000";
                WHEN "110011" =>  p0_uid247_constMult_q <= "1000110101100110111010110010000000";
                WHEN "110100" =>  p0_uid247_constMult_q <= "1001000000101100101100111000000000";
                WHEN "110101" =>  p0_uid247_constMult_q <= "1001001011110010011110111110000000";
                WHEN "110110" =>  p0_uid247_constMult_q <= "1001010110111000010001000100000000";
                WHEN "110111" =>  p0_uid247_constMult_q <= "1001100001111110000011001010000000";
                WHEN "111000" =>  p0_uid247_constMult_q <= "1001101101000011110101010000000000";
                WHEN "111001" =>  p0_uid247_constMult_q <= "1001111000001001100111010110000000";
                WHEN "111010" =>  p0_uid247_constMult_q <= "1010000011001111011001011100000000";
                WHEN "111011" =>  p0_uid247_constMult_q <= "1010001110010101001011100010000000";
                WHEN "111100" =>  p0_uid247_constMult_q <= "1010011001011010111101101000000000";
                WHEN "111101" =>  p0_uid247_constMult_q <= "1010100100100000101111101110000000";
                WHEN "111110" =>  p0_uid247_constMult_q <= "1010101111100110100001110100000000";
                WHEN "111111" =>  p0_uid247_constMult_q <= "1010111010101100010011111010000000";
                WHEN OTHERS =>
                    p0_uid247_constMult_q <= "0000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid245_constMult(BITSELECT,244)@20
    xv1_uid245_constMult_in <= e_uid84_fpLogE1pxTest_q(8 downto 0);
    xv1_uid245_constMult_b <= xv1_uid245_constMult_in(8 downto 6);

	--reg_xv1_uid245_constMult_0_to_p1_uid246_constMult_0(REG,388)@20
    reg_xv1_uid245_constMult_0_to_p1_uid246_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid245_constMult_0_to_p1_uid246_constMult_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid245_constMult_0_to_p1_uid246_constMult_0_q <= xv1_uid245_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p1_uid246_constMult(LOOKUP,245)@21
    p1_uid246_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p1_uid246_constMult_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv1_uid245_constMult_0_to_p1_uid246_constMult_0_q) IS
                WHEN "000" =>  p1_uid246_constMult_q <= "0000000000000000000000000000000000000";
                WHEN "001" =>  p1_uid246_constMult_q <= "0001011000101110010000110000000000000";
                WHEN "010" =>  p1_uid246_constMult_q <= "0010110001011100100001100000000000000";
                WHEN "011" =>  p1_uid246_constMult_q <= "0100001010001010110010010000000000000";
                WHEN "100" =>  p1_uid246_constMult_q <= "1010011101000110111101000000000000000";
                WHEN "101" =>  p1_uid246_constMult_q <= "1011110101110101001101110000000000000";
                WHEN "110" =>  p1_uid246_constMult_q <= "1101001110100011011110100000000000000";
                WHEN "111" =>  p1_uid246_constMult_q <= "1110100111010001101111010000000000000";
                WHEN OTHERS =>
                    p1_uid246_constMult_q <= "0000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid248_constMult(ADD,247)@22
    lev1_a0_uid248_constMult_a <= STD_LOGIC_VECTOR((38 downto 37 => p1_uid246_constMult_q(36)) & p1_uid246_constMult_q);
    lev1_a0_uid248_constMult_b <= STD_LOGIC_VECTOR('0' & "0000" & p0_uid247_constMult_q);
            lev1_a0_uid248_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid248_constMult_a) + SIGNED(lev1_a0_uid248_constMult_b));
    lev1_a0_uid248_constMult_q <= lev1_a0_uid248_constMult_o(37 downto 0);


	--sR_uid249_constMult(BITSELECT,248)@22
    sR_uid249_constMult_in <= lev1_a0_uid248_constMult_q(36 downto 0);
    sR_uid249_constMult_b <= sR_uid249_constMult_in(36 downto 2);

	--reg_sR_uid249_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2(REG,390)@22
    reg_sR_uid249_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sR_uid249_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sR_uid249_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q <= sR_uid249_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b(DELAY,509)@8
    ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => branch3OrC_uid94_fpLogE1pxTest_q, xout => ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--addTermOne_uid105_fpLogE1pxTest(MUX,104)@23
    addTermOne_uid105_fpLogE1pxTest_s <= ld_branch3OrC_uid94_fpLogE1pxTest_q_to_addTermOne_uid105_fpLogE1pxTest_b_q;
    addTermOne_uid105_fpLogE1pxTest: PROCESS (addTermOne_uid105_fpLogE1pxTest_s, en, reg_sR_uid249_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q, wideZero_uid104_fpLogE1pxTest_q)
    BEGIN
            CASE addTermOne_uid105_fpLogE1pxTest_s IS
                  WHEN "0" => addTermOne_uid105_fpLogE1pxTest_q <= reg_sR_uid249_constMult_0_to_addTermOne_uid105_fpLogE1pxTest_2_q;
                  WHEN "1" => addTermOne_uid105_fpLogE1pxTest_q <= wideZero_uid104_fpLogE1pxTest_q;
                  WHEN OTHERS => addTermOne_uid105_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sumAHighB_uid108_fpLogE1pxTest(ADD,107)@23
    sumAHighB_uid108_fpLogE1pxTest_a <= STD_LOGIC_VECTOR((35 downto 35 => addTermOne_uid105_fpLogE1pxTest_q(34)) & addTermOne_uid105_fpLogE1pxTest_q);
    sumAHighB_uid108_fpLogE1pxTest_b <= STD_LOGIC_VECTOR((35 downto 30 => highBBits_uid107_fpLogE1pxTest_b(29)) & highBBits_uid107_fpLogE1pxTest_b);
            sumAHighB_uid108_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid108_fpLogE1pxTest_a) + SIGNED(sumAHighB_uid108_fpLogE1pxTest_b));
    sumAHighB_uid108_fpLogE1pxTest_q <= sumAHighB_uid108_fpLogE1pxTest_o(35 downto 0);


	--lowRangeB_uid106_fpLogE1pxTest(BITSELECT,105)@23
    lowRangeB_uid106_fpLogE1pxTest_in <= postPEMul_uid103_fpLogE1pxTest_q(21 downto 0);
    lowRangeB_uid106_fpLogE1pxTest_b <= lowRangeB_uid106_fpLogE1pxTest_in(21 downto 0);

	--finalSum_uid106_uid109_fpLogE1pxTest(BITJOIN,108)@23
    finalSum_uid106_uid109_fpLogE1pxTest_q <= sumAHighB_uid108_fpLogE1pxTest_q & lowRangeB_uid106_fpLogE1pxTest_b;

	--FullSumAB57_uid110_fpLogE1pxTest(BITSELECT,109)@23
    FullSumAB57_uid110_fpLogE1pxTest_in <= finalSum_uid106_uid109_fpLogE1pxTest_q;
    FullSumAB57_uid110_fpLogE1pxTest_b <= FullSumAB57_uid110_fpLogE1pxTest_in(57 downto 57);

	--ld_FullSumAB57_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b(DELAY,521)@23
    ld_FullSumAB57_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => FullSumAB57_uid110_fpLogE1pxTest_b, xout => ld_FullSumAB57_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalSumOneComp_uid112_fpLogE1pxTest(LOGICAL,111)@23
    finalSumOneComp_uid112_fpLogE1pxTest_a <= finalSum_uid106_uid109_fpLogE1pxTest_q;
    finalSumOneComp_uid112_fpLogE1pxTest_b <= STD_LOGIC_VECTOR((57 downto 1 => FullSumAB57_uid110_fpLogE1pxTest_b(0)) & FullSumAB57_uid110_fpLogE1pxTest_b);
    finalSumOneComp_uid112_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            finalSumOneComp_uid112_fpLogE1pxTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            finalSumOneComp_uid112_fpLogE1pxTest_q <= finalSumOneComp_uid112_fpLogE1pxTest_a xor finalSumOneComp_uid112_fpLogE1pxTest_b;
        END IF;
        END IF;
    END PROCESS;



	--finalSumAbs_uid113_fpLogE1pxTest(ADD,112)@24
    finalSumAbs_uid113_fpLogE1pxTest_a <= STD_LOGIC_VECTOR((58 downto 58 => finalSumOneComp_uid112_fpLogE1pxTest_q(57)) & finalSumOneComp_uid112_fpLogE1pxTest_q);
    finalSumAbs_uid113_fpLogE1pxTest_b <= STD_LOGIC_VECTOR((58 downto 1 => ld_FullSumAB57_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b_q(0)) & ld_FullSumAB57_uid110_fpLogE1pxTest_b_to_finalSumAbs_uid113_fpLogE1pxTest_b_q);
            finalSumAbs_uid113_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(SIGNED(finalSumAbs_uid113_fpLogE1pxTest_a) + SIGNED(finalSumAbs_uid113_fpLogE1pxTest_b));
    finalSumAbs_uid113_fpLogE1pxTest_q <= finalSumAbs_uid113_fpLogE1pxTest_o(58 downto 0);


	--rVStage_uid268_countZ_uid114_fpLogE1pxTest(BITSELECT,267)@24
    rVStage_uid268_countZ_uid114_fpLogE1pxTest_in <= finalSumAbs_uid113_fpLogE1pxTest_q;
    rVStage_uid268_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid268_countZ_uid114_fpLogE1pxTest_in(58 downto 27);

	--reg_rVStage_uid268_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid269_countZ_uid114_fpLogE1pxTest_1(REG,391)@24
    reg_rVStage_uid268_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid269_countZ_uid114_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid268_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid269_countZ_uid114_fpLogE1pxTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid268_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid269_countZ_uid114_fpLogE1pxTest_1_q <= rVStage_uid268_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid269_countZ_uid114_fpLogE1pxTest(LOGICAL,268)@25
    vCount_uid269_countZ_uid114_fpLogE1pxTest_a <= reg_rVStage_uid268_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid269_countZ_uid114_fpLogE1pxTest_1_q;
    vCount_uid269_countZ_uid114_fpLogE1pxTest_b <= zs_uid267_countZ_uid114_fpLogE1pxTest_q;
    vCount_uid269_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid269_countZ_uid114_fpLogE1pxTest_a = vCount_uid269_countZ_uid114_fpLogE1pxTest_b else "0";

	--reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5(REG,401)@25
    reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q <= vCount_uid269_countZ_uid114_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_f(DELAY,724)@26
    ld_reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q, xout => ld_reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid271_countZ_uid114_fpLogE1pxTest(BITSELECT,270)@24
    vStage_uid271_countZ_uid114_fpLogE1pxTest_in <= finalSumAbs_uid113_fpLogE1pxTest_q(26 downto 0);
    vStage_uid271_countZ_uid114_fpLogE1pxTest_b <= vStage_uid271_countZ_uid114_fpLogE1pxTest_in(26 downto 0);

	--ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid272_countZ_uid114_fpLogE1pxTest_b(DELAY,689)@24
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid272_countZ_uid114_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => vStage_uid271_countZ_uid114_fpLogE1pxTest_b, xout => ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid272_countZ_uid114_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid270_countZ_uid114_fpLogE1pxTest(CONSTANT,269)
    mO_uid270_countZ_uid114_fpLogE1pxTest_q <= "11111";

	--cStage_uid272_countZ_uid114_fpLogE1pxTest(BITJOIN,271)@25
    cStage_uid272_countZ_uid114_fpLogE1pxTest_q <= ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid272_countZ_uid114_fpLogE1pxTest_b_q & mO_uid270_countZ_uid114_fpLogE1pxTest_q;

	--ld_rVStage_uid268_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid274_countZ_uid114_fpLogE1pxTest_c(DELAY,691)@24
    ld_rVStage_uid268_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid274_countZ_uid114_fpLogE1pxTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => rVStage_uid268_countZ_uid114_fpLogE1pxTest_b, xout => ld_rVStage_uid268_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid274_countZ_uid114_fpLogE1pxTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid274_countZ_uid114_fpLogE1pxTest(MUX,273)@25
    vStagei_uid274_countZ_uid114_fpLogE1pxTest_s <= vCount_uid269_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid274_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid274_countZ_uid114_fpLogE1pxTest_s, en, ld_rVStage_uid268_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid274_countZ_uid114_fpLogE1pxTest_c_q, cStage_uid272_countZ_uid114_fpLogE1pxTest_q)
    BEGIN
            CASE vStagei_uid274_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid274_countZ_uid114_fpLogE1pxTest_q <= ld_rVStage_uid268_countZ_uid114_fpLogE1pxTest_b_to_vStagei_uid274_countZ_uid114_fpLogE1pxTest_c_q;
                  WHEN "1" => vStagei_uid274_countZ_uid114_fpLogE1pxTest_q <= cStage_uid272_countZ_uid114_fpLogE1pxTest_q;
                  WHEN OTHERS => vStagei_uid274_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid276_countZ_uid114_fpLogE1pxTest(BITSELECT,275)@25
    rVStage_uid276_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid274_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid276_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid276_countZ_uid114_fpLogE1pxTest_in(31 downto 16);

	--reg_rVStage_uid276_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid277_countZ_uid114_fpLogE1pxTest_1(REG,392)@25
    reg_rVStage_uid276_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid277_countZ_uid114_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid276_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid277_countZ_uid114_fpLogE1pxTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid276_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid277_countZ_uid114_fpLogE1pxTest_1_q <= rVStage_uid276_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid277_countZ_uid114_fpLogE1pxTest(LOGICAL,276)@26
    vCount_uid277_countZ_uid114_fpLogE1pxTest_a <= reg_rVStage_uid276_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid277_countZ_uid114_fpLogE1pxTest_1_q;
    vCount_uid277_countZ_uid114_fpLogE1pxTest_b <= rightShiftStage0Idx2Pad16_uid160_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid277_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid277_countZ_uid114_fpLogE1pxTest_a = vCount_uid277_countZ_uid114_fpLogE1pxTest_b else "0";

	--ld_vCount_uid277_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_a(DELAY,822)@26
    ld_vCount_uid277_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid277_countZ_uid114_fpLogE1pxTest_q, xout => ld_vCount_uid277_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4(REG,400)@27
    reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_q <= ld_vCount_uid277_countZ_uid114_fpLogE1pxTest_q_to_reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid278_countZ_uid114_fpLogE1pxTest(BITSELECT,277)@25
    vStage_uid278_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid274_countZ_uid114_fpLogE1pxTest_q(15 downto 0);
    vStage_uid278_countZ_uid114_fpLogE1pxTest_b <= vStage_uid278_countZ_uid114_fpLogE1pxTest_in(15 downto 0);

	--reg_vStage_uid278_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid280_countZ_uid114_fpLogE1pxTest_3(REG,394)@25
    reg_vStage_uid278_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid280_countZ_uid114_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid278_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid280_countZ_uid114_fpLogE1pxTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid278_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid280_countZ_uid114_fpLogE1pxTest_3_q <= vStage_uid278_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid280_countZ_uid114_fpLogE1pxTest(MUX,279)@26
    vStagei_uid280_countZ_uid114_fpLogE1pxTest_s <= vCount_uid277_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid280_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid280_countZ_uid114_fpLogE1pxTest_s, en, reg_rVStage_uid276_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid277_countZ_uid114_fpLogE1pxTest_1_q, reg_vStage_uid278_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid280_countZ_uid114_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid280_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid280_countZ_uid114_fpLogE1pxTest_q <= reg_rVStage_uid276_countZ_uid114_fpLogE1pxTest_0_to_vCount_uid277_countZ_uid114_fpLogE1pxTest_1_q;
                  WHEN "1" => vStagei_uid280_countZ_uid114_fpLogE1pxTest_q <= reg_vStage_uid278_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid280_countZ_uid114_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid280_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid282_countZ_uid114_fpLogE1pxTest(BITSELECT,281)@26
    rVStage_uid282_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid280_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid282_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid282_countZ_uid114_fpLogE1pxTest_in(15 downto 8);

	--vCount_uid283_countZ_uid114_fpLogE1pxTest(LOGICAL,282)@26
    vCount_uid283_countZ_uid114_fpLogE1pxTest_a <= rVStage_uid282_countZ_uid114_fpLogE1pxTest_b;
    vCount_uid283_countZ_uid114_fpLogE1pxTest_b <= cstAllZWE_uid17_fpLogE1pxTest_q;
    vCount_uid283_countZ_uid114_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid283_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid283_countZ_uid114_fpLogE1pxTest_a = vCount_uid283_countZ_uid114_fpLogE1pxTest_b) THEN
                vCount_uid283_countZ_uid114_fpLogE1pxTest_q <= "1";
            ELSE
                vCount_uid283_countZ_uid114_fpLogE1pxTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--ld_vCount_uid283_countZ_uid114_fpLogE1pxTest_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_d(DELAY,722)@27
    ld_vCount_uid283_countZ_uid114_fpLogE1pxTest_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid283_countZ_uid114_fpLogE1pxTest_q, xout => ld_vCount_uid283_countZ_uid114_fpLogE1pxTest_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid284_countZ_uid114_fpLogE1pxTest(BITSELECT,283)@26
    vStage_uid284_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid280_countZ_uid114_fpLogE1pxTest_q(7 downto 0);
    vStage_uid284_countZ_uid114_fpLogE1pxTest_b <= vStage_uid284_countZ_uid114_fpLogE1pxTest_in(7 downto 0);

	--reg_vStage_uid284_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_3(REG,396)@26
    reg_vStage_uid284_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid284_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid284_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_3_q <= vStage_uid284_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid282_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_2(REG,395)@26
    reg_rVStage_uid282_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid282_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid282_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_2_q <= rVStage_uid282_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid286_countZ_uid114_fpLogE1pxTest(MUX,285)@27
    vStagei_uid286_countZ_uid114_fpLogE1pxTest_s <= vCount_uid283_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid286_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid286_countZ_uid114_fpLogE1pxTest_s, en, reg_rVStage_uid282_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_2_q, reg_vStage_uid284_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid286_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid286_countZ_uid114_fpLogE1pxTest_q <= reg_rVStage_uid282_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_2_q;
                  WHEN "1" => vStagei_uid286_countZ_uid114_fpLogE1pxTest_q <= reg_vStage_uid284_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid286_countZ_uid114_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid286_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid288_countZ_uid114_fpLogE1pxTest(BITSELECT,287)@27
    rVStage_uid288_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid286_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid288_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid288_countZ_uid114_fpLogE1pxTest_in(7 downto 4);

	--vCount_uid289_countZ_uid114_fpLogE1pxTest(LOGICAL,288)@27
    vCount_uid289_countZ_uid114_fpLogE1pxTest_a <= rVStage_uid288_countZ_uid114_fpLogE1pxTest_b;
    vCount_uid289_countZ_uid114_fpLogE1pxTest_b <= rightShiftStage1Idx2Pad4_uid171_fracXRSExt_uid36_fpLogE1pxTest_q;
    vCount_uid289_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid289_countZ_uid114_fpLogE1pxTest_a = vCount_uid289_countZ_uid114_fpLogE1pxTest_b else "0";

	--reg_vCount_uid289_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_2(REG,399)@27
    reg_vCount_uid289_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid289_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid289_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_2_q <= vCount_uid289_countZ_uid114_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid290_countZ_uid114_fpLogE1pxTest(BITSELECT,289)@27
    vStage_uid290_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid286_countZ_uid114_fpLogE1pxTest_q(3 downto 0);
    vStage_uid290_countZ_uid114_fpLogE1pxTest_b <= vStage_uid290_countZ_uid114_fpLogE1pxTest_in(3 downto 0);

	--vStagei_uid292_countZ_uid114_fpLogE1pxTest(MUX,291)@27
    vStagei_uid292_countZ_uid114_fpLogE1pxTest_s <= vCount_uid289_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid292_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid292_countZ_uid114_fpLogE1pxTest_s, en, rVStage_uid288_countZ_uid114_fpLogE1pxTest_b, vStage_uid290_countZ_uid114_fpLogE1pxTest_b)
    BEGIN
            CASE vStagei_uid292_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid292_countZ_uid114_fpLogE1pxTest_q <= rVStage_uid288_countZ_uid114_fpLogE1pxTest_b;
                  WHEN "1" => vStagei_uid292_countZ_uid114_fpLogE1pxTest_q <= vStage_uid290_countZ_uid114_fpLogE1pxTest_b;
                  WHEN OTHERS => vStagei_uid292_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid294_countZ_uid114_fpLogE1pxTest(BITSELECT,293)@27
    rVStage_uid294_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid292_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid294_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid294_countZ_uid114_fpLogE1pxTest_in(3 downto 2);

	--vCount_uid295_countZ_uid114_fpLogE1pxTest(LOGICAL,294)@27
    vCount_uid295_countZ_uid114_fpLogE1pxTest_a <= rVStage_uid294_countZ_uid114_fpLogE1pxTest_b;
    vCount_uid295_countZ_uid114_fpLogE1pxTest_b <= z2_uid100_fpLogE1pxTest_q;
    vCount_uid295_countZ_uid114_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vCount_uid295_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            IF (vCount_uid295_countZ_uid114_fpLogE1pxTest_a = vCount_uid295_countZ_uid114_fpLogE1pxTest_b) THEN
                vCount_uid295_countZ_uid114_fpLogE1pxTest_q <= "1";
            ELSE
                vCount_uid295_countZ_uid114_fpLogE1pxTest_q <= "0";
            END IF;
        END IF;
        END IF;
    END PROCESS;



	--vStage_uid296_countZ_uid114_fpLogE1pxTest(BITSELECT,295)@27
    vStage_uid296_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid292_countZ_uid114_fpLogE1pxTest_q(1 downto 0);
    vStage_uid296_countZ_uid114_fpLogE1pxTest_b <= vStage_uid296_countZ_uid114_fpLogE1pxTest_in(1 downto 0);

	--reg_vStage_uid296_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_3(REG,398)@27
    reg_vStage_uid296_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid296_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid296_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_3_q <= vStage_uid296_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid294_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_2(REG,397)@27
    reg_rVStage_uid294_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid294_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid294_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_2_q <= rVStage_uid294_countZ_uid114_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid298_countZ_uid114_fpLogE1pxTest(MUX,297)@28
    vStagei_uid298_countZ_uid114_fpLogE1pxTest_s <= vCount_uid295_countZ_uid114_fpLogE1pxTest_q;
    vStagei_uid298_countZ_uid114_fpLogE1pxTest: PROCESS (vStagei_uid298_countZ_uid114_fpLogE1pxTest_s, en, reg_rVStage_uid294_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_2_q, reg_vStage_uid296_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_3_q)
    BEGIN
            CASE vStagei_uid298_countZ_uid114_fpLogE1pxTest_s IS
                  WHEN "0" => vStagei_uid298_countZ_uid114_fpLogE1pxTest_q <= reg_rVStage_uid294_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_2_q;
                  WHEN "1" => vStagei_uid298_countZ_uid114_fpLogE1pxTest_q <= reg_vStage_uid296_countZ_uid114_fpLogE1pxTest_0_to_vStagei_uid298_countZ_uid114_fpLogE1pxTest_3_q;
                  WHEN OTHERS => vStagei_uid298_countZ_uid114_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid300_countZ_uid114_fpLogE1pxTest(BITSELECT,299)@28
    rVStage_uid300_countZ_uid114_fpLogE1pxTest_in <= vStagei_uid298_countZ_uid114_fpLogE1pxTest_q;
    rVStage_uid300_countZ_uid114_fpLogE1pxTest_b <= rVStage_uid300_countZ_uid114_fpLogE1pxTest_in(1 downto 1);

	--vCount_uid301_countZ_uid114_fpLogE1pxTest(LOGICAL,300)@28
    vCount_uid301_countZ_uid114_fpLogE1pxTest_a <= rVStage_uid300_countZ_uid114_fpLogE1pxTest_b;
    vCount_uid301_countZ_uid114_fpLogE1pxTest_b <= GND_q;
    vCount_uid301_countZ_uid114_fpLogE1pxTest_q <= "1" when vCount_uid301_countZ_uid114_fpLogE1pxTest_a = vCount_uid301_countZ_uid114_fpLogE1pxTest_b else "0";

	--r_uid302_countZ_uid114_fpLogE1pxTest(BITJOIN,301)@28
    r_uid302_countZ_uid114_fpLogE1pxTest_q <= ld_reg_vCount_uid269_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_5_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_f_q & reg_vCount_uid277_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_4_q & ld_vCount_uid283_countZ_uid114_fpLogE1pxTest_q_to_r_uid302_countZ_uid114_fpLogE1pxTest_d_q & reg_vCount_uid289_countZ_uid114_fpLogE1pxTest_0_to_r_uid302_countZ_uid114_fpLogE1pxTest_2_q & vCount_uid295_countZ_uid114_fpLogE1pxTest_q & vCount_uid301_countZ_uid114_fpLogE1pxTest_q;

	--cstMSBFinalSumPBias_uid116_fpLogE1pxTest(CONSTANT,115)
    cstMSBFinalSumPBias_uid116_fpLogE1pxTest_q <= "010001001";

	--expRExt0_uid117_fpLogE1pxTest(SUB,116)@28
    expRExt0_uid117_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & cstMSBFinalSumPBias_uid116_fpLogE1pxTest_q);
    expRExt0_uid117_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0000" & r_uid302_countZ_uid114_fpLogE1pxTest_q);
            expRExt0_uid117_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt0_uid117_fpLogE1pxTest_a) - UNSIGNED(expRExt0_uid117_fpLogE1pxTest_b));
    expRExt0_uid117_fpLogE1pxTest_q <= expRExt0_uid117_fpLogE1pxTest_o(9 downto 0);


	--reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0(REG,411)@28
    reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q <= expRExt0_uid117_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expRExt1_uid119_fpLogE1pxTest(SUB,118)@29
    expRExt1_uid119_fpLogE1pxTest_a <= STD_LOGIC_VECTOR((10 downto 10 => reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q(9)) & reg_expRExt0_uid117_fpLogE1pxTest_0_to_expRExt1_uid119_fpLogE1pxTest_0_q);
    expRExt1_uid119_fpLogE1pxTest_b <= STD_LOGIC_VECTOR((10 downto 6 => ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_q(5)) & ld_branch4ExpCorrection_uid118_fpLogE1pxTest_q_to_expRExt1_uid119_fpLogE1pxTest_b_replace_mem_q);
            expRExt1_uid119_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(SIGNED(expRExt1_uid119_fpLogE1pxTest_a) - SIGNED(expRExt1_uid119_fpLogE1pxTest_b));
    expRExt1_uid119_fpLogE1pxTest_q <= expRExt1_uid119_fpLogE1pxTest_o(10 downto 0);


	--expRExt1Red_uid120_fpLogE1pxTest(BITSELECT,119)@29
    expRExt1Red_uid120_fpLogE1pxTest_in <= expRExt1_uid119_fpLogE1pxTest_q(9 downto 0);
    expRExt1Red_uid120_fpLogE1pxTest_b <= expRExt1Red_uid120_fpLogE1pxTest_in(9 downto 0);

	--ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c(DELAY,529)@28
    ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c : dspba_delay
    GENERIC MAP ( width => 10, depth => 1 )
    PORT MAP ( xin => expRExt0_uid117_fpLogE1pxTest_q, xout => ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_inputreg(DELAY,928)
    ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => branch3OrC_uid94_fpLogE1pxTest_q, xout => ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b(DELAY,528)@8
    ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 20 )
    PORT MAP ( xin => ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_inputreg_q, xout => ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRExt_uid121_fpLogE1pxTest(MUX,120)@29
    expRExt_uid121_fpLogE1pxTest_s <= ld_branch3OrC_uid94_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_b_q;
    expRExt_uid121_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRExt_uid121_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRExt_uid121_fpLogE1pxTest_s IS
                      WHEN "0" => expRExt_uid121_fpLogE1pxTest_q <= ld_expRExt0_uid117_fpLogE1pxTest_q_to_expRExt_uid121_fpLogE1pxTest_c_q;
                      WHEN "1" => expRExt_uid121_fpLogE1pxTest_q <= expRExt1Red_uid120_fpLogE1pxTest_b;
                      WHEN OTHERS => expRExt_uid121_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor(LOGICAL,1011)
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_b <= ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_q <= not (ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_a or ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_b);

	--ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_sticky_ena(REG,1012)
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd(LOGICAL,1013)
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_a <= ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_q <= ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_a and ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_b;

	--X10dto0_uid312_normVal_uid115_fpLogE1pxTest(BITSELECT,311)@24
    X10dto0_uid312_normVal_uid115_fpLogE1pxTest_in <= finalSumAbs_uid113_fpLogE1pxTest_q(10 downto 0);
    X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b <= X10dto0_uid312_normVal_uid115_fpLogE1pxTest_in(10 downto 0);

	--ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_inputreg(DELAY,1003)
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b, xout => ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem(DUALMEM,1004)
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia <= ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_inputreg_q;
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q;
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q;
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 11,
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
        clocken1 => ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_q <= ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq(10 downto 0);

	--leftShiftStage0Idx3Pad48_uid311_normVal_uid115_fpLogE1pxTest(CONSTANT,310)
    leftShiftStage0Idx3Pad48_uid311_normVal_uid115_fpLogE1pxTest_q <= "000000000000000000000000000000000000000000000000";

	--leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest(BITJOIN,312)@28
    leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_q <= ld_X10dto0_uid312_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_b_replace_mem_q & leftShiftStage0Idx3Pad48_uid311_normVal_uid115_fpLogE1pxTest_q;

	--ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor(LOGICAL,1000)
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_b <= ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_q <= not (ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_a or ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_b);

	--ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_sticky_ena(REG,1001)
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd(LOGICAL,1002)
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_a <= ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_q <= ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_a and ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_b;

	--ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem(DUALMEM,993)
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia <= ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_cStage_uid272_countZ_uid114_fpLogE1pxTest_b_q;
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q;
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q;
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 27,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 27,
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
        clocken1 => ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_q <= ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq(26 downto 0);

	--leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest(BITJOIN,309)@28
    leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_q <= ld_vStage_uid271_countZ_uid114_fpLogE1pxTest_b_to_leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_b_replace_mem_q & zs_uid267_countZ_uid114_fpLogE1pxTest_q;

	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor(LOGICAL,989)
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_b <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_q <= not (ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_a or ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_b);

	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_sticky_ena(REG,990)
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd(LOGICAL,991)
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_a <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_sticky_ena_q;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_a and ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_b;

	--X42dto0_uid306_normVal_uid115_fpLogE1pxTest(BITSELECT,305)@24
    X42dto0_uid306_normVal_uid115_fpLogE1pxTest_in <= finalSumAbs_uid113_fpLogE1pxTest_q(42 downto 0);
    X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b <= X42dto0_uid306_normVal_uid115_fpLogE1pxTest_in(42 downto 0);

	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_inputreg(DELAY,981)
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 43, depth => 1 )
    PORT MAP ( xin => X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b, xout => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem(DUALMEM,982)
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_inputreg_q;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q;
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 43,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 43,
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
        clocken1 => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_iq(42 downto 0);

	--leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest(BITJOIN,306)@28
    leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_mem_q & rightShiftStage0Idx2Pad16_uid160_fracXRSExt_uid36_fpLogE1pxTest_q;

	--ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor(LOGICAL,1022)
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_b <= ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q;
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_q <= not (ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_a or ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_b);

	--ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_sticky_ena(REG,1023)
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_nor_q = "1") THEN
                ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd(LOGICAL,1024)
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_a <= ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_sticky_ena_q;
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_b <= en;
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_q <= ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_a and ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_b;

	--ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_inputreg(DELAY,1014)
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 59, depth => 1 )
    PORT MAP ( xin => finalSumAbs_uid113_fpLogE1pxTest_q, xout => ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem(DUALMEM,1015)
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_ia <= ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_inputreg_q;
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_aa <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdreg_q;
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_ab <= ld_X42dto0_uid306_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_b_replace_rdmux_q;
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 59,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 59,
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
        clocken1 => ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_iq,
        address_a => ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_aa,
        data_a => ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_ia
    );
    ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_reset0 <= areset;
        ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_q <= ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_iq(58 downto 0);

	--leftShiftStageSel5Dto4_uid314_normVal_uid115_fpLogE1pxTest(BITSELECT,313)@28
    leftShiftStageSel5Dto4_uid314_normVal_uid115_fpLogE1pxTest_in <= r_uid302_countZ_uid114_fpLogE1pxTest_q;
    leftShiftStageSel5Dto4_uid314_normVal_uid115_fpLogE1pxTest_b <= leftShiftStageSel5Dto4_uid314_normVal_uid115_fpLogE1pxTest_in(5 downto 4);

	--leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest(MUX,314)@28
    leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_s <= leftShiftStageSel5Dto4_uid314_normVal_uid115_fpLogE1pxTest_b;
    leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest: PROCESS (leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_s, en, ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_q, leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_q, leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_q, leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_q)
    BEGIN
            CASE leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q <= ld_finalSumAbs_uid113_fpLogE1pxTest_q_to_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_c_replace_mem_q;
                  WHEN "01" => leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage0Idx1_uid307_normVal_uid115_fpLogE1pxTest_q;
                  WHEN "10" => leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage0Idx2_uid310_normVal_uid115_fpLogE1pxTest_q;
                  WHEN "11" => leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage0Idx3_uid313_normVal_uid115_fpLogE1pxTest_q;
                  WHEN OTHERS => leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage046dto0_uid323_normVal_uid115_fpLogE1pxTest(BITSELECT,322)@28
    LeftShiftStage046dto0_uid323_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q(46 downto 0);
    LeftShiftStage046dto0_uid323_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage046dto0_uid323_normVal_uid115_fpLogE1pxTest_in(46 downto 0);

	--leftShiftStage1Idx3Pad12_uid322_normVal_uid115_fpLogE1pxTest(CONSTANT,321)
    leftShiftStage1Idx3Pad12_uid322_normVal_uid115_fpLogE1pxTest_q <= "000000000000";

	--leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest(BITJOIN,323)@28
    leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_q <= LeftShiftStage046dto0_uid323_normVal_uid115_fpLogE1pxTest_b & leftShiftStage1Idx3Pad12_uid322_normVal_uid115_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_5(REG,406)@28
    reg_leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_5_q <= "00000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_5_q <= leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage050dto0_uid320_normVal_uid115_fpLogE1pxTest(BITSELECT,319)@28
    LeftShiftStage050dto0_uid320_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q(50 downto 0);
    LeftShiftStage050dto0_uid320_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage050dto0_uid320_normVal_uid115_fpLogE1pxTest_in(50 downto 0);

	--leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest(BITJOIN,320)@28
    leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_q <= LeftShiftStage050dto0_uid320_normVal_uid115_fpLogE1pxTest_b & cstAllZWE_uid17_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_4(REG,405)@28
    reg_leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_4_q <= "00000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_4_q <= leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage054dto0_uid317_normVal_uid115_fpLogE1pxTest(BITSELECT,316)@28
    LeftShiftStage054dto0_uid317_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q(54 downto 0);
    LeftShiftStage054dto0_uid317_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage054dto0_uid317_normVal_uid115_fpLogE1pxTest_in(54 downto 0);

	--leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest(BITJOIN,317)@28
    leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_q <= LeftShiftStage054dto0_uid317_normVal_uid115_fpLogE1pxTest_b & rightShiftStage1Idx2Pad4_uid171_fracXRSExt_uid36_fpLogE1pxTest_q;

	--reg_leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_3(REG,404)@28
    reg_leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_3_q <= "00000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_3_q <= leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_2(REG,403)@28
    reg_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_2_q <= "00000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_2_q <= leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest(BITSELECT,324)@28
    leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_in <= r_uid302_countZ_uid114_fpLogE1pxTest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_b <= leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_1(REG,402)@28
    reg_leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_1_q <= leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest(MUX,325)@29
    leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_s <= reg_leftShiftStageSel3Dto2_uid325_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_1_q;
    leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest: PROCESS (leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_s, en, reg_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_2_q, reg_leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_3_q, reg_leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_4_q, reg_leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage0_uid315_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_2_q;
                  WHEN "01" => leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage1Idx1_uid318_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_3_q;
                  WHEN "10" => leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage1Idx2_uid321_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_4_q;
                  WHEN "11" => leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage1Idx3_uid324_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest(BITSELECT,333)@29
    LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q(55 downto 0);
    LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_in(55 downto 0);

	--ld_LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_b(DELAY,753)@29
    ld_LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 56, depth => 1 )
    PORT MAP ( xin => LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_b, xout => ld_LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3Pad3_uid333_normVal_uid115_fpLogE1pxTest(CONSTANT,332)
    leftShiftStage2Idx3Pad3_uid333_normVal_uid115_fpLogE1pxTest_q <= "000";

	--leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest(BITJOIN,334)@30
    leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_q <= ld_LeftShiftStage155dto0_uid334_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_b_q & leftShiftStage2Idx3Pad3_uid333_normVal_uid115_fpLogE1pxTest_q;

	--LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest(BITSELECT,330)@29
    LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q(56 downto 0);
    LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_in(56 downto 0);

	--ld_LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_b(DELAY,751)@29
    ld_LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 57, depth => 1 )
    PORT MAP ( xin => LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_b, xout => ld_LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest(BITJOIN,331)@30
    leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_q <= ld_LeftShiftStage156dto0_uid331_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_b_q & z2_uid100_fpLogE1pxTest_q;

	--LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest(BITSELECT,327)@29
    LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_in <= leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q(57 downto 0);
    LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_b <= LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_in(57 downto 0);

	--ld_LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_b(DELAY,749)@29
    ld_LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 58, depth => 1 )
    PORT MAP ( xin => LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_b, xout => ld_LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest(BITJOIN,328)@30
    leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_q <= ld_LeftShiftStage157dto0_uid328_normVal_uid115_fpLogE1pxTest_b_to_leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_b_q & GND_q;

	--reg_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_2(REG,408)@29
    reg_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_2_q <= "00000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_2_q <= leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest(BITSELECT,335)@28
    leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_in <= r_uid302_countZ_uid114_fpLogE1pxTest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_b <= leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_b_to_reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_a(DELAY,829)@28
    ld_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_b_to_reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_b, xout => ld_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_b_to_reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1(REG,407)@29
    reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_q <= ld_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_b_to_reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest(MUX,336)@30
    leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_s <= reg_leftShiftStageSel1Dto0_uid336_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_1_q;
    leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest: PROCESS (leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_s, en, reg_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_2_q, leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_q, leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_q, leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_q)
    BEGIN
            CASE leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_s IS
                  WHEN "00" => leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_q <= reg_leftShiftStage1_uid326_normVal_uid115_fpLogE1pxTest_0_to_leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_2_q;
                  WHEN "01" => leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage2Idx1_uid329_normVal_uid115_fpLogE1pxTest_q;
                  WHEN "10" => leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage2Idx2_uid332_normVal_uid115_fpLogE1pxTest_q;
                  WHEN "11" => leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_q <= leftShiftStage2Idx3_uid335_normVal_uid115_fpLogE1pxTest_q;
                  WHEN OTHERS => leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracR_uid122_fpLogE1pxTest(BITSELECT,121)@30
    fracR_uid122_fpLogE1pxTest_in <= leftShiftStage2_uid337_normVal_uid115_fpLogE1pxTest_q(57 downto 0);
    fracR_uid122_fpLogE1pxTest_b <= fracR_uid122_fpLogE1pxTest_in(57 downto 34);

	--expFracConc_uid123_fpLogE1pxTest(BITJOIN,122)@30
    expFracConc_uid123_fpLogE1pxTest_q <= expRExt_uid121_fpLogE1pxTest_q & fracR_uid122_fpLogE1pxTest_b;

	--reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0(REG,412)@30
    reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0_q <= expFracConc_uid123_fpLogE1pxTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracPostRnd_uid124_fpLogE1pxTest(ADD,123)@31
    expFracPostRnd_uid124_fpLogE1pxTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid123_fpLogE1pxTest_0_to_expFracPostRnd_uid124_fpLogE1pxTest_0_q);
    expFracPostRnd_uid124_fpLogE1pxTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & VCC_q);
            expFracPostRnd_uid124_fpLogE1pxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRnd_uid124_fpLogE1pxTest_a) + UNSIGNED(expFracPostRnd_uid124_fpLogE1pxTest_b));
    expFracPostRnd_uid124_fpLogE1pxTest_q <= expFracPostRnd_uid124_fpLogE1pxTest_o(34 downto 0);


	--expR_uid127_fpLogE1pxTest(BITSELECT,126)@31
    expR_uid127_fpLogE1pxTest_in <= expFracPostRnd_uid124_fpLogE1pxTest_q(31 downto 0);
    expR_uid127_fpLogE1pxTest_b <= expR_uid127_fpLogE1pxTest_in(31 downto 24);

	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor(LOGICAL,939)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_b <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_q <= not (ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_a or ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_b);

	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena(REG,940)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_nor_q = "1") THEN
                ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd(LOGICAL,941)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_a <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_sticky_ena_q;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_b <= en;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_q <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_a and ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_b;

	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_inputreg(DELAY,929)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => resIsX_uid62_fpLogE1pxTest_c, xout => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem(DUALMEM,930)
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ia <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_inputreg_q;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_aa <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdreg_q;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ab <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_rdmux_q;
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 29,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 29,
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
        clocken1 => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_iq,
        address_a => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_aa,
        data_a => ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_ia
    );
    ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_reset0 <= areset;
        ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_q <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_iq(0 downto 0);

	--expR_uid128_fpLogE1pxTest(MUX,127)@31
    expR_uid128_fpLogE1pxTest_s <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_q;
    expR_uid128_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expR_uid128_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expR_uid128_fpLogE1pxTest_s IS
                      WHEN "0" => expR_uid128_fpLogE1pxTest_q <= expR_uid127_fpLogE1pxTest_b;
                      WHEN "1" => expR_uid128_fpLogE1pxTest_q <= ld_expX_uid6_fpLogE1pxTest_b_to_expR_uid128_fpLogE1pxTest_d_replace_mem_q;
                      WHEN OTHERS => expR_uid128_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor(LOGICAL,1048)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_b <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_sticky_ena_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_q <= not (ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_a or ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_b);

	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_mem_top(CONSTANT,1044)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_mem_top_q <= "011010";

	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp(LOGICAL,1045)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_a <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_mem_top_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_q);
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_q <= "1" when ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_a = ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_b else "0";

	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmpReg(REG,1046)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmpReg_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_sticky_ena(REG,1049)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_nor_q = "1") THEN
                ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_sticky_ena_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd(LOGICAL,1050)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_a <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_sticky_ena_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_b <= en;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_a and ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_b;

	--xM1_uid131_fpLogE1pxTest(LOGICAL,130)@0
    xM1_uid131_fpLogE1pxTest_a <= a;
    xM1_uid131_fpLogE1pxTest_b <= mO_uid130_fpLogE1pxTest_q;
    xM1_uid131_fpLogE1pxTest_q <= "1" when xM1_uid131_fpLogE1pxTest_a = xM1_uid131_fpLogE1pxTest_b else "0";

	--ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b(DELAY,548)@0
    ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xM1_uid131_fpLogE1pxTest_q, xout => ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf0_uid134_fpLogE1pxTest(LOGICAL,133)@1
    excRInf0_uid134_fpLogE1pxTest_a <= exc_R_uid30_fpLogE1pxTest_q;
    excRInf0_uid134_fpLogE1pxTest_b <= ld_xM1_uid131_fpLogE1pxTest_q_to_excRInf0_uid134_fpLogE1pxTest_b_q;
    excRInf0_uid134_fpLogE1pxTest_q <= excRInf0_uid134_fpLogE1pxTest_a and excRInf0_uid134_fpLogE1pxTest_b;

	--ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a(DELAY,549)@0
    ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => branch11_uid64_fpLogE1pxTest_q, xout => ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--posInf_uid136_fpLogE1pxTest(LOGICAL,135)@1
    posInf_uid136_fpLogE1pxTest_a <= ld_branch11_uid64_fpLogE1pxTest_q_to_posInf_uid136_fpLogE1pxTest_a_q;
    posInf_uid136_fpLogE1pxTest_b <= exc_I_uid24_fpLogE1pxTest_q;
    posInf_uid136_fpLogE1pxTest_q <= posInf_uid136_fpLogE1pxTest_a and posInf_uid136_fpLogE1pxTest_b;

	--excRInf0_uid137_fpLogE1pxTest(LOGICAL,136)@1
    excRInf0_uid137_fpLogE1pxTest_a <= posInf_uid136_fpLogE1pxTest_q;
    excRInf0_uid137_fpLogE1pxTest_b <= excRInf0_uid134_fpLogE1pxTest_q;
    excRInf0_uid137_fpLogE1pxTest_q <= excRInf0_uid137_fpLogE1pxTest_a or excRInf0_uid137_fpLogE1pxTest_b;

	--concExc_uid143_fpLogE1pxTest(BITJOIN,142)@1
    concExc_uid143_fpLogE1pxTest_q <= excRNaN_uid140_fpLogE1pxTest_q & excRInf0_uid137_fpLogE1pxTest_q & ld_expXIsZero_uid19_fpLogE1pxTest_q_to_InvExpXIsZero_uid29_fpLogE1pxTest_a_q;

	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_inputreg(DELAY,1038)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => concExc_uid143_fpLogE1pxTest_q, xout => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt(COUNTER,1040)
    -- every=1, low=0, high=26, step=1, init=1
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_i = 25 THEN
                      ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_eq = '1') THEN
                        ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_i <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_i - 26;
                    ELSE
                        ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_i <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_i,5));


	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdreg(REG,1041)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdreg_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux(MUX,1042)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_s <= en;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux: PROCESS (ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_s, ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdreg_q, ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdreg_q;
                  WHEN "1" => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem(DUALMEM,1039)
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_ia <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_inputreg_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_aa <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdreg_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_ab <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_rdmux_q;
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 5,
        numwords_a => 27,
        width_b => 3,
        widthad_b => 5,
        numwords_b => 27,
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
        clocken1 => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_iq,
        address_a => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_aa,
        data_a => ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_ia
    );
    ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_reset0 <= areset;
        ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_iq(2 downto 0);

	--reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0(REG,347)@30
    reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_q <= ld_concExc_uid143_fpLogE1pxTest_q_to_reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid144_fpLogE1pxTest(LOOKUP,143)@31
    excREnc_uid144_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid144_fpLogE1pxTest_q <= "01";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_concExc_uid143_fpLogE1pxTest_0_to_excREnc_uid144_fpLogE1pxTest_0_q) IS
                WHEN "000" =>  excREnc_uid144_fpLogE1pxTest_q <= "01";
                WHEN "001" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN "010" =>  excREnc_uid144_fpLogE1pxTest_q <= "10";
                WHEN "011" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN "100" =>  excREnc_uid144_fpLogE1pxTest_q <= "11";
                WHEN "101" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN "110" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN "111" =>  excREnc_uid144_fpLogE1pxTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid144_fpLogE1pxTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--expRPostExc_uid152_fpLogE1pxTest(MUX,151)@32
    expRPostExc_uid152_fpLogE1pxTest_s <= excREnc_uid144_fpLogE1pxTest_q;
    expRPostExc_uid152_fpLogE1pxTest: PROCESS (expRPostExc_uid152_fpLogE1pxTest_s, en, cstAllZWE_uid17_fpLogE1pxTest_q, expR_uid128_fpLogE1pxTest_q, cstAllOWE_uid15_fpLogE1pxTest_q, cstAllOWE_uid15_fpLogE1pxTest_q)
    BEGIN
            CASE expRPostExc_uid152_fpLogE1pxTest_s IS
                  WHEN "00" => expRPostExc_uid152_fpLogE1pxTest_q <= cstAllZWE_uid17_fpLogE1pxTest_q;
                  WHEN "01" => expRPostExc_uid152_fpLogE1pxTest_q <= expR_uid128_fpLogE1pxTest_q;
                  WHEN "10" => expRPostExc_uid152_fpLogE1pxTest_q <= cstAllOWE_uid15_fpLogE1pxTest_q;
                  WHEN "11" => expRPostExc_uid152_fpLogE1pxTest_q <= cstAllOWE_uid15_fpLogE1pxTest_q;
                  WHEN OTHERS => expRPostExc_uid152_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid145_fpLogE1pxTest(CONSTANT,144)
    oneFracRPostExc2_uid145_fpLogE1pxTest_q <= "00000000000000000000001";

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor(LOGICAL,952)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_a <= ld_reg_expX_uid6_fpLogE1pxTest_0_to_expB_uid79_fpLogE1pxTest_2_q_to_expB_uid79_fpLogE1pxTest_c_notEnable_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_b <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_q <= not (ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_a or ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_b);

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena(REG,953)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_nor_q = "1") THEN
                ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd(LOGICAL,954)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_a <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_sticky_ena_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_b <= en;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_a and ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_b;

	--ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem(DUALMEM,943)
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ia <= ld_frac_uid22_fpLogE1pxTest_b_to_fracXz_uid82_fpLogE1pxTest_b_inputreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_aa <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdreg_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ab <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_rdmux_q;
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 5,
        numwords_a => 28,
        width_b => 23,
        widthad_b => 5,
        numwords_b => 28,
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
        clocken1 => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_iq,
        address_a => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_aa,
        data_a => ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_ia
    );
    ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_reset0 <= areset;
        ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_iq(22 downto 0);

	--fracR0_uid125_fpLogE1pxTest(BITSELECT,124)@31
    fracR0_uid125_fpLogE1pxTest_in <= expFracPostRnd_uid124_fpLogE1pxTest_q(23 downto 0);
    fracR0_uid125_fpLogE1pxTest_b <= fracR0_uid125_fpLogE1pxTest_in(23 downto 1);

	--fracR_uid126_fpLogE1pxTest(MUX,125)@31
    fracR_uid126_fpLogE1pxTest_s <= ld_resIsX_uid62_fpLogE1pxTest_c_to_fracR_uid126_fpLogE1pxTest_b_replace_mem_q;
    fracR_uid126_fpLogE1pxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracR_uid126_fpLogE1pxTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracR_uid126_fpLogE1pxTest_s IS
                      WHEN "0" => fracR_uid126_fpLogE1pxTest_q <= fracR0_uid125_fpLogE1pxTest_b;
                      WHEN "1" => fracR_uid126_fpLogE1pxTest_q <= ld_frac_uid22_fpLogE1pxTest_b_to_fracR_uid126_fpLogE1pxTest_d_replace_mem_q;
                      WHEN OTHERS => fracR_uid126_fpLogE1pxTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExc_uid148_fpLogE1pxTest(MUX,147)@32
    fracRPostExc_uid148_fpLogE1pxTest_s <= excREnc_uid144_fpLogE1pxTest_q;
    fracRPostExc_uid148_fpLogE1pxTest: PROCESS (fracRPostExc_uid148_fpLogE1pxTest_s, en, cstAllZWF_uid8_fpLogE1pxTest_q, fracR_uid126_fpLogE1pxTest_q, cstAllZWF_uid8_fpLogE1pxTest_q, oneFracRPostExc2_uid145_fpLogE1pxTest_q)
    BEGIN
            CASE fracRPostExc_uid148_fpLogE1pxTest_s IS
                  WHEN "00" => fracRPostExc_uid148_fpLogE1pxTest_q <= cstAllZWF_uid8_fpLogE1pxTest_q;
                  WHEN "01" => fracRPostExc_uid148_fpLogE1pxTest_q <= fracR_uid126_fpLogE1pxTest_q;
                  WHEN "10" => fracRPostExc_uid148_fpLogE1pxTest_q <= cstAllZWF_uid8_fpLogE1pxTest_q;
                  WHEN "11" => fracRPostExc_uid148_fpLogE1pxTest_q <= oneFracRPostExc2_uid145_fpLogE1pxTest_q;
                  WHEN OTHERS => fracRPostExc_uid148_fpLogE1pxTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RLn_uid153_fpLogE1pxTest(BITJOIN,152)@32
    RLn_uid153_fpLogE1pxTest_q <= ld_signRFull_uid142_fpLogE1pxTest_q_to_RLn_uid153_fpLogE1pxTest_c_replace_mem_q & expRPostExc_uid152_fpLogE1pxTest_q & fracRPostExc_uid148_fpLogE1pxTest_q;

	--xOut(GPOUT,4)@32
    q <= RLn_uid153_fpLogE1pxTest_q;


end normal;
