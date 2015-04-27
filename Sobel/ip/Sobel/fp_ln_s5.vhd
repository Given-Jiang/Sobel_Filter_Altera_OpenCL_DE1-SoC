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

-- VHDL created from fp_ln_s5
-- VHDL created on Wed Feb 27 15:13:10 2013


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

-- Text written from /data/tczajkow/polyeval/p4/ip/aion/src/mip_common/hw_model.cpp:1248
entity fp_ln_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_ln_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllZWF_uid8_fpLogETest_q : std_logic_vector (22 downto 0);
    signal cstBias_uid9_fpLogETest_q : std_logic_vector (7 downto 0);
    signal cstBiasMO_uid10_fpLogETest_q : std_logic_vector (7 downto 0);
    signal cstAllOWE_uid12_fpLogETest_q : std_logic_vector (7 downto 0);
    signal cstAllZWE_uid14_fpLogETest_q : std_logic_vector (7 downto 0);
    signal exc_R_uid27_fpLogETest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid27_fpLogETest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid27_fpLogETest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid27_fpLogETest_q : std_logic_vector(0 downto 0);
    signal z2_uid40_fpLogETest_q : std_logic_vector (1 downto 0);
    signal multTermOne_uid42_fpLogETest_s : std_logic_vector (0 downto 0);
    signal multTermOne_uid42_fpLogETest_q : std_logic_vector (24 downto 0);
    signal postPEMul_uid43_fpLogETest_a : std_logic_vector (24 downto 0);
    signal postPEMul_uid43_fpLogETest_b : std_logic_vector (25 downto 0);
    signal postPEMul_uid43_fpLogETest_s1 : std_logic_vector (50 downto 0);
    signal postPEMul_uid43_fpLogETest_pr : SIGNED (50 downto 0);
    signal postPEMul_uid43_fpLogETest_q : std_logic_vector (50 downto 0);
    signal wideZero_uid44_fpLogETest_q : std_logic_vector (34 downto 0);
    signal addTermOne_uid45_fpLogETest_s : std_logic_vector (0 downto 0);
    signal addTermOne_uid45_fpLogETest_q : std_logic_vector (34 downto 0);
    signal finalSumOneComp_uid52_fpLogETest_a : std_logic_vector(56 downto 0);
    signal finalSumOneComp_uid52_fpLogETest_b : std_logic_vector(56 downto 0);
    signal finalSumOneComp_uid52_fpLogETest_q : std_logic_vector(56 downto 0);
    signal cstMSBFinalSumPBias_uid56_fpLogETest_q : std_logic_vector (8 downto 0);
    signal signRC1_uid73_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signRC1_uid73_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signRC1_uid73_fpLogETest_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid76_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid76_fpLogETest_q : std_logic_vector(0 downto 0);
    signal oneFracRPostExc2_uid80_fpLogETest_q : std_logic_vector (22 downto 0);
    signal p1_uid92_constMult_q : std_logic_vector(36 downto 0);
    signal p0_uid93_constMult_q : std_logic_vector(33 downto 0);
    signal zs_uid113_countZ_uid54_fpLogETest_q : std_logic_vector (31 downto 0);
    signal mO_uid116_countZ_uid54_fpLogETest_q : std_logic_vector (5 downto 0);
    signal zs_uid121_countZ_uid54_fpLogETest_q : std_logic_vector (15 downto 0);
    signal zs_uid133_countZ_uid54_fpLogETest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad48_uid157_normVal_uid55_fpLogETest_q : std_logic_vector (47 downto 0);
    signal leftShiftStage1Idx3Pad12_uid168_normVal_uid55_fpLogETest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage2Idx3Pad3_uid179_normVal_uid55_fpLogETest_q : std_logic_vector (2 downto 0);
    signal prodXY_uid185_pT1_uid101_natLogPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid185_pT1_uid101_natLogPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid185_pT1_uid101_natLogPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid185_pT1_uid101_natLogPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid185_pT1_uid101_natLogPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid188_pT2_uid107_natLogPolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid188_pT2_uid107_natLogPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid188_pT2_uid107_natLogPolyEval_s1 : std_logic_vector (37 downto 0);
    signal prodXY_uid188_pT2_uid107_natLogPolyEval_pr : SIGNED (38 downto 0);
    signal prodXY_uid188_pT2_uid107_natLogPolyEval_q : std_logic_vector (37 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid97_natLogTabGen_lutmem_ia : std_logic_vector (30 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_iq : std_logic_vector (30 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_q : std_logic_vector (30 downto 0);
    signal memoryC1_uid98_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid98_natLogTabGen_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid98_natLogTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC1_uid98_natLogTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC1_uid98_natLogTabGen_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid98_natLogTabGen_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid99_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid99_natLogTabGen_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid99_natLogTabGen_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC2_uid99_natLogTabGen_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC2_uid99_natLogTabGen_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid99_natLogTabGen_lutmem_q : std_logic_vector (12 downto 0);
    signal reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q : std_logic_vector (2 downto 0);
    signal reg_addr_uid34_fpLogETest_0_to_memoryC2_uid99_natLogTabGen_lutmem_0_q : std_logic_vector (8 downto 0);
    signal reg_yT1_uid100_natLogPolyEval_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid99_natLogTabGen_lutmem_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid102_uid105_natLogPolyEval_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_peOR_uid37_fpLogETest_0_to_postPEMul_uid43_fpLogETest_1_q : std_logic_vector (25 downto 0);
    signal reg_rVStage_uid114_countZ_uid54_fpLogETest_0_to_vCount_uid115_countZ_uid54_fpLogETest_1_q : std_logic_vector (31 downto 0);
    signal reg_cStage_uid118_countZ_uid54_fpLogETest_0_to_vStagei_uid120_countZ_uid54_fpLogETest_3_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid122_countZ_uid54_fpLogETest_0_to_vCount_uid123_countZ_uid54_fpLogETest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid124_countZ_uid54_fpLogETest_0_to_vStagei_uid126_countZ_uid54_fpLogETest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid134_countZ_uid54_fpLogETest_0_to_vCount_uid135_countZ_uid54_fpLogETest_1_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid136_countZ_uid54_fpLogETest_0_to_vStagei_uid138_countZ_uid54_fpLogETest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid129_countZ_uid54_fpLogETest_0_to_r_uid148_countZ_uid54_fpLogETest_3_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid161_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_2_q : std_logic_vector (57 downto 0);
    signal reg_leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_3_q : std_logic_vector (57 downto 0);
    signal reg_leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_4_q : std_logic_vector (57 downto 0);
    signal reg_leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_5_q : std_logic_vector (57 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid183_normVal_uid55_fpLogETest_1_q : std_logic_vector (1 downto 0);
    signal reg_r_uid148_countZ_uid54_fpLogETest_0_to_expRExt_uid57_fpLogETest_1_q : std_logic_vector (5 downto 0);
    signal reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0_q : std_logic_vector (33 downto 0);
    signal reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_q : std_logic_vector (22 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_addTermOne_uid45_fpLogETest_b_q : std_logic_vector (0 downto 0);
    signal ld_FullSumAB56_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b_q : std_logic_vector (0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_q : std_logic_vector (0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_q : std_logic_vector (0 downto 0);
    signal ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid123_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid115_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_f_q : std_logic_vector (0 downto 0);
    signal ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b_q : std_logic_vector (41 downto 0);
    signal ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b_q : std_logic_vector (25 downto 0);
    signal ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b_q : std_logic_vector (9 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_q : std_logic_vector (57 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a_q : std_logic_vector (8 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_outputreg_q : std_logic_vector (22 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_outputreg_q : std_logic_vector (24 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_ia : std_logic_vector (24 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_iq : std_logic_vector (24 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_q : std_logic_vector (24 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_eq : std_logic;
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b_inputreg_q : std_logic_vector (41 downto 0);
    signal ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b_inputreg_q : std_logic_vector (25 downto 0);
    signal ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b_inputreg_q : std_logic_vector (9 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_inputreg_q : std_logic_vector (57 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_outputreg_q : std_logic_vector (8 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a_outputreg_q : std_logic_vector (8 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_reset0 : std_logic;
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_eq : std_logic;
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_sticky_ena_q : signal is true;
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_sticky_ena_q : signal is true;
    signal pad_o_uid11_uid38_fpLogETest_q : std_logic_vector (23 downto 0);
    signal FPOne_uid63_fpLogETest_q : std_logic_vector (31 downto 0);
    signal expFracPostRnd_uid60_fpLogETest_a : std_logic_vector(34 downto 0);
    signal expFracPostRnd_uid60_fpLogETest_b : std_logic_vector(34 downto 0);
    signal expFracPostRnd_uid60_fpLogETest_o : std_logic_vector (34 downto 0);
    signal expFracPostRnd_uid60_fpLogETest_q : std_logic_vector (34 downto 0);
    signal notC_uid71_fpLogETest_a : std_logic_vector(0 downto 0);
    signal notC_uid71_fpLogETest_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal expX_uid6_fpLogETest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpLogETest_b : std_logic_vector (7 downto 0);
    signal signX_uid7_fpLogETest_in : std_logic_vector (31 downto 0);
    signal signX_uid7_fpLogETest_b : std_logic_vector (0 downto 0);
    signal frac_uid19_fpLogETest_in : std_logic_vector (22 downto 0);
    signal frac_uid19_fpLogETest_b : std_logic_vector (22 downto 0);
    signal excRZero_uid64_fpLogETest_a : std_logic_vector(31 downto 0);
    signal excRZero_uid64_fpLogETest_b : std_logic_vector(31 downto 0);
    signal excRZero_uid64_fpLogETest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid16_fpLogETest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid16_fpLogETest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid16_fpLogETest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid18_fpLogETest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid18_fpLogETest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid18_fpLogETest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid20_fpLogETest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid20_fpLogETest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid20_fpLogETest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid21_fpLogETest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid21_fpLogETest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid21_fpLogETest_q : std_logic_vector(0 downto 0);
    signal e_uid29_fpLogETest_a : std_logic_vector(8 downto 0);
    signal e_uid29_fpLogETest_b : std_logic_vector(8 downto 0);
    signal e_uid29_fpLogETest_o : std_logic_vector (8 downto 0);
    signal e_uid29_fpLogETest_q : std_logic_vector (8 downto 0);
    signal c_uid31_fpLogETest_a : std_logic_vector(7 downto 0);
    signal c_uid31_fpLogETest_b : std_logic_vector(7 downto 0);
    signal c_uid31_fpLogETest_q : std_logic_vector(0 downto 0);
    signal oMz_uid38_fpLogETest_a : std_logic_vector(24 downto 0);
    signal oMz_uid38_fpLogETest_b : std_logic_vector(24 downto 0);
    signal oMz_uid38_fpLogETest_o : std_logic_vector (24 downto 0);
    signal oMz_uid38_fpLogETest_q : std_logic_vector (24 downto 0);
    signal finalSumAbs_uid53_fpLogETest_a : std_logic_vector(57 downto 0);
    signal finalSumAbs_uid53_fpLogETest_b : std_logic_vector(57 downto 0);
    signal finalSumAbs_uid53_fpLogETest_o : std_logic_vector (57 downto 0);
    signal finalSumAbs_uid53_fpLogETest_q : std_logic_vector (57 downto 0);
    signal expRExt_uid57_fpLogETest_a : std_logic_vector(9 downto 0);
    signal expRExt_uid57_fpLogETest_b : std_logic_vector(9 downto 0);
    signal expRExt_uid57_fpLogETest_o : std_logic_vector (9 downto 0);
    signal expRExt_uid57_fpLogETest_q : std_logic_vector (9 downto 0);
    signal signRC11_uid74_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signRC11_uid74_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signRC11_uid74_fpLogETest_q : std_logic_vector(0 downto 0);
    signal signR_uid75_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signR_uid75_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signR_uid75_fpLogETest_q : std_logic_vector(0 downto 0);
    signal signRFull_uid77_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signRFull_uid77_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signRFull_uid77_fpLogETest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid79_fpLogETest_q : std_logic_vector(1 downto 0);
    signal lev1_a0_uid94_constMult_a : std_logic_vector(38 downto 0);
    signal lev1_a0_uid94_constMult_b : std_logic_vector(38 downto 0);
    signal lev1_a0_uid94_constMult_o : std_logic_vector (38 downto 0);
    signal lev1_a0_uid94_constMult_q : std_logic_vector (37 downto 0);
    signal vCount_uid115_countZ_uid54_fpLogETest_a : std_logic_vector(31 downto 0);
    signal vCount_uid115_countZ_uid54_fpLogETest_b : std_logic_vector(31 downto 0);
    signal vCount_uid115_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid120_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid120_countZ_uid54_fpLogETest_q : std_logic_vector (31 downto 0);
    signal vCount_uid123_countZ_uid54_fpLogETest_a : std_logic_vector(15 downto 0);
    signal vCount_uid123_countZ_uid54_fpLogETest_b : std_logic_vector(15 downto 0);
    signal vCount_uid123_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid126_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid126_countZ_uid54_fpLogETest_q : std_logic_vector (15 downto 0);
    signal vCount_uid135_countZ_uid54_fpLogETest_a : std_logic_vector(3 downto 0);
    signal vCount_uid135_countZ_uid54_fpLogETest_b : std_logic_vector(3 downto 0);
    signal vCount_uid135_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid138_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid138_countZ_uid54_fpLogETest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid172_normVal_uid55_fpLogETest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid172_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal sEz_uid41_fpLogETest_q : std_logic_vector (24 downto 0);
    signal lowRangeB_uid46_fpLogETest_in : std_logic_vector (20 downto 0);
    signal lowRangeB_uid46_fpLogETest_b : std_logic_vector (20 downto 0);
    signal highBBits_uid47_fpLogETest_in : std_logic_vector (50 downto 0);
    signal highBBits_uid47_fpLogETest_b : std_logic_vector (29 downto 0);
    signal sumAHighB_uid48_fpLogETest_a : std_logic_vector(35 downto 0);
    signal sumAHighB_uid48_fpLogETest_b : std_logic_vector(35 downto 0);
    signal sumAHighB_uid48_fpLogETest_o : std_logic_vector (35 downto 0);
    signal sumAHighB_uid48_fpLogETest_q : std_logic_vector (35 downto 0);
    signal leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal prodXYTruncFR_uid186_pT1_uid101_natLogPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid186_pT1_uid101_natLogPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid189_pT2_uid107_natLogPolyEval_in : std_logic_vector (37 downto 0);
    signal prodXYTruncFR_uid189_pT2_uid107_natLogPolyEval_b : std_logic_vector (23 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal zPPolyEval_uid35_fpLogETest_in : std_logic_vector (14 downto 0);
    signal zPPolyEval_uid35_fpLogETest_b : std_logic_vector (14 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal fracR_uid61_fpLogETest_in : std_logic_vector (23 downto 0);
    signal fracR_uid61_fpLogETest_b : std_logic_vector (22 downto 0);
    signal expR_uid62_fpLogETest_in : std_logic_vector (31 downto 0);
    signal expR_uid62_fpLogETest_b : std_logic_vector (7 downto 0);
    signal InvSignX_uid65_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid65_fpLogETest_q : std_logic_vector(0 downto 0);
    signal zAddrLow_uid33_fpLogETest_in : std_logic_vector (22 downto 0);
    signal zAddrLow_uid33_fpLogETest_b : std_logic_vector (7 downto 0);
    signal InvExpXIsZero_uid26_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid26_fpLogETest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid22_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid22_fpLogETest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid25_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid25_fpLogETest_q : std_logic_vector(0 downto 0);
    signal excRInfC1_uid66_fpLogETest_a : std_logic_vector(0 downto 0);
    signal excRInfC1_uid66_fpLogETest_b : std_logic_vector(0 downto 0);
    signal excRInfC1_uid66_fpLogETest_q : std_logic_vector(0 downto 0);
    signal xv0_uid90_constMult_in : std_logic_vector (5 downto 0);
    signal xv0_uid90_constMult_b : std_logic_vector (5 downto 0);
    signal xv1_uid91_constMult_in : std_logic_vector (8 downto 0);
    signal xv1_uid91_constMult_b : std_logic_vector (2 downto 0);
    signal addr_uid34_fpLogETest_q : std_logic_vector (8 downto 0);
    signal rVStage_uid114_countZ_uid54_fpLogETest_in : std_logic_vector (57 downto 0);
    signal rVStage_uid114_countZ_uid54_fpLogETest_b : std_logic_vector (31 downto 0);
    signal vStage_uid117_countZ_uid54_fpLogETest_in : std_logic_vector (25 downto 0);
    signal vStage_uid117_countZ_uid54_fpLogETest_b : std_logic_vector (25 downto 0);
    signal X41dto0_uid152_normVal_uid55_fpLogETest_in : std_logic_vector (41 downto 0);
    signal X41dto0_uid152_normVal_uid55_fpLogETest_b : std_logic_vector (41 downto 0);
    signal X9dto0_uid158_normVal_uid55_fpLogETest_in : std_logic_vector (9 downto 0);
    signal X9dto0_uid158_normVal_uid55_fpLogETest_b : std_logic_vector (9 downto 0);
    signal fracRPostExc_uid83_fpLogETest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid83_fpLogETest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid87_fpLogETest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid87_fpLogETest_q : std_logic_vector (7 downto 0);
    signal sR_uid95_constMult_in : std_logic_vector (36 downto 0);
    signal sR_uid95_constMult_b : std_logic_vector (34 downto 0);
    signal rVStage_uid122_countZ_uid54_fpLogETest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid122_countZ_uid54_fpLogETest_b : std_logic_vector (15 downto 0);
    signal vStage_uid124_countZ_uid54_fpLogETest_in : std_logic_vector (15 downto 0);
    signal vStage_uid124_countZ_uid54_fpLogETest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid128_countZ_uid54_fpLogETest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid128_countZ_uid54_fpLogETest_b : std_logic_vector (7 downto 0);
    signal vStage_uid130_countZ_uid54_fpLogETest_in : std_logic_vector (7 downto 0);
    signal vStage_uid130_countZ_uid54_fpLogETest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid140_countZ_uid54_fpLogETest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid140_countZ_uid54_fpLogETest_b : std_logic_vector (1 downto 0);
    signal vStage_uid142_countZ_uid54_fpLogETest_in : std_logic_vector (1 downto 0);
    signal vStage_uid142_countZ_uid54_fpLogETest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage156dto0_uid174_normVal_uid55_fpLogETest_in : std_logic_vector (56 downto 0);
    signal LeftShiftStage156dto0_uid174_normVal_uid55_fpLogETest_b : std_logic_vector (56 downto 0);
    signal LeftShiftStage155dto0_uid177_normVal_uid55_fpLogETest_in : std_logic_vector (55 downto 0);
    signal LeftShiftStage155dto0_uid177_normVal_uid55_fpLogETest_b : std_logic_vector (55 downto 0);
    signal LeftShiftStage154dto0_uid180_normVal_uid55_fpLogETest_in : std_logic_vector (54 downto 0);
    signal LeftShiftStage154dto0_uid180_normVal_uid55_fpLogETest_b : std_logic_vector (54 downto 0);
    signal finalSum_uid46_uid49_fpLogETest_q : std_logic_vector (56 downto 0);
    signal lowRangeB_uid102_natLogPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid102_natLogPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid103_natLogPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid103_natLogPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid108_natLogPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid108_natLogPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid109_natLogPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid109_natLogPolyEval_b : std_logic_vector (21 downto 0);
    signal yT1_uid100_natLogPolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid100_natLogPolyEval_b : std_logic_vector (12 downto 0);
    signal negNonZero_uid69_fpLogETest_a : std_logic_vector(0 downto 0);
    signal negNonZero_uid69_fpLogETest_b : std_logic_vector(0 downto 0);
    signal negNonZero_uid69_fpLogETest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid23_fpLogETest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid23_fpLogETest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid23_fpLogETest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid67_fpLogETest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid67_fpLogETest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid67_fpLogETest_q : std_logic_vector(0 downto 0);
    signal cStage_uid118_countZ_uid54_fpLogETest_q : std_logic_vector (31 downto 0);
    signal RLn_uid88_fpLogETest_q : std_logic_vector (31 downto 0);
    signal vCount_uid129_countZ_uid54_fpLogETest_a : std_logic_vector(7 downto 0);
    signal vCount_uid129_countZ_uid54_fpLogETest_b : std_logic_vector(7 downto 0);
    signal vCount_uid129_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid132_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid132_countZ_uid54_fpLogETest_q : std_logic_vector (7 downto 0);
    signal vCount_uid141_countZ_uid54_fpLogETest_a : std_logic_vector(1 downto 0);
    signal vCount_uid141_countZ_uid54_fpLogETest_b : std_logic_vector(1 downto 0);
    signal vCount_uid141_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid144_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid144_countZ_uid54_fpLogETest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2Idx1_uid175_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal leftShiftStage2Idx2_uid178_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal leftShiftStage2Idx3_uid181_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal FullSumAB56_uid50_fpLogETest_in : std_logic_vector (56 downto 0);
    signal FullSumAB56_uid50_fpLogETest_b : std_logic_vector (0 downto 0);
    signal sumAHighB_uid104_natLogPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid104_natLogPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid104_natLogPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid104_natLogPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid110_natLogPolyEval_a : std_logic_vector(31 downto 0);
    signal sumAHighB_uid110_natLogPolyEval_b : std_logic_vector(31 downto 0);
    signal sumAHighB_uid110_natLogPolyEval_o : std_logic_vector (31 downto 0);
    signal sumAHighB_uid110_natLogPolyEval_q : std_logic_vector (31 downto 0);
    signal excRNaN_uid70_fpLogETest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid70_fpLogETest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid70_fpLogETest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid24_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid24_fpLogETest_q : std_logic_vector(0 downto 0);
    signal concExc_uid78_fpLogETest_q : std_logic_vector (2 downto 0);
    signal rVStage_uid134_countZ_uid54_fpLogETest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid134_countZ_uid54_fpLogETest_b : std_logic_vector (3 downto 0);
    signal vStage_uid136_countZ_uid54_fpLogETest_in : std_logic_vector (3 downto 0);
    signal vStage_uid136_countZ_uid54_fpLogETest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid146_countZ_uid54_fpLogETest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid146_countZ_uid54_fpLogETest_b : std_logic_vector (0 downto 0);
    signal leftShiftStage2_uid183_normVal_uid55_fpLogETest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid183_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal signTerm2_uid72_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signTerm2_uid72_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signTerm2_uid72_fpLogETest_q : std_logic_vector(0 downto 0);
    signal s1_uid102_uid105_natLogPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid108_uid111_natLogPolyEval_q : std_logic_vector (33 downto 0);
    signal vCount_uid147_countZ_uid54_fpLogETest_a : std_logic_vector(0 downto 0);
    signal vCount_uid147_countZ_uid54_fpLogETest_b : std_logic_vector(0 downto 0);
    signal vCount_uid147_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal fracR_uid58_fpLogETest_in : std_logic_vector (56 downto 0);
    signal fracR_uid58_fpLogETest_b : std_logic_vector (23 downto 0);
    signal peOR_uid37_fpLogETest_in : std_logic_vector (32 downto 0);
    signal peOR_uid37_fpLogETest_b : std_logic_vector (25 downto 0);
    signal r_uid148_countZ_uid54_fpLogETest_q : std_logic_vector (5 downto 0);
    signal expFracConc_uid59_fpLogETest_q : std_logic_vector (33 downto 0);
    signal leftShiftStageSel5Dto4_uid160_normVal_uid55_fpLogETest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid160_normVal_uid55_fpLogETest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_b : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid161_normVal_uid55_fpLogETest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid161_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal LeftShiftStage053dto0_uid163_normVal_uid55_fpLogETest_in : std_logic_vector (53 downto 0);
    signal LeftShiftStage053dto0_uid163_normVal_uid55_fpLogETest_b : std_logic_vector (53 downto 0);
    signal LeftShiftStage049dto0_uid166_normVal_uid55_fpLogETest_in : std_logic_vector (49 downto 0);
    signal LeftShiftStage049dto0_uid166_normVal_uid55_fpLogETest_b : std_logic_vector (49 downto 0);
    signal LeftShiftStage045dto0_uid169_normVal_uid55_fpLogETest_in : std_logic_vector (45 downto 0);
    signal LeftShiftStage045dto0_uid169_normVal_uid55_fpLogETest_b : std_logic_vector (45 downto 0);
    signal leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
    signal leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_q : std_logic_vector (57 downto 0);
begin


	--xIn(GPIN,3)@0

	--cstBiasMO_uid10_fpLogETest(CONSTANT,9)
    cstBiasMO_uid10_fpLogETest_q <= "01111110";

	--expX_uid6_fpLogETest(BITSELECT,5)@0
    expX_uid6_fpLogETest_in <= a(30 downto 0);
    expX_uid6_fpLogETest_b <= expX_uid6_fpLogETest_in(30 downto 23);

	--c_uid31_fpLogETest(LOGICAL,30)@0
    c_uid31_fpLogETest_a <= expX_uid6_fpLogETest_b;
    c_uid31_fpLogETest_b <= cstBiasMO_uid10_fpLogETest_q;
    c_uid31_fpLogETest_q <= "1" when c_uid31_fpLogETest_a = c_uid31_fpLogETest_b else "0";

	--frac_uid19_fpLogETest(BITSELECT,18)@0
    frac_uid19_fpLogETest_in <= a(22 downto 0);
    frac_uid19_fpLogETest_b <= frac_uid19_fpLogETest_in(22 downto 0);

	--zAddrLow_uid33_fpLogETest(BITSELECT,32)@0
    zAddrLow_uid33_fpLogETest_in <= frac_uid19_fpLogETest_b;
    zAddrLow_uid33_fpLogETest_b <= zAddrLow_uid33_fpLogETest_in(22 downto 15);

	--addr_uid34_fpLogETest(BITJOIN,33)@0
    addr_uid34_fpLogETest_q <= c_uid31_fpLogETest_q & zAddrLow_uid33_fpLogETest_b;

	--reg_addr_uid34_fpLogETest_0_to_memoryC2_uid99_natLogTabGen_lutmem_0(REG,194)@0
    reg_addr_uid34_fpLogETest_0_to_memoryC2_uid99_natLogTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid34_fpLogETest_0_to_memoryC2_uid99_natLogTabGen_lutmem_0_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid34_fpLogETest_0_to_memoryC2_uid99_natLogTabGen_lutmem_0_q <= addr_uid34_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid99_natLogTabGen_lutmem(DUALMEM,192)@1
    memoryC2_uid99_natLogTabGen_lutmem_reset0 <= areset;
    memoryC2_uid99_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid99_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid99_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC2_uid99_natLogTabGen_lutmem_0_q;
    memoryC2_uid99_natLogTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_ln_s5_memoryC2_uid99_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid99_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid99_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid99_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid99_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid99_natLogTabGen_lutmem_ia
    );
        memoryC2_uid99_natLogTabGen_lutmem_q <= memoryC2_uid99_natLogTabGen_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid99_natLogTabGen_lutmem_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_1(REG,196)@3
    reg_memoryC2_uid99_natLogTabGen_lutmem_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid99_natLogTabGen_lutmem_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid99_natLogTabGen_lutmem_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_1_q <= memoryC2_uid99_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a(DELAY,244)@0
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => frac_uid19_fpLogETest_b, xout => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_outputreg(DELAY,451)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_q, xout => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--zPPolyEval_uid35_fpLogETest(BITSELECT,34)@3
    zPPolyEval_uid35_fpLogETest_in <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_outputreg_q(14 downto 0);
    zPPolyEval_uid35_fpLogETest_b <= zPPolyEval_uid35_fpLogETest_in(14 downto 0);

	--yT1_uid100_natLogPolyEval(BITSELECT,99)@3
    yT1_uid100_natLogPolyEval_in <= zPPolyEval_uid35_fpLogETest_b;
    yT1_uid100_natLogPolyEval_b <= yT1_uid100_natLogPolyEval_in(14 downto 2);

	--reg_yT1_uid100_natLogPolyEval_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_0(REG,195)@3
    reg_yT1_uid100_natLogPolyEval_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid100_natLogPolyEval_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid100_natLogPolyEval_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_0_q <= yT1_uid100_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid185_pT1_uid101_natLogPolyEval(MULT,184)@4
    prodXY_uid185_pT1_uid101_natLogPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid185_pT1_uid101_natLogPolyEval_a),14)) * SIGNED(prodXY_uid185_pT1_uid101_natLogPolyEval_b);
    prodXY_uid185_pT1_uid101_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid185_pT1_uid101_natLogPolyEval_a <= (others => '0');
            prodXY_uid185_pT1_uid101_natLogPolyEval_b <= (others => '0');
            prodXY_uid185_pT1_uid101_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid185_pT1_uid101_natLogPolyEval_a <= reg_yT1_uid100_natLogPolyEval_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_0_q;
                prodXY_uid185_pT1_uid101_natLogPolyEval_b <= reg_memoryC2_uid99_natLogTabGen_lutmem_0_to_prodXY_uid185_pT1_uid101_natLogPolyEval_1_q;
                prodXY_uid185_pT1_uid101_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid185_pT1_uid101_natLogPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid185_pT1_uid101_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid185_pT1_uid101_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid185_pT1_uid101_natLogPolyEval_q <= prodXY_uid185_pT1_uid101_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid186_pT1_uid101_natLogPolyEval(BITSELECT,185)@7
    prodXYTruncFR_uid186_pT1_uid101_natLogPolyEval_in <= prodXY_uid185_pT1_uid101_natLogPolyEval_q;
    prodXYTruncFR_uid186_pT1_uid101_natLogPolyEval_b <= prodXYTruncFR_uid186_pT1_uid101_natLogPolyEval_in(25 downto 12);

	--highBBits_uid103_natLogPolyEval(BITSELECT,102)@7
    highBBits_uid103_natLogPolyEval_in <= prodXYTruncFR_uid186_pT1_uid101_natLogPolyEval_b;
    highBBits_uid103_natLogPolyEval_b <= highBBits_uid103_natLogPolyEval_in(13 downto 1);

	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a(DELAY,409)@1
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 3 )
    PORT MAP ( xin => reg_addr_uid34_fpLogETest_0_to_memoryC2_uid99_natLogTabGen_lutmem_0_q, xout => ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a_outputreg(DELAY,482)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a_q, xout => ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid98_natLogTabGen_lutmem(DUALMEM,191)@5
    memoryC1_uid98_natLogTabGen_lutmem_reset0 <= areset;
    memoryC1_uid98_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid98_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid98_natLogTabGen_lutmem_ab <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC1_uid98_natLogTabGen_lutmem_0_q_to_memoryC1_uid98_natLogTabGen_lutmem_a_outputreg_q;
    memoryC1_uid98_natLogTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_ln_s5_memoryC1_uid98_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid98_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid98_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid98_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid98_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid98_natLogTabGen_lutmem_ia
    );
        memoryC1_uid98_natLogTabGen_lutmem_q <= memoryC1_uid98_natLogTabGen_lutmem_iq(20 downto 0);

	--sumAHighB_uid104_natLogPolyEval(ADD,103)@7
    sumAHighB_uid104_natLogPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid98_natLogTabGen_lutmem_q(20)) & memoryC1_uid98_natLogTabGen_lutmem_q);
    sumAHighB_uid104_natLogPolyEval_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid103_natLogPolyEval_b(12)) & highBBits_uid103_natLogPolyEval_b);
            sumAHighB_uid104_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid104_natLogPolyEval_a) + SIGNED(sumAHighB_uid104_natLogPolyEval_b));
    sumAHighB_uid104_natLogPolyEval_q <= sumAHighB_uid104_natLogPolyEval_o(21 downto 0);


	--lowRangeB_uid102_natLogPolyEval(BITSELECT,101)@7
    lowRangeB_uid102_natLogPolyEval_in <= prodXYTruncFR_uid186_pT1_uid101_natLogPolyEval_b(0 downto 0);
    lowRangeB_uid102_natLogPolyEval_b <= lowRangeB_uid102_natLogPolyEval_in(0 downto 0);

	--s1_uid102_uid105_natLogPolyEval(BITJOIN,104)@7
    s1_uid102_uid105_natLogPolyEval_q <= sumAHighB_uid104_natLogPolyEval_q & lowRangeB_uid102_natLogPolyEval_b;

	--reg_s1_uid102_uid105_natLogPolyEval_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_1(REG,199)@7
    reg_s1_uid102_uid105_natLogPolyEval_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid102_uid105_natLogPolyEval_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid102_uid105_natLogPolyEval_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_1_q <= s1_uid102_uid105_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable(LOGICAL,447)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_a <= en;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q <= not ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_a;

	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor(LOGICAL,504)
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_b <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_sticky_ena_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_q <= not (ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_a or ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_b);

	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_cmpReg(REG,502)
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_sticky_ena(REG,505)
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_nor_q = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_sticky_ena_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd(LOGICAL,506)
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_a <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_sticky_ena_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_b <= en;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_a and ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_b;

	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_inputreg(DELAY,496)
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => zPPolyEval_uid35_fpLogETest_b, xout => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt(COUNTER,498)
    -- every=1, low=0, high=1, step=1, init=1
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_i <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_i,1));


	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdreg(REG,499)
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdreg_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux(MUX,500)
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_s <= en;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux: PROCESS (ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_s, ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdreg_q, ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdreg_q;
                  WHEN "1" => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem(DUALMEM,497)
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_reset0 <= areset;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_ia <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_inputreg_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_aa <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdreg_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_ab <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_rdmux_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_ia
    );
        ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_iq(14 downto 0);

	--reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0(REG,198)@7
    reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid188_pT2_uid107_natLogPolyEval(MULT,187)@8
    prodXY_uid188_pT2_uid107_natLogPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid188_pT2_uid107_natLogPolyEval_a),16)) * SIGNED(prodXY_uid188_pT2_uid107_natLogPolyEval_b);
    prodXY_uid188_pT2_uid107_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid188_pT2_uid107_natLogPolyEval_a <= (others => '0');
            prodXY_uid188_pT2_uid107_natLogPolyEval_b <= (others => '0');
            prodXY_uid188_pT2_uid107_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid188_pT2_uid107_natLogPolyEval_a <= reg_zPPolyEval_uid35_fpLogETest_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_0_q;
                prodXY_uid188_pT2_uid107_natLogPolyEval_b <= reg_s1_uid102_uid105_natLogPolyEval_0_to_prodXY_uid188_pT2_uid107_natLogPolyEval_1_q;
                prodXY_uid188_pT2_uid107_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid188_pT2_uid107_natLogPolyEval_pr,38));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid188_pT2_uid107_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid188_pT2_uid107_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid188_pT2_uid107_natLogPolyEval_q <= prodXY_uid188_pT2_uid107_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid189_pT2_uid107_natLogPolyEval(BITSELECT,188)@11
    prodXYTruncFR_uid189_pT2_uid107_natLogPolyEval_in <= prodXY_uid188_pT2_uid107_natLogPolyEval_q;
    prodXYTruncFR_uid189_pT2_uid107_natLogPolyEval_b <= prodXYTruncFR_uid189_pT2_uid107_natLogPolyEval_in(37 downto 14);

	--highBBits_uid109_natLogPolyEval(BITSELECT,108)@11
    highBBits_uid109_natLogPolyEval_in <= prodXYTruncFR_uid189_pT2_uid107_natLogPolyEval_b;
    highBBits_uid109_natLogPolyEval_b <= highBBits_uid109_natLogPolyEval_in(23 downto 2);

	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor(LOGICAL,479)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_b <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_sticky_ena_q;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_q <= not (ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_a or ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_b);

	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_mem_top(CONSTANT,475)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_mem_top_q <= "0101";

	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp(LOGICAL,476)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_a <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_mem_top_q;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_q);
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_q <= "1" when ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_a = ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_b else "0";

	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmpReg(REG,477)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmpReg_q <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_sticky_ena(REG,480)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_sticky_ena_q <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd(LOGICAL,481)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_a <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_sticky_ena_q;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_q <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_a and ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_b;

	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt(COUNTER,471)
    -- every=1, low=0, high=5, step=1, init=1
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_i = 4 THEN
                      ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_i <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_i - 5;
                    ELSE
                        ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_i <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_i,3));


	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdreg(REG,472)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdreg_q <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux(MUX,473)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_s <= en;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux: PROCESS (ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_s, ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdreg_q, ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_q <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_q <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem(DUALMEM,470)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_reset0 <= areset;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_ia <= reg_addr_uid34_fpLogETest_0_to_memoryC2_uid99_natLogTabGen_lutmem_0_q;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_aa <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdreg_q;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_ab <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_rdmux_q;
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 9,
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
        clocken1 => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_ia
    );
        ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_q <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_iq(8 downto 0);

	--ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_outputreg(DELAY,469)
    ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_outputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_replace_mem_q, xout => ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC0_uid97_natLogTabGen_lutmem(DUALMEM,190)@9
    memoryC0_uid97_natLogTabGen_lutmem_reset0 <= areset;
    memoryC0_uid97_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid97_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid97_natLogTabGen_lutmem_ab <= ld_reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q_to_memoryC0_uid97_natLogTabGen_lutmem_a_outputreg_q;
    memoryC0_uid97_natLogTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_ln_s5_memoryC0_uid97_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid97_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid97_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid97_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid97_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid97_natLogTabGen_lutmem_ia
    );
        memoryC0_uid97_natLogTabGen_lutmem_q <= memoryC0_uid97_natLogTabGen_lutmem_iq(30 downto 0);

	--sumAHighB_uid110_natLogPolyEval(ADD,109)@11
    sumAHighB_uid110_natLogPolyEval_a <= STD_LOGIC_VECTOR((31 downto 31 => memoryC0_uid97_natLogTabGen_lutmem_q(30)) & memoryC0_uid97_natLogTabGen_lutmem_q);
    sumAHighB_uid110_natLogPolyEval_b <= STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid109_natLogPolyEval_b(21)) & highBBits_uid109_natLogPolyEval_b);
            sumAHighB_uid110_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid110_natLogPolyEval_a) + SIGNED(sumAHighB_uid110_natLogPolyEval_b));
    sumAHighB_uid110_natLogPolyEval_q <= sumAHighB_uid110_natLogPolyEval_o(31 downto 0);


	--lowRangeB_uid108_natLogPolyEval(BITSELECT,107)@11
    lowRangeB_uid108_natLogPolyEval_in <= prodXYTruncFR_uid189_pT2_uid107_natLogPolyEval_b(1 downto 0);
    lowRangeB_uid108_natLogPolyEval_b <= lowRangeB_uid108_natLogPolyEval_in(1 downto 0);

	--s2_uid108_uid111_natLogPolyEval(BITJOIN,110)@11
    s2_uid108_uid111_natLogPolyEval_q <= sumAHighB_uid110_natLogPolyEval_q & lowRangeB_uid108_natLogPolyEval_b;

	--peOR_uid37_fpLogETest(BITSELECT,36)@11
    peOR_uid37_fpLogETest_in <= s2_uid108_uid111_natLogPolyEval_q(32 downto 0);
    peOR_uid37_fpLogETest_b <= peOR_uid37_fpLogETest_in(32 downto 7);

	--reg_peOR_uid37_fpLogETest_0_to_postPEMul_uid43_fpLogETest_1(REG,201)@11
    reg_peOR_uid37_fpLogETest_0_to_postPEMul_uid43_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_peOR_uid37_fpLogETest_0_to_postPEMul_uid43_fpLogETest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_peOR_uid37_fpLogETest_0_to_postPEMul_uid43_fpLogETest_1_q <= peOR_uid37_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor(LOGICAL,462)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_b <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_sticky_ena_q;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_q <= not (ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_a or ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_b);

	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_mem_top(CONSTANT,458)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_mem_top_q <= "01000";

	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp(LOGICAL,459)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_a <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_mem_top_q;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_q);
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_q <= "1" when ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_a = ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_b else "0";

	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmpReg(REG,460)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmpReg_q <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_sticky_ena(REG,463)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_nor_q = "1") THEN
                ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_sticky_ena_q <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd(LOGICAL,464)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_a <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_sticky_ena_q;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_b <= en;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_q <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_a and ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_b;

	--GND(CONSTANT,0)
    GND_q <= "0";

	--pad_o_uid11_uid38_fpLogETest(BITJOIN,37)@0
    pad_o_uid11_uid38_fpLogETest_q <= VCC_q & STD_LOGIC_VECTOR((22 downto 1 => GND_q(0)) & GND_q);

	--oMz_uid38_fpLogETest(SUB,38)@0
    oMz_uid38_fpLogETest_a <= STD_LOGIC_VECTOR("0" & pad_o_uid11_uid38_fpLogETest_q);
    oMz_uid38_fpLogETest_b <= STD_LOGIC_VECTOR("00" & frac_uid19_fpLogETest_b);
            oMz_uid38_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMz_uid38_fpLogETest_a) - UNSIGNED(oMz_uid38_fpLogETest_b));
    oMz_uid38_fpLogETest_q <= oMz_uid38_fpLogETest_o(24 downto 0);


	--z2_uid40_fpLogETest(CONSTANT,39)
    z2_uid40_fpLogETest_q <= "00";

	--sEz_uid41_fpLogETest(BITJOIN,40)@0
    sEz_uid41_fpLogETest_q <= z2_uid40_fpLogETest_q & frac_uid19_fpLogETest_b;

	--multTermOne_uid42_fpLogETest(MUX,41)@0
    multTermOne_uid42_fpLogETest_s <= c_uid31_fpLogETest_q;
    multTermOne_uid42_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multTermOne_uid42_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE multTermOne_uid42_fpLogETest_s IS
                      WHEN "0" => multTermOne_uid42_fpLogETest_q <= sEz_uid41_fpLogETest_q;
                      WHEN "1" => multTermOne_uid42_fpLogETest_q <= oMz_uid38_fpLogETest_q;
                      WHEN OTHERS => multTermOne_uid42_fpLogETest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt(COUNTER,454)
    -- every=1, low=0, high=8, step=1, init=1
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_i = 7 THEN
                      ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_eq = '1') THEN
                        ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_i <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_i - 8;
                    ELSE
                        ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_i <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_i,4));


	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdreg(REG,455)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdreg_q <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux(MUX,456)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_s <= en;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux: PROCESS (ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_s, ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdreg_q, ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_q <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdreg_q;
                  WHEN "1" => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_q <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem(DUALMEM,453)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_reset0 <= areset;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_ia <= multTermOne_uid42_fpLogETest_q;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_aa <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdreg_q;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_ab <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_rdmux_q;
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_iq,
        address_a => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_aa,
        data_a => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_ia
    );
        ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_q <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_iq(24 downto 0);

	--ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_outputreg(DELAY,452)
    ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_outputreg : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_replace_mem_q, xout => ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--postPEMul_uid43_fpLogETest(MULT,42)@12
    postPEMul_uid43_fpLogETest_pr <= SIGNED(postPEMul_uid43_fpLogETest_a) * SIGNED(postPEMul_uid43_fpLogETest_b);
    postPEMul_uid43_fpLogETest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a <= (others => '0');
            postPEMul_uid43_fpLogETest_b <= (others => '0');
            postPEMul_uid43_fpLogETest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a <= ld_multTermOne_uid42_fpLogETest_q_to_postPEMul_uid43_fpLogETest_a_outputreg_q;
                postPEMul_uid43_fpLogETest_b <= reg_peOR_uid37_fpLogETest_0_to_postPEMul_uid43_fpLogETest_1_q;
                postPEMul_uid43_fpLogETest_s1 <= STD_LOGIC_VECTOR(postPEMul_uid43_fpLogETest_pr);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid43_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_q <= postPEMul_uid43_fpLogETest_s1;
            END IF;
        END IF;
    END PROCESS;

	--highBBits_uid47_fpLogETest(BITSELECT,46)@15
    highBBits_uid47_fpLogETest_in <= postPEMul_uid43_fpLogETest_q;
    highBBits_uid47_fpLogETest_b <= highBBits_uid47_fpLogETest_in(50 downto 21);

	--wideZero_uid44_fpLogETest(CONSTANT,43)
    wideZero_uid44_fpLogETest_q <= "00000000000000000000000000000000000";

	--cstBias_uid9_fpLogETest(CONSTANT,8)
    cstBias_uid9_fpLogETest_q <= "01111111";

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor(LOGICAL,448)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_b <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_q <= not (ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_a or ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_b);

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_mem_top(CONSTANT,444)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_mem_top_q <= "01011";

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp(LOGICAL,445)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_mem_top_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q);
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_q <= "1" when ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_a = ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_b else "0";

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmpReg(REG,446)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmpReg_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena(REG,449)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_q = "1") THEN
                ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd(LOGICAL,450)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_b <= en;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_a and ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_b;

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt(COUNTER,440)
    -- every=1, low=0, high=11, step=1, init=1
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i = 10 THEN
                      ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i - 11;
                    ELSE
                        ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i,4));


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg(REG,441)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux(MUX,442)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_s <= en;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux: PROCESS (ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_s, ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q, ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem(DUALMEM,439)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_reset0 <= areset;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ia <= expX_uid6_fpLogETest_b;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_aa <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ab <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_iq,
        address_a => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_aa,
        data_a => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ia
    );
        ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_iq(7 downto 0);

	--e_uid29_fpLogETest(SUB,28)@13
    e_uid29_fpLogETest_a <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_q);
    e_uid29_fpLogETest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid9_fpLogETest_q);
            e_uid29_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(e_uid29_fpLogETest_a) - UNSIGNED(e_uid29_fpLogETest_b));
    e_uid29_fpLogETest_q <= e_uid29_fpLogETest_o(8 downto 0);


	--xv0_uid90_constMult(BITSELECT,89)@13
    xv0_uid90_constMult_in <= e_uid29_fpLogETest_q(5 downto 0);
    xv0_uid90_constMult_b <= xv0_uid90_constMult_in(5 downto 0);

	--p0_uid93_constMult(LOOKUP,92)@13
    p0_uid93_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p0_uid93_constMult_q <= "0000000000000000000000000000000000";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (xv0_uid90_constMult_b) IS
                WHEN "000000" =>  p0_uid93_constMult_q <= "0000000000000000000000000000000000";
                WHEN "000001" =>  p0_uid93_constMult_q <= "0000001011000101110010000110000000";
                WHEN "000010" =>  p0_uid93_constMult_q <= "0000010110001011100100001100000000";
                WHEN "000011" =>  p0_uid93_constMult_q <= "0000100001010001010110010010000000";
                WHEN "000100" =>  p0_uid93_constMult_q <= "0000101100010111001000011000000000";
                WHEN "000101" =>  p0_uid93_constMult_q <= "0000110111011100111010011110000000";
                WHEN "000110" =>  p0_uid93_constMult_q <= "0001000010100010101100100100000000";
                WHEN "000111" =>  p0_uid93_constMult_q <= "0001001101101000011110101010000000";
                WHEN "001000" =>  p0_uid93_constMult_q <= "0001011000101110010000110000000000";
                WHEN "001001" =>  p0_uid93_constMult_q <= "0001100011110100000010110110000000";
                WHEN "001010" =>  p0_uid93_constMult_q <= "0001101110111001110100111100000000";
                WHEN "001011" =>  p0_uid93_constMult_q <= "0001111001111111100111000010000000";
                WHEN "001100" =>  p0_uid93_constMult_q <= "0010000101000101011001001000000000";
                WHEN "001101" =>  p0_uid93_constMult_q <= "0010010000001011001011001110000000";
                WHEN "001110" =>  p0_uid93_constMult_q <= "0010011011010000111101010100000000";
                WHEN "001111" =>  p0_uid93_constMult_q <= "0010100110010110101111011010000000";
                WHEN "010000" =>  p0_uid93_constMult_q <= "0010110001011100100001100000000000";
                WHEN "010001" =>  p0_uid93_constMult_q <= "0010111100100010010011100110000000";
                WHEN "010010" =>  p0_uid93_constMult_q <= "0011000111101000000101101100000000";
                WHEN "010011" =>  p0_uid93_constMult_q <= "0011010010101101110111110010000000";
                WHEN "010100" =>  p0_uid93_constMult_q <= "0011011101110011101001111000000000";
                WHEN "010101" =>  p0_uid93_constMult_q <= "0011101000111001011011111110000000";
                WHEN "010110" =>  p0_uid93_constMult_q <= "0011110011111111001110000100000000";
                WHEN "010111" =>  p0_uid93_constMult_q <= "0011111111000101000000001010000000";
                WHEN "011000" =>  p0_uid93_constMult_q <= "0100001010001010110010010000000000";
                WHEN "011001" =>  p0_uid93_constMult_q <= "0100010101010000100100010110000000";
                WHEN "011010" =>  p0_uid93_constMult_q <= "0100100000010110010110011100000000";
                WHEN "011011" =>  p0_uid93_constMult_q <= "0100101011011100001000100010000000";
                WHEN "011100" =>  p0_uid93_constMult_q <= "0100110110100001111010101000000000";
                WHEN "011101" =>  p0_uid93_constMult_q <= "0101000001100111101100101110000000";
                WHEN "011110" =>  p0_uid93_constMult_q <= "0101001100101101011110110100000000";
                WHEN "011111" =>  p0_uid93_constMult_q <= "0101010111110011010000111010000000";
                WHEN "100000" =>  p0_uid93_constMult_q <= "0101100010111001000011000000000000";
                WHEN "100001" =>  p0_uid93_constMult_q <= "0101101101111110110101000110000000";
                WHEN "100010" =>  p0_uid93_constMult_q <= "0101111001000100100111001100000000";
                WHEN "100011" =>  p0_uid93_constMult_q <= "0110000100001010011001010010000000";
                WHEN "100100" =>  p0_uid93_constMult_q <= "0110001111010000001011011000000000";
                WHEN "100101" =>  p0_uid93_constMult_q <= "0110011010010101111101011110000000";
                WHEN "100110" =>  p0_uid93_constMult_q <= "0110100101011011101111100100000000";
                WHEN "100111" =>  p0_uid93_constMult_q <= "0110110000100001100001101010000000";
                WHEN "101000" =>  p0_uid93_constMult_q <= "0110111011100111010011110000000000";
                WHEN "101001" =>  p0_uid93_constMult_q <= "0111000110101101000101110110000000";
                WHEN "101010" =>  p0_uid93_constMult_q <= "0111010001110010110111111100000000";
                WHEN "101011" =>  p0_uid93_constMult_q <= "0111011100111000101010000010000000";
                WHEN "101100" =>  p0_uid93_constMult_q <= "0111100111111110011100001000000000";
                WHEN "101101" =>  p0_uid93_constMult_q <= "0111110011000100001110001110000000";
                WHEN "101110" =>  p0_uid93_constMult_q <= "0111111110001010000000010100000000";
                WHEN "101111" =>  p0_uid93_constMult_q <= "1000001001001111110010011010000000";
                WHEN "110000" =>  p0_uid93_constMult_q <= "1000010100010101100100100000000000";
                WHEN "110001" =>  p0_uid93_constMult_q <= "1000011111011011010110100110000000";
                WHEN "110010" =>  p0_uid93_constMult_q <= "1000101010100001001000101100000000";
                WHEN "110011" =>  p0_uid93_constMult_q <= "1000110101100110111010110010000000";
                WHEN "110100" =>  p0_uid93_constMult_q <= "1001000000101100101100111000000000";
                WHEN "110101" =>  p0_uid93_constMult_q <= "1001001011110010011110111110000000";
                WHEN "110110" =>  p0_uid93_constMult_q <= "1001010110111000010001000100000000";
                WHEN "110111" =>  p0_uid93_constMult_q <= "1001100001111110000011001010000000";
                WHEN "111000" =>  p0_uid93_constMult_q <= "1001101101000011110101010000000000";
                WHEN "111001" =>  p0_uid93_constMult_q <= "1001111000001001100111010110000000";
                WHEN "111010" =>  p0_uid93_constMult_q <= "1010000011001111011001011100000000";
                WHEN "111011" =>  p0_uid93_constMult_q <= "1010001110010101001011100010000000";
                WHEN "111100" =>  p0_uid93_constMult_q <= "1010011001011010111101101000000000";
                WHEN "111101" =>  p0_uid93_constMult_q <= "1010100100100000101111101110000000";
                WHEN "111110" =>  p0_uid93_constMult_q <= "1010101111100110100001110100000000";
                WHEN "111111" =>  p0_uid93_constMult_q <= "1010111010101100010011111010000000";
                WHEN OTHERS =>
                    p0_uid93_constMult_q <= "0000000000000000000000000000000000";
            END CASE;
        END IF;
    END PROCESS;


	--xv1_uid91_constMult(BITSELECT,90)@13
    xv1_uid91_constMult_in <= e_uid29_fpLogETest_q;
    xv1_uid91_constMult_b <= xv1_uid91_constMult_in(8 downto 6);

	--p1_uid92_constMult(LOOKUP,91)@13
    p1_uid92_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p1_uid92_constMult_q <= "0000000000000000000000000000000000000";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (xv1_uid91_constMult_b) IS
                WHEN "000" =>  p1_uid92_constMult_q <= "0000000000000000000000000000000000000";
                WHEN "001" =>  p1_uid92_constMult_q <= "0001011000101110010000110000000000000";
                WHEN "010" =>  p1_uid92_constMult_q <= "0010110001011100100001100000000000000";
                WHEN "011" =>  p1_uid92_constMult_q <= "0100001010001010110010010000000000000";
                WHEN "100" =>  p1_uid92_constMult_q <= "1010011101000110111101000000000000000";
                WHEN "101" =>  p1_uid92_constMult_q <= "1011110101110101001101110000000000000";
                WHEN "110" =>  p1_uid92_constMult_q <= "1101001110100011011110100000000000000";
                WHEN "111" =>  p1_uid92_constMult_q <= "1110100111010001101111010000000000000";
                WHEN OTHERS =>
                    p1_uid92_constMult_q <= "0000000000000000000000000000000000000";
            END CASE;
        END IF;
    END PROCESS;


	--lev1_a0_uid94_constMult(ADD,93)@14
    lev1_a0_uid94_constMult_a <= STD_LOGIC_VECTOR((38 downto 37 => p1_uid92_constMult_q(36)) & p1_uid92_constMult_q);
    lev1_a0_uid94_constMult_b <= STD_LOGIC_VECTOR('0' & "0000" & p0_uid93_constMult_q);
            lev1_a0_uid94_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid94_constMult_a) + SIGNED(lev1_a0_uid94_constMult_b));
    lev1_a0_uid94_constMult_q <= lev1_a0_uid94_constMult_o(37 downto 0);


	--sR_uid95_constMult(BITSELECT,94)@14
    sR_uid95_constMult_in <= lev1_a0_uid94_constMult_q(36 downto 0);
    sR_uid95_constMult_b <= sR_uid95_constMult_in(36 downto 2);

	--ld_c_uid31_fpLogETest_q_to_addTermOne_uid45_fpLogETest_b(DELAY,254)@0
    ld_c_uid31_fpLogETest_q_to_addTermOne_uid45_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => c_uid31_fpLogETest_q, xout => ld_c_uid31_fpLogETest_q_to_addTermOne_uid45_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--addTermOne_uid45_fpLogETest(MUX,44)@14
    addTermOne_uid45_fpLogETest_s <= ld_c_uid31_fpLogETest_q_to_addTermOne_uid45_fpLogETest_b_q;
    addTermOne_uid45_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            addTermOne_uid45_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE addTermOne_uid45_fpLogETest_s IS
                      WHEN "0" => addTermOne_uid45_fpLogETest_q <= sR_uid95_constMult_b;
                      WHEN "1" => addTermOne_uid45_fpLogETest_q <= wideZero_uid44_fpLogETest_q;
                      WHEN OTHERS => addTermOne_uid45_fpLogETest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid48_fpLogETest(ADD,47)@15
    sumAHighB_uid48_fpLogETest_a <= STD_LOGIC_VECTOR((35 downto 35 => addTermOne_uid45_fpLogETest_q(34)) & addTermOne_uid45_fpLogETest_q);
    sumAHighB_uid48_fpLogETest_b <= STD_LOGIC_VECTOR((35 downto 30 => highBBits_uid47_fpLogETest_b(29)) & highBBits_uid47_fpLogETest_b);
            sumAHighB_uid48_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid48_fpLogETest_a) + SIGNED(sumAHighB_uid48_fpLogETest_b));
    sumAHighB_uid48_fpLogETest_q <= sumAHighB_uid48_fpLogETest_o(35 downto 0);


	--lowRangeB_uid46_fpLogETest(BITSELECT,45)@15
    lowRangeB_uid46_fpLogETest_in <= postPEMul_uid43_fpLogETest_q(20 downto 0);
    lowRangeB_uid46_fpLogETest_b <= lowRangeB_uid46_fpLogETest_in(20 downto 0);

	--finalSum_uid46_uid49_fpLogETest(BITJOIN,48)@15
    finalSum_uid46_uid49_fpLogETest_q <= sumAHighB_uid48_fpLogETest_q & lowRangeB_uid46_fpLogETest_b;

	--FullSumAB56_uid50_fpLogETest(BITSELECT,49)@15
    FullSumAB56_uid50_fpLogETest_in <= finalSum_uid46_uid49_fpLogETest_q;
    FullSumAB56_uid50_fpLogETest_b <= FullSumAB56_uid50_fpLogETest_in(56 downto 56);

	--notC_uid71_fpLogETest(LOGICAL,70)@15
    notC_uid71_fpLogETest_a <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_q;
    notC_uid71_fpLogETest_q <= not notC_uid71_fpLogETest_a;

	--signTerm2_uid72_fpLogETest(LOGICAL,71)@15
    signTerm2_uid72_fpLogETest_a <= notC_uid71_fpLogETest_q;
    signTerm2_uid72_fpLogETest_b <= FullSumAB56_uid50_fpLogETest_b;
    signTerm2_uid72_fpLogETest_q <= signTerm2_uid72_fpLogETest_a and signTerm2_uid72_fpLogETest_b;

	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a(DELAY,285)@0
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => c_uid31_fpLogETest_q, xout => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signRC1_uid73_fpLogETest(LOGICAL,72)@15
    signRC1_uid73_fpLogETest_a <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_q;
    signRC1_uid73_fpLogETest_b <= signTerm2_uid72_fpLogETest_q;
    signRC1_uid73_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signRC1_uid73_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signRC1_uid73_fpLogETest_q <= signRC1_uid73_fpLogETest_a or signRC1_uid73_fpLogETest_b;
        END IF;
    END PROCESS;



	--cstAllZWF_uid8_fpLogETest(CONSTANT,7)
    cstAllZWF_uid8_fpLogETest_q <= "00000000000000000000000";

	--fracXIsZero_uid20_fpLogETest(LOGICAL,19)@0
    fracXIsZero_uid20_fpLogETest_a <= frac_uid19_fpLogETest_b;
    fracXIsZero_uid20_fpLogETest_b <= cstAllZWF_uid8_fpLogETest_q;
    fracXIsZero_uid20_fpLogETest_q <= "1" when fracXIsZero_uid20_fpLogETest_a = fracXIsZero_uid20_fpLogETest_b else "0";

	--InvFracXIsZero_uid22_fpLogETest(LOGICAL,21)@0
    InvFracXIsZero_uid22_fpLogETest_a <= fracXIsZero_uid20_fpLogETest_q;
    InvFracXIsZero_uid22_fpLogETest_q <= not InvFracXIsZero_uid22_fpLogETest_a;

	--cstAllOWE_uid12_fpLogETest(CONSTANT,11)
    cstAllOWE_uid12_fpLogETest_q <= "11111111";

	--expXIsMax_uid18_fpLogETest(LOGICAL,17)@0
    expXIsMax_uid18_fpLogETest_a <= expX_uid6_fpLogETest_b;
    expXIsMax_uid18_fpLogETest_b <= cstAllOWE_uid12_fpLogETest_q;
    expXIsMax_uid18_fpLogETest_q <= "1" when expXIsMax_uid18_fpLogETest_a = expXIsMax_uid18_fpLogETest_b else "0";

	--exc_N_uid23_fpLogETest(LOGICAL,22)@0
    exc_N_uid23_fpLogETest_a <= expXIsMax_uid18_fpLogETest_q;
    exc_N_uid23_fpLogETest_b <= InvFracXIsZero_uid22_fpLogETest_q;
    exc_N_uid23_fpLogETest_q <= exc_N_uid23_fpLogETest_a and exc_N_uid23_fpLogETest_b;

	--InvExc_N_uid24_fpLogETest(LOGICAL,23)@0
    InvExc_N_uid24_fpLogETest_a <= exc_N_uid23_fpLogETest_q;
    InvExc_N_uid24_fpLogETest_q <= not InvExc_N_uid24_fpLogETest_a;

	--exc_I_uid21_fpLogETest(LOGICAL,20)@0
    exc_I_uid21_fpLogETest_a <= expXIsMax_uid18_fpLogETest_q;
    exc_I_uid21_fpLogETest_b <= fracXIsZero_uid20_fpLogETest_q;
    exc_I_uid21_fpLogETest_q <= exc_I_uid21_fpLogETest_a and exc_I_uid21_fpLogETest_b;

	--InvExc_I_uid25_fpLogETest(LOGICAL,24)@0
    InvExc_I_uid25_fpLogETest_a <= exc_I_uid21_fpLogETest_q;
    InvExc_I_uid25_fpLogETest_q <= not InvExc_I_uid25_fpLogETest_a;

	--cstAllZWE_uid14_fpLogETest(CONSTANT,13)
    cstAllZWE_uid14_fpLogETest_q <= "00000000";

	--expXIsZero_uid16_fpLogETest(LOGICAL,15)@0
    expXIsZero_uid16_fpLogETest_a <= expX_uid6_fpLogETest_b;
    expXIsZero_uid16_fpLogETest_b <= cstAllZWE_uid14_fpLogETest_q;
    expXIsZero_uid16_fpLogETest_q <= "1" when expXIsZero_uid16_fpLogETest_a = expXIsZero_uid16_fpLogETest_b else "0";

	--InvExpXIsZero_uid26_fpLogETest(LOGICAL,25)@0
    InvExpXIsZero_uid26_fpLogETest_a <= expXIsZero_uid16_fpLogETest_q;
    InvExpXIsZero_uid26_fpLogETest_q <= not InvExpXIsZero_uid26_fpLogETest_a;

	--exc_R_uid27_fpLogETest(LOGICAL,26)@0
    exc_R_uid27_fpLogETest_a <= InvExpXIsZero_uid26_fpLogETest_q;
    exc_R_uid27_fpLogETest_b <= InvExc_I_uid25_fpLogETest_q;
    exc_R_uid27_fpLogETest_c <= InvExc_N_uid24_fpLogETest_q;
    exc_R_uid27_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            exc_R_uid27_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            exc_R_uid27_fpLogETest_q <= exc_R_uid27_fpLogETest_a and exc_R_uid27_fpLogETest_b and exc_R_uid27_fpLogETest_c;
        END IF;
    END PROCESS;



	--ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a(DELAY,290)@1
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => exc_R_uid27_fpLogETest_q, xout => ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signRC11_uid74_fpLogETest(LOGICAL,73)@16
    signRC11_uid74_fpLogETest_a <= ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_q;
    signRC11_uid74_fpLogETest_b <= signRC1_uid73_fpLogETest_q;
    signRC11_uid74_fpLogETest_q <= signRC11_uid74_fpLogETest_a and signRC11_uid74_fpLogETest_b;

	--reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1(REG,220)@0
    reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q <= expXIsZero_uid16_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a(DELAY,292)@1
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q, xout => ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid75_fpLogETest(LOGICAL,74)@16
    signR_uid75_fpLogETest_a <= ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_q;
    signR_uid75_fpLogETest_b <= signRC11_uid74_fpLogETest_q;
    signR_uid75_fpLogETest_q <= signR_uid75_fpLogETest_a or signR_uid75_fpLogETest_b;

	--signX_uid7_fpLogETest(BITSELECT,6)@0
    signX_uid7_fpLogETest_in <= a;
    signX_uid7_fpLogETest_b <= signX_uid7_fpLogETest_in(31 downto 31);

	--negNonZero_uid69_fpLogETest(LOGICAL,68)@0
    negNonZero_uid69_fpLogETest_a <= InvExpXIsZero_uid26_fpLogETest_q;
    negNonZero_uid69_fpLogETest_b <= signX_uid7_fpLogETest_b;
    negNonZero_uid69_fpLogETest_q <= negNonZero_uid69_fpLogETest_a and negNonZero_uid69_fpLogETest_b;

	--excRNaN_uid70_fpLogETest(LOGICAL,69)@0
    excRNaN_uid70_fpLogETest_a <= negNonZero_uid69_fpLogETest_q;
    excRNaN_uid70_fpLogETest_b <= exc_N_uid23_fpLogETest_q;
    excRNaN_uid70_fpLogETest_q <= excRNaN_uid70_fpLogETest_a or excRNaN_uid70_fpLogETest_b;

	--ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a(DELAY,294)@0
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => excRNaN_uid70_fpLogETest_q, xout => ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvExcRNaN_uid76_fpLogETest(LOGICAL,75)@15
    InvExcRNaN_uid76_fpLogETest_a <= ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_q;
    InvExcRNaN_uid76_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExcRNaN_uid76_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExcRNaN_uid76_fpLogETest_q <= not InvExcRNaN_uid76_fpLogETest_a;
        END IF;
    END PROCESS;



	--signRFull_uid77_fpLogETest(LOGICAL,76)@16
    signRFull_uid77_fpLogETest_a <= InvExcRNaN_uid76_fpLogETest_q;
    signRFull_uid77_fpLogETest_b <= signR_uid75_fpLogETest_q;
    signRFull_uid77_fpLogETest_q <= signRFull_uid77_fpLogETest_a and signRFull_uid77_fpLogETest_b;

	--ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c(DELAY,307)@16
    ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => signRFull_uid77_fpLogETest_q, xout => ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c_q, ena => en(0), clk => clk, aclr => areset );

	--zs_uid113_countZ_uid54_fpLogETest(CONSTANT,112)
    zs_uid113_countZ_uid54_fpLogETest_q <= "00000000000000000000000000000000";

	--ld_FullSumAB56_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b(DELAY,266)@15
    ld_FullSumAB56_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => FullSumAB56_uid50_fpLogETest_b, xout => ld_FullSumAB56_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalSumOneComp_uid52_fpLogETest(LOGICAL,51)@15
    finalSumOneComp_uid52_fpLogETest_a <= finalSum_uid46_uid49_fpLogETest_q;
    finalSumOneComp_uid52_fpLogETest_b <= STD_LOGIC_VECTOR((56 downto 1 => FullSumAB56_uid50_fpLogETest_b(0)) & FullSumAB56_uid50_fpLogETest_b);
    finalSumOneComp_uid52_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            finalSumOneComp_uid52_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            finalSumOneComp_uid52_fpLogETest_q <= finalSumOneComp_uid52_fpLogETest_a xor finalSumOneComp_uid52_fpLogETest_b;
        END IF;
    END PROCESS;



	--finalSumAbs_uid53_fpLogETest(ADD,52)@16
    finalSumAbs_uid53_fpLogETest_a <= STD_LOGIC_VECTOR((57 downto 57 => finalSumOneComp_uid52_fpLogETest_q(56)) & finalSumOneComp_uid52_fpLogETest_q);
    finalSumAbs_uid53_fpLogETest_b <= STD_LOGIC_VECTOR((57 downto 1 => ld_FullSumAB56_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b_q(0)) & ld_FullSumAB56_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b_q);
            finalSumAbs_uid53_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(finalSumAbs_uid53_fpLogETest_a) + SIGNED(finalSumAbs_uid53_fpLogETest_b));
    finalSumAbs_uid53_fpLogETest_q <= finalSumAbs_uid53_fpLogETest_o(57 downto 0);


	--rVStage_uid114_countZ_uid54_fpLogETest(BITSELECT,113)@16
    rVStage_uid114_countZ_uid54_fpLogETest_in <= finalSumAbs_uid53_fpLogETest_q;
    rVStage_uid114_countZ_uid54_fpLogETest_b <= rVStage_uid114_countZ_uid54_fpLogETest_in(57 downto 26);

	--reg_rVStage_uid114_countZ_uid54_fpLogETest_0_to_vCount_uid115_countZ_uid54_fpLogETest_1(REG,202)@16
    reg_rVStage_uid114_countZ_uid54_fpLogETest_0_to_vCount_uid115_countZ_uid54_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid114_countZ_uid54_fpLogETest_0_to_vCount_uid115_countZ_uid54_fpLogETest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid114_countZ_uid54_fpLogETest_0_to_vCount_uid115_countZ_uid54_fpLogETest_1_q <= rVStage_uid114_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid115_countZ_uid54_fpLogETest(LOGICAL,114)@17
    vCount_uid115_countZ_uid54_fpLogETest_a <= reg_rVStage_uid114_countZ_uid54_fpLogETest_0_to_vCount_uid115_countZ_uid54_fpLogETest_1_q;
    vCount_uid115_countZ_uid54_fpLogETest_b <= zs_uid113_countZ_uid54_fpLogETest_q;
    vCount_uid115_countZ_uid54_fpLogETest_q <= "1" when vCount_uid115_countZ_uid54_fpLogETest_a = vCount_uid115_countZ_uid54_fpLogETest_b else "0";

	--ld_vCount_uid115_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_f(DELAY,366)@17
    ld_vCount_uid115_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid115_countZ_uid54_fpLogETest_q, xout => ld_vCount_uid115_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_f_q, ena => en(0), clk => clk, aclr => areset );

	--zs_uid121_countZ_uid54_fpLogETest(CONSTANT,120)
    zs_uid121_countZ_uid54_fpLogETest_q <= "0000000000000000";

	--vStage_uid117_countZ_uid54_fpLogETest(BITSELECT,116)@16
    vStage_uid117_countZ_uid54_fpLogETest_in <= finalSumAbs_uid53_fpLogETest_q(25 downto 0);
    vStage_uid117_countZ_uid54_fpLogETest_b <= vStage_uid117_countZ_uid54_fpLogETest_in(25 downto 0);

	--mO_uid116_countZ_uid54_fpLogETest(CONSTANT,115)
    mO_uid116_countZ_uid54_fpLogETest_q <= "111111";

	--cStage_uid118_countZ_uid54_fpLogETest(BITJOIN,117)@16
    cStage_uid118_countZ_uid54_fpLogETest_q <= vStage_uid117_countZ_uid54_fpLogETest_b & mO_uid116_countZ_uid54_fpLogETest_q;

	--reg_cStage_uid118_countZ_uid54_fpLogETest_0_to_vStagei_uid120_countZ_uid54_fpLogETest_3(REG,204)@16
    reg_cStage_uid118_countZ_uid54_fpLogETest_0_to_vStagei_uid120_countZ_uid54_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid118_countZ_uid54_fpLogETest_0_to_vStagei_uid120_countZ_uid54_fpLogETest_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid118_countZ_uid54_fpLogETest_0_to_vStagei_uid120_countZ_uid54_fpLogETest_3_q <= cStage_uid118_countZ_uid54_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid120_countZ_uid54_fpLogETest(MUX,119)@17
    vStagei_uid120_countZ_uid54_fpLogETest_s <= vCount_uid115_countZ_uid54_fpLogETest_q;
    vStagei_uid120_countZ_uid54_fpLogETest: PROCESS (vStagei_uid120_countZ_uid54_fpLogETest_s, en, reg_rVStage_uid114_countZ_uid54_fpLogETest_0_to_vCount_uid115_countZ_uid54_fpLogETest_1_q, reg_cStage_uid118_countZ_uid54_fpLogETest_0_to_vStagei_uid120_countZ_uid54_fpLogETest_3_q)
    BEGIN
            CASE vStagei_uid120_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid120_countZ_uid54_fpLogETest_q <= reg_rVStage_uid114_countZ_uid54_fpLogETest_0_to_vCount_uid115_countZ_uid54_fpLogETest_1_q;
                  WHEN "1" => vStagei_uid120_countZ_uid54_fpLogETest_q <= reg_cStage_uid118_countZ_uid54_fpLogETest_0_to_vStagei_uid120_countZ_uid54_fpLogETest_3_q;
                  WHEN OTHERS => vStagei_uid120_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid122_countZ_uid54_fpLogETest(BITSELECT,121)@17
    rVStage_uid122_countZ_uid54_fpLogETest_in <= vStagei_uid120_countZ_uid54_fpLogETest_q;
    rVStage_uid122_countZ_uid54_fpLogETest_b <= rVStage_uid122_countZ_uid54_fpLogETest_in(31 downto 16);

	--reg_rVStage_uid122_countZ_uid54_fpLogETest_0_to_vCount_uid123_countZ_uid54_fpLogETest_1(REG,205)@17
    reg_rVStage_uid122_countZ_uid54_fpLogETest_0_to_vCount_uid123_countZ_uid54_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid122_countZ_uid54_fpLogETest_0_to_vCount_uid123_countZ_uid54_fpLogETest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid122_countZ_uid54_fpLogETest_0_to_vCount_uid123_countZ_uid54_fpLogETest_1_q <= rVStage_uid122_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid123_countZ_uid54_fpLogETest(LOGICAL,122)@18
    vCount_uid123_countZ_uid54_fpLogETest_a <= reg_rVStage_uid122_countZ_uid54_fpLogETest_0_to_vCount_uid123_countZ_uid54_fpLogETest_1_q;
    vCount_uid123_countZ_uid54_fpLogETest_b <= zs_uid121_countZ_uid54_fpLogETest_q;
    vCount_uid123_countZ_uid54_fpLogETest_q <= "1" when vCount_uid123_countZ_uid54_fpLogETest_a = vCount_uid123_countZ_uid54_fpLogETest_b else "0";

	--ld_vCount_uid123_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_e(DELAY,365)@18
    ld_vCount_uid123_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid123_countZ_uid54_fpLogETest_q, xout => ld_vCount_uid123_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid124_countZ_uid54_fpLogETest(BITSELECT,123)@17
    vStage_uid124_countZ_uid54_fpLogETest_in <= vStagei_uid120_countZ_uid54_fpLogETest_q(15 downto 0);
    vStage_uid124_countZ_uid54_fpLogETest_b <= vStage_uid124_countZ_uid54_fpLogETest_in(15 downto 0);

	--reg_vStage_uid124_countZ_uid54_fpLogETest_0_to_vStagei_uid126_countZ_uid54_fpLogETest_3(REG,207)@17
    reg_vStage_uid124_countZ_uid54_fpLogETest_0_to_vStagei_uid126_countZ_uid54_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid124_countZ_uid54_fpLogETest_0_to_vStagei_uid126_countZ_uid54_fpLogETest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid124_countZ_uid54_fpLogETest_0_to_vStagei_uid126_countZ_uid54_fpLogETest_3_q <= vStage_uid124_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid126_countZ_uid54_fpLogETest(MUX,125)@18
    vStagei_uid126_countZ_uid54_fpLogETest_s <= vCount_uid123_countZ_uid54_fpLogETest_q;
    vStagei_uid126_countZ_uid54_fpLogETest: PROCESS (vStagei_uid126_countZ_uid54_fpLogETest_s, en, reg_rVStage_uid122_countZ_uid54_fpLogETest_0_to_vCount_uid123_countZ_uid54_fpLogETest_1_q, reg_vStage_uid124_countZ_uid54_fpLogETest_0_to_vStagei_uid126_countZ_uid54_fpLogETest_3_q)
    BEGIN
            CASE vStagei_uid126_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid126_countZ_uid54_fpLogETest_q <= reg_rVStage_uid122_countZ_uid54_fpLogETest_0_to_vCount_uid123_countZ_uid54_fpLogETest_1_q;
                  WHEN "1" => vStagei_uid126_countZ_uid54_fpLogETest_q <= reg_vStage_uid124_countZ_uid54_fpLogETest_0_to_vStagei_uid126_countZ_uid54_fpLogETest_3_q;
                  WHEN OTHERS => vStagei_uid126_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid128_countZ_uid54_fpLogETest(BITSELECT,127)@18
    rVStage_uid128_countZ_uid54_fpLogETest_in <= vStagei_uid126_countZ_uid54_fpLogETest_q;
    rVStage_uid128_countZ_uid54_fpLogETest_b <= rVStage_uid128_countZ_uid54_fpLogETest_in(15 downto 8);

	--vCount_uid129_countZ_uid54_fpLogETest(LOGICAL,128)@18
    vCount_uid129_countZ_uid54_fpLogETest_a <= rVStage_uid128_countZ_uid54_fpLogETest_b;
    vCount_uid129_countZ_uid54_fpLogETest_b <= cstAllZWE_uid14_fpLogETest_q;
    vCount_uid129_countZ_uid54_fpLogETest_q <= "1" when vCount_uid129_countZ_uid54_fpLogETest_a = vCount_uid129_countZ_uid54_fpLogETest_b else "0";

	--reg_vCount_uid129_countZ_uid54_fpLogETest_0_to_r_uid148_countZ_uid54_fpLogETest_3(REG,211)@18
    reg_vCount_uid129_countZ_uid54_fpLogETest_0_to_r_uid148_countZ_uid54_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid129_countZ_uid54_fpLogETest_0_to_r_uid148_countZ_uid54_fpLogETest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid129_countZ_uid54_fpLogETest_0_to_r_uid148_countZ_uid54_fpLogETest_3_q <= vCount_uid129_countZ_uid54_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--zs_uid133_countZ_uid54_fpLogETest(CONSTANT,132)
    zs_uid133_countZ_uid54_fpLogETest_q <= "0000";

	--vStage_uid130_countZ_uid54_fpLogETest(BITSELECT,129)@18
    vStage_uid130_countZ_uid54_fpLogETest_in <= vStagei_uid126_countZ_uid54_fpLogETest_q(7 downto 0);
    vStage_uid130_countZ_uid54_fpLogETest_b <= vStage_uid130_countZ_uid54_fpLogETest_in(7 downto 0);

	--vStagei_uid132_countZ_uid54_fpLogETest(MUX,131)@18
    vStagei_uid132_countZ_uid54_fpLogETest_s <= vCount_uid129_countZ_uid54_fpLogETest_q;
    vStagei_uid132_countZ_uid54_fpLogETest: PROCESS (vStagei_uid132_countZ_uid54_fpLogETest_s, en, rVStage_uid128_countZ_uid54_fpLogETest_b, vStage_uid130_countZ_uid54_fpLogETest_b)
    BEGIN
            CASE vStagei_uid132_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid132_countZ_uid54_fpLogETest_q <= rVStage_uid128_countZ_uid54_fpLogETest_b;
                  WHEN "1" => vStagei_uid132_countZ_uid54_fpLogETest_q <= vStage_uid130_countZ_uid54_fpLogETest_b;
                  WHEN OTHERS => vStagei_uid132_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid134_countZ_uid54_fpLogETest(BITSELECT,133)@18
    rVStage_uid134_countZ_uid54_fpLogETest_in <= vStagei_uid132_countZ_uid54_fpLogETest_q;
    rVStage_uid134_countZ_uid54_fpLogETest_b <= rVStage_uid134_countZ_uid54_fpLogETest_in(7 downto 4);

	--reg_rVStage_uid134_countZ_uid54_fpLogETest_0_to_vCount_uid135_countZ_uid54_fpLogETest_1(REG,208)@18
    reg_rVStage_uid134_countZ_uid54_fpLogETest_0_to_vCount_uid135_countZ_uid54_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid134_countZ_uid54_fpLogETest_0_to_vCount_uid135_countZ_uid54_fpLogETest_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid134_countZ_uid54_fpLogETest_0_to_vCount_uid135_countZ_uid54_fpLogETest_1_q <= rVStage_uid134_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid135_countZ_uid54_fpLogETest(LOGICAL,134)@19
    vCount_uid135_countZ_uid54_fpLogETest_a <= reg_rVStage_uid134_countZ_uid54_fpLogETest_0_to_vCount_uid135_countZ_uid54_fpLogETest_1_q;
    vCount_uid135_countZ_uid54_fpLogETest_b <= zs_uid133_countZ_uid54_fpLogETest_q;
    vCount_uid135_countZ_uid54_fpLogETest_q <= "1" when vCount_uid135_countZ_uid54_fpLogETest_a = vCount_uid135_countZ_uid54_fpLogETest_b else "0";

	--vStage_uid136_countZ_uid54_fpLogETest(BITSELECT,135)@18
    vStage_uid136_countZ_uid54_fpLogETest_in <= vStagei_uid132_countZ_uid54_fpLogETest_q(3 downto 0);
    vStage_uid136_countZ_uid54_fpLogETest_b <= vStage_uid136_countZ_uid54_fpLogETest_in(3 downto 0);

	--reg_vStage_uid136_countZ_uid54_fpLogETest_0_to_vStagei_uid138_countZ_uid54_fpLogETest_3(REG,210)@18
    reg_vStage_uid136_countZ_uid54_fpLogETest_0_to_vStagei_uid138_countZ_uid54_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid136_countZ_uid54_fpLogETest_0_to_vStagei_uid138_countZ_uid54_fpLogETest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid136_countZ_uid54_fpLogETest_0_to_vStagei_uid138_countZ_uid54_fpLogETest_3_q <= vStage_uid136_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid138_countZ_uid54_fpLogETest(MUX,137)@19
    vStagei_uid138_countZ_uid54_fpLogETest_s <= vCount_uid135_countZ_uid54_fpLogETest_q;
    vStagei_uid138_countZ_uid54_fpLogETest: PROCESS (vStagei_uid138_countZ_uid54_fpLogETest_s, en, reg_rVStage_uid134_countZ_uid54_fpLogETest_0_to_vCount_uid135_countZ_uid54_fpLogETest_1_q, reg_vStage_uid136_countZ_uid54_fpLogETest_0_to_vStagei_uid138_countZ_uid54_fpLogETest_3_q)
    BEGIN
            CASE vStagei_uid138_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid138_countZ_uid54_fpLogETest_q <= reg_rVStage_uid134_countZ_uid54_fpLogETest_0_to_vCount_uid135_countZ_uid54_fpLogETest_1_q;
                  WHEN "1" => vStagei_uid138_countZ_uid54_fpLogETest_q <= reg_vStage_uid136_countZ_uid54_fpLogETest_0_to_vStagei_uid138_countZ_uid54_fpLogETest_3_q;
                  WHEN OTHERS => vStagei_uid138_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid140_countZ_uid54_fpLogETest(BITSELECT,139)@19
    rVStage_uid140_countZ_uid54_fpLogETest_in <= vStagei_uid138_countZ_uid54_fpLogETest_q;
    rVStage_uid140_countZ_uid54_fpLogETest_b <= rVStage_uid140_countZ_uid54_fpLogETest_in(3 downto 2);

	--vCount_uid141_countZ_uid54_fpLogETest(LOGICAL,140)@19
    vCount_uid141_countZ_uid54_fpLogETest_a <= rVStage_uid140_countZ_uid54_fpLogETest_b;
    vCount_uid141_countZ_uid54_fpLogETest_b <= z2_uid40_fpLogETest_q;
    vCount_uid141_countZ_uid54_fpLogETest_q <= "1" when vCount_uid141_countZ_uid54_fpLogETest_a = vCount_uid141_countZ_uid54_fpLogETest_b else "0";

	--vStage_uid142_countZ_uid54_fpLogETest(BITSELECT,141)@19
    vStage_uid142_countZ_uid54_fpLogETest_in <= vStagei_uid138_countZ_uid54_fpLogETest_q(1 downto 0);
    vStage_uid142_countZ_uid54_fpLogETest_b <= vStage_uid142_countZ_uid54_fpLogETest_in(1 downto 0);

	--vStagei_uid144_countZ_uid54_fpLogETest(MUX,143)@19
    vStagei_uid144_countZ_uid54_fpLogETest_s <= vCount_uid141_countZ_uid54_fpLogETest_q;
    vStagei_uid144_countZ_uid54_fpLogETest: PROCESS (vStagei_uid144_countZ_uid54_fpLogETest_s, en, rVStage_uid140_countZ_uid54_fpLogETest_b, vStage_uid142_countZ_uid54_fpLogETest_b)
    BEGIN
            CASE vStagei_uid144_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid144_countZ_uid54_fpLogETest_q <= rVStage_uid140_countZ_uid54_fpLogETest_b;
                  WHEN "1" => vStagei_uid144_countZ_uid54_fpLogETest_q <= vStage_uid142_countZ_uid54_fpLogETest_b;
                  WHEN OTHERS => vStagei_uid144_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid146_countZ_uid54_fpLogETest(BITSELECT,145)@19
    rVStage_uid146_countZ_uid54_fpLogETest_in <= vStagei_uid144_countZ_uid54_fpLogETest_q;
    rVStage_uid146_countZ_uid54_fpLogETest_b <= rVStage_uid146_countZ_uid54_fpLogETest_in(1 downto 1);

	--vCount_uid147_countZ_uid54_fpLogETest(LOGICAL,146)@19
    vCount_uid147_countZ_uid54_fpLogETest_a <= rVStage_uid146_countZ_uid54_fpLogETest_b;
    vCount_uid147_countZ_uid54_fpLogETest_b <= GND_q;
    vCount_uid147_countZ_uid54_fpLogETest_q <= "1" when vCount_uid147_countZ_uid54_fpLogETest_a = vCount_uid147_countZ_uid54_fpLogETest_b else "0";

	--r_uid148_countZ_uid54_fpLogETest(BITJOIN,147)@19
    r_uid148_countZ_uid54_fpLogETest_q <= ld_vCount_uid115_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_f_q & ld_vCount_uid123_countZ_uid54_fpLogETest_q_to_r_uid148_countZ_uid54_fpLogETest_e_q & reg_vCount_uid129_countZ_uid54_fpLogETest_0_to_r_uid148_countZ_uid54_fpLogETest_3_q & vCount_uid135_countZ_uid54_fpLogETest_q & vCount_uid141_countZ_uid54_fpLogETest_q & vCount_uid147_countZ_uid54_fpLogETest_q;

	--reg_r_uid148_countZ_uid54_fpLogETest_0_to_expRExt_uid57_fpLogETest_1(REG,218)@19
    reg_r_uid148_countZ_uid54_fpLogETest_0_to_expRExt_uid57_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid148_countZ_uid54_fpLogETest_0_to_expRExt_uid57_fpLogETest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid148_countZ_uid54_fpLogETest_0_to_expRExt_uid57_fpLogETest_1_q <= r_uid148_countZ_uid54_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--cstMSBFinalSumPBias_uid56_fpLogETest(CONSTANT,55)
    cstMSBFinalSumPBias_uid56_fpLogETest_q <= "010001001";

	--expRExt_uid57_fpLogETest(SUB,56)@20
    expRExt_uid57_fpLogETest_a <= STD_LOGIC_VECTOR("0" & cstMSBFinalSumPBias_uid56_fpLogETest_q);
    expRExt_uid57_fpLogETest_b <= STD_LOGIC_VECTOR("0000" & reg_r_uid148_countZ_uid54_fpLogETest_0_to_expRExt_uid57_fpLogETest_1_q);
            expRExt_uid57_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt_uid57_fpLogETest_a) - UNSIGNED(expRExt_uid57_fpLogETest_b));
    expRExt_uid57_fpLogETest_q <= expRExt_uid57_fpLogETest_o(9 downto 0);


	--LeftShiftStage154dto0_uid180_normVal_uid55_fpLogETest(BITSELECT,179)@20
    LeftShiftStage154dto0_uid180_normVal_uid55_fpLogETest_in <= leftShiftStage1_uid172_normVal_uid55_fpLogETest_q(54 downto 0);
    LeftShiftStage154dto0_uid180_normVal_uid55_fpLogETest_b <= LeftShiftStage154dto0_uid180_normVal_uid55_fpLogETest_in(54 downto 0);

	--leftShiftStage2Idx3Pad3_uid179_normVal_uid55_fpLogETest(CONSTANT,178)
    leftShiftStage2Idx3Pad3_uid179_normVal_uid55_fpLogETest_q <= "000";

	--leftShiftStage2Idx3_uid181_normVal_uid55_fpLogETest(BITJOIN,180)@20
    leftShiftStage2Idx3_uid181_normVal_uid55_fpLogETest_q <= LeftShiftStage154dto0_uid180_normVal_uid55_fpLogETest_b & leftShiftStage2Idx3Pad3_uid179_normVal_uid55_fpLogETest_q;

	--LeftShiftStage155dto0_uid177_normVal_uid55_fpLogETest(BITSELECT,176)@20
    LeftShiftStage155dto0_uid177_normVal_uid55_fpLogETest_in <= leftShiftStage1_uid172_normVal_uid55_fpLogETest_q(55 downto 0);
    LeftShiftStage155dto0_uid177_normVal_uid55_fpLogETest_b <= LeftShiftStage155dto0_uid177_normVal_uid55_fpLogETest_in(55 downto 0);

	--leftShiftStage2Idx2_uid178_normVal_uid55_fpLogETest(BITJOIN,177)@20
    leftShiftStage2Idx2_uid178_normVal_uid55_fpLogETest_q <= LeftShiftStage155dto0_uid177_normVal_uid55_fpLogETest_b & z2_uid40_fpLogETest_q;

	--LeftShiftStage156dto0_uid174_normVal_uid55_fpLogETest(BITSELECT,173)@20
    LeftShiftStage156dto0_uid174_normVal_uid55_fpLogETest_in <= leftShiftStage1_uid172_normVal_uid55_fpLogETest_q(56 downto 0);
    LeftShiftStage156dto0_uid174_normVal_uid55_fpLogETest_b <= LeftShiftStage156dto0_uid174_normVal_uid55_fpLogETest_in(56 downto 0);

	--leftShiftStage2Idx1_uid175_normVal_uid55_fpLogETest(BITJOIN,174)@20
    leftShiftStage2Idx1_uid175_normVal_uid55_fpLogETest_q <= LeftShiftStage156dto0_uid174_normVal_uid55_fpLogETest_b & GND_q;

	--X9dto0_uid158_normVal_uid55_fpLogETest(BITSELECT,157)@16
    X9dto0_uid158_normVal_uid55_fpLogETest_in <= finalSumAbs_uid53_fpLogETest_q(9 downto 0);
    X9dto0_uid158_normVal_uid55_fpLogETest_b <= X9dto0_uid158_normVal_uid55_fpLogETest_in(9 downto 0);

	--ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b_inputreg(DELAY,467)
    ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 10, depth => 1 )
    PORT MAP ( xin => X9dto0_uid158_normVal_uid55_fpLogETest_b, xout => ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b(DELAY,371)@16
    ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 10, depth => 2 )
    PORT MAP ( xin => ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b_inputreg_q, xout => ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx3Pad48_uid157_normVal_uid55_fpLogETest(CONSTANT,156)
    leftShiftStage0Idx3Pad48_uid157_normVal_uid55_fpLogETest_q <= "000000000000000000000000000000000000000000000000";

	--leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest(BITJOIN,158)@19
    leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_q <= ld_X9dto0_uid158_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_b_q & leftShiftStage0Idx3Pad48_uid157_normVal_uid55_fpLogETest_q;

	--ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b_inputreg(DELAY,466)
    ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => vStage_uid117_countZ_uid54_fpLogETest_b, xout => ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b(DELAY,369)@16
    ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 26, depth => 2 )
    PORT MAP ( xin => ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b_inputreg_q, xout => ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest(BITJOIN,155)@19
    leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_q <= ld_vStage_uid117_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_b_q & zs_uid113_countZ_uid54_fpLogETest_q;

	--X41dto0_uid152_normVal_uid55_fpLogETest(BITSELECT,151)@16
    X41dto0_uid152_normVal_uid55_fpLogETest_in <= finalSumAbs_uid53_fpLogETest_q(41 downto 0);
    X41dto0_uid152_normVal_uid55_fpLogETest_b <= X41dto0_uid152_normVal_uid55_fpLogETest_in(41 downto 0);

	--ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b_inputreg(DELAY,465)
    ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 42, depth => 1 )
    PORT MAP ( xin => X41dto0_uid152_normVal_uid55_fpLogETest_b, xout => ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b(DELAY,368)@16
    ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 42, depth => 2 )
    PORT MAP ( xin => ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b_inputreg_q, xout => ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest(BITJOIN,152)@19
    leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_q <= ld_X41dto0_uid152_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_b_q & zs_uid121_countZ_uid54_fpLogETest_q;

	--ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_inputreg(DELAY,468)
    ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 58, depth => 1 )
    PORT MAP ( xin => finalSumAbs_uid53_fpLogETest_q, xout => ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c(DELAY,374)@16
    ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c : dspba_delay
    GENERIC MAP ( width => 58, depth => 2 )
    PORT MAP ( xin => ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_inputreg_q, xout => ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStageSel5Dto4_uid160_normVal_uid55_fpLogETest(BITSELECT,159)@19
    leftShiftStageSel5Dto4_uid160_normVal_uid55_fpLogETest_in <= r_uid148_countZ_uid54_fpLogETest_q;
    leftShiftStageSel5Dto4_uid160_normVal_uid55_fpLogETest_b <= leftShiftStageSel5Dto4_uid160_normVal_uid55_fpLogETest_in(5 downto 4);

	--leftShiftStage0_uid161_normVal_uid55_fpLogETest(MUX,160)@19
    leftShiftStage0_uid161_normVal_uid55_fpLogETest_s <= leftShiftStageSel5Dto4_uid160_normVal_uid55_fpLogETest_b;
    leftShiftStage0_uid161_normVal_uid55_fpLogETest: PROCESS (leftShiftStage0_uid161_normVal_uid55_fpLogETest_s, en, ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_q, leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_q, leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_q, leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_q)
    BEGIN
            CASE leftShiftStage0_uid161_normVal_uid55_fpLogETest_s IS
                  WHEN "00" => leftShiftStage0_uid161_normVal_uid55_fpLogETest_q <= ld_finalSumAbs_uid53_fpLogETest_q_to_leftShiftStage0_uid161_normVal_uid55_fpLogETest_c_q;
                  WHEN "01" => leftShiftStage0_uid161_normVal_uid55_fpLogETest_q <= leftShiftStage0Idx1_uid153_normVal_uid55_fpLogETest_q;
                  WHEN "10" => leftShiftStage0_uid161_normVal_uid55_fpLogETest_q <= leftShiftStage0Idx2_uid156_normVal_uid55_fpLogETest_q;
                  WHEN "11" => leftShiftStage0_uid161_normVal_uid55_fpLogETest_q <= leftShiftStage0Idx3_uid159_normVal_uid55_fpLogETest_q;
                  WHEN OTHERS => leftShiftStage0_uid161_normVal_uid55_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage045dto0_uid169_normVal_uid55_fpLogETest(BITSELECT,168)@19
    LeftShiftStage045dto0_uid169_normVal_uid55_fpLogETest_in <= leftShiftStage0_uid161_normVal_uid55_fpLogETest_q(45 downto 0);
    LeftShiftStage045dto0_uid169_normVal_uid55_fpLogETest_b <= LeftShiftStage045dto0_uid169_normVal_uid55_fpLogETest_in(45 downto 0);

	--leftShiftStage1Idx3Pad12_uid168_normVal_uid55_fpLogETest(CONSTANT,167)
    leftShiftStage1Idx3Pad12_uid168_normVal_uid55_fpLogETest_q <= "000000000000";

	--leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest(BITJOIN,169)@19
    leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_q <= LeftShiftStage045dto0_uid169_normVal_uid55_fpLogETest_b & leftShiftStage1Idx3Pad12_uid168_normVal_uid55_fpLogETest_q;

	--reg_leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_5(REG,216)@19
    reg_leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_5_q <= "0000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_5_q <= leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage049dto0_uid166_normVal_uid55_fpLogETest(BITSELECT,165)@19
    LeftShiftStage049dto0_uid166_normVal_uid55_fpLogETest_in <= leftShiftStage0_uid161_normVal_uid55_fpLogETest_q(49 downto 0);
    LeftShiftStage049dto0_uid166_normVal_uid55_fpLogETest_b <= LeftShiftStage049dto0_uid166_normVal_uid55_fpLogETest_in(49 downto 0);

	--leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest(BITJOIN,166)@19
    leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_q <= LeftShiftStage049dto0_uid166_normVal_uid55_fpLogETest_b & cstAllZWE_uid14_fpLogETest_q;

	--reg_leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_4(REG,215)@19
    reg_leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_4_q <= "0000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_4_q <= leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage053dto0_uid163_normVal_uid55_fpLogETest(BITSELECT,162)@19
    LeftShiftStage053dto0_uid163_normVal_uid55_fpLogETest_in <= leftShiftStage0_uid161_normVal_uid55_fpLogETest_q(53 downto 0);
    LeftShiftStage053dto0_uid163_normVal_uid55_fpLogETest_b <= LeftShiftStage053dto0_uid163_normVal_uid55_fpLogETest_in(53 downto 0);

	--leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest(BITJOIN,163)@19
    leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_q <= LeftShiftStage053dto0_uid163_normVal_uid55_fpLogETest_b & zs_uid133_countZ_uid54_fpLogETest_q;

	--reg_leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_3(REG,214)@19
    reg_leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_3_q <= "0000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_3_q <= leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid161_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_2(REG,213)@19
    reg_leftShiftStage0_uid161_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid161_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_2_q <= "0000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid161_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_2_q <= leftShiftStage0_uid161_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest(BITSELECT,170)@19
    leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_in <= r_uid148_countZ_uid54_fpLogETest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_b <= leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_1(REG,212)@19
    reg_leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_1_q <= leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid172_normVal_uid55_fpLogETest(MUX,171)@20
    leftShiftStage1_uid172_normVal_uid55_fpLogETest_s <= reg_leftShiftStageSel3Dto2_uid171_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_1_q;
    leftShiftStage1_uid172_normVal_uid55_fpLogETest: PROCESS (leftShiftStage1_uid172_normVal_uid55_fpLogETest_s, en, reg_leftShiftStage0_uid161_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_2_q, reg_leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_3_q, reg_leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_4_q, reg_leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_5_q)
    BEGIN
            CASE leftShiftStage1_uid172_normVal_uid55_fpLogETest_s IS
                  WHEN "00" => leftShiftStage1_uid172_normVal_uid55_fpLogETest_q <= reg_leftShiftStage0_uid161_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_2_q;
                  WHEN "01" => leftShiftStage1_uid172_normVal_uid55_fpLogETest_q <= reg_leftShiftStage1Idx1_uid164_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_3_q;
                  WHEN "10" => leftShiftStage1_uid172_normVal_uid55_fpLogETest_q <= reg_leftShiftStage1Idx2_uid167_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_4_q;
                  WHEN "11" => leftShiftStage1_uid172_normVal_uid55_fpLogETest_q <= reg_leftShiftStage1Idx3_uid170_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid172_normVal_uid55_fpLogETest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid172_normVal_uid55_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest(BITSELECT,181)@19
    leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_in <= r_uid148_countZ_uid54_fpLogETest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_b <= leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid183_normVal_uid55_fpLogETest_1(REG,217)@19
    reg_leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid183_normVal_uid55_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid183_normVal_uid55_fpLogETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid183_normVal_uid55_fpLogETest_1_q <= leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid183_normVal_uid55_fpLogETest(MUX,182)@20
    leftShiftStage2_uid183_normVal_uid55_fpLogETest_s <= reg_leftShiftStageSel1Dto0_uid182_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid183_normVal_uid55_fpLogETest_1_q;
    leftShiftStage2_uid183_normVal_uid55_fpLogETest: PROCESS (leftShiftStage2_uid183_normVal_uid55_fpLogETest_s, en, leftShiftStage1_uid172_normVal_uid55_fpLogETest_q, leftShiftStage2Idx1_uid175_normVal_uid55_fpLogETest_q, leftShiftStage2Idx2_uid178_normVal_uid55_fpLogETest_q, leftShiftStage2Idx3_uid181_normVal_uid55_fpLogETest_q)
    BEGIN
            CASE leftShiftStage2_uid183_normVal_uid55_fpLogETest_s IS
                  WHEN "00" => leftShiftStage2_uid183_normVal_uid55_fpLogETest_q <= leftShiftStage1_uid172_normVal_uid55_fpLogETest_q;
                  WHEN "01" => leftShiftStage2_uid183_normVal_uid55_fpLogETest_q <= leftShiftStage2Idx1_uid175_normVal_uid55_fpLogETest_q;
                  WHEN "10" => leftShiftStage2_uid183_normVal_uid55_fpLogETest_q <= leftShiftStage2Idx2_uid178_normVal_uid55_fpLogETest_q;
                  WHEN "11" => leftShiftStage2_uid183_normVal_uid55_fpLogETest_q <= leftShiftStage2Idx3_uid181_normVal_uid55_fpLogETest_q;
                  WHEN OTHERS => leftShiftStage2_uid183_normVal_uid55_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracR_uid58_fpLogETest(BITSELECT,57)@20
    fracR_uid58_fpLogETest_in <= leftShiftStage2_uid183_normVal_uid55_fpLogETest_q(56 downto 0);
    fracR_uid58_fpLogETest_b <= fracR_uid58_fpLogETest_in(56 downto 33);

	--expFracConc_uid59_fpLogETest(BITJOIN,58)@20
    expFracConc_uid59_fpLogETest_q <= expRExt_uid57_fpLogETest_q & fracR_uid58_fpLogETest_b;

	--reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0(REG,219)@20
    reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0_q <= "0000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0_q <= expFracConc_uid59_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracPostRnd_uid60_fpLogETest(ADD,59)@21
    expFracPostRnd_uid60_fpLogETest_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0_q);
    expFracPostRnd_uid60_fpLogETest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & VCC_q);
            expFracPostRnd_uid60_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRnd_uid60_fpLogETest_a) + UNSIGNED(expFracPostRnd_uid60_fpLogETest_b));
    expFracPostRnd_uid60_fpLogETest_q <= expFracPostRnd_uid60_fpLogETest_o(34 downto 0);


	--expR_uid62_fpLogETest(BITSELECT,61)@21
    expR_uid62_fpLogETest_in <= expFracPostRnd_uid60_fpLogETest_q(31 downto 0);
    expR_uid62_fpLogETest_b <= expR_uid62_fpLogETest_in(31 downto 24);

	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor(LOGICAL,493)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_b <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_sticky_ena_q;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_q <= not (ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_a or ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_b);

	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_mem_top(CONSTANT,489)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_mem_top_q <= "010001";

	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp(LOGICAL,490)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_a <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_mem_top_q;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_q);
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_q <= "1" when ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_a = ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_b else "0";

	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmpReg(REG,491)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmpReg_q <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_sticky_ena(REG,494)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_nor_q = "1") THEN
                ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_sticky_ena_q <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd(LOGICAL,495)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_a <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_sticky_ena_q;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_b <= en;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_q <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_a and ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_b;

	--InvSignX_uid65_fpLogETest(LOGICAL,64)@0
    InvSignX_uid65_fpLogETest_a <= signX_uid7_fpLogETest_b;
    InvSignX_uid65_fpLogETest_q <= not InvSignX_uid65_fpLogETest_a;

	--excRInfC1_uid66_fpLogETest(LOGICAL,65)@0
    excRInfC1_uid66_fpLogETest_a <= exc_I_uid21_fpLogETest_q;
    excRInfC1_uid66_fpLogETest_b <= InvSignX_uid65_fpLogETest_q;
    excRInfC1_uid66_fpLogETest_q <= excRInfC1_uid66_fpLogETest_a and excRInfC1_uid66_fpLogETest_b;

	--excRInf_uid67_fpLogETest(LOGICAL,66)@0
    excRInf_uid67_fpLogETest_a <= excRInfC1_uid66_fpLogETest_q;
    excRInf_uid67_fpLogETest_b <= expXIsZero_uid16_fpLogETest_q;
    excRInf_uid67_fpLogETest_q <= excRInf_uid67_fpLogETest_a or excRInf_uid67_fpLogETest_b;

	--FPOne_uid63_fpLogETest(BITJOIN,62)@0
    FPOne_uid63_fpLogETest_q <= GND_q & cstBias_uid9_fpLogETest_q & cstAllZWF_uid8_fpLogETest_q;

	--excRZero_uid64_fpLogETest(LOGICAL,63)@0
    excRZero_uid64_fpLogETest_a <= a;
    excRZero_uid64_fpLogETest_b <= FPOne_uid63_fpLogETest_q;
    excRZero_uid64_fpLogETest_q <= "1" when excRZero_uid64_fpLogETest_a = excRZero_uid64_fpLogETest_b else "0";

	--concExc_uid78_fpLogETest(BITJOIN,77)@0
    concExc_uid78_fpLogETest_q <= excRNaN_uid70_fpLogETest_q & excRInf_uid67_fpLogETest_q & excRZero_uid64_fpLogETest_q;

	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_inputreg(DELAY,483)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => concExc_uid78_fpLogETest_q, xout => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt(COUNTER,485)
    -- every=1, low=0, high=17, step=1, init=1
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_i = 16 THEN
                      ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_eq = '1') THEN
                        ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_i <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_i - 17;
                    ELSE
                        ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_i <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_i,5));


	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdreg(REG,486)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdreg_q <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux(MUX,487)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_s <= en;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux: PROCESS (ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_s, ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdreg_q, ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_q <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdreg_q;
                  WHEN "1" => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_q <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem(DUALMEM,484)
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_reset0 <= areset;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_ia <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_inputreg_q;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_aa <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdreg_q;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_ab <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_rdmux_q;
    ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_iq,
        address_a => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_aa,
        data_a => ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_ia
    );
        ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_q <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_iq(2 downto 0);

	--reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0(REG,193)@20
    reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q <= ld_concExc_uid78_fpLogETest_q_to_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid79_fpLogETest(LOOKUP,78)@21
    excREnc_uid79_fpLogETest: PROCESS (reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q) IS
                WHEN "000" =>  excREnc_uid79_fpLogETest_q <= "01";
                WHEN "001" =>  excREnc_uid79_fpLogETest_q <= "00";
                WHEN "010" =>  excREnc_uid79_fpLogETest_q <= "10";
                WHEN "011" =>  excREnc_uid79_fpLogETest_q <= "00";
                WHEN "100" =>  excREnc_uid79_fpLogETest_q <= "11";
                WHEN "101" =>  excREnc_uid79_fpLogETest_q <= "00";
                WHEN "110" =>  excREnc_uid79_fpLogETest_q <= "00";
                WHEN "111" =>  excREnc_uid79_fpLogETest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid79_fpLogETest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid87_fpLogETest(MUX,86)@21
    expRPostExc_uid87_fpLogETest_s <= excREnc_uid79_fpLogETest_q;
    expRPostExc_uid87_fpLogETest: PROCESS (expRPostExc_uid87_fpLogETest_s, en, cstAllZWE_uid14_fpLogETest_q, expR_uid62_fpLogETest_b, cstAllOWE_uid12_fpLogETest_q, cstAllOWE_uid12_fpLogETest_q)
    BEGIN
            CASE expRPostExc_uid87_fpLogETest_s IS
                  WHEN "00" => expRPostExc_uid87_fpLogETest_q <= cstAllZWE_uid14_fpLogETest_q;
                  WHEN "01" => expRPostExc_uid87_fpLogETest_q <= expR_uid62_fpLogETest_b;
                  WHEN "10" => expRPostExc_uid87_fpLogETest_q <= cstAllOWE_uid12_fpLogETest_q;
                  WHEN "11" => expRPostExc_uid87_fpLogETest_q <= cstAllOWE_uid12_fpLogETest_q;
                  WHEN OTHERS => expRPostExc_uid87_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid80_fpLogETest(CONSTANT,79)
    oneFracRPostExc2_uid80_fpLogETest_q <= "00000000000000000000001";

	--fracR_uid61_fpLogETest(BITSELECT,60)@21
    fracR_uid61_fpLogETest_in <= expFracPostRnd_uid60_fpLogETest_q(23 downto 0);
    fracR_uid61_fpLogETest_b <= fracR_uid61_fpLogETest_in(23 downto 1);

	--fracRPostExc_uid83_fpLogETest(MUX,82)@21
    fracRPostExc_uid83_fpLogETest_s <= excREnc_uid79_fpLogETest_q;
    fracRPostExc_uid83_fpLogETest: PROCESS (fracRPostExc_uid83_fpLogETest_s, en, cstAllZWF_uid8_fpLogETest_q, fracR_uid61_fpLogETest_b, cstAllZWF_uid8_fpLogETest_q, oneFracRPostExc2_uid80_fpLogETest_q)
    BEGIN
            CASE fracRPostExc_uid83_fpLogETest_s IS
                  WHEN "00" => fracRPostExc_uid83_fpLogETest_q <= cstAllZWF_uid8_fpLogETest_q;
                  WHEN "01" => fracRPostExc_uid83_fpLogETest_q <= fracR_uid61_fpLogETest_b;
                  WHEN "10" => fracRPostExc_uid83_fpLogETest_q <= cstAllZWF_uid8_fpLogETest_q;
                  WHEN "11" => fracRPostExc_uid83_fpLogETest_q <= oneFracRPostExc2_uid80_fpLogETest_q;
                  WHEN OTHERS => fracRPostExc_uid83_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RLn_uid88_fpLogETest(BITJOIN,87)@21
    RLn_uid88_fpLogETest_q <= ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c_q & expRPostExc_uid87_fpLogETest_q & fracRPostExc_uid83_fpLogETest_q;

	--xOut(GPOUT,4)@21
    q <= RLn_uid88_fpLogETest_q;


end normal;
