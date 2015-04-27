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

-- VHDL created from fp_tanpi_s5
-- VHDL created on Wed Feb 27 15:22:47 2013


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

entity fp_tanpi_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_tanpi_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllZWE_uid8_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMwSMo_uid22_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal piwFP1_uid29_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal xpi_uid30_fpTanPiTest_a : std_logic_vector (23 downto 0);
    signal xpi_uid30_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal xpi_uid30_fpTanPiTest_s1 : std_logic_vector (47 downto 0);
    signal xpi_uid30_fpTanPiTest_pr : UNSIGNED (47 downto 0);
    signal xpi_uid30_fpTanPiTest_q : std_logic_vector (47 downto 0);
    signal roundAndExpUpdateCst_uid38_fpTanPiTest_q : std_logic_vector (24 downto 0);
    signal cstAllOWE_uid52_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid53_spix_uid43_fpTanPiTest_q : std_logic_vector (22 downto 0);
    signal cstBias_uid54_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasPwF_uid55_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal biasM1_uid74_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal biasMwShift_uid76_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal cst01pWShift_uid81_spix_uid43_fpTanPiTest_q : std_logic_vector (12 downto 0);
    signal ozz_uid88_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal cOne_uid91_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal p_uid102_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal p_uid102_spix_uid43_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal expP_uid108_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal expP_uid108_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal piwFP2_uid114_spix_uid43_fpTanPiTest_q : std_logic_vector (24 downto 0);
    signal multRightOp_uid115_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal multRightOp_uid115_spix_uid43_fpTanPiTest_q : std_logic_vector (24 downto 0);
    signal mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a : std_logic_vector (23 downto 0);
    signal mul2xSinRes_uid116_spix_uid43_fpTanPiTest_b : std_logic_vector (24 downto 0);
    signal mul2xSinRes_uid116_spix_uid43_fpTanPiTest_s1 : std_logic_vector (48 downto 0);
    signal mul2xSinRes_uid116_spix_uid43_fpTanPiTest_pr : UNSIGNED (48 downto 0);
    signal mul2xSinRes_uid116_spix_uid43_fpTanPiTest_q : std_logic_vector (48 downto 0);
    signal excRZero_uid134_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid134_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid134_spix_uid43_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid134_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc1_uid136_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc1_uid136_spix_uid43_fpTanPiTest_q : std_logic_vector (22 downto 0);
    signal oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc1_uid142_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal expRPostExc1_uid142_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal signComp_uid148_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal signComp_uid148_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal signComp_uid148_spix_uid43_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal signComp_uid148_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid149_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvYIsZero_uid149_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal signR_uid151_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid151_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid151_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_q : std_logic_vector (35 downto 0);
    signal fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc1_uid239_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal expRPostExc1_uid239_cpix_uid44_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal signRComp_uid247_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal signRComp_uid247_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal signRComp_uid247_cpix_uid44_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal signRComp_uid247_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal signR_uid249_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid249_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid249_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal signR_uid294_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid294_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid294_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expXmY_uid295_tpix_uid45_fpTanPiTest_a : std_logic_vector(8 downto 0);
    signal expXmY_uid295_tpix_uid45_fpTanPiTest_b : std_logic_vector(8 downto 0);
    signal expXmY_uid295_tpix_uid45_fpTanPiTest_o : std_logic_vector (8 downto 0);
    signal expXmY_uid295_tpix_uid45_fpTanPiTest_q : std_logic_vector (8 downto 0);
    signal expR_uid296_tpix_uid45_fpTanPiTest_a : std_logic_vector(10 downto 0);
    signal expR_uid296_tpix_uid45_fpTanPiTest_b : std_logic_vector(10 downto 0);
    signal expR_uid296_tpix_uid45_fpTanPiTest_o : std_logic_vector (10 downto 0);
    signal expR_uid296_tpix_uid45_fpTanPiTest_q : std_logic_vector (9 downto 0);
    signal fracYPostZ_uid303_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal fracYPostZ_uid303_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal z_uid306_tpix_uid45_fpTanPiTest_q : std_logic_vector (1 downto 0);
    signal zeroOverReg_uid326_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal zeroOverReg_uid326_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid328_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid328_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xRegOrZero_uid328_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid349_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid349_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1Pad16_uid354_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (15 downto 0);
    signal leftShiftStage0Idx2Pad32_uid357_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage0Idx3_uid360_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx1Pad4_uid363_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1Idx3Pad12_uid369_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage2Idx3Pad3_uid380_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (2 downto 0);
    signal mO_uid389_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector (28 downto 0);
    signal memoryC2_uid458_sinPiZTableGenerator_q : std_logic_vector(13 downto 0);
    signal memoryC2_uid577_sinPiZTableGenerator_q : std_logic_vector(13 downto 0);
    signal prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_a : std_logic_vector (23 downto 0);
    signal prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b : std_logic_vector (24 downto 0);
    signal prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_s1 : std_logic_vector (48 downto 0);
    signal prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_pr : UNSIGNED (48 downto 0);
    signal prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_q : std_logic_vector (48 downto 0);
    signal prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_a : std_logic_vector (25 downto 0);
    signal prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_s1 : std_logic_vector (49 downto 0);
    signal prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_pr : UNSIGNED (49 downto 0);
    signal prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_q : std_logic_vector (49 downto 0);
    signal prodXY_uid613_pT1_uid460_sinPiZPolyEval_a : std_logic_vector (13 downto 0);
    signal prodXY_uid613_pT1_uid460_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXY_uid613_pT1_uid460_sinPiZPolyEval_s1 : std_logic_vector (27 downto 0);
    signal prodXY_uid613_pT1_uid460_sinPiZPolyEval_pr : SIGNED (28 downto 0);
    signal prodXY_uid613_pT1_uid460_sinPiZPolyEval_q : std_logic_vector (27 downto 0);
    signal prodXY_uid616_pT2_uid466_sinPiZPolyEval_a : std_logic_vector (15 downto 0);
    signal prodXY_uid616_pT2_uid466_sinPiZPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid616_pT2_uid466_sinPiZPolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid616_pT2_uid466_sinPiZPolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid616_pT2_uid466_sinPiZPolyEval_q : std_logic_vector (38 downto 0);
    signal prodXY_uid619_pT1_uid579_sinPiZPolyEval_a : std_logic_vector (13 downto 0);
    signal prodXY_uid619_pT1_uid579_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXY_uid619_pT1_uid579_sinPiZPolyEval_s1 : std_logic_vector (27 downto 0);
    signal prodXY_uid619_pT1_uid579_sinPiZPolyEval_pr : SIGNED (28 downto 0);
    signal prodXY_uid619_pT1_uid579_sinPiZPolyEval_q : std_logic_vector (27 downto 0);
    signal prodXY_uid622_pT2_uid585_sinPiZPolyEval_a : std_logic_vector (15 downto 0);
    signal prodXY_uid622_pT2_uid585_sinPiZPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid622_pT2_uid585_sinPiZPolyEval_s1 : std_logic_vector (38 downto 0);
    signal prodXY_uid622_pT2_uid585_sinPiZPolyEval_pr : SIGNED (39 downto 0);
    signal prodXY_uid622_pT2_uid585_sinPiZPolyEval_q : std_logic_vector (38 downto 0);
    signal prodXY_uid625_pT1_uid598_invPE_a : std_logic_vector (11 downto 0);
    signal prodXY_uid625_pT1_uid598_invPE_b : std_logic_vector (11 downto 0);
    signal prodXY_uid625_pT1_uid598_invPE_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid625_pT1_uid598_invPE_pr : SIGNED (24 downto 0);
    signal prodXY_uid625_pT1_uid598_invPE_q : std_logic_vector (23 downto 0);
    signal prodXY_uid628_pT2_uid604_invPE_a : std_logic_vector (13 downto 0);
    signal prodXY_uid628_pT2_uid604_invPE_b : std_logic_vector (22 downto 0);
    signal prodXY_uid628_pT2_uid604_invPE_s1 : std_logic_vector (36 downto 0);
    signal prodXY_uid628_pT2_uid604_invPE_pr : SIGNED (37 downto 0);
    signal prodXY_uid628_pT2_uid604_invPE_q : std_logic_vector (36 downto 0);
    signal memoryC0_uid594_invTab_lutmem_reset0 : std_logic;
    signal memoryC0_uid594_invTab_lutmem_ia : std_logic_vector (30 downto 0);
    signal memoryC0_uid594_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC0_uid594_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC0_uid594_invTab_lutmem_iq : std_logic_vector (30 downto 0);
    signal memoryC0_uid594_invTab_lutmem_q : std_logic_vector (30 downto 0);
    signal memoryC1_uid595_invTab_lutmem_reset0 : std_logic;
    signal memoryC1_uid595_invTab_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid595_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC1_uid595_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC1_uid595_invTab_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid595_invTab_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid596_invTab_lutmem_reset0 : std_logic;
    signal memoryC2_uid596_invTab_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid596_invTab_lutmem_aa : std_logic_vector (8 downto 0);
    signal memoryC2_uid596_invTab_lutmem_ab : std_logic_vector (8 downto 0);
    signal memoryC2_uid596_invTab_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid596_invTab_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_2_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_3_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_4_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_5_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1_q : std_logic_vector (35 downto 0);
    signal reg_xRyHalf_uid133_spix_uid43_fpTanPiTest_0_to_xHalfRZI_uid135_spix_uid43_fpTanPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_oneMinusY_uid92_spix_uid43_fpTanPiTest_0_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_0_q : std_logic_vector (37 downto 0);
    signal reg_rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q : std_logic_vector (31 downto 0);
    signal reg_cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_5_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC2_uid458_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_q : std_logic_vector (13 downto 0);
    signal reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid461_uid464_sinPiZPolyEval_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_expHardCase_uid104_spix_uid43_fpTanPiTest_1_q : std_logic_vector (5 downto 0);
    signal reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_xIsInt_uid130_spix_uid43_fpTanPiTest_0_to_rZOrXInt_uid139_spix_uid43_fpTanPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_tanXIsX_uid28_fpTanPiTest_1_to_bigCond_uid233_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_xIsInt_uid228_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_yIsZero_uid90_spix_uid43_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_expXIsZero_uid10_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_4_q : std_logic_vector (0 downto 0);
    signal reg_xIsHalf_uid231_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_5_q : std_logic_vector (0 downto 0);
    signal reg_pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_0_to_oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_0_q : std_logic_vector (36 downto 0);
    signal reg_pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_0_to_z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_0_q : std_logic_vector (35 downto 0);
    signal reg_rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (31 downto 0);
    signal reg_cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (3 downto 0);
    signal reg_vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q : std_logic_vector (3 downto 0);
    signal reg_vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_2_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_3_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_4_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_5_q : std_logic_vector (34 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC2_uid577_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q : std_logic_vector (13 downto 0);
    signal reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_q : std_logic_vector (6 downto 0);
    signal reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q : std_logic_vector (15 downto 0);
    signal reg_s1_uid580_uid583_sinPiZPolyEval_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_q : std_logic_vector (23 downto 0);
    signal reg_fxpSinRes_uid213_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (24 downto 0);
    signal reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (5 downto 0);
    signal reg_expP_uid208_cpix_uid44_fpTanPiTest_0_to_expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid596_invTab_lutmem_0_to_prodXY_uid625_pT1_uid598_invPE_1_q : std_logic_vector (11 downto 0);
    signal reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q : std_logic_vector (13 downto 0);
    signal reg_s1_uid599_uid602_invPE_0_to_prodXY_uid628_pT2_uid604_invPE_1_q : std_logic_vector (22 downto 0);
    signal reg_invY_uid301_tpix_uid45_fpTanPiTest_0_to_prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_0_q : std_logic_vector (25 downto 0);
    signal reg_oFracXExt_uid307_tpix_uid45_fpTanPiTest_0_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_3_q : std_logic_vector (25 downto 0);
    signal reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1_q : std_logic_vector (10 downto 0);
    signal reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_q : std_logic_vector (0 downto 0);
    signal reg_exc_I_uid287_tpix_uid45_fpTanPiTest_0_to_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_concExc_uid339_tpix_uid45_fpTanPiTest_0_to_excREnc_uid340_tpix_uid45_fpTanPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q : std_logic_vector (22 downto 0);
    signal reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_expFracRSmallpixConc_uid37_fpTanPiTest_0_to_expRSmallpix2_uid39_fpTanPiTest_0_q : std_logic_vector (32 downto 0);
    signal reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q : std_logic_vector (31 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expRSmallpix_uid36_fpTanPiTest_a_q : std_logic_vector (7 downto 0);
    signal ld_signX_uid26_fpTanPiTest_b_to_join_uid41_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_expXIsMax_uid63_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracXIsZero_uid65_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_q_to_exc_R_uid72_spix_uid43_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_y_uid86_spix_uid43_fpTanPiTest_b_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_b_q : std_logic_vector (35 downto 0);
    signal ld_yBottom_uid95_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_c_q : std_logic_vector (34 downto 0);
    signal ld_oMyBottom_uid94_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_d_q : std_logic_vector (34 downto 0);
    signal ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_p_uid102_spix_uid43_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_multRightOp_uid115_spix_uid43_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_InvSinXIsX_uid127_spix_uid43_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_xIntExp_uid73_spix_uid43_fpTanPiTest_c_to_xIntYz_uid129_spix_uid43_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid10_fpTanPiTest_q_to_excRZero_uid134_spix_uid43_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xHalfRZI_uid135_spix_uid43_fpTanPiTest_q_to_fracRPostExc1_uid136_spix_uid43_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_rZOrXInt_uid139_spix_uid43_fpTanPiTest_q_to_expRPostExc1_uid142_spix_uid43_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xFrac_uid75_spix_uid43_fpTanPiTest_n_to_InvXFrac_uid146_spix_uid43_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_intXParity_uid85_spix_uid43_fpTanPiTest_b_to_signComp_uid148_spix_uid43_fpTanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid26_fpTanPiTest_b_to_signR_uid151_spix_uid43_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid151_spix_uid43_fpTanPiTest_q_to_R_uid152_spix_uid43_fpTanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_y_uid86_spix_uid43_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_c_q : std_logic_vector (35 downto 0);
    signal ld_tanXIsX_uid28_fpTanPiTest_c_to_InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_bigCond_uid233_cpix_uid44_fpTanPiTest_q_to_fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xIsHalf_uid231_cpix_uid44_fpTanPiTest_q_to_expRPostExc1_uid239_cpix_uid44_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_q_to_signRComp_uid247_cpix_uid44_fpTanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_q_to_signR_uid249_cpix_uid44_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid249_cpix_uid44_fpTanPiTest_q_to_R_uid250_cpix_uid44_fpTanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_fracYZero_uid261_tpix_uid45_fpTanPiTest_q_to_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_lOAdded_uid304_tpix_uid45_fpTanPiTest_q_to_oFracXExt_uid307_tpix_uid45_fpTanPiTest_b_q : std_logic_vector (23 downto 0);
    signal ld_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXRYZ_uid331_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXIYZ_uid333_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excXIYR_uid334_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q_to_concExc_uid339_tpix_uid45_fpTanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_d_q : std_logic_vector (22 downto 0);
    signal ld_reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_d_q : std_logic_vector (7 downto 0);
    signal ld_sRPostExc_uid350_tpix_uid45_fpTanPiTest_q_to_divR_uid351_tpix_uid45_fpTanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_b_q : std_logic_vector (18 downto 0);
    signal ld_vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_b_q : std_logic_vector (2 downto 0);
    signal ld_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_f_q : std_logic_vector (0 downto 0);
    signal ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_q : std_logic_vector (18 downto 0);
    signal ld_vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_q : std_logic_vector (2 downto 0);
    signal ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_q : std_logic_vector (34 downto 0);
    signal ld_reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_a_q : std_logic_vector (13 downto 0);
    signal ld_reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q_to_prodXY_uid625_pT1_uid598_invPE_a_q : std_logic_vector (11 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC1_uid595_invTab_lutmem_a_q : std_logic_vector (8 downto 0);
    signal ld_z_uid96_spix_uid43_fpTanPiTest_q_to_reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_a_q : std_logic_vector (34 downto 0);
    signal ld_yT1_uid459_sinPiZPolyEval_b_to_reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_a_q : std_logic_vector (13 downto 0);
    signal ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a_q : std_logic_vector (6 downto 0);
    signal ld_excRNaN_uid232_cpix_uid44_fpTanPiTest_q_to_reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid277_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid293_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_a_q : std_logic_vector (0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_inputreg_q : std_logic_vector (1 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_sticky_ena_q : signal is true;
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_eq : std_logic;
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_sticky_ena_q : signal is true;
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_reset0 : std_logic;
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_sticky_ena_q : signal is true;
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_reset0 : std_logic;
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_eq : std_logic;
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_sticky_ena_q : signal is true;
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_sticky_ena_q : signal is true;
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_sticky_ena_q : signal is true;
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_outputreg_q : std_logic_vector (7 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_sticky_ena_q : signal is true;
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_sticky_ena_q : signal is true;
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_ia : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_iq : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_q : std_logic_vector (5 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_sticky_ena_q : signal is true;
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_ia : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_iq : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_q : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_sticky_ena_q : signal is true;
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_eq : std_logic;
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_sticky_ena_q : signal is true;
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_sticky_ena_q : signal is true;
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_sticky_ena_q : signal is true;
    signal ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_inputreg_q : std_logic_vector (18 downto 0);
    signal ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_inputreg_q : std_logic_vector (34 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_sticky_ena_q : signal is true;
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_ia : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_iq : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_q : std_logic_vector (15 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_ia : std_logic_vector (13 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_iq : std_logic_vector (13 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_q : std_logic_vector (13 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_sticky_ena_q : signal is true;
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_inputreg_q : std_logic_vector (8 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_ia : std_logic_vector (8 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_iq : std_logic_vector (8 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_q : std_logic_vector (8 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_sticky_ena_q : signal is true;
    signal ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a_inputreg_q : std_logic_vector (6 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_reset0 : std_logic;
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_eq : std_logic;
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_sticky_ena_q : signal is true;
    signal yIsZero_uid87_spix_uid43_fpTanPiTest_a : std_logic_vector(35 downto 0);
    signal yIsZero_uid87_spix_uid43_fpTanPiTest_b : std_logic_vector(35 downto 0);
    signal yIsZero_uid87_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_a : std_logic_vector(40 downto 0);
    signal cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_b : std_logic_vector(40 downto 0);
    signal cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_o : std_logic_vector (40 downto 0);
    signal cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_cin : std_logic_vector (0 downto 0);
    signal cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_c : std_logic_vector (0 downto 0);
    signal xHalfRZI_uid135_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xHalfRZI_uid135_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xHalfRZI_uid135_spix_uid43_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal xHalfRZI_uid135_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_q : std_logic_vector (35 downto 0);
    signal bigCond_uid233_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal bigCond_uid233_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal bigCond_uid233_cpix_uid44_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal bigCond_uid233_cpix_uid44_fpTanPiTest_d : std_logic_vector(0 downto 0);
    signal bigCond_uid233_cpix_uid44_fpTanPiTest_f : std_logic_vector(0 downto 0);
    signal bigCond_uid233_cpix_uid44_fpTanPiTest_g : std_logic_vector(0 downto 0);
    signal bigCond_uid233_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expUdf_uid322_tpix_uid45_fpTanPiTest_a : std_logic_vector(13 downto 0);
    signal expUdf_uid322_tpix_uid45_fpTanPiTest_b : std_logic_vector(13 downto 0);
    signal expUdf_uid322_tpix_uid45_fpTanPiTest_o : std_logic_vector (13 downto 0);
    signal expUdf_uid322_tpix_uid45_fpTanPiTest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid322_tpix_uid45_fpTanPiTest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid325_tpix_uid45_fpTanPiTest_a : std_logic_vector(13 downto 0);
    signal expOvf_uid325_tpix_uid45_fpTanPiTest_b : std_logic_vector(13 downto 0);
    signal expOvf_uid325_tpix_uid45_fpTanPiTest_o : std_logic_vector (13 downto 0);
    signal expOvf_uid325_tpix_uid45_fpTanPiTest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid325_tpix_uid45_fpTanPiTest_n : std_logic_vector (0 downto 0);
    signal InvFracXIsZero_uid67_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid67_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expXP1_uid105_spix_uid43_fpTanPiTest_a : std_logic_vector(8 downto 0);
    signal expXP1_uid105_spix_uid43_fpTanPiTest_b : std_logic_vector(8 downto 0);
    signal expXP1_uid105_spix_uid43_fpTanPiTest_o : std_logic_vector (8 downto 0);
    signal expXP1_uid105_spix_uid43_fpTanPiTest_q : std_logic_vector (8 downto 0);
    signal InvSinXIsX_uid127_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvSinXIsX_uid127_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvXIntExp_uid131_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvXIntExp_uid131_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvXFrac_uid146_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvXFrac_uid146_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal lOAdded_uid304_tpix_uid45_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal join_uid89_spix_uid43_fpTanPiTest_q : std_logic_vector (35 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal exp_uid9_fpTanPiTest_in : std_logic_vector (30 downto 0);
    signal exp_uid9_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid25_fpTanPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid25_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal signX_uid26_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid26_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid10_fpTanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpTanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal tanXIsX_uid28_fpTanPiTest_a : std_logic_vector(10 downto 0);
    signal tanXIsX_uid28_fpTanPiTest_b : std_logic_vector(10 downto 0);
    signal tanXIsX_uid28_fpTanPiTest_o : std_logic_vector (10 downto 0);
    signal tanXIsX_uid28_fpTanPiTest_cin : std_logic_vector (0 downto 0);
    signal tanXIsX_uid28_fpTanPiTest_c : std_logic_vector (0 downto 0);
    signal expRSmallpix2_uid39_fpTanPiTest_a : std_logic_vector(33 downto 0);
    signal expRSmallpix2_uid39_fpTanPiTest_b : std_logic_vector(33 downto 0);
    signal expRSmallpix2_uid39_fpTanPiTest_o : std_logic_vector (33 downto 0);
    signal expRSmallpix2_uid39_fpTanPiTest_q : std_logic_vector (33 downto 0);
    signal expXIsMax_uid63_spix_uid43_fpTanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid63_spix_uid43_fpTanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid63_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid65_spix_uid43_fpTanPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid65_spix_uid43_fpTanPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid65_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid66_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid66_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid66_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid68_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid68_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid68_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal xIntExp_uid73_spix_uid43_fpTanPiTest_a : std_logic_vector(10 downto 0);
    signal xIntExp_uid73_spix_uid43_fpTanPiTest_b : std_logic_vector(10 downto 0);
    signal xIntExp_uid73_spix_uid43_fpTanPiTest_o : std_logic_vector (10 downto 0);
    signal xIntExp_uid73_spix_uid43_fpTanPiTest_cin : std_logic_vector (0 downto 0);
    signal xIntExp_uid73_spix_uid43_fpTanPiTest_c : std_logic_vector (0 downto 0);
    signal xFrac_uid75_spix_uid43_fpTanPiTest_a : std_logic_vector(10 downto 0);
    signal xFrac_uid75_spix_uid43_fpTanPiTest_b : std_logic_vector(10 downto 0);
    signal xFrac_uid75_spix_uid43_fpTanPiTest_o : std_logic_vector (10 downto 0);
    signal xFrac_uid75_spix_uid43_fpTanPiTest_cin : std_logic_vector (0 downto 0);
    signal xFrac_uid75_spix_uid43_fpTanPiTest_n : std_logic_vector (0 downto 0);
    signal sinXIsX_uid77_spix_uid43_fpTanPiTest_a : std_logic_vector(10 downto 0);
    signal sinXIsX_uid77_spix_uid43_fpTanPiTest_b : std_logic_vector(10 downto 0);
    signal sinXIsX_uid77_spix_uid43_fpTanPiTest_o : std_logic_vector (10 downto 0);
    signal sinXIsX_uid77_spix_uid43_fpTanPiTest_cin : std_logic_vector (0 downto 0);
    signal sinXIsX_uid77_spix_uid43_fpTanPiTest_c : std_logic_vector (0 downto 0);
    signal shiftValue_uid80_spix_uid43_fpTanPiTest_a : std_logic_vector(8 downto 0);
    signal shiftValue_uid80_spix_uid43_fpTanPiTest_b : std_logic_vector(8 downto 0);
    signal shiftValue_uid80_spix_uid43_fpTanPiTest_o : std_logic_vector (8 downto 0);
    signal shiftValue_uid80_spix_uid43_fpTanPiTest_q : std_logic_vector (8 downto 0);
    signal yIsZero_uid90_spix_uid43_fpTanPiTest_a : std_logic_vector(35 downto 0);
    signal yIsZero_uid90_spix_uid43_fpTanPiTest_b : std_logic_vector(35 downto 0);
    signal yIsZero_uid90_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal oneMinusY_uid92_spix_uid43_fpTanPiTest_a : std_logic_vector(37 downto 0);
    signal oneMinusY_uid92_spix_uid43_fpTanPiTest_b : std_logic_vector(37 downto 0);
    signal oneMinusY_uid92_spix_uid43_fpTanPiTest_o : std_logic_vector (37 downto 0);
    signal oneMinusY_uid92_spix_uid43_fpTanPiTest_q : std_logic_vector (37 downto 0);
    signal z_uid96_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal z_uid96_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal expHardCase_uid104_spix_uid43_fpTanPiTest_a : std_logic_vector(8 downto 0);
    signal expHardCase_uid104_spix_uid43_fpTanPiTest_b : std_logic_vector(8 downto 0);
    signal expHardCase_uid104_spix_uid43_fpTanPiTest_o : std_logic_vector (8 downto 0);
    signal expHardCase_uid104_spix_uid43_fpTanPiTest_q : std_logic_vector (8 downto 0);
    signal yZSinXNX_uid128_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal yZSinXNX_uid128_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal yZSinXNX_uid128_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal xIntYz_uid129_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xIntYz_uid129_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xIntYz_uid129_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid138_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc_uid138_spix_uid43_fpTanPiTest_q : std_logic_vector (22 downto 0);
    signal rZOrXInt_uid139_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal rZOrXInt_uid139_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal rZOrXInt_uid139_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excRIoN_uid143_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excRIoN_uid143_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excRIoN_uid143_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expRPostExc_uid145_spix_uid43_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid145_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal yZSC_uid150_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal yZSC_uid150_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal yZSC_uid150_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_a : std_logic_vector(35 downto 0);
    signal fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_b : std_logic_vector(35 downto 0);
    signal fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_a : std_logic_vector(37 downto 0);
    signal oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_b : std_logic_vector(37 downto 0);
    signal oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_o : std_logic_vector (37 downto 0);
    signal oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_q : std_logic_vector (37 downto 0);
    signal z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_a : std_logic_vector(36 downto 0);
    signal z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_b : std_logic_vector(36 downto 0);
    signal z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_o : std_logic_vector (36 downto 0);
    signal z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal expHardCase_uid207_cpix_uid44_fpTanPiTest_a : std_logic_vector(8 downto 0);
    signal expHardCase_uid207_cpix_uid44_fpTanPiTest_b : std_logic_vector(8 downto 0);
    signal expHardCase_uid207_cpix_uid44_fpTanPiTest_o : std_logic_vector (8 downto 0);
    signal expHardCase_uid207_cpix_uid44_fpTanPiTest_q : std_logic_vector (8 downto 0);
    signal fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid232_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid232_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid232_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid236_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc_uid236_cpix_uid44_fpTanPiTest_q : std_logic_vector (22 downto 0);
    signal rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expRPostExc_uid243_cpix_uid44_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid243_cpix_uid44_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid330_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid330_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid330_tpix_uid45_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid330_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid332_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid332_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid332_tpix_uid45_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal excXRYROvf_uid332_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid335_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid335_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid335_tpix_uid45_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid335_tpix_uid45_fpTanPiTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid335_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid340_tpix_uid45_fpTanPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid344_tpix_uid45_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid344_tpix_uid45_fpTanPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid348_tpix_uid45_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid348_tpix_uid45_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal sRPostExc_uid350_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal sRPostExc_uid350_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal sRPostExc_uid350_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal memoryC0_uid456_sinPiZTableGenerator_q : std_logic_vector(28 downto 0);
    signal memoryC1_uid457_sinPiZTableGenerator_q : std_logic_vector(20 downto 0);
    signal vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector (15 downto 0);
    signal vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal memoryC0_uid575_sinPiZTableGenerator_q : std_logic_vector(28 downto 0);
    signal memoryC1_uid576_sinPiZTableGenerator_q : std_logic_vector(20 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal fsel_uid31_fpTanPiTest_in : std_logic_vector (47 downto 0);
    signal fsel_uid31_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal fracRSmallPiXH_uid32_fpTanPiTest_in : std_logic_vector (46 downto 0);
    signal fracRSmallPiXH_uid32_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal fracRSmallPiXL_uid33_fpTanPiTest_in : std_logic_vector (45 downto 0);
    signal fracRSmallPiXL_uid33_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal normBit_uid117_spix_uid43_fpTanPiTest_in : std_logic_vector (48 downto 0);
    signal normBit_uid117_spix_uid43_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal highRes_uid118_spix_uid43_fpTanPiTest_in : std_logic_vector (47 downto 0);
    signal highRes_uid118_spix_uid43_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal lowRes_uid119_spix_uid43_fpTanPiTest_in : std_logic_vector (46 downto 0);
    signal lowRes_uid119_spix_uid43_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal oFracXExt_uid307_tpix_uid45_fpTanPiTest_q : std_logic_vector (25 downto 0);
    signal leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_in : std_logic_vector (48 downto 0);
    signal prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid611_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_in : std_logic_vector (49 downto 0);
    signal prodXYTruncFR_uid611_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_b : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid614_pT1_uid460_sinPiZPolyEval_in : std_logic_vector (27 downto 0);
    signal prodXYTruncFR_uid614_pT1_uid460_sinPiZPolyEval_b : std_logic_vector (14 downto 0);
    signal prodXYTruncFR_uid617_pT2_uid466_sinPiZPolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid617_pT2_uid466_sinPiZPolyEval_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid620_pT1_uid579_sinPiZPolyEval_in : std_logic_vector (27 downto 0);
    signal prodXYTruncFR_uid620_pT1_uid579_sinPiZPolyEval_b : std_logic_vector (14 downto 0);
    signal prodXYTruncFR_uid623_pT2_uid585_sinPiZPolyEval_in : std_logic_vector (38 downto 0);
    signal prodXYTruncFR_uid623_pT2_uid585_sinPiZPolyEval_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid626_pT1_uid598_invPE_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid626_pT1_uid598_invPE_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid629_pT2_uid604_invPE_in : std_logic_vector (36 downto 0);
    signal prodXYTruncFR_uid629_pT2_uid604_invPE_b : std_logic_vector (23 downto 0);
    signal divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_q : std_logic_vector (25 downto 0);
    signal expRSmallpix_uid36_fpTanPiTest_a : std_logic_vector(8 downto 0);
    signal expRSmallpix_uid36_fpTanPiTest_b : std_logic_vector(8 downto 0);
    signal expRSmallpix_uid36_fpTanPiTest_o : std_logic_vector (8 downto 0);
    signal expRSmallpix_uid36_fpTanPiTest_q : std_logic_vector (8 downto 0);
    signal R_uid152_spix_uid43_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal R_uid250_cpix_uid44_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal concExc_uid339_tpix_uid45_fpTanPiTest_q : std_logic_vector (2 downto 0);
    signal divR_uid351_tpix_uid45_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal tanPiXOutMux_uid47_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal tanPiXOutMux_uid47_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_a : std_logic_vector(5 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_b : std_logic_vector(5 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_a : std_logic_vector(3 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_b : std_logic_vector(3 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_a : std_logic_vector(2 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_b : std_logic_vector(2 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_q : std_logic_vector(0 downto 0);
    signal expXP1R_uid106_spix_uid43_fpTanPiTest_in : std_logic_vector (7 downto 0);
    signal expXP1R_uid106_spix_uid43_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal oFracX_uid27_uid27_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal join_uid46_fpTanPiTest_q : std_logic_vector (1 downto 0);
    signal InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expFracRSmallPiXR_uid40_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal expFracRSmallPiXR_uid40_fpTanPiTest_b : std_logic_vector (30 downto 0);
    signal InvExc_I_uid70_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid70_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid69_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid69_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid83_spix_uid43_fpTanPiTest_in : std_logic_vector (5 downto 0);
    signal fxpShifterBits_uid83_spix_uid43_fpTanPiTest_b : std_logic_vector (5 downto 0);
    signal InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal oMyBottom_uid94_spix_uid43_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal oMyBottom_uid94_spix_uid43_fpTanPiTest_b : std_logic_vector (34 downto 0);
    signal zAddr_uid110_spix_uid43_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal zAddr_uid110_spix_uid43_fpTanPiTest_b : std_logic_vector (6 downto 0);
    signal zPPolyEval_uid111_spix_uid43_fpTanPiTest_in : std_logic_vector (27 downto 0);
    signal zPPolyEval_uid111_spix_uid43_fpTanPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (2 downto 0);
    signal vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (2 downto 0);
    signal X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (18 downto 0);
    signal X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (18 downto 0);
    signal expHardCaseR_uid107_spix_uid43_fpTanPiTest_in : std_logic_vector (7 downto 0);
    signal expHardCaseR_uid107_spix_uid43_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal oMFxpXFrac_uid197_cpix_uid44_fpTanPiTest_in : std_logic_vector (35 downto 0);
    signal oMFxpXFrac_uid197_cpix_uid44_fpTanPiTest_b : std_logic_vector (35 downto 0);
    signal z_uid202_cpix_uid44_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal z_uid202_cpix_uid44_fpTanPiTest_b : std_logic_vector (34 downto 0);
    signal expP_uid208_cpix_uid44_fpTanPiTest_in : std_logic_vector (7 downto 0);
    signal expP_uid208_cpix_uid44_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal LeftShiftStage135dto0_uid375_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (35 downto 0);
    signal LeftShiftStage135dto0_uid375_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage134dto0_uid378_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal LeftShiftStage134dto0_uid378_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (34 downto 0);
    signal LeftShiftStage133dto0_uid381_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage133dto0_uid381_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (33 downto 0);
    signal rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid403_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid403_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid415_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid415_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage133dto0_uid445_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage133dto0_uid445_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (33 downto 0);
    signal LeftShiftStage132dto0_uid448_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (32 downto 0);
    signal LeftShiftStage132dto0_uid448_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (32 downto 0);
    signal LeftShiftStage131dto0_uid451_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal LeftShiftStage131dto0_uid451_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (31 downto 0);
    signal rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid522_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (7 downto 0);
    signal vStage_uid522_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid534_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (1 downto 0);
    signal vStage_uid534_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal LeftShiftStage133dto0_uid564_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage133dto0_uid564_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (33 downto 0);
    signal LeftShiftStage132dto0_uid567_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (32 downto 0);
    signal LeftShiftStage132dto0_uid567_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (32 downto 0);
    signal LeftShiftStage131dto0_uid570_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal LeftShiftStage131dto0_uid570_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (31 downto 0);
    signal fracRSmallPiXNorm_uid34_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRSmallPiXNorm_uid34_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal rndExpUpdate_uid122_uid123_spix_uid43_fpTanPiTest_q : std_logic_vector (24 downto 0);
    signal normBit_uid215_cpix_uid44_fpTanPiTest_in : std_logic_vector (25 downto 0);
    signal normBit_uid215_cpix_uid44_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal highRes_uid216_cpix_uid44_fpTanPiTest_in : std_logic_vector (24 downto 0);
    signal highRes_uid216_cpix_uid44_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal lowRes_uid217_cpix_uid44_fpTanPiTest_in : std_logic_vector (23 downto 0);
    signal lowRes_uid217_cpix_uid44_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal lowRangeB_uid461_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid461_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid462_sinPiZPolyEval_in : std_logic_vector (14 downto 0);
    signal highBBits_uid462_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal lowRangeB_uid467_sinPiZPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid467_sinPiZPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid468_sinPiZPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid468_sinPiZPolyEval_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid580_sinPiZPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid580_sinPiZPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid581_sinPiZPolyEval_in : std_logic_vector (14 downto 0);
    signal highBBits_uid581_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal lowRangeB_uid586_sinPiZPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid586_sinPiZPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid587_sinPiZPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid587_sinPiZPolyEval_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid599_invPE_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid599_invPE_b : std_logic_vector (0 downto 0);
    signal highBBits_uid600_invPE_in : std_logic_vector (12 downto 0);
    signal highBBits_uid600_invPE_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid605_invPE_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid605_invPE_b : std_logic_vector (1 downto 0);
    signal highBBits_uid606_invPE_in : std_logic_vector (23 downto 0);
    signal highBBits_uid606_invPE_b : std_logic_vector (21 downto 0);
    signal norm_uid310_tpix_uid45_fpTanPiTest_in : std_logic_vector (25 downto 0);
    signal norm_uid310_tpix_uid45_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal divValPreNormHigh_uid311_tpix_uid45_fpTanPiTest_in : std_logic_vector (24 downto 0);
    signal divValPreNormHigh_uid311_tpix_uid45_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal divValPreNormLow_uid312_tpix_uid45_fpTanPiTest_in : std_logic_vector (23 downto 0);
    signal divValPreNormLow_uid312_tpix_uid45_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal expFracRSmallpixConc_uid37_fpTanPiTest_q : std_logic_vector (32 downto 0);
    signal expX_uid255_tpix_uid45_fpTanPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid255_tpix_uid45_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid256_tpix_uid45_fpTanPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid256_tpix_uid45_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal signX_uid257_tpix_uid45_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid257_tpix_uid45_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal expY_uid258_tpix_uid45_fpTanPiTest_in : std_logic_vector (30 downto 0);
    signal expY_uid258_tpix_uid45_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal fracY_uid259_tpix_uid45_fpTanPiTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid259_tpix_uid45_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal signY_uid260_tpix_uid45_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal signY_uid260_tpix_uid45_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal fracYAddr_uid298_tpix_uid45_fpTanPiTest_in : std_logic_vector (22 downto 0);
    signal fracYAddr_uid298_tpix_uid45_fpTanPiTest_b : std_logic_vector (8 downto 0);
    signal yPE_uid299_tpix_uid45_fpTanPiTest_in : std_logic_vector (13 downto 0);
    signal yPE_uid299_tpix_uid45_fpTanPiTest_b : std_logic_vector (13 downto 0);
    signal extendedFracX_uid82_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal join_uid41_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal exc_R_uid72_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid72_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid72_spix_uid43_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid72_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel5Dto4_uid361_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid361_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal yT1_uid459_sinPiZPolyEval_in : std_logic_vector (15 downto 0);
    signal yT1_uid459_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal zAddr_uid210_cpix_uid44_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal zAddr_uid210_cpix_uid44_fpTanPiTest_b : std_logic_vector (6 downto 0);
    signal zPPolyEval_uid211_cpix_uid44_fpTanPiTest_in : std_logic_vector (27 downto 0);
    signal zPPolyEval_uid211_cpix_uid44_fpTanPiTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (31 downto 0);
    signal vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (2 downto 0);
    signal vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (2 downto 0);
    signal X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (18 downto 0);
    signal X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (18 downto 0);
    signal leftShiftStage2Idx1_uid376_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage2Idx2_uid379_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage2Idx3_uid382_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2Idx1_uid446_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2Idx2_uid449_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2Idx3_uid452_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage2Idx1_uid565_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2Idx2_uid568_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage2Idx3_uid571_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal expFracComp_uid124_spix_uid43_fpTanPiTest_a : std_logic_vector(32 downto 0);
    signal expFracComp_uid124_spix_uid43_fpTanPiTest_b : std_logic_vector(32 downto 0);
    signal expFracComp_uid124_spix_uid43_fpTanPiTest_o : std_logic_vector (32 downto 0);
    signal expFracComp_uid124_spix_uid43_fpTanPiTest_q : std_logic_vector (32 downto 0);
    signal fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal rndExpUpdate_uid220_uid221_cpix_uid44_fpTanPiTest_q : std_logic_vector (24 downto 0);
    signal sumAHighB_uid463_sinPiZPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid463_sinPiZPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid463_sinPiZPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid463_sinPiZPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid469_sinPiZPolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid469_sinPiZPolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid469_sinPiZPolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid469_sinPiZPolyEval_q : std_logic_vector (29 downto 0);
    signal sumAHighB_uid582_sinPiZPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid582_sinPiZPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid582_sinPiZPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid582_sinPiZPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid588_sinPiZPolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid588_sinPiZPolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid588_sinPiZPolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid588_sinPiZPolyEval_q : std_logic_vector (29 downto 0);
    signal sumAHighB_uid601_invPE_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid601_invPE_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid601_invPE_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid601_invPE_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid607_invPE_a : std_logic_vector(31 downto 0);
    signal sumAHighB_uid607_invPE_b : std_logic_vector(31 downto 0);
    signal sumAHighB_uid607_invPE_o : std_logic_vector (31 downto 0);
    signal sumAHighB_uid607_invPE_q : std_logic_vector (31 downto 0);
    signal normFracRnd_uid313_tpix_uid45_fpTanPiTest_s : std_logic_vector (0 downto 0);
    signal normFracRnd_uid313_tpix_uid45_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal rndOp_uid316_tpix_uid45_fpTanPiTest_q : std_logic_vector (24 downto 0);
    signal expXIsZero_uid266_tpix_uid45_fpTanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid266_tpix_uid45_fpTanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid266_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid268_tpix_uid45_fpTanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid268_tpix_uid45_fpTanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid268_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid270_tpix_uid45_fpTanPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid270_tpix_uid45_fpTanPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid270_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid282_tpix_uid45_fpTanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid282_tpix_uid45_fpTanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid282_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid284_tpix_uid45_fpTanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid284_tpix_uid45_fpTanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid284_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fracYZero_uid261_tpix_uid45_fpTanPiTest_a : std_logic_vector(22 downto 0);
    signal fracYZero_uid261_tpix_uid45_fpTanPiTest_b : std_logic_vector(22 downto 0);
    signal fracYZero_uid261_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid286_tpix_uid45_fpTanPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid286_tpix_uid45_fpTanPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid286_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid597_invPE_in : std_logic_vector (13 downto 0);
    signal yT1_uid597_invPE_b : std_logic_vector (11 downto 0);
    signal X20dto0_uid355_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (20 downto 0);
    signal X20dto0_uid355_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (20 downto 0);
    signal X4dto0_uid358_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (4 downto 0);
    signal X4dto0_uid358_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (4 downto 0);
    signal xIsInt_uid130_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xIsInt_uid130_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xIsInt_uid130_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal xRyHalf_uid133_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xRyHalf_uid133_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xRyHalf_uid133_spix_uid43_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal xRyHalf_uid133_spix_uid43_fpTanPiTest_d : std_logic_vector(0 downto 0);
    signal xRyHalf_uid133_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal xIsInt_uid228_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xIsInt_uid228_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xIsInt_uid228_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal xIsHalf_uid231_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xIsHalf_uid231_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xIsHalf_uid231_cpix_uid44_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal xIsHalf_uid231_cpix_uid44_fpTanPiTest_d : std_logic_vector(0 downto 0);
    signal xIsHalf_uid231_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal yT1_uid578_sinPiZPolyEval_in : std_logic_vector (15 downto 0);
    signal yT1_uid578_sinPiZPolyEval_b : std_logic_vector (13 downto 0);
    signal cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid419_lzcZ_uid98_spix_uid43_fpTanPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid419_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (3 downto 0);
    signal vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid538_lzcZ_uid204_cpix_uid44_fpTanPiTest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid538_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal fracRComp_uid125_spix_uid43_fpTanPiTest_in : std_logic_vector (23 downto 0);
    signal fracRComp_uid125_spix_uid43_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal expRComp_uid126_spix_uid43_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal expRComp_uid126_spix_uid43_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_q : std_logic_vector (31 downto 0);
    signal expFracComp_uid222_cpix_uid44_fpTanPiTest_a : std_logic_vector(32 downto 0);
    signal expFracComp_uid222_cpix_uid44_fpTanPiTest_b : std_logic_vector(32 downto 0);
    signal expFracComp_uid222_cpix_uid44_fpTanPiTest_o : std_logic_vector (32 downto 0);
    signal expFracComp_uid222_cpix_uid44_fpTanPiTest_q : std_logic_vector (32 downto 0);
    signal s1_uid461_uid464_sinPiZPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid467_uid470_sinPiZPolyEval_q : std_logic_vector (31 downto 0);
    signal s1_uid580_uid583_sinPiZPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid586_uid589_sinPiZPolyEval_q : std_logic_vector (31 downto 0);
    signal s1_uid599_uid602_invPE_q : std_logic_vector (22 downto 0);
    signal s2_uid605_uid608_invPE_q : std_logic_vector (33 downto 0);
    signal expFracRnd_uid314_tpix_uid45_fpTanPiTest_q : std_logic_vector (33 downto 0);
    signal expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_a : std_logic_vector(35 downto 0);
    signal expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_b : std_logic_vector(35 downto 0);
    signal expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_o : std_logic_vector (35 downto 0);
    signal expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal InvExpXIsZero_uid276_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid276_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excXZYZ_uid336_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excXZYZ_uid336_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excXZYZ_uid336_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid271_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid271_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid271_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid272_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid272_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid292_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid292_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excXIYZ_uid333_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excXIYZ_uid333_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excXIYZ_uid333_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid287_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid287_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid287_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid288_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid288_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx1_uid356_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx2_uid359_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal InvXIsInt_uid147_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvXIsInt_uid147_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal join_uid144_spix_uid43_fpTanPiTest_q : std_logic_vector (1 downto 0);
    signal xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal intXParity_uid85_spix_uid43_fpTanPiTest_in : std_logic_vector (36 downto 0);
    signal intXParity_uid85_spix_uid43_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal y_uid86_spix_uid43_fpTanPiTest_in : std_logic_vector (35 downto 0);
    signal y_uid86_spix_uid43_fpTanPiTest_b : std_logic_vector (35 downto 0);
    signal vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal alignedZLow_uid100_spix_uid43_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal alignedZLow_uid100_spix_uid43_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal alignedZLow_uid206_cpix_uid44_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal alignedZLow_uid206_cpix_uid44_fpTanPiTest_b : std_logic_vector (23 downto 0);
    signal fracRComp_uid223_cpix_uid44_fpTanPiTest_in : std_logic_vector (23 downto 0);
    signal fracRComp_uid223_cpix_uid44_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal expRComp_uid224_cpix_uid44_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal expRComp_uid224_cpix_uid44_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal fxpSinRes_uid113_spix_uid43_fpTanPiTest_in : std_logic_vector (29 downto 0);
    signal fxpSinRes_uid113_spix_uid43_fpTanPiTest_b : std_logic_vector (24 downto 0);
    signal fxpSinRes_uid213_cpix_uid44_fpTanPiTest_in : std_logic_vector (29 downto 0);
    signal fxpSinRes_uid213_cpix_uid44_fpTanPiTest_b : std_logic_vector (24 downto 0);
    signal invY_uid301_tpix_uid45_fpTanPiTest_in : std_logic_vector (30 downto 0);
    signal invY_uid301_tpix_uid45_fpTanPiTest_b : std_logic_vector (25 downto 0);
    signal invYO_uid302_tpix_uid45_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal invYO_uid302_tpix_uid45_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal fracRPreExc_uid319_tpix_uid45_fpTanPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid319_tpix_uid45_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal excRPreExc_uid320_tpix_uid45_fpTanPiTest_in : std_logic_vector (31 downto 0);
    signal excRPreExc_uid320_tpix_uid45_fpTanPiTest_b : std_logic_vector (7 downto 0);
    signal expRExt_uid321_tpix_uid45_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal expRExt_uid321_tpix_uid45_fpTanPiTest_b : std_logic_vector (10 downto 0);
    signal InvExc_I_uid275_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid275_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excXIYI_uid337_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excXIYI_uid337_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excXIYI_uid337_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid273_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid273_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid273_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid291_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid291_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid289_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid289_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid289_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal join_uid242_cpix_uid44_fpTanPiTest_q : std_logic_vector (1 downto 0);
    signal yBottom_uid95_spix_uid43_fpTanPiTest_in : std_logic_vector (34 downto 0);
    signal yBottom_uid95_spix_uid43_fpTanPiTest_b : std_logic_vector (34 downto 0);
    signal FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_in : std_logic_vector (35 downto 0);
    signal FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b : std_logic_vector (0 downto 0);
    signal r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_q : std_logic_vector (5 downto 0);
    signal pHardCase_uid101_spix_uid43_fpTanPiTest_q : std_logic_vector (23 downto 0);
    signal r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_q : std_logic_vector (5 downto 0);
    signal excRNaN_uid338_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid338_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid338_tpix_uid45_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid338_tpix_uid45_fpTanPiTest_d : std_logic_vector(0 downto 0);
    signal excRNaN_uid338_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid274_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid274_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid290_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid290_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal LeftShiftStage032dto0_uid364_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (32 downto 0);
    signal LeftShiftStage032dto0_uid364_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (32 downto 0);
    signal LeftShiftStage028dto0_uid367_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (28 downto 0);
    signal LeftShiftStage028dto0_uid367_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (28 downto 0);
    signal LeftShiftStage024dto0_uid370_fixedPointX_uid84_spix_uid43_fpTanPiTest_in : std_logic_vector (24 downto 0);
    signal LeftShiftStage024dto0_uid370_fixedPointX_uid84_spix_uid43_fpTanPiTest_b : std_logic_vector (24 downto 0);
    signal xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel5Dto4_uid431_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid431_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel5Dto4_uid550_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (5 downto 0);
    signal leftShiftStageSel5Dto4_uid550_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (1 downto 0);
    signal exc_R_uid277_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid277_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid277_tpix_uid45_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid277_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid293_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid293_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid293_tpix_uid45_fpTanPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid293_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal excXRYZ_uid331_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excXRYZ_uid331_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excXRYZ_uid331_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal excXIYR_uid334_tpix_uid45_fpTanPiTest_a : std_logic_vector(0 downto 0);
    signal excXIYR_uid334_tpix_uid45_fpTanPiTest_b : std_logic_vector(0 downto 0);
    signal excXIYR_uid334_tpix_uid45_fpTanPiTest_q : std_logic_vector(0 downto 0);
    signal LeftShiftStage030dto0_uid434_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (30 downto 0);
    signal LeftShiftStage030dto0_uid434_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (30 downto 0);
    signal LeftShiftStage026dto0_uid437_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (26 downto 0);
    signal LeftShiftStage026dto0_uid437_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (26 downto 0);
    signal LeftShiftStage022dto0_uid440_alignedZ_uid99_spix_uid43_fpTanPiTest_in : std_logic_vector (22 downto 0);
    signal LeftShiftStage022dto0_uid440_alignedZ_uid99_spix_uid43_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal LeftShiftStage030dto0_uid553_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (30 downto 0);
    signal LeftShiftStage030dto0_uid553_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (30 downto 0);
    signal LeftShiftStage026dto0_uid556_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (26 downto 0);
    signal LeftShiftStage026dto0_uid556_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (26 downto 0);
    signal LeftShiftStage022dto0_uid559_alignedZ_uid205_cpix_uid44_fpTanPiTest_in : std_logic_vector (22 downto 0);
    signal LeftShiftStage022dto0_uid559_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : std_logic_vector (22 downto 0);
    signal leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
    signal leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_q : std_logic_vector (34 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable(LOGICAL,1446)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_a <= en;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q <= not ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_a;

	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor(LOGICAL,1471)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_b <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_sticky_ena_q;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_q <= not (ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_a or ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_b);

	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_mem_top(CONSTANT,1467)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_mem_top_q <= "011111";

	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp(LOGICAL,1468)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_a <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_mem_top_q;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_q);
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_q <= "1" when ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_a = ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_b else "0";

	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmpReg(REG,1469)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmpReg_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_sticky_ena(REG,1472)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_nor_q = "1") THEN
                ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_sticky_ena_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd(LOGICAL,1473)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_a <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_sticky_ena_q;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_b <= en;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_a and ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_b;

	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt(COUNTER,1463)
    -- every=1, low=0, high=31, step=1, init=1
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_i <= TO_UNSIGNED(1,5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_i <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_i,5));


	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdreg(REG,1464)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdreg_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux(MUX,1465)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_s <= en;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux: PROCESS (ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_s, ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdreg_q, ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_q)
    BEGIN
            CASE ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_s IS
                  WHEN "0" => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdreg_q;
                  WHEN "1" => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdcnt_q;
                  WHEN OTHERS => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem(DUALMEM,1462)
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_reset0 <= areset;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_ia <= a;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_aa <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdreg_q;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_ab <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_rdmux_q;
    ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 32,
        width_b => 32,
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
        clocken1 => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_iq,
        address_a => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_aa,
        data_a => ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_ia
    );
        ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_iq(31 downto 0);

	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor(LOGICAL,1459)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_b <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_sticky_ena_q;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_q <= not (ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_a or ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_b);

	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_mem_top(CONSTANT,1455)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_mem_top_q <= "011010";

	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp(LOGICAL,1456)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_a <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_mem_top_q;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_q);
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_q <= "1" when ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_a = ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_b else "0";

	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmpReg(REG,1457)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmpReg_q <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_sticky_ena(REG,1460)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_nor_q = "1") THEN
                ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_sticky_ena_q <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd(LOGICAL,1461)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_a <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_sticky_ena_q;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_b <= en;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_q <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_a and ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_b;

	--signX_uid26_fpTanPiTest(BITSELECT,25)@0
    signX_uid26_fpTanPiTest_in <= a;
    signX_uid26_fpTanPiTest_b <= signX_uid26_fpTanPiTest_in(31 downto 31);

	--ld_signX_uid26_fpTanPiTest_b_to_join_uid41_fpTanPiTest_b(DELAY,792)@0
    ld_signX_uid26_fpTanPiTest_b_to_join_uid41_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => signX_uid26_fpTanPiTest_b, xout => ld_signX_uid26_fpTanPiTest_b_to_join_uid41_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--roundAndExpUpdateCst_uid38_fpTanPiTest(CONSTANT,37)
    roundAndExpUpdateCst_uid38_fpTanPiTest_q <= "1000000000000000000000001";

	--piwFP1_uid29_fpTanPiTest(CONSTANT,28)
    piwFP1_uid29_fpTanPiTest_q <= "110010010000111111011011";

	--fracX_uid25_fpTanPiTest(BITSELECT,24)@0
    fracX_uid25_fpTanPiTest_in <= a(22 downto 0);
    fracX_uid25_fpTanPiTest_b <= fracX_uid25_fpTanPiTest_in(22 downto 0);

	--oFracX_uid27_uid27_fpTanPiTest(BITJOIN,26)@0
    oFracX_uid27_uid27_fpTanPiTest_q <= VCC_q & fracX_uid25_fpTanPiTest_b;

	--xpi_uid30_fpTanPiTest(MULT,29)@0
    xpi_uid30_fpTanPiTest_pr <= UNSIGNED(xpi_uid30_fpTanPiTest_a) * UNSIGNED(xpi_uid30_fpTanPiTest_b);
    xpi_uid30_fpTanPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xpi_uid30_fpTanPiTest_a <= (others => '0');
            xpi_uid30_fpTanPiTest_b <= (others => '0');
            xpi_uid30_fpTanPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                xpi_uid30_fpTanPiTest_a <= oFracX_uid27_uid27_fpTanPiTest_q;
                xpi_uid30_fpTanPiTest_b <= piwFP1_uid29_fpTanPiTest_q;
                xpi_uid30_fpTanPiTest_s1 <= STD_LOGIC_VECTOR(xpi_uid30_fpTanPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    xpi_uid30_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xpi_uid30_fpTanPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                xpi_uid30_fpTanPiTest_q <= xpi_uid30_fpTanPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--fsel_uid31_fpTanPiTest(BITSELECT,30)@3
    fsel_uid31_fpTanPiTest_in <= xpi_uid30_fpTanPiTest_q;
    fsel_uid31_fpTanPiTest_b <= fsel_uid31_fpTanPiTest_in(47 downto 47);

	--exp_uid9_fpTanPiTest(BITSELECT,8)@0
    exp_uid9_fpTanPiTest_in <= a(30 downto 0);
    exp_uid9_fpTanPiTest_b <= exp_uid9_fpTanPiTest_in(30 downto 23);

	--ld_exp_uid9_fpTanPiTest_b_to_expRSmallpix_uid36_fpTanPiTest_a(DELAY,785)@0
    ld_exp_uid9_fpTanPiTest_b_to_expRSmallpix_uid36_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => exp_uid9_fpTanPiTest_b, xout => ld_exp_uid9_fpTanPiTest_b_to_expRSmallpix_uid36_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--expRSmallpix_uid36_fpTanPiTest(ADD,35)@3
    expRSmallpix_uid36_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & ld_exp_uid9_fpTanPiTest_b_to_expRSmallpix_uid36_fpTanPiTest_a_q);
    expRSmallpix_uid36_fpTanPiTest_b <= STD_LOGIC_VECTOR("00000000" & fsel_uid31_fpTanPiTest_b);
            expRSmallpix_uid36_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRSmallpix_uid36_fpTanPiTest_a) + UNSIGNED(expRSmallpix_uid36_fpTanPiTest_b));
    expRSmallpix_uid36_fpTanPiTest_q <= expRSmallpix_uid36_fpTanPiTest_o(8 downto 0);


	--fracRSmallPiXH_uid32_fpTanPiTest(BITSELECT,31)@3
    fracRSmallPiXH_uid32_fpTanPiTest_in <= xpi_uid30_fpTanPiTest_q(46 downto 0);
    fracRSmallPiXH_uid32_fpTanPiTest_b <= fracRSmallPiXH_uid32_fpTanPiTest_in(46 downto 23);

	--fracRSmallPiXL_uid33_fpTanPiTest(BITSELECT,32)@3
    fracRSmallPiXL_uid33_fpTanPiTest_in <= xpi_uid30_fpTanPiTest_q(45 downto 0);
    fracRSmallPiXL_uid33_fpTanPiTest_b <= fracRSmallPiXL_uid33_fpTanPiTest_in(45 downto 22);

	--fracRSmallPiXNorm_uid34_fpTanPiTest(MUX,33)@3
    fracRSmallPiXNorm_uid34_fpTanPiTest_s <= fsel_uid31_fpTanPiTest_b;
    fracRSmallPiXNorm_uid34_fpTanPiTest: PROCESS (fracRSmallPiXNorm_uid34_fpTanPiTest_s, en, fracRSmallPiXL_uid33_fpTanPiTest_b, fracRSmallPiXH_uid32_fpTanPiTest_b)
    BEGIN
            CASE fracRSmallPiXNorm_uid34_fpTanPiTest_s IS
                  WHEN "0" => fracRSmallPiXNorm_uid34_fpTanPiTest_q <= fracRSmallPiXL_uid33_fpTanPiTest_b;
                  WHEN "1" => fracRSmallPiXNorm_uid34_fpTanPiTest_q <= fracRSmallPiXH_uid32_fpTanPiTest_b;
                  WHEN OTHERS => fracRSmallPiXNorm_uid34_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRSmallpixConc_uid37_fpTanPiTest(BITJOIN,36)@3
    expFracRSmallpixConc_uid37_fpTanPiTest_q <= expRSmallpix_uid36_fpTanPiTest_q & fracRSmallPiXNorm_uid34_fpTanPiTest_q;

	--reg_expFracRSmallpixConc_uid37_fpTanPiTest_0_to_expRSmallpix2_uid39_fpTanPiTest_0(REG,769)@3
    reg_expFracRSmallpixConc_uid37_fpTanPiTest_0_to_expRSmallpix2_uid39_fpTanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracRSmallpixConc_uid37_fpTanPiTest_0_to_expRSmallpix2_uid39_fpTanPiTest_0_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracRSmallpixConc_uid37_fpTanPiTest_0_to_expRSmallpix2_uid39_fpTanPiTest_0_q <= expFracRSmallpixConc_uid37_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expRSmallpix2_uid39_fpTanPiTest(ADD,38)@4
    expRSmallpix2_uid39_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracRSmallpixConc_uid37_fpTanPiTest_0_to_expRSmallpix2_uid39_fpTanPiTest_0_q);
    expRSmallpix2_uid39_fpTanPiTest_b <= STD_LOGIC_VECTOR("000000000" & roundAndExpUpdateCst_uid38_fpTanPiTest_q);
            expRSmallpix2_uid39_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRSmallpix2_uid39_fpTanPiTest_a) + UNSIGNED(expRSmallpix2_uid39_fpTanPiTest_b));
    expRSmallpix2_uid39_fpTanPiTest_q <= expRSmallpix2_uid39_fpTanPiTest_o(33 downto 0);


	--expFracRSmallPiXR_uid40_fpTanPiTest(BITSELECT,39)@4
    expFracRSmallPiXR_uid40_fpTanPiTest_in <= expRSmallpix2_uid39_fpTanPiTest_q(31 downto 0);
    expFracRSmallPiXR_uid40_fpTanPiTest_b <= expFracRSmallPiXR_uid40_fpTanPiTest_in(31 downto 1);

	--join_uid41_fpTanPiTest(BITJOIN,40)@4
    join_uid41_fpTanPiTest_q <= ld_signX_uid26_fpTanPiTest_b_to_join_uid41_fpTanPiTest_b_q & expFracRSmallPiXR_uid40_fpTanPiTest_b;

	--reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3(REG,770)@4
    reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q <= join_uid41_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt(COUNTER,1451)
    -- every=1, low=0, high=26, step=1, init=1
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_i = 25 THEN
                      ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_eq = '1') THEN
                        ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_i <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_i - 26;
                    ELSE
                        ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_i <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_i,5));


	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdreg(REG,1452)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdreg_q <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux(MUX,1453)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_s <= en;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux: PROCESS (ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_s, ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdreg_q, ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_q <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_q <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem(DUALMEM,1450)
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_reset0 <= areset;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_ia <= reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_aa <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdreg_q;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_ab <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_rdmux_q;
    ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 27,
        width_b => 32,
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
        clocken1 => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_iq,
        address_a => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_aa,
        data_a => ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_ia
    );
        ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_q <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_iq(31 downto 0);

	--cstAllZWF_uid53_spix_uid43_fpTanPiTest(CONSTANT,52)
    cstAllZWF_uid53_spix_uid43_fpTanPiTest_q <= "00000000000000000000000";

	--LeftShiftStage133dto0_uid381_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,380)@1
    LeftShiftStage133dto0_uid381_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q(33 downto 0);
    LeftShiftStage133dto0_uid381_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= LeftShiftStage133dto0_uid381_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(33 downto 0);

	--leftShiftStage2Idx3Pad3_uid380_fixedPointX_uid84_spix_uid43_fpTanPiTest(CONSTANT,379)
    leftShiftStage2Idx3Pad3_uid380_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= "000";

	--leftShiftStage2Idx3_uid382_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITJOIN,381)@1
    leftShiftStage2Idx3_uid382_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= LeftShiftStage133dto0_uid381_fixedPointX_uid84_spix_uid43_fpTanPiTest_b & leftShiftStage2Idx3Pad3_uid380_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--LeftShiftStage134dto0_uid378_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,377)@1
    LeftShiftStage134dto0_uid378_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q(34 downto 0);
    LeftShiftStage134dto0_uid378_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= LeftShiftStage134dto0_uid378_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(34 downto 0);

	--z_uid306_tpix_uid45_fpTanPiTest(CONSTANT,305)
    z_uid306_tpix_uid45_fpTanPiTest_q <= "00";

	--leftShiftStage2Idx2_uid379_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITJOIN,378)@1
    leftShiftStage2Idx2_uid379_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= LeftShiftStage134dto0_uid378_fixedPointX_uid84_spix_uid43_fpTanPiTest_b & z_uid306_tpix_uid45_fpTanPiTest_q;

	--LeftShiftStage135dto0_uid375_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,374)@1
    LeftShiftStage135dto0_uid375_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q(35 downto 0);
    LeftShiftStage135dto0_uid375_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= LeftShiftStage135dto0_uid375_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(35 downto 0);

	--GND(CONSTANT,0)
    GND_q <= "0";

	--leftShiftStage2Idx1_uid376_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITJOIN,375)@1
    leftShiftStage2Idx1_uid376_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= LeftShiftStage135dto0_uid375_fixedPointX_uid84_spix_uid43_fpTanPiTest_b & GND_q;

	--leftShiftStage0Idx3_uid360_fixedPointX_uid84_spix_uid43_fpTanPiTest(CONSTANT,359)
    leftShiftStage0Idx3_uid360_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= "0000000000000000000000000000000000000";

	--X4dto0_uid358_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,357)@0
    X4dto0_uid358_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= extendedFracX_uid82_spix_uid43_fpTanPiTest_q(4 downto 0);
    X4dto0_uid358_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= X4dto0_uid358_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(4 downto 0);

	--leftShiftStage0Idx2Pad32_uid357_fixedPointX_uid84_spix_uid43_fpTanPiTest(CONSTANT,356)
    leftShiftStage0Idx2Pad32_uid357_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= "00000000000000000000000000000000";

	--leftShiftStage0Idx2_uid359_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITJOIN,358)@0
    leftShiftStage0Idx2_uid359_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= X4dto0_uid358_fixedPointX_uid84_spix_uid43_fpTanPiTest_b & leftShiftStage0Idx2Pad32_uid357_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--X20dto0_uid355_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,354)@0
    X20dto0_uid355_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= extendedFracX_uid82_spix_uid43_fpTanPiTest_q(20 downto 0);
    X20dto0_uid355_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= X20dto0_uid355_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(20 downto 0);

	--leftShiftStage0Idx1Pad16_uid354_fixedPointX_uid84_spix_uid43_fpTanPiTest(CONSTANT,353)
    leftShiftStage0Idx1Pad16_uid354_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= "0000000000000000";

	--leftShiftStage0Idx1_uid356_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITJOIN,355)@0
    leftShiftStage0Idx1_uid356_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= X20dto0_uid355_fixedPointX_uid84_spix_uid43_fpTanPiTest_b & leftShiftStage0Idx1Pad16_uid354_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--cst01pWShift_uid81_spix_uid43_fpTanPiTest(CONSTANT,80)
    cst01pWShift_uid81_spix_uid43_fpTanPiTest_q <= "0000000000000";

	--extendedFracX_uid82_spix_uid43_fpTanPiTest(BITJOIN,81)@0
    extendedFracX_uid82_spix_uid43_fpTanPiTest_q <= cst01pWShift_uid81_spix_uid43_fpTanPiTest_q & oFracX_uid27_uid27_fpTanPiTest_q;

	--cstBiasMwSMo_uid22_fpTanPiTest(CONSTANT,21)
    cstBiasMwSMo_uid22_fpTanPiTest_q <= "01110010";

	--shiftValue_uid80_spix_uid43_fpTanPiTest(SUB,79)@0
    shiftValue_uid80_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & exp_uid9_fpTanPiTest_b);
    shiftValue_uid80_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("0" & cstBiasMwSMo_uid22_fpTanPiTest_q);
            shiftValue_uid80_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid80_spix_uid43_fpTanPiTest_a) - UNSIGNED(shiftValue_uid80_spix_uid43_fpTanPiTest_b));
    shiftValue_uid80_spix_uid43_fpTanPiTest_q <= shiftValue_uid80_spix_uid43_fpTanPiTest_o(8 downto 0);


	--fxpShifterBits_uid83_spix_uid43_fpTanPiTest(BITSELECT,82)@0
    fxpShifterBits_uid83_spix_uid43_fpTanPiTest_in <= shiftValue_uid80_spix_uid43_fpTanPiTest_q(5 downto 0);
    fxpShifterBits_uid83_spix_uid43_fpTanPiTest_b <= fxpShifterBits_uid83_spix_uid43_fpTanPiTest_in(5 downto 0);

	--leftShiftStageSel5Dto4_uid361_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,360)@0
    leftShiftStageSel5Dto4_uid361_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= fxpShifterBits_uid83_spix_uid43_fpTanPiTest_b;
    leftShiftStageSel5Dto4_uid361_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= leftShiftStageSel5Dto4_uid361_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(5 downto 4);

	--leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest(MUX,361)@0
    leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_s <= leftShiftStageSel5Dto4_uid361_fixedPointX_uid84_spix_uid43_fpTanPiTest_b;
    leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest: PROCESS (leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_s, en, extendedFracX_uid82_spix_uid43_fpTanPiTest_q, leftShiftStage0Idx1_uid356_fixedPointX_uid84_spix_uid43_fpTanPiTest_q, leftShiftStage0Idx2_uid359_fixedPointX_uid84_spix_uid43_fpTanPiTest_q, leftShiftStage0Idx3_uid360_fixedPointX_uid84_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= extendedFracX_uid82_spix_uid43_fpTanPiTest_q;
                  WHEN "01" => leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= leftShiftStage0Idx1_uid356_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
                  WHEN "10" => leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= leftShiftStage0Idx2_uid359_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
                  WHEN "11" => leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= leftShiftStage0Idx3_uid360_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage024dto0_uid370_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,369)@0
    LeftShiftStage024dto0_uid370_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q(24 downto 0);
    LeftShiftStage024dto0_uid370_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= LeftShiftStage024dto0_uid370_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(24 downto 0);

	--leftShiftStage1Idx3Pad12_uid369_fixedPointX_uid84_spix_uid43_fpTanPiTest(CONSTANT,368)
    leftShiftStage1Idx3Pad12_uid369_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= "000000000000";

	--leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITJOIN,370)@0
    leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= LeftShiftStage024dto0_uid370_fixedPointX_uid84_spix_uid43_fpTanPiTest_b & leftShiftStage1Idx3Pad12_uid369_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--reg_leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_5(REG,679)@0
    reg_leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_5_q <= leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage028dto0_uid367_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,366)@0
    LeftShiftStage028dto0_uid367_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q(28 downto 0);
    LeftShiftStage028dto0_uid367_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= LeftShiftStage028dto0_uid367_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(28 downto 0);

	--cstAllZWE_uid8_fpTanPiTest(CONSTANT,7)
    cstAllZWE_uid8_fpTanPiTest_q <= "00000000";

	--leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITJOIN,367)@0
    leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= LeftShiftStage028dto0_uid367_fixedPointX_uid84_spix_uid43_fpTanPiTest_b & cstAllZWE_uid8_fpTanPiTest_q;

	--reg_leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_4(REG,678)@0
    reg_leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_4_q <= leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage032dto0_uid364_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,363)@0
    LeftShiftStage032dto0_uid364_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q(32 downto 0);
    LeftShiftStage032dto0_uid364_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= LeftShiftStage032dto0_uid364_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(32 downto 0);

	--leftShiftStage1Idx1Pad4_uid363_fixedPointX_uid84_spix_uid43_fpTanPiTest(CONSTANT,362)
    leftShiftStage1Idx1Pad4_uid363_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= "0000";

	--leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITJOIN,364)@0
    leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= LeftShiftStage032dto0_uid364_fixedPointX_uid84_spix_uid43_fpTanPiTest_b & leftShiftStage1Idx1Pad4_uid363_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--reg_leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_3(REG,677)@0
    reg_leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_3_q <= leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_2(REG,676)@0
    reg_leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_2_q <= leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,371)@0
    leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= fxpShifterBits_uid83_spix_uid43_fpTanPiTest_b(3 downto 0);
    leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_1(REG,675)@0
    reg_leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_1_q <= leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest(MUX,372)@1
    leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_s <= reg_leftShiftStageSel3Dto2_uid372_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_1_q;
    leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest: PROCESS (leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_s, en, reg_leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_2_q, reg_leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_3_q, reg_leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_4_q, reg_leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage0_uid362_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage1Idx1_uid365_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage1Idx2_uid368_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage1Idx3_uid371_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest(BITSELECT,382)@0
    leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_in <= fxpShifterBits_uid83_spix_uid43_fpTanPiTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_b <= leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_1(REG,680)@0
    reg_leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_1_q <= leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest(MUX,383)@1
    leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_s <= reg_leftShiftStageSel1Dto0_uid383_fixedPointX_uid84_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_1_q;
    leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest: PROCESS (leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_s, en, leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q, leftShiftStage2Idx1_uid376_fixedPointX_uid84_spix_uid43_fpTanPiTest_q, leftShiftStage2Idx2_uid379_fixedPointX_uid84_spix_uid43_fpTanPiTest_q, leftShiftStage2Idx3_uid382_fixedPointX_uid84_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= leftShiftStage1_uid373_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
                  WHEN "01" => leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= leftShiftStage2Idx1_uid376_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
                  WHEN "10" => leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= leftShiftStage2Idx2_uid379_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
                  WHEN "11" => leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= leftShiftStage2Idx3_uid382_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid86_spix_uid43_fpTanPiTest(BITSELECT,85)@1
    y_uid86_spix_uid43_fpTanPiTest_in <= leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_q(35 downto 0);
    y_uid86_spix_uid43_fpTanPiTest_b <= y_uid86_spix_uid43_fpTanPiTest_in(35 downto 0);

	--FxpXFrac35_uid192_cpix_uid44_fpTanPiTest(BITSELECT,191)@1
    FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_in <= y_uid86_spix_uid43_fpTanPiTest_b;
    FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b <= FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_in(35 downto 35);

	--intXParity_uid85_spix_uid43_fpTanPiTest(BITSELECT,84)@1
    intXParity_uid85_spix_uid43_fpTanPiTest_in <= leftShiftStage2_uid384_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
    intXParity_uid85_spix_uid43_fpTanPiTest_b <= intXParity_uid85_spix_uid43_fpTanPiTest_in(36 downto 36);

	--xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest(LOGICAL,243)@1
    xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_a <= intXParity_uid85_spix_uid43_fpTanPiTest_b;
    xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_b <= FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b;
    xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_q <= xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_a xor xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_b;

	--ld_xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_q_to_signRComp_uid247_cpix_uid44_fpTanPiTest_c(DELAY,973)@1
    ld_xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_q_to_signRComp_uid247_cpix_uid44_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_q, xout => ld_xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_q_to_signRComp_uid247_cpix_uid44_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstBiasPwF_uid55_spix_uid43_fpTanPiTest(CONSTANT,54)
    cstBiasPwF_uid55_spix_uid43_fpTanPiTest_q <= "10010110";

	--xIntExp_uid73_spix_uid43_fpTanPiTest(COMPARE,72)@0
    xIntExp_uid73_spix_uid43_fpTanPiTest_cin <= GND_q;
    xIntExp_uid73_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("00" & cstBiasPwF_uid55_spix_uid43_fpTanPiTest_q) & '0';
    xIntExp_uid73_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("00" & exp_uid9_fpTanPiTest_b) & xIntExp_uid73_spix_uid43_fpTanPiTest_cin(0);
            xIntExp_uid73_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xIntExp_uid73_spix_uid43_fpTanPiTest_a) - UNSIGNED(xIntExp_uid73_spix_uid43_fpTanPiTest_b));
    xIntExp_uid73_spix_uid43_fpTanPiTest_c(0) <= xIntExp_uid73_spix_uid43_fpTanPiTest_o(10);


	--ld_xIntExp_uid73_spix_uid43_fpTanPiTest_c_to_xIntYz_uid129_spix_uid43_fpTanPiTest_a(DELAY,867)@0
    ld_xIntExp_uid73_spix_uid43_fpTanPiTest_c_to_xIntYz_uid129_spix_uid43_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xIntExp_uid73_spix_uid43_fpTanPiTest_c, xout => ld_xIntExp_uid73_spix_uid43_fpTanPiTest_c_to_xIntYz_uid129_spix_uid43_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvXIntExp_uid131_spix_uid43_fpTanPiTest(LOGICAL,130)@2
    InvXIntExp_uid131_spix_uid43_fpTanPiTest_a <= ld_xIntExp_uid73_spix_uid43_fpTanPiTest_c_to_xIntYz_uid129_spix_uid43_fpTanPiTest_a_q;
    InvXIntExp_uid131_spix_uid43_fpTanPiTest_q <= not InvXIntExp_uid131_spix_uid43_fpTanPiTest_a;

	--tanXIsX_uid28_fpTanPiTest(COMPARE,27)@0
    tanXIsX_uid28_fpTanPiTest_cin <= GND_q;
    tanXIsX_uid28_fpTanPiTest_a <= STD_LOGIC_VECTOR("00" & exp_uid9_fpTanPiTest_b) & '0';
    tanXIsX_uid28_fpTanPiTest_b <= STD_LOGIC_VECTOR("00" & cstBiasMwSMo_uid22_fpTanPiTest_q) & tanXIsX_uid28_fpTanPiTest_cin(0);
            tanXIsX_uid28_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(tanXIsX_uid28_fpTanPiTest_a) - UNSIGNED(tanXIsX_uid28_fpTanPiTest_b));
    tanXIsX_uid28_fpTanPiTest_c(0) <= tanXIsX_uid28_fpTanPiTest_o(10);


	--ld_tanXIsX_uid28_fpTanPiTest_c_to_InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a(DELAY,937)@0
    ld_tanXIsX_uid28_fpTanPiTest_c_to_InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => tanXIsX_uid28_fpTanPiTest_c, xout => ld_tanXIsX_uid28_fpTanPiTest_c_to_InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest(LOGICAL,224)@2
    InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a <= ld_tanXIsX_uid28_fpTanPiTest_c_to_InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a_q;
    InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_q <= not InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a;

	--signRComp_uid247_cpix_uid44_fpTanPiTest(LOGICAL,246)@2
    signRComp_uid247_cpix_uid44_fpTanPiTest_a <= InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_q;
    signRComp_uid247_cpix_uid44_fpTanPiTest_b <= InvXIntExp_uid131_spix_uid43_fpTanPiTest_q;
    signRComp_uid247_cpix_uid44_fpTanPiTest_c <= ld_xParityXorHalfParity_uid244_cpix_uid44_fpTanPiTest_q_to_signRComp_uid247_cpix_uid44_fpTanPiTest_c_q;
    signRComp_uid247_cpix_uid44_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signRComp_uid247_cpix_uid44_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signRComp_uid247_cpix_uid44_fpTanPiTest_q <= signRComp_uid247_cpix_uid44_fpTanPiTest_a and signRComp_uid247_cpix_uid44_fpTanPiTest_b and signRComp_uid247_cpix_uid44_fpTanPiTest_c;
        END IF;
    END PROCESS;



	--ozz_uid88_spix_uid43_fpTanPiTest(CONSTANT,87)
    ozz_uid88_spix_uid43_fpTanPiTest_q <= "00000000000000000000000000000000000";

	--join_uid89_spix_uid43_fpTanPiTest(BITJOIN,88)@2
    join_uid89_spix_uid43_fpTanPiTest_q <= VCC_q & ozz_uid88_spix_uid43_fpTanPiTest_q;

	--reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1(REG,681)@1
    reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1_q <= "000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1_q <= y_uid86_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--yIsZero_uid90_spix_uid43_fpTanPiTest(LOGICAL,89)@2
    yIsZero_uid90_spix_uid43_fpTanPiTest_a <= reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1_q;
    yIsZero_uid90_spix_uid43_fpTanPiTest_b <= join_uid89_spix_uid43_fpTanPiTest_q;
    yIsZero_uid90_spix_uid43_fpTanPiTest_q <= "1" when yIsZero_uid90_spix_uid43_fpTanPiTest_a = yIsZero_uid90_spix_uid43_fpTanPiTest_b else "0";

	--InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest(LOGICAL,247)@2
    InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_a <= yIsZero_uid90_spix_uid43_fpTanPiTest_q;
    InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_q <= not InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_a;

	--ld_InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_q_to_signR_uid249_cpix_uid44_fpTanPiTest_a(DELAY,975)@2
    ld_InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_q_to_signR_uid249_cpix_uid44_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_q, xout => ld_InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_q_to_signR_uid249_cpix_uid44_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid249_cpix_uid44_fpTanPiTest(LOGICAL,248)@3
    signR_uid249_cpix_uid44_fpTanPiTest_a <= ld_InvFxpXFracHalf_uid248_cpix_uid44_fpTanPiTest_q_to_signR_uid249_cpix_uid44_fpTanPiTest_a_q;
    signR_uid249_cpix_uid44_fpTanPiTest_b <= signRComp_uid247_cpix_uid44_fpTanPiTest_q;
    signR_uid249_cpix_uid44_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid249_cpix_uid44_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signR_uid249_cpix_uid44_fpTanPiTest_q <= signR_uid249_cpix_uid44_fpTanPiTest_a and signR_uid249_cpix_uid44_fpTanPiTest_b;
        END IF;
    END PROCESS;



	--ld_signR_uid249_cpix_uid44_fpTanPiTest_q_to_R_uid250_cpix_uid44_fpTanPiTest_c(DELAY,979)@4
    ld_signR_uid249_cpix_uid44_fpTanPiTest_q_to_R_uid250_cpix_uid44_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => signR_uid249_cpix_uid44_fpTanPiTest_q, xout => ld_signR_uid249_cpix_uid44_fpTanPiTest_q_to_R_uid250_cpix_uid44_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--cstBias_uid54_spix_uid43_fpTanPiTest(CONSTANT,53)
    cstBias_uid54_spix_uid43_fpTanPiTest_q <= "01111111";

	--cstAllOWE_uid52_spix_uid43_fpTanPiTest(CONSTANT,51)
    cstAllOWE_uid52_spix_uid43_fpTanPiTest_q <= "11111111";

	--pad_o_uid164_uid195_cpix_uid44_fpTanPiTest(BITJOIN,194)@1
    pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_q <= VCC_q & STD_LOGIC_VECTOR((35 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_0_to_oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_0(REG,721)@1
    reg_pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_0_to_oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_0_to_oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_0_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_0_to_oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_0_q <= pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest(SUB,195)@2
    oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_o_uid164_uid195_cpix_uid44_fpTanPiTest_0_to_oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_0_q);
    oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1_q);
            oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_a) - UNSIGNED(oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_b));
    oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_q <= oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_o(37 downto 0);


	--oMFxpXFrac_uid197_cpix_uid44_fpTanPiTest(BITSELECT,196)@2
    oMFxpXFrac_uid197_cpix_uid44_fpTanPiTest_in <= oMFxpXFrac_uid195_cpix_uid44_fpTanPiTest_q(35 downto 0);
    oMFxpXFrac_uid197_cpix_uid44_fpTanPiTest_b <= oMFxpXFrac_uid197_cpix_uid44_fpTanPiTest_in(35 downto 0);

	--ld_y_uid86_spix_uid43_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_c(DELAY,913)@1
    ld_y_uid86_spix_uid43_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 36, depth => 1 )
    PORT MAP ( xin => y_uid86_spix_uid43_fpTanPiTest_b, xout => ld_y_uid86_spix_uid43_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_b(DELAY,912)@1
    ld_FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b, xout => ld_FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest(MUX,198)@2
    rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_s <= ld_FxpXFrac35_uid192_cpix_uid44_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_b_q;
    rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_s IS
                      WHEN "0" => rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_q <= ld_y_uid86_spix_uid43_fpTanPiTest_b_to_rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_c_q;
                      WHEN "1" => rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_q <= oMFxpXFrac_uid197_cpix_uid44_fpTanPiTest_b;
                      WHEN OTHERS => rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--pad_half_uid165_uid200_cpix_uid44_fpTanPiTest(BITJOIN,199)@2
    pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_q <= VCC_q & STD_LOGIC_VECTOR((34 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_0_to_z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_0(REG,723)@2
    reg_pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_0_to_z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_0_to_z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_0_q <= "000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_0_to_z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_0_q <= pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest(SUB,200)@3
    z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & reg_pad_half_uid165_uid200_cpix_uid44_fpTanPiTest_0_to_z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_0_q);
    z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_b <= STD_LOGIC_VECTOR("0" & rangeReducedFxPX_uid199_cpix_uid44_fpTanPiTest_q);
            z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_a) - UNSIGNED(z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_b));
    z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_q <= z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_o(36 downto 0);


	--z_uid202_cpix_uid44_fpTanPiTest(BITSELECT,201)@3
    z_uid202_cpix_uid44_fpTanPiTest_in <= z_halfMRRFxPXE_uid200_cpix_uid44_fpTanPiTest_q(34 downto 0);
    z_uid202_cpix_uid44_fpTanPiTest_b <= z_uid202_cpix_uid44_fpTanPiTest_in(34 downto 0);

	--zAddr_uid210_cpix_uid44_fpTanPiTest(BITSELECT,209)@3
    zAddr_uid210_cpix_uid44_fpTanPiTest_in <= z_uid202_cpix_uid44_fpTanPiTest_b;
    zAddr_uid210_cpix_uid44_fpTanPiTest_b <= zAddr_uid210_cpix_uid44_fpTanPiTest_in(34 downto 28);

	--reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC2_uid577_sinPiZTableGenerator_0(REG,740)@3
    reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC2_uid577_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC2_uid577_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC2_uid577_sinPiZTableGenerator_0_q <= zAddr_uid210_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid577_sinPiZTableGenerator(LOOKUP,576)@4
    memoryC2_uid577_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC2_uid577_sinPiZTableGenerator_q <= "10101101010011";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC2_uid577_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101010011";
                WHEN "0000001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101010100";
                WHEN "0000010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101010111";
                WHEN "0000011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101011001";
                WHEN "0000100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101011011";
                WHEN "0000101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101011100";
                WHEN "0000110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101011111";
                WHEN "0000111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101100010";
                WHEN "0001000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101100110";
                WHEN "0001001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101101011";
                WHEN "0001010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101110000";
                WHEN "0001011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101110101";
                WHEN "0001100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101101111011";
                WHEN "0001101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101110000000";
                WHEN "0001110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101110000111";
                WHEN "0001111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101110001110";
                WHEN "0010000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101110010011";
                WHEN "0010001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101110011110";
                WHEN "0010010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101110100110";
                WHEN "0010011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101110101111";
                WHEN "0010100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101110111000";
                WHEN "0010101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101111000011";
                WHEN "0010110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101111001100";
                WHEN "0010111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101111010111";
                WHEN "0011000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101111100011";
                WHEN "0011001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101111101110";
                WHEN "0011010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10101111111011";
                WHEN "0011011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110000001001";
                WHEN "0011100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110000010101";
                WHEN "0011101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110000100000";
                WHEN "0011110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110000110001";
                WHEN "0011111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110001000000";
                WHEN "0100000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110001001101";
                WHEN "0100001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110001011110";
                WHEN "0100010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110001101100";
                WHEN "0100011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110001111111";
                WHEN "0100100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110010001111";
                WHEN "0100101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110010100001";
                WHEN "0100110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110010110011";
                WHEN "0100111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110011000101";
                WHEN "0101000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110011010110";
                WHEN "0101001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110011101011";
                WHEN "0101010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110011111111";
                WHEN "0101011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110100010010";
                WHEN "0101100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110100100101";
                WHEN "0101101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110100111011";
                WHEN "0101110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110101001110";
                WHEN "0101111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110101100111";
                WHEN "0110000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110101111100";
                WHEN "0110001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110110010010";
                WHEN "0110010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110110100110";
                WHEN "0110011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110111000000";
                WHEN "0110100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110111010101";
                WHEN "0110101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10110111110000";
                WHEN "0110110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111000000110";
                WHEN "0110111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111000100010";
                WHEN "0111000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111000111001";
                WHEN "0111001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111001010100";
                WHEN "0111010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111001101111";
                WHEN "0111011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111010001001";
                WHEN "0111100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111010100011";
                WHEN "0111101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111010111100";
                WHEN "0111110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111011011001";
                WHEN "0111111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111011110111";
                WHEN "1000000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111100010100";
                WHEN "1000001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111100110001";
                WHEN "1000010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111101001101";
                WHEN "1000011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111101101010";
                WHEN "1000100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111110001000";
                WHEN "1000101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111110100101";
                WHEN "1000110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111111000101";
                WHEN "1000111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "10111111100011";
                WHEN "1001000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000000000011";
                WHEN "1001001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000000100011";
                WHEN "1001010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000001000100";
                WHEN "1001011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000001100010";
                WHEN "1001100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000010000100";
                WHEN "1001101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000010100010";
                WHEN "1001110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000011000110";
                WHEN "1001111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000011101000";
                WHEN "1010000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000100001010";
                WHEN "1010001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000100101101";
                WHEN "1010010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000101010001";
                WHEN "1010011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000101110010";
                WHEN "1010100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000110010100";
                WHEN "1010101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000110111011";
                WHEN "1010110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11000111011010";
                WHEN "1010111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001000000001";
                WHEN "1011000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001000100110";
                WHEN "1011001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001001001011";
                WHEN "1011010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001001101101";
                WHEN "1011011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001010010101";
                WHEN "1011100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001010111100";
                WHEN "1011101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001011100000";
                WHEN "1011110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001100000101";
                WHEN "1011111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001100101110";
                WHEN "1100000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001101010100";
                WHEN "1100001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001101111010";
                WHEN "1100010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001110100010";
                WHEN "1100011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001111001001";
                WHEN "1100100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11001111110001";
                WHEN "1100101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010000010110";
                WHEN "1100110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010000111111";
                WHEN "1100111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010001101001";
                WHEN "1101000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010010010010";
                WHEN "1101001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010010111101";
                WHEN "1101010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010011100001";
                WHEN "1101011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010100001100";
                WHEN "1101100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010100110111";
                WHEN "1101101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010101100001";
                WHEN "1101110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010110001011";
                WHEN "1101111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010110110011";
                WHEN "1110000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11010111011111";
                WHEN "1110001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011000001010";
                WHEN "1110010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011000110100";
                WHEN "1110011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011001011111";
                WHEN "1110100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011010001010";
                WHEN "1110101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011010110110";
                WHEN "1110110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011011100011";
                WHEN "1110111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011100001111";
                WHEN "1111000" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011100111001";
                WHEN "1111001" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011101100011";
                WHEN "1111010" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011110010001";
                WHEN "1111011" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011110111011";
                WHEN "1111100" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11011111101000";
                WHEN "1111101" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11100000010101";
                WHEN "1111110" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11100001000010";
                WHEN "1111111" =>  memoryC2_uid577_sinPiZTableGenerator_q <= "11100001110000";
                WHEN OTHERS =>
                    memoryC2_uid577_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--zPPolyEval_uid211_cpix_uid44_fpTanPiTest(BITSELECT,210)@3
    zPPolyEval_uid211_cpix_uid44_fpTanPiTest_in <= z_uid202_cpix_uid44_fpTanPiTest_b(27 downto 0);
    zPPolyEval_uid211_cpix_uid44_fpTanPiTest_b <= zPPolyEval_uid211_cpix_uid44_fpTanPiTest_in(27 downto 12);

	--yT1_uid578_sinPiZPolyEval(BITSELECT,577)@3
    yT1_uid578_sinPiZPolyEval_in <= zPPolyEval_uid211_cpix_uid44_fpTanPiTest_b;
    yT1_uid578_sinPiZPolyEval_b <= yT1_uid578_sinPiZPolyEval_in(15 downto 2);

	--reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0(REG,741)@3
    reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q <= yT1_uid578_sinPiZPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_a(DELAY,1326)@4
    ld_reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_a : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q, xout => ld_reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid619_pT1_uid579_sinPiZPolyEval(MULT,618)@5
    prodXY_uid619_pT1_uid579_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid619_pT1_uid579_sinPiZPolyEval_a),15)) * SIGNED(prodXY_uid619_pT1_uid579_sinPiZPolyEval_b);
    prodXY_uid619_pT1_uid579_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid619_pT1_uid579_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid619_pT1_uid579_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid619_pT1_uid579_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid619_pT1_uid579_sinPiZPolyEval_a <= ld_reg_yT1_uid578_sinPiZPolyEval_0_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_0_q_to_prodXY_uid619_pT1_uid579_sinPiZPolyEval_a_q;
                prodXY_uid619_pT1_uid579_sinPiZPolyEval_b <= memoryC2_uid577_sinPiZTableGenerator_q;
                prodXY_uid619_pT1_uid579_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid619_pT1_uid579_sinPiZPolyEval_pr,28));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid619_pT1_uid579_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid619_pT1_uid579_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid619_pT1_uid579_sinPiZPolyEval_q <= prodXY_uid619_pT1_uid579_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid620_pT1_uid579_sinPiZPolyEval(BITSELECT,619)@8
    prodXYTruncFR_uid620_pT1_uid579_sinPiZPolyEval_in <= prodXY_uid619_pT1_uid579_sinPiZPolyEval_q;
    prodXYTruncFR_uid620_pT1_uid579_sinPiZPolyEval_b <= prodXYTruncFR_uid620_pT1_uid579_sinPiZPolyEval_in(27 downto 13);

	--highBBits_uid581_sinPiZPolyEval(BITSELECT,580)@8
    highBBits_uid581_sinPiZPolyEval_in <= prodXYTruncFR_uid620_pT1_uid579_sinPiZPolyEval_b;
    highBBits_uid581_sinPiZPolyEval_b <= highBBits_uid581_sinPiZPolyEval_in(14 downto 1);

	--ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a_inputreg(DELAY,1661)
    ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => zAddr_uid210_cpix_uid44_fpTanPiTest_b, xout => ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a(DELAY,1408)@3
    ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a_inputreg_q, xout => ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0(REG,742)@7
    reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_q <= ld_zAddr_uid210_cpix_uid44_fpTanPiTest_b_to_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid576_sinPiZTableGenerator(LOOKUP,575)@8
    memoryC1_uid576_sinPiZTableGenerator: PROCESS (reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC1_uid576_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "000000000000000000001";
                WHEN "0000001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111111101011010101010";
                WHEN "0000010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111111010110101010001";
                WHEN "0000011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111111000001111111100";
                WHEN "0000100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111110101101010101010";
                WHEN "0000101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111110011000101011101";
                WHEN "0000110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111110000100000010101";
                WHEN "0000111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111101101111011010001";
                WHEN "0001000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111101011010110010101";
                WHEN "0001001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111101000110001011111";
                WHEN "0001010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111100110001100110010";
                WHEN "0001011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111100011101000010000";
                WHEN "0001100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111100001000011110111";
                WHEN "0001101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111011110011111101011";
                WHEN "0001110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111011011111011101011";
                WHEN "0001111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111011001010111110111";
                WHEN "0010000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111010110110100010101";
                WHEN "0010001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111010100010000111100";
                WHEN "0010010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111010001101101111000";
                WHEN "0010011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111001111001011000011";
                WHEN "0010100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111001100101000100010";
                WHEN "0010101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111001010000110010001";
                WHEN "0010110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111000111100100010111";
                WHEN "0010111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111000101000010110001";
                WHEN "0011000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111000010100001011111";
                WHEN "0011001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "111000000000000100110";
                WHEN "0011010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110111101100000000011";
                WHEN "0011011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110111010111111111000";
                WHEN "0011100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110111000100000001000";
                WHEN "0011101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110110110000000110101";
                WHEN "0011110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110110011100001110111";
                WHEN "0011111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110110001000011011000";
                WHEN "0100000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110101110100101011010";
                WHEN "0100001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110101100000111110101";
                WHEN "0100010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110101001101010110010";
                WHEN "0100011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110100111001110001011";
                WHEN "0100100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110100100110010001001";
                WHEN "0100101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110100010010110100110";
                WHEN "0100110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110011111111011100110";
                WHEN "0100111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110011101100001001010";
                WHEN "0101000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110011011000111010011";
                WHEN "0101001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110011000101101111111";
                WHEN "0101010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110010110010101010010";
                WHEN "0101011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110010011111101001101";
                WHEN "0101100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110010001100101110000";
                WHEN "0101101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110001111001110111001";
                WHEN "0101110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110001100111000110000";
                WHEN "0101111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110001010100011001011";
                WHEN "0110000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110001000001110010110";
                WHEN "0110001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110000101111010001100";
                WHEN "0110010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110000011100110110001";
                WHEN "0110011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "110000001010011111111";
                WHEN "0110100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101111111000010000000";
                WHEN "0110101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101111100110000101100";
                WHEN "0110110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101111010100000001100";
                WHEN "0110111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101111000010000011001";
                WHEN "0111000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101110110000001011100";
                WHEN "0111001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101110011110011001110";
                WHEN "0111010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101110001100101110101";
                WHEN "0111011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101101111011001010001";
                WHEN "0111100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101101101001101100010";
                WHEN "0111101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101101011000010101010";
                WHEN "0111110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101101000111000100101";
                WHEN "0111111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101100110101111010111";
                WHEN "1000000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101100100100111000010";
                WHEN "1000001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101100010011111100111";
                WHEN "1000010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101100000011001000111";
                WHEN "1000011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101011110010011100000";
                WHEN "1000100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101011100001110110100";
                WHEN "1000101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101011010001011000100";
                WHEN "1000110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101011000001000001110";
                WHEN "1000111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101010110000110011000";
                WHEN "1001000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101010100000101011111";
                WHEN "1001001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101010010000101100100";
                WHEN "1001010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101010000000110101001";
                WHEN "1001011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101001110001000110000";
                WHEN "1001100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101001100001011110101";
                WHEN "1001101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101001010001111111111";
                WHEN "1001110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101001000010101000110";
                WHEN "1001111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101000110011011010001";
                WHEN "1010000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101000100100010100001";
                WHEN "1010001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101000010101010110100";
                WHEN "1010010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "101000000110100001011";
                WHEN "1010011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100111110111110101011";
                WHEN "1010100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100111101001010010000";
                WHEN "1010101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100111011010110110110";
                WHEN "1010110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100111001100100101100";
                WHEN "1010111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100110111110011100011";
                WHEN "1011000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100110110000011100011";
                WHEN "1011001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100110100010100101110";
                WHEN "1011010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100110010100111000101";
                WHEN "1011011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100110000111010100001";
                WHEN "1011100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100101111001111001000";
                WHEN "1011101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100101101100100111111";
                WHEN "1011110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100101011111100000000";
                WHEN "1011111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100101010010100001001";
                WHEN "1100000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100101000101101100011";
                WHEN "1100001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100100111001000001011";
                WHEN "1100010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100100101100011111111";
                WHEN "1100011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100100100000001000010";
                WHEN "1100100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100100010011111010101";
                WHEN "1100101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100100000111110111001";
                WHEN "1100110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100011111011111101010";
                WHEN "1100111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100011110000001101010";
                WHEN "1101000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100011100100100111101";
                WHEN "1101001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100011011001001011111";
                WHEN "1101010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100011001101111011010";
                WHEN "1101011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100011000010110100001";
                WHEN "1101100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100010110111110111010";
                WHEN "1101101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100010101101000101000";
                WHEN "1101110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100010100010011101001";
                WHEN "1101111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100010011000000000001";
                WHEN "1110000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100010001101101101010";
                WHEN "1110001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100010000011100100111";
                WHEN "1110010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100001111001100111100";
                WHEN "1110011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100001101111110100101";
                WHEN "1110100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100001100110001100100";
                WHEN "1110101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100001011100101111001";
                WHEN "1110110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100001010011011100011";
                WHEN "1110111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100001001010010100101";
                WHEN "1111000" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100001000001011000000";
                WHEN "1111001" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100000111000100110100";
                WHEN "1111010" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100000101111111111100";
                WHEN "1111011" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100000100111100011111";
                WHEN "1111100" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100000011111010011000";
                WHEN "1111101" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100000010111001101010";
                WHEN "1111110" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100000001111010010101";
                WHEN "1111111" =>  memoryC1_uid576_sinPiZTableGenerator_q <= "100000000111100011001";
                WHEN OTHERS =>
                    memoryC1_uid576_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--sumAHighB_uid582_sinPiZPolyEval(ADD,581)@8
    sumAHighB_uid582_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid576_sinPiZTableGenerator_q(20)) & memoryC1_uid576_sinPiZTableGenerator_q);
    sumAHighB_uid582_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((21 downto 14 => highBBits_uid581_sinPiZPolyEval_b(13)) & highBBits_uid581_sinPiZPolyEval_b);
            sumAHighB_uid582_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid582_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid582_sinPiZPolyEval_b));
    sumAHighB_uid582_sinPiZPolyEval_q <= sumAHighB_uid582_sinPiZPolyEval_o(21 downto 0);


	--lowRangeB_uid580_sinPiZPolyEval(BITSELECT,579)@8
    lowRangeB_uid580_sinPiZPolyEval_in <= prodXYTruncFR_uid620_pT1_uid579_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid580_sinPiZPolyEval_b <= lowRangeB_uid580_sinPiZPolyEval_in(0 downto 0);

	--s1_uid580_uid583_sinPiZPolyEval(BITJOIN,582)@8
    s1_uid580_uid583_sinPiZPolyEval_q <= sumAHighB_uid582_sinPiZPolyEval_q & lowRangeB_uid580_sinPiZPolyEval_b;

	--reg_s1_uid580_uid583_sinPiZPolyEval_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_1(REG,744)@8
    reg_s1_uid580_uid583_sinPiZPolyEval_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid580_uid583_sinPiZPolyEval_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid580_uid583_sinPiZPolyEval_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_1_q <= s1_uid580_uid583_sinPiZPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor(LOGICAL,1631)
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_b <= ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_q <= not (ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_a or ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_b);

	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_mem_top(CONSTANT,1503)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_mem_top_q <= "011";

	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp(LOGICAL,1504)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_a <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_mem_top_q;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_q);
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_q <= "1" when ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_a = ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_b else "0";

	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmpReg(REG,1505)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmpReg_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_sticky_ena(REG,1632)
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_nor_q = "1") THEN
                ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_sticky_ena_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd(LOGICAL,1633)
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_a <= ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_b <= en;
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_q <= ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_a and ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_b;

	--reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0(REG,743)@3
    reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q <= zPPolyEval_uid211_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt(COUNTER,1499)
    -- every=1, low=0, high=3, step=1, init=1
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_i <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_i,2));


	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg(REG,1500)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux(MUX,1501)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_s <= en;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux: PROCESS (ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_s, ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg_q, ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem(DUALMEM,1622)
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_reset0 <= areset;
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_ia <= reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q;
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_aa <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg_q;
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_ab <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_q;
    ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 16,
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
        clocken1 => ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_iq,
        address_a => ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_aa,
        data_a => ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_ia
    );
        ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_q <= ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_iq(15 downto 0);

	--prodXY_uid622_pT2_uid585_sinPiZPolyEval(MULT,621)@9
    prodXY_uid622_pT2_uid585_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid622_pT2_uid585_sinPiZPolyEval_a),17)) * SIGNED(prodXY_uid622_pT2_uid585_sinPiZPolyEval_b);
    prodXY_uid622_pT2_uid585_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid622_pT2_uid585_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid622_pT2_uid585_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid622_pT2_uid585_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid622_pT2_uid585_sinPiZPolyEval_a <= ld_reg_zPPolyEval_uid211_cpix_uid44_fpTanPiTest_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_0_q_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_a_replace_mem_q;
                prodXY_uid622_pT2_uid585_sinPiZPolyEval_b <= reg_s1_uid580_uid583_sinPiZPolyEval_0_to_prodXY_uid622_pT2_uid585_sinPiZPolyEval_1_q;
                prodXY_uid622_pT2_uid585_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid622_pT2_uid585_sinPiZPolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid622_pT2_uid585_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid622_pT2_uid585_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid622_pT2_uid585_sinPiZPolyEval_q <= prodXY_uid622_pT2_uid585_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid623_pT2_uid585_sinPiZPolyEval(BITSELECT,622)@12
    prodXYTruncFR_uid623_pT2_uid585_sinPiZPolyEval_in <= prodXY_uid622_pT2_uid585_sinPiZPolyEval_q;
    prodXYTruncFR_uid623_pT2_uid585_sinPiZPolyEval_b <= prodXYTruncFR_uid623_pT2_uid585_sinPiZPolyEval_in(38 downto 15);

	--highBBits_uid587_sinPiZPolyEval(BITSELECT,586)@12
    highBBits_uid587_sinPiZPolyEval_in <= prodXYTruncFR_uid623_pT2_uid585_sinPiZPolyEval_b;
    highBBits_uid587_sinPiZPolyEval_b <= highBBits_uid587_sinPiZPolyEval_in(23 downto 2);

	--ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor(LOGICAL,1607)
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_b <= ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_q <= not (ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_a or ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_b);

	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_mem_top(CONSTANT,1540)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_mem_top_q <= "0110";

	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp(LOGICAL,1541)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_a <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_mem_top_q;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_q);
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_q <= "1" when ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_a = ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_b else "0";

	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmpReg(REG,1542)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmpReg_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_sticky_ena(REG,1608)
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_nor_q = "1") THEN
                ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_sticky_ena_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd(LOGICAL,1609)
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_a <= ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_b <= en;
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_q <= ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_a and ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_b;

	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt(COUNTER,1536)
    -- every=1, low=0, high=6, step=1, init=1
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_i = 5 THEN
                      ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_i <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_i - 6;
                    ELSE
                        ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_i <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_i,3));


	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg(REG,1537)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux(MUX,1538)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_s <= en;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux: PROCESS (ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_s, ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg_q, ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem(DUALMEM,1598)
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_reset0 <= areset;
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_ia <= reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC2_uid577_sinPiZTableGenerator_0_q;
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_aa <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg_q;
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_ab <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_q;
    ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_iq,
        address_a => ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_aa,
        data_a => ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_ia
    );
        ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_q <= ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_iq(6 downto 0);

	--memoryC0_uid575_sinPiZTableGenerator(LOOKUP,574)@12
    memoryC0_uid575_sinPiZTableGenerator: PROCESS (ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_zAddr_uid210_cpix_uid44_fpTanPiTest_0_to_memoryC0_uid575_sinPiZTableGenerator_0_q_to_memoryC0_uid575_sinPiZTableGenerator_a_replace_mem_q) IS
                WHEN "0000000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100100001111110110101110";
                WHEN "0000001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100100001110100100000010";
                WHEN "0000010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100100001010101100000000";
                WHEN "0000011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100100000100001110101000";
                WHEN "0000100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100011111011001011111101";
                WHEN "0000101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100011101111100100000010";
                WHEN "0000110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100011100001010110111011";
                WHEN "0000111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100011010000100100101111";
                WHEN "0001000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100010111101001101100010";
                WHEN "0001001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100010100111010001011101";
                WHEN "0001010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100010001110110000100111";
                WHEN "0001011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100001110011101011001001";
                WHEN "0001100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100001010110000001001110";
                WHEN "0001101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100000110101110011000000";
                WHEN "0001110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100100000010011000000101011";
                WHEN "0001111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011111101101101010011101";
                WHEN "0010000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011111000101110000100010";
                WHEN "0010001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011110011011010011001011";
                WHEN "0010010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011101101110010010100101";
                WHEN "0010011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011100111110101111000011";
                WHEN "0010100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011100001100101000110101";
                WHEN "0010101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011011011000000000001111";
                WHEN "0010110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011010100000110101100011";
                WHEN "0010111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011001100111001001000110";
                WHEN "0011000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100011000101010111011001110";
                WHEN "0011001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100010111101100001100010000";
                WHEN "0011010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100010110101010111100100100";
                WHEN "0011011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100010101100111001100100010";
                WHEN "0011100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100010100100000111100100011";
                WHEN "0011101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100010011011000001101000000";
                WHEN "0011110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100010010001100111110010110";
                WHEN "0011111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100010000111111010000111111";
                WHEN "0100000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100001111101111000101010111";
                WHEN "0100001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100001110011100011011111110";
                WHEN "0100010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100001101000111010101010001";
                WHEN "0100011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100001011101111110001110000";
                WHEN "0100100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100001010010101110001111010";
                WHEN "0100101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100001000111001010110010010";
                WHEN "0100110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100000111011010011111011001";
                WHEN "0100111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100000101111001001101110010";
                WHEN "0101000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100000100010101100010000001";
                WHEN "0101001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100000010101111011100101011";
                WHEN "0101010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01100000001000110111110010101";
                WHEN "0101011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011111111011100000111100110";
                WHEN "0101100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011111101101110111001000101";
                WHEN "0101101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011111011111111010011011011";
                WHEN "0101110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011111010001101010111001111";
                WHEN "0101111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011111000011001000101001110";
                WHEN "0110000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011110110100010011110000000";
                WHEN "0110001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011110100101001100010010010";
                WHEN "0110010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011110010101110010010110000";
                WHEN "0110011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011110000110000110000001000";
                WHEN "0110100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011101110110000111011000111";
                WHEN "0110101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011101100101110110100011101";
                WHEN "0110110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011101010101010011100111001";
                WHEN "0110111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011101000100011110101001100";
                WHEN "0111000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011100110011010111110000111";
                WHEN "0111001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011100100001111111000011101";
                WHEN "0111010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011100010000010100101000000";
                WHEN "0111011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011011111110011000100100100";
                WHEN "0111100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011011101100001010111111110";
                WHEN "0111101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011011011001101100000000011";
                WHEN "0111110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011011000110111011101101010";
                WHEN "0111111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011010110011111010001101001";
                WHEN "1000000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011010100000100111100111000";
                WHEN "1000001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011010001101000100000001111";
                WHEN "1000010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011001111001001111100100111";
                WHEN "1000011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011001100101001010010111011";
                WHEN "1000100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011001010000110100100000101";
                WHEN "1000101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011000111100001110001000001";
                WHEN "1000110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011000100111010111010101011";
                WHEN "1000111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01011000010010010000001111111";
                WHEN "1001000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010111111100111000111111011";
                WHEN "1001001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010111100111010001101011110";
                WHEN "1001010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010111010001011010011100110";
                WHEN "1001011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010110111011010011011010011";
                WHEN "1001100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010110100100111100101100110";
                WHEN "1001101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010110001110010110011011111";
                WHEN "1001110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010101110111100000110000001";
                WHEN "1001111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010101100000011011110001110";
                WHEN "1010000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010101001001000111101001000";
                WHEN "1010001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010100110001100100011110100";
                WHEN "1010010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010100011001110010011010110";
                WHEN "1010011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010100000001110001100110010";
                WHEN "1010100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010011101001100010001001111";
                WHEN "1010101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010011010001000100001110100";
                WHEN "1010110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010010111000010111111100101";
                WHEN "1010111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010010011111011101011101100";
                WHEN "1011000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010010000110010100111010001";
                WHEN "1011001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010001101100111110011011011";
                WHEN "1011010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010001010011011010001010100";
                WHEN "1011011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010000111001101000010000111";
                WHEN "1011100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010000011111101000110111110";
                WHEN "1011101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01010000000101011100001000010";
                WHEN "1011110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001111101011000010001100001";
                WHEN "1011111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001111010000011011001100111";
                WHEN "1100000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001110110101100111010011111";
                WHEN "1100001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001110011010100110101010111";
                WHEN "1100010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001101111111011001011011101";
                WHEN "1100011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001101100011111111101111111";
                WHEN "1100100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001101001000011001110001011";
                WHEN "1100101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001100101100100111101010001";
                WHEN "1100110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001100010000101001100100001";
                WHEN "1100111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001011110100011111101001011";
                WHEN "1101000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001011011000001010000011111";
                WHEN "1101001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001010111011101000111101111";
                WHEN "1101010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001010011110111100100001011";
                WHEN "1101011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001010000010000100111000111";
                WHEN "1101100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001001100101000010001110101";
                WHEN "1101101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001001000111110100101100111";
                WHEN "1101110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001000101010011100011110001";
                WHEN "1101111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01001000001100111001101100110";
                WHEN "1110000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000111101111001100100011011";
                WHEN "1110001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000111010001010101001100101";
                WHEN "1110010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000110110011010011110010111";
                WHEN "1110011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000110010101001000100001000";
                WHEN "1110100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000101110110110011100001101";
                WHEN "1110101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000101011000010100111111100";
                WHEN "1110110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000100111001101101000101100";
                WHEN "1110111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000100011010111011111110011";
                WHEN "1111000" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000011111100000001110101000";
                WHEN "1111001" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000011011100111110110100010";
                WHEN "1111010" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000010111101110011000111010";
                WHEN "1111011" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000010011110011110111000111";
                WHEN "1111100" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000001111111000010010100010";
                WHEN "1111101" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000001011111011101100100011";
                WHEN "1111110" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000000111111110000110100011";
                WHEN "1111111" =>  memoryC0_uid575_sinPiZTableGenerator_q <= "01000000011111111100001111011";
                WHEN OTHERS =>
                    memoryC0_uid575_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--sumAHighB_uid588_sinPiZPolyEval(ADD,587)@12
    sumAHighB_uid588_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid575_sinPiZTableGenerator_q(28)) & memoryC0_uid575_sinPiZTableGenerator_q);
    sumAHighB_uid588_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid587_sinPiZPolyEval_b(21)) & highBBits_uid587_sinPiZPolyEval_b);
            sumAHighB_uid588_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid588_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid588_sinPiZPolyEval_b));
    sumAHighB_uid588_sinPiZPolyEval_q <= sumAHighB_uid588_sinPiZPolyEval_o(29 downto 0);


	--lowRangeB_uid586_sinPiZPolyEval(BITSELECT,585)@12
    lowRangeB_uid586_sinPiZPolyEval_in <= prodXYTruncFR_uid623_pT2_uid585_sinPiZPolyEval_b(1 downto 0);
    lowRangeB_uid586_sinPiZPolyEval_b <= lowRangeB_uid586_sinPiZPolyEval_in(1 downto 0);

	--s2_uid586_uid589_sinPiZPolyEval(BITJOIN,588)@12
    s2_uid586_uid589_sinPiZPolyEval_q <= sumAHighB_uid588_sinPiZPolyEval_q & lowRangeB_uid586_sinPiZPolyEval_b;

	--fxpSinRes_uid213_cpix_uid44_fpTanPiTest(BITSELECT,212)@12
    fxpSinRes_uid213_cpix_uid44_fpTanPiTest_in <= s2_uid586_uid589_sinPiZPolyEval_q(29 downto 0);
    fxpSinRes_uid213_cpix_uid44_fpTanPiTest_b <= fxpSinRes_uid213_cpix_uid44_fpTanPiTest_in(29 downto 5);

	--reg_fxpSinRes_uid213_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_1(REG,747)@12
    reg_fxpSinRes_uid213_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpSinRes_uid213_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_1_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpSinRes_uid213_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_1_q <= fxpSinRes_uid213_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor(LOGICAL,1672)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_b <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_sticky_ena_q;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_q <= not (ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_a or ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_b);

	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_mem_top(CONSTANT,1668)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_mem_top_q <= "010";

	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp(LOGICAL,1669)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_a <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_mem_top_q;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_q);
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_q <= "1" when ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_a = ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_b else "0";

	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmpReg(REG,1670)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmpReg_q <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_sticky_ena(REG,1673)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_nor_q = "1") THEN
                ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_sticky_ena_q <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd(LOGICAL,1674)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_a <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_sticky_ena_q;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_b <= en;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_q <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_a and ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_b;

	--LeftShiftStage131dto0_uid570_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,569)@7
    LeftShiftStage131dto0_uid570_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q(31 downto 0);
    LeftShiftStage131dto0_uid570_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= LeftShiftStage131dto0_uid570_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(31 downto 0);

	--leftShiftStage2Idx3_uid571_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITJOIN,570)@7
    leftShiftStage2Idx3_uid571_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= LeftShiftStage131dto0_uid570_alignedZ_uid205_cpix_uid44_fpTanPiTest_b & leftShiftStage2Idx3Pad3_uid380_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--LeftShiftStage132dto0_uid567_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,566)@7
    LeftShiftStage132dto0_uid567_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q(32 downto 0);
    LeftShiftStage132dto0_uid567_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= LeftShiftStage132dto0_uid567_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(32 downto 0);

	--leftShiftStage2Idx2_uid568_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITJOIN,567)@7
    leftShiftStage2Idx2_uid568_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= LeftShiftStage132dto0_uid567_alignedZ_uid205_cpix_uid44_fpTanPiTest_b & z_uid306_tpix_uid45_fpTanPiTest_q;

	--LeftShiftStage133dto0_uid564_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,563)@7
    LeftShiftStage133dto0_uid564_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q(33 downto 0);
    LeftShiftStage133dto0_uid564_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= LeftShiftStage133dto0_uid564_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(33 downto 0);

	--leftShiftStage2Idx1_uid565_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITJOIN,564)@7
    leftShiftStage2Idx1_uid565_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= LeftShiftStage133dto0_uid564_alignedZ_uid205_cpix_uid44_fpTanPiTest_b & GND_q;

	--vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,508)@3
    vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= z_uid202_cpix_uid44_fpTanPiTest_b(2 downto 0);
    vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(2 downto 0);

	--ld_vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_b(DELAY,1255)@3
    ld_vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 3, depth => 3 )
    PORT MAP ( xin => vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b, xout => ld_vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITJOIN,547)@6
    leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= ld_vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_q & leftShiftStage0Idx2Pad32_uid357_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,543)@3
    X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= z_uid202_cpix_uid44_fpTanPiTest_b(18 downto 0);
    X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(18 downto 0);

	--ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_inputreg(DELAY,1596)
    ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b, xout => ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b(DELAY,1254)@3
    ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 19, depth => 2 )
    PORT MAP ( xin => ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_inputreg_q, xout => ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITJOIN,544)@6
    leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= ld_X18dto0_uid544_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_b_q & leftShiftStage0Idx1Pad16_uid354_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_inputreg(DELAY,1597)
    ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => z_uid202_cpix_uid44_fpTanPiTest_b, xout => ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c(DELAY,1258)@3
    ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 35, depth => 2 )
    PORT MAP ( xin => ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_inputreg_q, xout => ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,505)@3
    rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= z_uid202_cpix_uid44_fpTanPiTest_b;
    rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(34 downto 3);

	--reg_rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_1(REG,724)@3
    reg_rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q <= rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest(LOGICAL,506)@4
    vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_a <= reg_rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q;
    vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= leftShiftStage0Idx2Pad32_uid357_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
    vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= "1" when vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_a = vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_b else "0";

	--ld_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_f(DELAY,1252)@4
    ld_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q, xout => ld_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid389_lzcZ_uid98_spix_uid43_fpTanPiTest(CONSTANT,388)
    mO_uid389_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= "11111111111111111111111111111";

	--cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITJOIN,509)@3
    cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= vStage_uid509_lzcZ_uid204_cpix_uid44_fpTanPiTest_b & mO_uid389_lzcZ_uid98_spix_uid43_fpTanPiTest_q;

	--reg_cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_3(REG,726)@3
    reg_cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q <= cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest(MUX,511)@4
    vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_s <= vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest: PROCESS (vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_s, en, reg_rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q, reg_cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q)
    BEGIN
            CASE vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= reg_rVStage_uid506_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q;
                  WHEN "1" => vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= reg_cStage_uid510_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q;
                  WHEN OTHERS => vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,513)@4
    rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(31 downto 16);

	--reg_rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_1(REG,727)@4
    reg_rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q <= rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest(LOGICAL,514)@5
    vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_a <= reg_rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q;
    vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= leftShiftStage0Idx1Pad16_uid354_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
    vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= "1" when vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_a = vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_b else "0";

	--ld_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_e(DELAY,1251)@5
    ld_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q, xout => ld_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,515)@4
    vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid512_lzcZ_uid204_cpix_uid44_fpTanPiTest_q(15 downto 0);
    vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(15 downto 0);

	--reg_vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_3(REG,729)@4
    reg_vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q <= vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest(MUX,517)@5
    vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_s <= vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest: PROCESS (vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_s, en, reg_rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q, reg_vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q)
    BEGIN
            CASE vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= reg_rVStage_uid514_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q;
                  WHEN "1" => vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= reg_vStage_uid516_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q;
                  WHEN OTHERS => vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,519)@5
    rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(15 downto 8);

	--vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest(LOGICAL,520)@5
    vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_a <= rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
    vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= cstAllZWE_uid8_fpTanPiTest_q;
    vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= "1" when vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_a = vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_b else "0";

	--reg_vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_3(REG,733)@5
    reg_vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q <= vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid522_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,521)@5
    vStage_uid522_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid518_lzcZ_uid204_cpix_uid44_fpTanPiTest_q(7 downto 0);
    vStage_uid522_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= vStage_uid522_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(7 downto 0);

	--vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest(MUX,523)@5
    vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_s <= vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest: PROCESS (vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_s, en, rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest_b, vStage_uid522_lzcZ_uid204_cpix_uid44_fpTanPiTest_b)
    BEGIN
            CASE vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= rVStage_uid520_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
                  WHEN "1" => vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= vStage_uid522_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
                  WHEN OTHERS => vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,525)@5
    rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(7 downto 4);

	--reg_rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_1(REG,730)@5
    reg_rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q <= rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest(LOGICAL,526)@6
    vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_a <= reg_rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q;
    vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= leftShiftStage1Idx1Pad4_uid363_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
    vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= "1" when vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_a = vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_b else "0";

	--vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,527)@5
    vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid524_lzcZ_uid204_cpix_uid44_fpTanPiTest_q(3 downto 0);
    vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(3 downto 0);

	--reg_vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_3(REG,732)@5
    reg_vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q <= vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest(MUX,529)@6
    vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_s <= vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest: PROCESS (vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_s, en, reg_rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q, reg_vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q)
    BEGIN
            CASE vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= reg_rVStage_uid526_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_1_q;
                  WHEN "1" => vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= reg_vStage_uid528_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q;
                  WHEN OTHERS => vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,531)@6
    rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(3 downto 2);

	--vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest(LOGICAL,532)@6
    vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_a <= rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
    vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= z_uid306_tpix_uid45_fpTanPiTest_q;
    vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= "1" when vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_a = vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_b else "0";

	--vStage_uid534_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,533)@6
    vStage_uid534_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid530_lzcZ_uid204_cpix_uid44_fpTanPiTest_q(1 downto 0);
    vStage_uid534_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= vStage_uid534_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(1 downto 0);

	--vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest(MUX,535)@6
    vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_s <= vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest: PROCESS (vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_s, en, rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest_b, vStage_uid534_lzcZ_uid204_cpix_uid44_fpTanPiTest_b)
    BEGIN
            CASE vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= rVStage_uid532_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
                  WHEN "1" => vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= vStage_uid534_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
                  WHEN OTHERS => vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid538_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITSELECT,537)@6
    rVStage_uid538_lzcZ_uid204_cpix_uid44_fpTanPiTest_in <= vStagei_uid536_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    rVStage_uid538_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= rVStage_uid538_lzcZ_uid204_cpix_uid44_fpTanPiTest_in(1 downto 1);

	--vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest(LOGICAL,538)@6
    vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_a <= rVStage_uid538_lzcZ_uid204_cpix_uid44_fpTanPiTest_b;
    vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_b <= GND_q;
    vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= "1" when vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_a = vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_b else "0";

	--r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest(BITJOIN,539)@6
    r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_q <= ld_vCount_uid507_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_f_q & ld_vCount_uid515_lzcZ_uid204_cpix_uid44_fpTanPiTest_q_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_e_q & reg_vCount_uid521_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_3_q & vCount_uid527_lzcZ_uid204_cpix_uid44_fpTanPiTest_q & vCount_uid533_lzcZ_uid204_cpix_uid44_fpTanPiTest_q & vCount_uid539_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;

	--leftShiftStageSel5Dto4_uid550_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,549)@6
    leftShiftStageSel5Dto4_uid550_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
    leftShiftStageSel5Dto4_uid550_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= leftShiftStageSel5Dto4_uid550_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(5 downto 4);

	--leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest(MUX,550)@6
    leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_s <= leftShiftStageSel5Dto4_uid550_alignedZ_uid205_cpix_uid44_fpTanPiTest_b;
    leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest: PROCESS (leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_s, en, ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_q, leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_q, leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_q, ozz_uid88_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= ld_z_uid202_cpix_uid44_fpTanPiTest_b_to_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_c_q;
                  WHEN "01" => leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= leftShiftStage0Idx1_uid545_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
                  WHEN "10" => leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= leftShiftStage0Idx2_uid548_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
                  WHEN "11" => leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= ozz_uid88_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage022dto0_uid559_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,558)@6
    LeftShiftStage022dto0_uid559_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q(22 downto 0);
    LeftShiftStage022dto0_uid559_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= LeftShiftStage022dto0_uid559_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(22 downto 0);

	--leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITJOIN,559)@6
    leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= LeftShiftStage022dto0_uid559_alignedZ_uid205_cpix_uid44_fpTanPiTest_b & leftShiftStage1Idx3Pad12_uid369_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--reg_leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_5(REG,738)@6
    reg_leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_5_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_5_q <= leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage026dto0_uid556_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,555)@6
    LeftShiftStage026dto0_uid556_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q(26 downto 0);
    LeftShiftStage026dto0_uid556_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= LeftShiftStage026dto0_uid556_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(26 downto 0);

	--leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITJOIN,556)@6
    leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= LeftShiftStage026dto0_uid556_alignedZ_uid205_cpix_uid44_fpTanPiTest_b & cstAllZWE_uid8_fpTanPiTest_q;

	--reg_leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_4(REG,737)@6
    reg_leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_4_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_4_q <= leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage030dto0_uid553_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,552)@6
    LeftShiftStage030dto0_uid553_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q(30 downto 0);
    LeftShiftStage030dto0_uid553_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= LeftShiftStage030dto0_uid553_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(30 downto 0);

	--leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITJOIN,553)@6
    leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= LeftShiftStage030dto0_uid553_alignedZ_uid205_cpix_uid44_fpTanPiTest_b & leftShiftStage1Idx1Pad4_uid363_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--reg_leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_3(REG,736)@6
    reg_leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_3_q <= leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_2(REG,735)@6
    reg_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_2_q <= leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,560)@6
    leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_1(REG,734)@6
    reg_leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_1_q <= leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest(MUX,561)@7
    leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_s <= reg_leftShiftStageSel3Dto2_uid561_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_1_q;
    leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest: PROCESS (leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_s, en, reg_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_2_q, reg_leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_3_q, reg_leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_4_q, reg_leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= reg_leftShiftStage0_uid551_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= reg_leftShiftStage1Idx1_uid554_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= reg_leftShiftStage1Idx2_uid557_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= reg_leftShiftStage1Idx3_uid560_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest(BITSELECT,571)@6
    leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_in <= r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_b <= leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_1(REG,739)@6
    reg_leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_1_q <= leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest(MUX,572)@7
    leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_s <= reg_leftShiftStageSel1Dto0_uid572_alignedZ_uid205_cpix_uid44_fpTanPiTest_0_to_leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_1_q;
    leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest: PROCESS (leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_s, en, leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q, leftShiftStage2Idx1_uid565_alignedZ_uid205_cpix_uid44_fpTanPiTest_q, leftShiftStage2Idx2_uid568_alignedZ_uid205_cpix_uid44_fpTanPiTest_q, leftShiftStage2Idx3_uid571_alignedZ_uid205_cpix_uid44_fpTanPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= leftShiftStage1_uid562_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
                  WHEN "01" => leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= leftShiftStage2Idx1_uid565_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
                  WHEN "10" => leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= leftShiftStage2Idx2_uid568_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
                  WHEN "11" => leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= leftShiftStage2Idx3_uid571_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--alignedZLow_uid206_cpix_uid44_fpTanPiTest(BITSELECT,205)@7
    alignedZLow_uid206_cpix_uid44_fpTanPiTest_in <= leftShiftStage2_uid573_alignedZ_uid205_cpix_uid44_fpTanPiTest_q;
    alignedZLow_uid206_cpix_uid44_fpTanPiTest_b <= alignedZLow_uid206_cpix_uid44_fpTanPiTest_in(34 downto 11);

	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_inputreg(DELAY,1662)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => alignedZLow_uid206_cpix_uid44_fpTanPiTest_b, xout => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt(COUNTER,1664)
    -- every=1, low=0, high=2, step=1, init=1
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_i = 1 THEN
                      ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_eq = '1') THEN
                        ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_i <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_i - 2;
                    ELSE
                        ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_i <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_i,2));


	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdreg(REG,1665)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdreg_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdreg_q <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux(MUX,1666)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_s <= en;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux: PROCESS (ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_s, ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdreg_q, ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_q)
    BEGIN
            CASE ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_s IS
                  WHEN "0" => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_q <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdreg_q;
                  WHEN "1" => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_q <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem(DUALMEM,1663)
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_reset0 <= areset;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_ia <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_inputreg_q;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_aa <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdreg_q;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_ab <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_rdmux_q;
    ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_iq,
        address_a => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_aa,
        data_a => ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_ia
    );
        ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_q <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_iq(23 downto 0);

	--reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0(REG,746)@12
    reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_q <= ld_alignedZLow_uid206_cpix_uid44_fpTanPiTest_b_to_reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest(MULT,590)@13
    prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_pr <= UNSIGNED(prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_a) * UNSIGNED(prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b);
    prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_a <= (others => '0');
            prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b <= (others => '0');
            prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_a <= reg_alignedZLow_uid206_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_0_q;
                prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b <= reg_fxpSinRes_uid213_cpix_uid44_fpTanPiTest_0_to_prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_1_q;
                prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_s1 <= STD_LOGIC_VECTOR(prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_q <= prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest(BITSELECT,591)@16
    prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_in <= prodXY_uid591_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_q;
    prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b <= prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_in(48 downto 23);

	--normBit_uid215_cpix_uid44_fpTanPiTest(BITSELECT,214)@16
    normBit_uid215_cpix_uid44_fpTanPiTest_in <= prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b;
    normBit_uid215_cpix_uid44_fpTanPiTest_b <= normBit_uid215_cpix_uid44_fpTanPiTest_in(25 downto 25);

	--rndExpUpdate_uid220_uid221_cpix_uid44_fpTanPiTest(BITJOIN,220)@16
    rndExpUpdate_uid220_uid221_cpix_uid44_fpTanPiTest_q <= normBit_uid215_cpix_uid44_fpTanPiTest_b & cstAllZWF_uid53_spix_uid43_fpTanPiTest_q & VCC_q;

	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor(LOGICAL,1544)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_b <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_sticky_ena_q;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_q <= not (ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_a or ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_b);

	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_sticky_ena(REG,1545)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_nor_q = "1") THEN
                ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_sticky_ena_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd(LOGICAL,1546)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_a <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_sticky_ena_q;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_b <= en;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_a and ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_b;

	--reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1(REG,748)@6
    reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q <= r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem(DUALMEM,1535)
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_reset0 <= areset;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_ia <= reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_aa <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg_q;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_ab <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_q;
    ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 6,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 6,
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
        clocken1 => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_iq,
        address_a => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_aa,
        data_a => ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_ia
    );
        ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_iq(5 downto 0);

	--biasM1_uid74_spix_uid43_fpTanPiTest(CONSTANT,73)
    biasM1_uid74_spix_uid43_fpTanPiTest_q <= "01111110";

	--expHardCase_uid207_cpix_uid44_fpTanPiTest(SUB,206)@15
    expHardCase_uid207_cpix_uid44_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & biasM1_uid74_spix_uid43_fpTanPiTest_q);
    expHardCase_uid207_cpix_uid44_fpTanPiTest_b <= STD_LOGIC_VECTOR("000" & ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_mem_q);
            expHardCase_uid207_cpix_uid44_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid207_cpix_uid44_fpTanPiTest_a) - UNSIGNED(expHardCase_uid207_cpix_uid44_fpTanPiTest_b));
    expHardCase_uid207_cpix_uid44_fpTanPiTest_q <= expHardCase_uid207_cpix_uid44_fpTanPiTest_o(8 downto 0);


	--expP_uid208_cpix_uid44_fpTanPiTest(BITSELECT,207)@15
    expP_uid208_cpix_uid44_fpTanPiTest_in <= expHardCase_uid207_cpix_uid44_fpTanPiTest_q(7 downto 0);
    expP_uid208_cpix_uid44_fpTanPiTest_b <= expP_uid208_cpix_uid44_fpTanPiTest_in(7 downto 0);

	--reg_expP_uid208_cpix_uid44_fpTanPiTest_0_to_expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_1(REG,749)@15
    reg_expP_uid208_cpix_uid44_fpTanPiTest_0_to_expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expP_uid208_cpix_uid44_fpTanPiTest_0_to_expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expP_uid208_cpix_uid44_fpTanPiTest_0_to_expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_1_q <= expP_uid208_cpix_uid44_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--highRes_uid216_cpix_uid44_fpTanPiTest(BITSELECT,215)@16
    highRes_uid216_cpix_uid44_fpTanPiTest_in <= prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b(24 downto 0);
    highRes_uid216_cpix_uid44_fpTanPiTest_b <= highRes_uid216_cpix_uid44_fpTanPiTest_in(24 downto 1);

	--lowRes_uid217_cpix_uid44_fpTanPiTest(BITSELECT,216)@16
    lowRes_uid217_cpix_uid44_fpTanPiTest_in <= prodXYTruncFR_uid592_mul2xSinRes_uid214_cpix_uid44_fpTanPiTest_b(23 downto 0);
    lowRes_uid217_cpix_uid44_fpTanPiTest_b <= lowRes_uid217_cpix_uid44_fpTanPiTest_in(23 downto 0);

	--fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest(MUX,217)@16
    fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_s <= normBit_uid215_cpix_uid44_fpTanPiTest_b;
    fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest: PROCESS (fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_s, en, lowRes_uid217_cpix_uid44_fpTanPiTest_b, highRes_uid216_cpix_uid44_fpTanPiTest_b)
    BEGIN
            CASE fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_s IS
                  WHEN "0" => fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_q <= lowRes_uid217_cpix_uid44_fpTanPiTest_b;
                  WHEN "1" => fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_q <= highRes_uid216_cpix_uid44_fpTanPiTest_b;
                  WHEN OTHERS => fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest(BITJOIN,218)@16
    expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_q <= reg_expP_uid208_cpix_uid44_fpTanPiTest_0_to_expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_1_q & fracRCompPreRnd_uid218_cpix_uid44_fpTanPiTest_q;

	--expFracComp_uid222_cpix_uid44_fpTanPiTest(ADD,221)@16
    expFracComp_uid222_cpix_uid44_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & expFracPreRnd_uid219_uid219_cpix_uid44_fpTanPiTest_q);
    expFracComp_uid222_cpix_uid44_fpTanPiTest_b <= STD_LOGIC_VECTOR("00000000" & rndExpUpdate_uid220_uid221_cpix_uid44_fpTanPiTest_q);
            expFracComp_uid222_cpix_uid44_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracComp_uid222_cpix_uid44_fpTanPiTest_a) + UNSIGNED(expFracComp_uid222_cpix_uid44_fpTanPiTest_b));
    expFracComp_uid222_cpix_uid44_fpTanPiTest_q <= expFracComp_uid222_cpix_uid44_fpTanPiTest_o(32 downto 0);


	--expRComp_uid224_cpix_uid44_fpTanPiTest(BITSELECT,223)@16
    expRComp_uid224_cpix_uid44_fpTanPiTest_in <= expFracComp_uid222_cpix_uid44_fpTanPiTest_q(31 downto 0);
    expRComp_uid224_cpix_uid44_fpTanPiTest_b <= expRComp_uid224_cpix_uid44_fpTanPiTest_in(31 downto 24);

	--fracXIsZero_uid65_spix_uid43_fpTanPiTest(LOGICAL,64)@0
    fracXIsZero_uid65_spix_uid43_fpTanPiTest_a <= fracX_uid25_fpTanPiTest_b;
    fracXIsZero_uid65_spix_uid43_fpTanPiTest_b <= cstAllZWF_uid53_spix_uid43_fpTanPiTest_q;
    fracXIsZero_uid65_spix_uid43_fpTanPiTest_q <= "1" when fracXIsZero_uid65_spix_uid43_fpTanPiTest_a = fracXIsZero_uid65_spix_uid43_fpTanPiTest_b else "0";

	--ld_fracXIsZero_uid65_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_b(DELAY,803)@0
    ld_fracXIsZero_uid65_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => fracXIsZero_uid65_spix_uid43_fpTanPiTest_q, xout => ld_fracXIsZero_uid65_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvFracXIsZero_uid67_spix_uid43_fpTanPiTest(LOGICAL,66)@2
    InvFracXIsZero_uid67_spix_uid43_fpTanPiTest_a <= ld_fracXIsZero_uid65_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_b_q;
    InvFracXIsZero_uid67_spix_uid43_fpTanPiTest_q <= not InvFracXIsZero_uid67_spix_uid43_fpTanPiTest_a;

	--expXIsMax_uid63_spix_uid43_fpTanPiTest(LOGICAL,62)@0
    expXIsMax_uid63_spix_uid43_fpTanPiTest_a <= exp_uid9_fpTanPiTest_b;
    expXIsMax_uid63_spix_uid43_fpTanPiTest_b <= cstAllOWE_uid52_spix_uid43_fpTanPiTest_q;
    expXIsMax_uid63_spix_uid43_fpTanPiTest_q <= "1" when expXIsMax_uid63_spix_uid43_fpTanPiTest_a = expXIsMax_uid63_spix_uid43_fpTanPiTest_b else "0";

	--ld_expXIsMax_uid63_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_a(DELAY,802)@0
    ld_expXIsMax_uid63_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => expXIsMax_uid63_spix_uid43_fpTanPiTest_q, xout => ld_expXIsMax_uid63_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_N_uid68_spix_uid43_fpTanPiTest(LOGICAL,67)@2
    exc_N_uid68_spix_uid43_fpTanPiTest_a <= ld_expXIsMax_uid63_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_a_q;
    exc_N_uid68_spix_uid43_fpTanPiTest_b <= InvFracXIsZero_uid67_spix_uid43_fpTanPiTest_q;
    exc_N_uid68_spix_uid43_fpTanPiTest_q <= exc_N_uid68_spix_uid43_fpTanPiTest_a and exc_N_uid68_spix_uid43_fpTanPiTest_b;

	--InvExc_N_uid69_spix_uid43_fpTanPiTest(LOGICAL,68)@2
    InvExc_N_uid69_spix_uid43_fpTanPiTest_a <= exc_N_uid68_spix_uid43_fpTanPiTest_q;
    InvExc_N_uid69_spix_uid43_fpTanPiTest_q <= not InvExc_N_uid69_spix_uid43_fpTanPiTest_a;

	--exc_I_uid66_spix_uid43_fpTanPiTest(LOGICAL,65)@2
    exc_I_uid66_spix_uid43_fpTanPiTest_a <= ld_expXIsMax_uid63_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_a_q;
    exc_I_uid66_spix_uid43_fpTanPiTest_b <= ld_fracXIsZero_uid65_spix_uid43_fpTanPiTest_q_to_exc_I_uid66_spix_uid43_fpTanPiTest_b_q;
    exc_I_uid66_spix_uid43_fpTanPiTest_q <= exc_I_uid66_spix_uid43_fpTanPiTest_a and exc_I_uid66_spix_uid43_fpTanPiTest_b;

	--InvExc_I_uid70_spix_uid43_fpTanPiTest(LOGICAL,69)@2
    InvExc_I_uid70_spix_uid43_fpTanPiTest_a <= exc_I_uid66_spix_uid43_fpTanPiTest_q;
    InvExc_I_uid70_spix_uid43_fpTanPiTest_q <= not InvExc_I_uid70_spix_uid43_fpTanPiTest_a;

	--expXIsZero_uid10_fpTanPiTest(LOGICAL,9)@0
    expXIsZero_uid10_fpTanPiTest_a <= exp_uid9_fpTanPiTest_b;
    expXIsZero_uid10_fpTanPiTest_b <= cstAllZWE_uid8_fpTanPiTest_q;
    expXIsZero_uid10_fpTanPiTest_q <= "1" when expXIsZero_uid10_fpTanPiTest_a = expXIsZero_uid10_fpTanPiTest_b else "0";

	--InvExpXIsZero_uid71_spix_uid43_fpTanPiTest(LOGICAL,70)@0
    InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_a <= expXIsZero_uid10_fpTanPiTest_q;
    InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_q <= not InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_a;

	--ld_InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_q_to_exc_R_uid72_spix_uid43_fpTanPiTest_a(DELAY,810)@0
    ld_InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_q_to_exc_R_uid72_spix_uid43_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_q, xout => ld_InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_q_to_exc_R_uid72_spix_uid43_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_R_uid72_spix_uid43_fpTanPiTest(LOGICAL,71)@2
    exc_R_uid72_spix_uid43_fpTanPiTest_a <= ld_InvExpXIsZero_uid71_spix_uid43_fpTanPiTest_q_to_exc_R_uid72_spix_uid43_fpTanPiTest_a_q;
    exc_R_uid72_spix_uid43_fpTanPiTest_b <= InvExc_I_uid70_spix_uid43_fpTanPiTest_q;
    exc_R_uid72_spix_uid43_fpTanPiTest_c <= InvExc_N_uid69_spix_uid43_fpTanPiTest_q;
    exc_R_uid72_spix_uid43_fpTanPiTest_q <= exc_R_uid72_spix_uid43_fpTanPiTest_a and exc_R_uid72_spix_uid43_fpTanPiTest_b and exc_R_uid72_spix_uid43_fpTanPiTest_c;

	--xIsHalf_uid231_cpix_uid44_fpTanPiTest(LOGICAL,230)@2
    xIsHalf_uid231_cpix_uid44_fpTanPiTest_a <= exc_R_uid72_spix_uid43_fpTanPiTest_q;
    xIsHalf_uid231_cpix_uid44_fpTanPiTest_b <= yIsZero_uid90_spix_uid43_fpTanPiTest_q;
    xIsHalf_uid231_cpix_uid44_fpTanPiTest_c <= InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_q;
    xIsHalf_uid231_cpix_uid44_fpTanPiTest_d <= InvXIntExp_uid131_spix_uid43_fpTanPiTest_q;
    xIsHalf_uid231_cpix_uid44_fpTanPiTest_q <= xIsHalf_uid231_cpix_uid44_fpTanPiTest_a and xIsHalf_uid231_cpix_uid44_fpTanPiTest_b and xIsHalf_uid231_cpix_uid44_fpTanPiTest_c and xIsHalf_uid231_cpix_uid44_fpTanPiTest_d;

	--ld_xIsHalf_uid231_cpix_uid44_fpTanPiTest_q_to_expRPostExc1_uid239_cpix_uid44_fpTanPiTest_b(DELAY,959)@2
    ld_xIsHalf_uid231_cpix_uid44_fpTanPiTest_q_to_expRPostExc1_uid239_cpix_uid44_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => xIsHalf_uid231_cpix_uid44_fpTanPiTest_q, xout => ld_xIsHalf_uid231_cpix_uid44_fpTanPiTest_q_to_expRPostExc1_uid239_cpix_uid44_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRPostExc1_uid239_cpix_uid44_fpTanPiTest(MUX,238)@16
    expRPostExc1_uid239_cpix_uid44_fpTanPiTest_s <= ld_xIsHalf_uid231_cpix_uid44_fpTanPiTest_q_to_expRPostExc1_uid239_cpix_uid44_fpTanPiTest_b_q;
    expRPostExc1_uid239_cpix_uid44_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc1_uid239_cpix_uid44_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRPostExc1_uid239_cpix_uid44_fpTanPiTest_s IS
                      WHEN "0" => expRPostExc1_uid239_cpix_uid44_fpTanPiTest_q <= expRComp_uid224_cpix_uid44_fpTanPiTest_b;
                      WHEN "1" => expRPostExc1_uid239_cpix_uid44_fpTanPiTest_q <= cstAllZWE_uid8_fpTanPiTest_q;
                      WHEN OTHERS => expRPostExc1_uid239_cpix_uid44_fpTanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor(LOGICAL,1556)
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_b <= ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_sticky_ena_q;
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_q <= not (ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_a or ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_b);

	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_mem_top(CONSTANT,1528)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_mem_top_q <= "01100";

	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp(LOGICAL,1529)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_a <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_mem_top_q;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_q);
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_q <= "1" when ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_a = ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_b else "0";

	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmpReg(REG,1530)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmpReg_q <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_sticky_ena(REG,1557)
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_nor_q = "1") THEN
                ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_sticky_ena_q <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd(LOGICAL,1558)
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_a <= ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_sticky_ena_q;
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_b <= en;
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_q <= ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_a and ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_b;

	--ld_expXIsZero_uid10_fpTanPiTest_q_to_excRZero_uid134_spix_uid43_fpTanPiTest_b(DELAY,877)@0
    ld_expXIsZero_uid10_fpTanPiTest_q_to_excRZero_uid134_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => expXIsZero_uid10_fpTanPiTest_q, xout => ld_expXIsZero_uid10_fpTanPiTest_q_to_excRZero_uid134_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fxpXFracZero_uid193_cpix_uid44_fpTanPiTest(LOGICAL,192)@2
    fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_a <= reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1_q;
    fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_b <= STD_LOGIC_VECTOR("0" & ozz_uid88_spix_uid43_fpTanPiTest_q);
    fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_q <= "1" when fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_a = fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_b else "0";

	--fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest(LOGICAL,225)@2
    fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_a <= fxpXFracZero_uid193_cpix_uid44_fpTanPiTest_q;
    fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_b <= InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_q;
    fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_q <= fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_a and fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_b;

	--evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest(LOGICAL,226)@2
    evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_a <= ld_xIntExp_uid73_spix_uid43_fpTanPiTest_c_to_xIntYz_uid129_spix_uid43_fpTanPiTest_a_q;
    evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_b <= fracZCosNotOne_uid226_cpix_uid44_fpTanPiTest_q;
    evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_q <= evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_a or evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_b;

	--xIsInt_uid228_cpix_uid44_fpTanPiTest(LOGICAL,227)@2
    xIsInt_uid228_cpix_uid44_fpTanPiTest_a <= exc_R_uid72_spix_uid43_fpTanPiTest_q;
    xIsInt_uid228_cpix_uid44_fpTanPiTest_b <= evenIntCosNotOneFZ_uid227_cpix_uid44_fpTanPiTest_q;
    xIsInt_uid228_cpix_uid44_fpTanPiTest_q <= xIsInt_uid228_cpix_uid44_fpTanPiTest_a and xIsInt_uid228_cpix_uid44_fpTanPiTest_b;

	--xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest(LOGICAL,240)@2
    xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_a <= xIsInt_uid228_cpix_uid44_fpTanPiTest_q;
    xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_b <= ld_expXIsZero_uid10_fpTanPiTest_q_to_excRZero_uid134_spix_uid43_fpTanPiTest_b_q;
    xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_c <= ld_tanXIsX_uid28_fpTanPiTest_c_to_InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a_q;
    xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_q <= xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_a or xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_b or xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_c;

	--excRNaN_uid232_cpix_uid44_fpTanPiTest(LOGICAL,231)@2
    excRNaN_uid232_cpix_uid44_fpTanPiTest_a <= exc_N_uid68_spix_uid43_fpTanPiTest_q;
    excRNaN_uid232_cpix_uid44_fpTanPiTest_b <= exc_I_uid66_spix_uid43_fpTanPiTest_q;
    excRNaN_uid232_cpix_uid44_fpTanPiTest_q <= excRNaN_uid232_cpix_uid44_fpTanPiTest_a or excRNaN_uid232_cpix_uid44_fpTanPiTest_b;

	--rInfOrNaN_uid240_cpix_uid44_fpTanPiTest(LOGICAL,239)@2
    rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_a <= GND_q;
    rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_b <= excRNaN_uid232_cpix_uid44_fpTanPiTest_q;
    rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_q <= rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_a or rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_b;

	--join_uid242_cpix_uid44_fpTanPiTest(BITJOIN,241)@2
    join_uid242_cpix_uid44_fpTanPiTest_q <= xIntOrXZOrCosOne_uid241_cpix_uid44_fpTanPiTest_q & rInfOrNaN_uid240_cpix_uid44_fpTanPiTest_q;

	--reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1(REG,751)@2
    reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q <= join_uid242_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt(COUNTER,1524)
    -- every=1, low=0, high=12, step=1, init=1
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_i = 11 THEN
                      ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_i <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_i - 12;
                    ELSE
                        ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_i <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_i,4));


	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg(REG,1525)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg_q <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux(MUX,1526)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_s <= en;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux: PROCESS (ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_s, ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg_q, ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_q <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_q <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem(DUALMEM,1547)
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_reset0 <= areset;
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_ia <= reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q;
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_aa <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg_q;
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_ab <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_q;
    ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 2,
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
        clocken1 => ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_iq,
        address_a => ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_aa,
        data_a => ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_ia
    );
        ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_q <= ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_iq(1 downto 0);

	--expRPostExc_uid243_cpix_uid44_fpTanPiTest(MUX,242)@17
    expRPostExc_uid243_cpix_uid44_fpTanPiTest_s <= ld_reg_join_uid242_cpix_uid44_fpTanPiTest_0_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_1_q_to_expRPostExc_uid243_cpix_uid44_fpTanPiTest_b_replace_mem_q;
    expRPostExc_uid243_cpix_uid44_fpTanPiTest: PROCESS (expRPostExc_uid243_cpix_uid44_fpTanPiTest_s, en, expRPostExc1_uid239_cpix_uid44_fpTanPiTest_q, cstAllOWE_uid52_spix_uid43_fpTanPiTest_q, cstBias_uid54_spix_uid43_fpTanPiTest_q, cstBias_uid54_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE expRPostExc_uid243_cpix_uid44_fpTanPiTest_s IS
                  WHEN "00" => expRPostExc_uid243_cpix_uid44_fpTanPiTest_q <= expRPostExc1_uid239_cpix_uid44_fpTanPiTest_q;
                  WHEN "01" => expRPostExc_uid243_cpix_uid44_fpTanPiTest_q <= cstAllOWE_uid52_spix_uid43_fpTanPiTest_q;
                  WHEN "10" => expRPostExc_uid243_cpix_uid44_fpTanPiTest_q <= cstBias_uid54_spix_uid43_fpTanPiTest_q;
                  WHEN "11" => expRPostExc_uid243_cpix_uid44_fpTanPiTest_q <= cstBias_uid54_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => expRPostExc_uid243_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest(CONSTANT,136)
    oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest_q <= "00000000000000000000001";

	--fracRComp_uid223_cpix_uid44_fpTanPiTest(BITSELECT,222)@16
    fracRComp_uid223_cpix_uid44_fpTanPiTest_in <= expFracComp_uid222_cpix_uid44_fpTanPiTest_q(23 downto 0);
    fracRComp_uid223_cpix_uid44_fpTanPiTest_b <= fracRComp_uid223_cpix_uid44_fpTanPiTest_in(23 downto 1);

	--reg_xIsHalf_uid231_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_5(REG,720)@2
    reg_xIsHalf_uid231_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xIsHalf_uid231_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_5_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xIsHalf_uid231_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_5_q <= xIsHalf_uid231_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_expXIsZero_uid10_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_4(REG,719)@2
    reg_expXIsZero_uid10_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expXIsZero_uid10_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expXIsZero_uid10_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_4_q <= ld_expXIsZero_uid10_fpTanPiTest_q_to_excRZero_uid134_spix_uid43_fpTanPiTest_b_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_yIsZero_uid90_spix_uid43_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_3(REG,718)@2
    reg_yIsZero_uid90_spix_uid43_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yIsZero_uid90_spix_uid43_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yIsZero_uid90_spix_uid43_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_3_q <= yIsZero_uid90_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_xIsInt_uid228_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_2(REG,717)@2
    reg_xIsInt_uid228_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xIsInt_uid228_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xIsInt_uid228_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_2_q <= xIsInt_uid228_cpix_uid44_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_tanXIsX_uid28_fpTanPiTest_1_to_bigCond_uid233_cpix_uid44_fpTanPiTest_1(REG,716)@2
    reg_tanXIsX_uid28_fpTanPiTest_1_to_bigCond_uid233_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_tanXIsX_uid28_fpTanPiTest_1_to_bigCond_uid233_cpix_uid44_fpTanPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_tanXIsX_uid28_fpTanPiTest_1_to_bigCond_uid233_cpix_uid44_fpTanPiTest_1_q <= ld_tanXIsX_uid28_fpTanPiTest_c_to_InvCosXIsOne_uid225_cpix_uid44_fpTanPiTest_a_q;
            END IF;
        END IF;
    END PROCESS;


	--bigCond_uid233_cpix_uid44_fpTanPiTest(LOGICAL,232)@3
    bigCond_uid233_cpix_uid44_fpTanPiTest_a <= reg_tanXIsX_uid28_fpTanPiTest_1_to_bigCond_uid233_cpix_uid44_fpTanPiTest_1_q;
    bigCond_uid233_cpix_uid44_fpTanPiTest_b <= reg_xIsInt_uid228_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_2_q;
    bigCond_uid233_cpix_uid44_fpTanPiTest_c <= reg_yIsZero_uid90_spix_uid43_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_3_q;
    bigCond_uid233_cpix_uid44_fpTanPiTest_d <= reg_expXIsZero_uid10_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_4_q;
    bigCond_uid233_cpix_uid44_fpTanPiTest_f <= reg_xIsHalf_uid231_cpix_uid44_fpTanPiTest_0_to_bigCond_uid233_cpix_uid44_fpTanPiTest_5_q;
    bigCond_uid233_cpix_uid44_fpTanPiTest_g <= GND_q;
    bigCond_uid233_cpix_uid44_fpTanPiTest_q <= bigCond_uid233_cpix_uid44_fpTanPiTest_a or bigCond_uid233_cpix_uid44_fpTanPiTest_b or bigCond_uid233_cpix_uid44_fpTanPiTest_c or bigCond_uid233_cpix_uid44_fpTanPiTest_d or bigCond_uid233_cpix_uid44_fpTanPiTest_f or bigCond_uid233_cpix_uid44_fpTanPiTest_g;

	--ld_bigCond_uid233_cpix_uid44_fpTanPiTest_q_to_fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_b(DELAY,955)@3
    ld_bigCond_uid233_cpix_uid44_fpTanPiTest_q_to_fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => bigCond_uid233_cpix_uid44_fpTanPiTest_q, xout => ld_bigCond_uid233_cpix_uid44_fpTanPiTest_q_to_fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc1_uid234_cpix_uid44_fpTanPiTest(MUX,233)@16
    fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_s <= ld_bigCond_uid233_cpix_uid44_fpTanPiTest_q_to_fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_b_q;
    fracRPostExc1_uid234_cpix_uid44_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_s IS
                      WHEN "0" => fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_q <= fracRComp_uid223_cpix_uid44_fpTanPiTest_b;
                      WHEN "1" => fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_q <= cstAllZWF_uid53_spix_uid43_fpTanPiTest_q;
                      WHEN OTHERS => fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid232_cpix_uid44_fpTanPiTest_q_to_reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_a(DELAY,1416)@2
    ld_excRNaN_uid232_cpix_uid44_fpTanPiTest_q_to_reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => excRNaN_uid232_cpix_uid44_fpTanPiTest_q, xout => ld_excRNaN_uid232_cpix_uid44_fpTanPiTest_q_to_reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1(REG,750)@16
    reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_q <= ld_excRNaN_uid232_cpix_uid44_fpTanPiTest_q_to_reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExc_uid236_cpix_uid44_fpTanPiTest(MUX,235)@17
    fracRPostExc_uid236_cpix_uid44_fpTanPiTest_s <= reg_excRNaN_uid232_cpix_uid44_fpTanPiTest_0_to_fracRPostExc_uid236_cpix_uid44_fpTanPiTest_1_q;
    fracRPostExc_uid236_cpix_uid44_fpTanPiTest: PROCESS (fracRPostExc_uid236_cpix_uid44_fpTanPiTest_s, en, fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_q, oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE fracRPostExc_uid236_cpix_uid44_fpTanPiTest_s IS
                  WHEN "0" => fracRPostExc_uid236_cpix_uid44_fpTanPiTest_q <= fracRPostExc1_uid234_cpix_uid44_fpTanPiTest_q;
                  WHEN "1" => fracRPostExc_uid236_cpix_uid44_fpTanPiTest_q <= oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid236_cpix_uid44_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid250_cpix_uid44_fpTanPiTest(BITJOIN,249)@17
    R_uid250_cpix_uid44_fpTanPiTest_q <= ld_signR_uid249_cpix_uid44_fpTanPiTest_q_to_R_uid250_cpix_uid44_fpTanPiTest_c_q & expRPostExc_uid243_cpix_uid44_fpTanPiTest_q & fracRPostExc_uid236_cpix_uid44_fpTanPiTest_q;

	--fracY_uid259_tpix_uid45_fpTanPiTest(BITSELECT,258)@17
    fracY_uid259_tpix_uid45_fpTanPiTest_in <= R_uid250_cpix_uid44_fpTanPiTest_q(22 downto 0);
    fracY_uid259_tpix_uid45_fpTanPiTest_b <= fracY_uid259_tpix_uid45_fpTanPiTest_in(22 downto 0);

	--fracXIsZero_uid286_tpix_uid45_fpTanPiTest(LOGICAL,285)@17
    fracXIsZero_uid286_tpix_uid45_fpTanPiTest_a <= fracY_uid259_tpix_uid45_fpTanPiTest_b;
    fracXIsZero_uid286_tpix_uid45_fpTanPiTest_b <= cstAllZWF_uid53_spix_uid43_fpTanPiTest_q;
    fracXIsZero_uid286_tpix_uid45_fpTanPiTest_q <= "1" when fracXIsZero_uid286_tpix_uid45_fpTanPiTest_a = fracXIsZero_uid286_tpix_uid45_fpTanPiTest_b else "0";

	--expY_uid258_tpix_uid45_fpTanPiTest(BITSELECT,257)@17
    expY_uid258_tpix_uid45_fpTanPiTest_in <= R_uid250_cpix_uid44_fpTanPiTest_q(30 downto 0);
    expY_uid258_tpix_uid45_fpTanPiTest_b <= expY_uid258_tpix_uid45_fpTanPiTest_in(30 downto 23);

	--expXIsMax_uid284_tpix_uid45_fpTanPiTest(LOGICAL,283)@17
    expXIsMax_uid284_tpix_uid45_fpTanPiTest_a <= expY_uid258_tpix_uid45_fpTanPiTest_b;
    expXIsMax_uid284_tpix_uid45_fpTanPiTest_b <= cstAllOWE_uid52_spix_uid43_fpTanPiTest_q;
    expXIsMax_uid284_tpix_uid45_fpTanPiTest_q <= "1" when expXIsMax_uid284_tpix_uid45_fpTanPiTest_a = expXIsMax_uid284_tpix_uid45_fpTanPiTest_b else "0";

	--exc_I_uid287_tpix_uid45_fpTanPiTest(LOGICAL,286)@17
    exc_I_uid287_tpix_uid45_fpTanPiTest_a <= expXIsMax_uid284_tpix_uid45_fpTanPiTest_q;
    exc_I_uid287_tpix_uid45_fpTanPiTest_b <= fracXIsZero_uid286_tpix_uid45_fpTanPiTest_q;
    exc_I_uid287_tpix_uid45_fpTanPiTest_q <= exc_I_uid287_tpix_uid45_fpTanPiTest_a and exc_I_uid287_tpix_uid45_fpTanPiTest_b;

	--ld_intXParity_uid85_spix_uid43_fpTanPiTest_b_to_signComp_uid148_spix_uid43_fpTanPiTest_c(DELAY,898)@1
    ld_intXParity_uid85_spix_uid43_fpTanPiTest_b_to_signComp_uid148_spix_uid43_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => intXParity_uid85_spix_uid43_fpTanPiTest_b, xout => ld_intXParity_uid85_spix_uid43_fpTanPiTest_b_to_signComp_uid148_spix_uid43_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--xFrac_uid75_spix_uid43_fpTanPiTest(COMPARE,74)@0
    xFrac_uid75_spix_uid43_fpTanPiTest_cin <= GND_q;
    xFrac_uid75_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("00" & biasM1_uid74_spix_uid43_fpTanPiTest_q) & '0';
    xFrac_uid75_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("00" & exp_uid9_fpTanPiTest_b) & xFrac_uid75_spix_uid43_fpTanPiTest_cin(0);
            xFrac_uid75_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xFrac_uid75_spix_uid43_fpTanPiTest_a) - UNSIGNED(xFrac_uid75_spix_uid43_fpTanPiTest_b));
    xFrac_uid75_spix_uid43_fpTanPiTest_n(0) <= not xFrac_uid75_spix_uid43_fpTanPiTest_o(10);


	--ld_xFrac_uid75_spix_uid43_fpTanPiTest_n_to_InvXFrac_uid146_spix_uid43_fpTanPiTest_a(DELAY,894)@0
    ld_xFrac_uid75_spix_uid43_fpTanPiTest_n_to_InvXFrac_uid146_spix_uid43_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xFrac_uid75_spix_uid43_fpTanPiTest_n, xout => ld_xFrac_uid75_spix_uid43_fpTanPiTest_n_to_InvXFrac_uid146_spix_uid43_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvXFrac_uid146_spix_uid43_fpTanPiTest(LOGICAL,145)@2
    InvXFrac_uid146_spix_uid43_fpTanPiTest_a <= ld_xFrac_uid75_spix_uid43_fpTanPiTest_n_to_InvXFrac_uid146_spix_uid43_fpTanPiTest_a_q;
    InvXFrac_uid146_spix_uid43_fpTanPiTest_q <= not InvXFrac_uid146_spix_uid43_fpTanPiTest_a;

	--biasMwShift_uid76_spix_uid43_fpTanPiTest(CONSTANT,75)
    biasMwShift_uid76_spix_uid43_fpTanPiTest_q <= "01110011";

	--sinXIsX_uid77_spix_uid43_fpTanPiTest(COMPARE,76)@0
    sinXIsX_uid77_spix_uid43_fpTanPiTest_cin <= GND_q;
    sinXIsX_uid77_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("00" & exp_uid9_fpTanPiTest_b) & '0';
    sinXIsX_uid77_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("00" & biasMwShift_uid76_spix_uid43_fpTanPiTest_q) & sinXIsX_uid77_spix_uid43_fpTanPiTest_cin(0);
            sinXIsX_uid77_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sinXIsX_uid77_spix_uid43_fpTanPiTest_a) - UNSIGNED(sinXIsX_uid77_spix_uid43_fpTanPiTest_b));
    sinXIsX_uid77_spix_uid43_fpTanPiTest_c(0) <= sinXIsX_uid77_spix_uid43_fpTanPiTest_o(10);


	--ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_InvSinXIsX_uid127_spix_uid43_fpTanPiTest_a(DELAY,864)@0
    ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_InvSinXIsX_uid127_spix_uid43_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => sinXIsX_uid77_spix_uid43_fpTanPiTest_c, xout => ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_InvSinXIsX_uid127_spix_uid43_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvSinXIsX_uid127_spix_uid43_fpTanPiTest(LOGICAL,126)@2
    InvSinXIsX_uid127_spix_uid43_fpTanPiTest_a <= ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_InvSinXIsX_uid127_spix_uid43_fpTanPiTest_a_q;
    InvSinXIsX_uid127_spix_uid43_fpTanPiTest_q <= not InvSinXIsX_uid127_spix_uid43_fpTanPiTest_a;

	--yIsZero_uid87_spix_uid43_fpTanPiTest(LOGICAL,86)@2
    yIsZero_uid87_spix_uid43_fpTanPiTest_a <= reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1_q;
    yIsZero_uid87_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000" & GND_q);
    yIsZero_uid87_spix_uid43_fpTanPiTest_q <= "1" when yIsZero_uid87_spix_uid43_fpTanPiTest_a = yIsZero_uid87_spix_uid43_fpTanPiTest_b else "0";

	--yZSinXNX_uid128_spix_uid43_fpTanPiTest(LOGICAL,127)@2
    yZSinXNX_uid128_spix_uid43_fpTanPiTest_a <= yIsZero_uid87_spix_uid43_fpTanPiTest_q;
    yZSinXNX_uid128_spix_uid43_fpTanPiTest_b <= InvSinXIsX_uid127_spix_uid43_fpTanPiTest_q;
    yZSinXNX_uid128_spix_uid43_fpTanPiTest_q <= yZSinXNX_uid128_spix_uid43_fpTanPiTest_a and yZSinXNX_uid128_spix_uid43_fpTanPiTest_b;

	--xIntYz_uid129_spix_uid43_fpTanPiTest(LOGICAL,128)@2
    xIntYz_uid129_spix_uid43_fpTanPiTest_a <= ld_xIntExp_uid73_spix_uid43_fpTanPiTest_c_to_xIntYz_uid129_spix_uid43_fpTanPiTest_a_q;
    xIntYz_uid129_spix_uid43_fpTanPiTest_b <= yZSinXNX_uid128_spix_uid43_fpTanPiTest_q;
    xIntYz_uid129_spix_uid43_fpTanPiTest_q <= xIntYz_uid129_spix_uid43_fpTanPiTest_a or xIntYz_uid129_spix_uid43_fpTanPiTest_b;

	--xIsInt_uid130_spix_uid43_fpTanPiTest(LOGICAL,129)@2
    xIsInt_uid130_spix_uid43_fpTanPiTest_a <= exc_R_uid72_spix_uid43_fpTanPiTest_q;
    xIsInt_uid130_spix_uid43_fpTanPiTest_b <= xIntYz_uid129_spix_uid43_fpTanPiTest_q;
    xIsInt_uid130_spix_uid43_fpTanPiTest_q <= xIsInt_uid130_spix_uid43_fpTanPiTest_a and xIsInt_uid130_spix_uid43_fpTanPiTest_b;

	--InvXIsInt_uid147_spix_uid43_fpTanPiTest(LOGICAL,146)@2
    InvXIsInt_uid147_spix_uid43_fpTanPiTest_a <= xIsInt_uid130_spix_uid43_fpTanPiTest_q;
    InvXIsInt_uid147_spix_uid43_fpTanPiTest_q <= not InvXIsInt_uid147_spix_uid43_fpTanPiTest_a;

	--signComp_uid148_spix_uid43_fpTanPiTest(LOGICAL,147)@2
    signComp_uid148_spix_uid43_fpTanPiTest_a <= InvXIsInt_uid147_spix_uid43_fpTanPiTest_q;
    signComp_uid148_spix_uid43_fpTanPiTest_b <= InvXFrac_uid146_spix_uid43_fpTanPiTest_q;
    signComp_uid148_spix_uid43_fpTanPiTest_c <= ld_intXParity_uid85_spix_uid43_fpTanPiTest_b_to_signComp_uid148_spix_uid43_fpTanPiTest_c_q;
    signComp_uid148_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signComp_uid148_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signComp_uid148_spix_uid43_fpTanPiTest_q <= signComp_uid148_spix_uid43_fpTanPiTest_a and signComp_uid148_spix_uid43_fpTanPiTest_b and signComp_uid148_spix_uid43_fpTanPiTest_c;
        END IF;
    END PROCESS;



	--InvYIsZero_uid149_spix_uid43_fpTanPiTest(LOGICAL,148)@2
    InvYIsZero_uid149_spix_uid43_fpTanPiTest_a <= yIsZero_uid87_spix_uid43_fpTanPiTest_q;
    InvYIsZero_uid149_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvYIsZero_uid149_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvYIsZero_uid149_spix_uid43_fpTanPiTest_q <= not InvYIsZero_uid149_spix_uid43_fpTanPiTest_a;
        END IF;
    END PROCESS;



	--yZSC_uid150_spix_uid43_fpTanPiTest(LOGICAL,149)@3
    yZSC_uid150_spix_uid43_fpTanPiTest_a <= InvYIsZero_uid149_spix_uid43_fpTanPiTest_q;
    yZSC_uid150_spix_uid43_fpTanPiTest_b <= signComp_uid148_spix_uid43_fpTanPiTest_q;
    yZSC_uid150_spix_uid43_fpTanPiTest_q <= yZSC_uid150_spix_uid43_fpTanPiTest_a and yZSC_uid150_spix_uid43_fpTanPiTest_b;

	--ld_signX_uid26_fpTanPiTest_b_to_signR_uid151_spix_uid43_fpTanPiTest_a(DELAY,902)@0
    ld_signX_uid26_fpTanPiTest_b_to_signR_uid151_spix_uid43_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => signX_uid26_fpTanPiTest_b, xout => ld_signX_uid26_fpTanPiTest_b_to_signR_uid151_spix_uid43_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signR_uid151_spix_uid43_fpTanPiTest(LOGICAL,150)@3
    signR_uid151_spix_uid43_fpTanPiTest_a <= ld_signX_uid26_fpTanPiTest_b_to_signR_uid151_spix_uid43_fpTanPiTest_a_q;
    signR_uid151_spix_uid43_fpTanPiTest_b <= yZSC_uid150_spix_uid43_fpTanPiTest_q;
    signR_uid151_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid151_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signR_uid151_spix_uid43_fpTanPiTest_q <= signR_uid151_spix_uid43_fpTanPiTest_a xor signR_uid151_spix_uid43_fpTanPiTest_b;
        END IF;
    END PROCESS;



	--ld_signR_uid151_spix_uid43_fpTanPiTest_q_to_R_uid152_spix_uid43_fpTanPiTest_c(DELAY,906)@4
    ld_signR_uid151_spix_uid43_fpTanPiTest_q_to_R_uid152_spix_uid43_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => signR_uid151_spix_uid43_fpTanPiTest_q, xout => ld_signR_uid151_spix_uid43_fpTanPiTest_q_to_R_uid152_spix_uid43_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--piwFP2_uid114_spix_uid43_fpTanPiTest(CONSTANT,113)
    piwFP2_uid114_spix_uid43_fpTanPiTest_q <= "1100100100001111110110101";

	--cOne_uid91_spix_uid43_fpTanPiTest(CONSTANT,90)
    cOne_uid91_spix_uid43_fpTanPiTest_q <= "1000000000000000000000000000000000000";

	--oneMinusY_uid92_spix_uid43_fpTanPiTest(SUB,91)@2
    oneMinusY_uid92_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & cOne_uid91_spix_uid43_fpTanPiTest_q);
    oneMinusY_uid92_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("00" & reg_y_uid86_spix_uid43_fpTanPiTest_0_to_yIsZero_uid90_spix_uid43_fpTanPiTest_1_q);
            oneMinusY_uid92_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(oneMinusY_uid92_spix_uid43_fpTanPiTest_a) - UNSIGNED(oneMinusY_uid92_spix_uid43_fpTanPiTest_b));
    oneMinusY_uid92_spix_uid43_fpTanPiTest_q <= oneMinusY_uid92_spix_uid43_fpTanPiTest_o(37 downto 0);


	--oMyBottom_uid94_spix_uid43_fpTanPiTest(BITSELECT,93)@2
    oMyBottom_uid94_spix_uid43_fpTanPiTest_in <= oneMinusY_uid92_spix_uid43_fpTanPiTest_q(34 downto 0);
    oMyBottom_uid94_spix_uid43_fpTanPiTest_b <= oMyBottom_uid94_spix_uid43_fpTanPiTest_in(34 downto 0);

	--ld_oMyBottom_uid94_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_d(DELAY,831)@2
    ld_oMyBottom_uid94_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_d : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => oMyBottom_uid94_spix_uid43_fpTanPiTest_b, xout => ld_oMyBottom_uid94_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--yBottom_uid95_spix_uid43_fpTanPiTest(BITSELECT,94)@1
    yBottom_uid95_spix_uid43_fpTanPiTest_in <= y_uid86_spix_uid43_fpTanPiTest_b(34 downto 0);
    yBottom_uid95_spix_uid43_fpTanPiTest_b <= yBottom_uid95_spix_uid43_fpTanPiTest_in(34 downto 0);

	--ld_yBottom_uid95_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_c(DELAY,830)@1
    ld_yBottom_uid95_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 35, depth => 2 )
    PORT MAP ( xin => yBottom_uid95_spix_uid43_fpTanPiTest_b, xout => ld_yBottom_uid95_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_y_uid86_spix_uid43_fpTanPiTest_b_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_b(DELAY,826)@1
    ld_y_uid86_spix_uid43_fpTanPiTest_b_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 36, depth => 2 )
    PORT MAP ( xin => y_uid86_spix_uid43_fpTanPiTest_b, xout => ld_y_uid86_spix_uid43_fpTanPiTest_b_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--reg_oneMinusY_uid92_spix_uid43_fpTanPiTest_0_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_0(REG,685)@2
    reg_oneMinusY_uid92_spix_uid43_fpTanPiTest_0_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oneMinusY_uid92_spix_uid43_fpTanPiTest_0_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_0_q <= "00000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oneMinusY_uid92_spix_uid43_fpTanPiTest_0_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_0_q <= oneMinusY_uid92_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest(COMPARE,92)@3
    cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_cin <= GND_q;
    cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("00" & reg_oneMinusY_uid92_spix_uid43_fpTanPiTest_0_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_0_q) & '0';
    cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("0000" & ld_y_uid86_spix_uid43_fpTanPiTest_b_to_cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_b_q) & cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_cin(0);
            cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_a) - UNSIGNED(cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_b));
    cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_c(0) <= cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_o(40);


	--z_uid96_spix_uid43_fpTanPiTest(MUX,95)@3
    z_uid96_spix_uid43_fpTanPiTest_s <= cmpYToOneMinusY_uid93_spix_uid43_fpTanPiTest_c;
    z_uid96_spix_uid43_fpTanPiTest: PROCESS (z_uid96_spix_uid43_fpTanPiTest_s, en, ld_yBottom_uid95_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_c_q, ld_oMyBottom_uid94_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_d_q)
    BEGIN
            CASE z_uid96_spix_uid43_fpTanPiTest_s IS
                  WHEN "0" => z_uid96_spix_uid43_fpTanPiTest_q <= ld_yBottom_uid95_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_c_q;
                  WHEN "1" => z_uid96_spix_uid43_fpTanPiTest_q <= ld_oMyBottom_uid94_spix_uid43_fpTanPiTest_b_to_z_uid96_spix_uid43_fpTanPiTest_d_q;
                  WHEN OTHERS => z_uid96_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--zAddr_uid110_spix_uid43_fpTanPiTest(BITSELECT,109)@3
    zAddr_uid110_spix_uid43_fpTanPiTest_in <= z_uid96_spix_uid43_fpTanPiTest_q;
    zAddr_uid110_spix_uid43_fpTanPiTest_b <= zAddr_uid110_spix_uid43_fpTanPiTest_in(34 downto 28);

	--reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC2_uid458_sinPiZTableGenerator_0(REG,705)@3
    reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC2_uid458_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC2_uid458_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC2_uid458_sinPiZTableGenerator_0_q <= zAddr_uid110_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid458_sinPiZTableGenerator(LOOKUP,457)@4
    memoryC2_uid458_sinPiZTableGenerator: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC2_uid458_sinPiZTableGenerator_q <= "10101101010011";
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            CASE (reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC2_uid458_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101010011";
                WHEN "0000001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101010100";
                WHEN "0000010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101010111";
                WHEN "0000011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101011001";
                WHEN "0000100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101011011";
                WHEN "0000101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101011100";
                WHEN "0000110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101011111";
                WHEN "0000111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101100010";
                WHEN "0001000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101100110";
                WHEN "0001001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101101011";
                WHEN "0001010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101110000";
                WHEN "0001011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101110101";
                WHEN "0001100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101101111011";
                WHEN "0001101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101110000000";
                WHEN "0001110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101110000111";
                WHEN "0001111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101110001110";
                WHEN "0010000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101110010011";
                WHEN "0010001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101110011110";
                WHEN "0010010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101110100110";
                WHEN "0010011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101110101111";
                WHEN "0010100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101110111000";
                WHEN "0010101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101111000011";
                WHEN "0010110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101111001100";
                WHEN "0010111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101111010111";
                WHEN "0011000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101111100011";
                WHEN "0011001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101111101110";
                WHEN "0011010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10101111111011";
                WHEN "0011011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110000001001";
                WHEN "0011100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110000010101";
                WHEN "0011101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110000100000";
                WHEN "0011110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110000110001";
                WHEN "0011111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110001000000";
                WHEN "0100000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110001001101";
                WHEN "0100001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110001011110";
                WHEN "0100010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110001101100";
                WHEN "0100011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110001111111";
                WHEN "0100100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110010001111";
                WHEN "0100101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110010100001";
                WHEN "0100110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110010110011";
                WHEN "0100111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110011000101";
                WHEN "0101000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110011010110";
                WHEN "0101001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110011101011";
                WHEN "0101010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110011111111";
                WHEN "0101011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110100010010";
                WHEN "0101100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110100100101";
                WHEN "0101101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110100111011";
                WHEN "0101110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110101001110";
                WHEN "0101111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110101100111";
                WHEN "0110000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110101111100";
                WHEN "0110001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110110010010";
                WHEN "0110010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110110100110";
                WHEN "0110011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110111000000";
                WHEN "0110100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110111010101";
                WHEN "0110101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10110111110000";
                WHEN "0110110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111000000110";
                WHEN "0110111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111000100010";
                WHEN "0111000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111000111001";
                WHEN "0111001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111001010100";
                WHEN "0111010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111001101111";
                WHEN "0111011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111010001001";
                WHEN "0111100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111010100011";
                WHEN "0111101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111010111100";
                WHEN "0111110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111011011001";
                WHEN "0111111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111011110111";
                WHEN "1000000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111100010100";
                WHEN "1000001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111100110001";
                WHEN "1000010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111101001101";
                WHEN "1000011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111101101010";
                WHEN "1000100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111110001000";
                WHEN "1000101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111110100101";
                WHEN "1000110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111111000101";
                WHEN "1000111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "10111111100011";
                WHEN "1001000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000000000011";
                WHEN "1001001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000000100011";
                WHEN "1001010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000001000100";
                WHEN "1001011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000001100010";
                WHEN "1001100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000010000100";
                WHEN "1001101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000010100010";
                WHEN "1001110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000011000110";
                WHEN "1001111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000011101000";
                WHEN "1010000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000100001010";
                WHEN "1010001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000100101101";
                WHEN "1010010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000101010001";
                WHEN "1010011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000101110010";
                WHEN "1010100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000110010100";
                WHEN "1010101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000110111011";
                WHEN "1010110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11000111011010";
                WHEN "1010111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001000000001";
                WHEN "1011000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001000100110";
                WHEN "1011001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001001001011";
                WHEN "1011010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001001101101";
                WHEN "1011011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001010010101";
                WHEN "1011100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001010111100";
                WHEN "1011101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001011100000";
                WHEN "1011110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001100000101";
                WHEN "1011111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001100101110";
                WHEN "1100000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001101010100";
                WHEN "1100001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001101111010";
                WHEN "1100010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001110100010";
                WHEN "1100011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001111001001";
                WHEN "1100100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11001111110001";
                WHEN "1100101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010000010110";
                WHEN "1100110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010000111111";
                WHEN "1100111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010001101001";
                WHEN "1101000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010010010010";
                WHEN "1101001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010010111101";
                WHEN "1101010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010011100001";
                WHEN "1101011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010100001100";
                WHEN "1101100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010100110111";
                WHEN "1101101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010101100001";
                WHEN "1101110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010110001011";
                WHEN "1101111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010110110011";
                WHEN "1110000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11010111011111";
                WHEN "1110001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011000001010";
                WHEN "1110010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011000110100";
                WHEN "1110011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011001011111";
                WHEN "1110100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011010001010";
                WHEN "1110101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011010110110";
                WHEN "1110110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011011100011";
                WHEN "1110111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011100001111";
                WHEN "1111000" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011100111001";
                WHEN "1111001" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011101100011";
                WHEN "1111010" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011110010001";
                WHEN "1111011" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011110111011";
                WHEN "1111100" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11011111101000";
                WHEN "1111101" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11100000010101";
                WHEN "1111110" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11100001000010";
                WHEN "1111111" =>  memoryC2_uid458_sinPiZTableGenerator_q <= "11100001110000";
                WHEN OTHERS =>
                    memoryC2_uid458_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--zPPolyEval_uid111_spix_uid43_fpTanPiTest(BITSELECT,110)@3
    zPPolyEval_uid111_spix_uid43_fpTanPiTest_in <= z_uid96_spix_uid43_fpTanPiTest_q(27 downto 0);
    zPPolyEval_uid111_spix_uid43_fpTanPiTest_b <= zPPolyEval_uid111_spix_uid43_fpTanPiTest_in(27 downto 12);

	--yT1_uid459_sinPiZPolyEval(BITSELECT,458)@3
    yT1_uid459_sinPiZPolyEval_in <= zPPolyEval_uid111_spix_uid43_fpTanPiTest_b;
    yT1_uid459_sinPiZPolyEval_b <= yT1_uid459_sinPiZPolyEval_in(15 downto 2);

	--ld_yT1_uid459_sinPiZPolyEval_b_to_reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_a(DELAY,1372)@3
    ld_yT1_uid459_sinPiZPolyEval_b_to_reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_a : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => yT1_uid459_sinPiZPolyEval_b, xout => ld_yT1_uid459_sinPiZPolyEval_b_to_reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0(REG,706)@4
    reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_q <= ld_yT1_uid459_sinPiZPolyEval_b_to_reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid613_pT1_uid460_sinPiZPolyEval(MULT,612)@5
    prodXY_uid613_pT1_uid460_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid613_pT1_uid460_sinPiZPolyEval_a),15)) * SIGNED(prodXY_uid613_pT1_uid460_sinPiZPolyEval_b);
    prodXY_uid613_pT1_uid460_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid613_pT1_uid460_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid613_pT1_uid460_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid613_pT1_uid460_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid613_pT1_uid460_sinPiZPolyEval_a <= reg_yT1_uid459_sinPiZPolyEval_0_to_prodXY_uid613_pT1_uid460_sinPiZPolyEval_0_q;
                prodXY_uid613_pT1_uid460_sinPiZPolyEval_b <= memoryC2_uid458_sinPiZTableGenerator_q;
                prodXY_uid613_pT1_uid460_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid613_pT1_uid460_sinPiZPolyEval_pr,28));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid613_pT1_uid460_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid613_pT1_uid460_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid613_pT1_uid460_sinPiZPolyEval_q <= prodXY_uid613_pT1_uid460_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid614_pT1_uid460_sinPiZPolyEval(BITSELECT,613)@8
    prodXYTruncFR_uid614_pT1_uid460_sinPiZPolyEval_in <= prodXY_uid613_pT1_uid460_sinPiZPolyEval_q;
    prodXYTruncFR_uid614_pT1_uid460_sinPiZPolyEval_b <= prodXYTruncFR_uid614_pT1_uid460_sinPiZPolyEval_in(27 downto 13);

	--highBBits_uid462_sinPiZPolyEval(BITSELECT,461)@8
    highBBits_uid462_sinPiZPolyEval_in <= prodXYTruncFR_uid614_pT1_uid460_sinPiZPolyEval_b;
    highBBits_uid462_sinPiZPolyEval_b <= highBBits_uid462_sinPiZPolyEval_in(14 downto 1);

	--ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a_inputreg(DELAY,1660)
    ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => zAddr_uid110_spix_uid43_fpTanPiTest_b, xout => ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a(DELAY,1373)@3
    ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a_inputreg_q, xout => ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0(REG,707)@7
    reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_q <= ld_zAddr_uid110_spix_uid43_fpTanPiTest_b_to_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid457_sinPiZTableGenerator(LOOKUP,456)@8
    memoryC1_uid457_sinPiZTableGenerator: PROCESS (reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC1_uid457_sinPiZTableGenerator_0_q) IS
                WHEN "0000000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "000000000000000000001";
                WHEN "0000001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111111101011010101010";
                WHEN "0000010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111111010110101010001";
                WHEN "0000011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111111000001111111100";
                WHEN "0000100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111110101101010101010";
                WHEN "0000101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111110011000101011101";
                WHEN "0000110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111110000100000010101";
                WHEN "0000111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111101101111011010001";
                WHEN "0001000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111101011010110010101";
                WHEN "0001001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111101000110001011111";
                WHEN "0001010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111100110001100110010";
                WHEN "0001011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111100011101000010000";
                WHEN "0001100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111100001000011110111";
                WHEN "0001101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111011110011111101011";
                WHEN "0001110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111011011111011101011";
                WHEN "0001111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111011001010111110111";
                WHEN "0010000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111010110110100010101";
                WHEN "0010001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111010100010000111100";
                WHEN "0010010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111010001101101111000";
                WHEN "0010011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111001111001011000011";
                WHEN "0010100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111001100101000100010";
                WHEN "0010101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111001010000110010001";
                WHEN "0010110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111000111100100010111";
                WHEN "0010111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111000101000010110001";
                WHEN "0011000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111000010100001011111";
                WHEN "0011001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "111000000000000100110";
                WHEN "0011010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110111101100000000011";
                WHEN "0011011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110111010111111111000";
                WHEN "0011100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110111000100000001000";
                WHEN "0011101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110110110000000110101";
                WHEN "0011110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110110011100001110111";
                WHEN "0011111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110110001000011011000";
                WHEN "0100000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110101110100101011010";
                WHEN "0100001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110101100000111110101";
                WHEN "0100010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110101001101010110010";
                WHEN "0100011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110100111001110001011";
                WHEN "0100100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110100100110010001001";
                WHEN "0100101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110100010010110100110";
                WHEN "0100110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110011111111011100110";
                WHEN "0100111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110011101100001001010";
                WHEN "0101000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110011011000111010011";
                WHEN "0101001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110011000101101111111";
                WHEN "0101010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110010110010101010010";
                WHEN "0101011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110010011111101001101";
                WHEN "0101100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110010001100101110000";
                WHEN "0101101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110001111001110111001";
                WHEN "0101110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110001100111000110000";
                WHEN "0101111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110001010100011001011";
                WHEN "0110000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110001000001110010110";
                WHEN "0110001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110000101111010001100";
                WHEN "0110010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110000011100110110001";
                WHEN "0110011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "110000001010011111111";
                WHEN "0110100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101111111000010000000";
                WHEN "0110101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101111100110000101100";
                WHEN "0110110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101111010100000001100";
                WHEN "0110111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101111000010000011001";
                WHEN "0111000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101110110000001011100";
                WHEN "0111001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101110011110011001110";
                WHEN "0111010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101110001100101110101";
                WHEN "0111011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101101111011001010001";
                WHEN "0111100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101101101001101100010";
                WHEN "0111101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101101011000010101010";
                WHEN "0111110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101101000111000100101";
                WHEN "0111111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101100110101111010111";
                WHEN "1000000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101100100100111000010";
                WHEN "1000001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101100010011111100111";
                WHEN "1000010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101100000011001000111";
                WHEN "1000011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101011110010011100000";
                WHEN "1000100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101011100001110110100";
                WHEN "1000101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101011010001011000100";
                WHEN "1000110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101011000001000001110";
                WHEN "1000111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101010110000110011000";
                WHEN "1001000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101010100000101011111";
                WHEN "1001001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101010010000101100100";
                WHEN "1001010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101010000000110101001";
                WHEN "1001011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101001110001000110000";
                WHEN "1001100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101001100001011110101";
                WHEN "1001101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101001010001111111111";
                WHEN "1001110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101001000010101000110";
                WHEN "1001111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101000110011011010001";
                WHEN "1010000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101000100100010100001";
                WHEN "1010001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101000010101010110100";
                WHEN "1010010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "101000000110100001011";
                WHEN "1010011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100111110111110101011";
                WHEN "1010100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100111101001010010000";
                WHEN "1010101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100111011010110110110";
                WHEN "1010110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100111001100100101100";
                WHEN "1010111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100110111110011100011";
                WHEN "1011000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100110110000011100011";
                WHEN "1011001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100110100010100101110";
                WHEN "1011010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100110010100111000101";
                WHEN "1011011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100110000111010100001";
                WHEN "1011100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100101111001111001000";
                WHEN "1011101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100101101100100111111";
                WHEN "1011110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100101011111100000000";
                WHEN "1011111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100101010010100001001";
                WHEN "1100000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100101000101101100011";
                WHEN "1100001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100100111001000001011";
                WHEN "1100010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100100101100011111111";
                WHEN "1100011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100100100000001000010";
                WHEN "1100100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100100010011111010101";
                WHEN "1100101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100100000111110111001";
                WHEN "1100110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100011111011111101010";
                WHEN "1100111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100011110000001101010";
                WHEN "1101000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100011100100100111101";
                WHEN "1101001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100011011001001011111";
                WHEN "1101010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100011001101111011010";
                WHEN "1101011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100011000010110100001";
                WHEN "1101100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100010110111110111010";
                WHEN "1101101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100010101101000101000";
                WHEN "1101110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100010100010011101001";
                WHEN "1101111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100010011000000000001";
                WHEN "1110000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100010001101101101010";
                WHEN "1110001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100010000011100100111";
                WHEN "1110010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100001111001100111100";
                WHEN "1110011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100001101111110100101";
                WHEN "1110100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100001100110001100100";
                WHEN "1110101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100001011100101111001";
                WHEN "1110110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100001010011011100011";
                WHEN "1110111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100001001010010100101";
                WHEN "1111000" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100001000001011000000";
                WHEN "1111001" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100000111000100110100";
                WHEN "1111010" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100000101111111111100";
                WHEN "1111011" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100000100111100011111";
                WHEN "1111100" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100000011111010011000";
                WHEN "1111101" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100000010111001101010";
                WHEN "1111110" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100000001111010010101";
                WHEN "1111111" =>  memoryC1_uid457_sinPiZTableGenerator_q <= "100000000111100011001";
                WHEN OTHERS =>
                    memoryC1_uid457_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--sumAHighB_uid463_sinPiZPolyEval(ADD,462)@8
    sumAHighB_uid463_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid457_sinPiZTableGenerator_q(20)) & memoryC1_uid457_sinPiZTableGenerator_q);
    sumAHighB_uid463_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((21 downto 14 => highBBits_uid462_sinPiZPolyEval_b(13)) & highBBits_uid462_sinPiZPolyEval_b);
            sumAHighB_uid463_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid463_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid463_sinPiZPolyEval_b));
    sumAHighB_uid463_sinPiZPolyEval_q <= sumAHighB_uid463_sinPiZPolyEval_o(21 downto 0);


	--lowRangeB_uid461_sinPiZPolyEval(BITSELECT,460)@8
    lowRangeB_uid461_sinPiZPolyEval_in <= prodXYTruncFR_uid614_pT1_uid460_sinPiZPolyEval_b(0 downto 0);
    lowRangeB_uid461_sinPiZPolyEval_b <= lowRangeB_uid461_sinPiZPolyEval_in(0 downto 0);

	--s1_uid461_uid464_sinPiZPolyEval(BITJOIN,463)@8
    s1_uid461_uid464_sinPiZPolyEval_q <= sumAHighB_uid463_sinPiZPolyEval_q & lowRangeB_uid461_sinPiZPolyEval_b;

	--reg_s1_uid461_uid464_sinPiZPolyEval_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_1(REG,709)@8
    reg_s1_uid461_uid464_sinPiZPolyEval_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid461_uid464_sinPiZPolyEval_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid461_uid464_sinPiZPolyEval_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_1_q <= s1_uid461_uid464_sinPiZPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor(LOGICAL,1619)
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_b <= ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_q <= not (ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_a or ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_b);

	--ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_sticky_ena(REG,1620)
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_nor_q = "1") THEN
                ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_sticky_ena_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd(LOGICAL,1621)
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_a <= ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_sticky_ena_q;
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_b <= en;
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_q <= ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_a and ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_b;

	--reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0(REG,708)@3
    reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q <= zPPolyEval_uid111_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem(DUALMEM,1610)
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_reset0 <= areset;
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_ia <= reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q;
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_aa <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg_q;
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_ab <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_q;
    ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 16,
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
        clocken1 => ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_iq,
        address_a => ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_aa,
        data_a => ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_ia
    );
        ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_q <= ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_iq(15 downto 0);

	--prodXY_uid616_pT2_uid466_sinPiZPolyEval(MULT,615)@9
    prodXY_uid616_pT2_uid466_sinPiZPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid616_pT2_uid466_sinPiZPolyEval_a),17)) * SIGNED(prodXY_uid616_pT2_uid466_sinPiZPolyEval_b);
    prodXY_uid616_pT2_uid466_sinPiZPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid616_pT2_uid466_sinPiZPolyEval_a <= (others => '0');
            prodXY_uid616_pT2_uid466_sinPiZPolyEval_b <= (others => '0');
            prodXY_uid616_pT2_uid466_sinPiZPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid616_pT2_uid466_sinPiZPolyEval_a <= ld_reg_zPPolyEval_uid111_spix_uid43_fpTanPiTest_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_0_q_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_a_replace_mem_q;
                prodXY_uid616_pT2_uid466_sinPiZPolyEval_b <= reg_s1_uid461_uid464_sinPiZPolyEval_0_to_prodXY_uid616_pT2_uid466_sinPiZPolyEval_1_q;
                prodXY_uid616_pT2_uid466_sinPiZPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid616_pT2_uid466_sinPiZPolyEval_pr,39));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid616_pT2_uid466_sinPiZPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid616_pT2_uid466_sinPiZPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid616_pT2_uid466_sinPiZPolyEval_q <= prodXY_uid616_pT2_uid466_sinPiZPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid617_pT2_uid466_sinPiZPolyEval(BITSELECT,616)@12
    prodXYTruncFR_uid617_pT2_uid466_sinPiZPolyEval_in <= prodXY_uid616_pT2_uid466_sinPiZPolyEval_q;
    prodXYTruncFR_uid617_pT2_uid466_sinPiZPolyEval_b <= prodXYTruncFR_uid617_pT2_uid466_sinPiZPolyEval_in(38 downto 15);

	--highBBits_uid468_sinPiZPolyEval(BITSELECT,467)@12
    highBBits_uid468_sinPiZPolyEval_in <= prodXYTruncFR_uid617_pT2_uid466_sinPiZPolyEval_b;
    highBBits_uid468_sinPiZPolyEval_b <= highBBits_uid468_sinPiZPolyEval_in(23 downto 2);

	--ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor(LOGICAL,1593)
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_b <= ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_q <= not (ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_a or ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_b);

	--ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_sticky_ena(REG,1594)
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_nor_q = "1") THEN
                ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_sticky_ena_q <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd(LOGICAL,1595)
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_a <= ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_sticky_ena_q;
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_b <= en;
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_q <= ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_a and ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_b;

	--ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem(DUALMEM,1584)
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_reset0 <= areset;
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_ia <= reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC2_uid458_sinPiZTableGenerator_0_q;
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_aa <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdreg_q;
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_ab <= ld_reg_r_uid540_lzcZ_uid204_cpix_uid44_fpTanPiTest_0_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_1_q_to_expHardCase_uid207_cpix_uid44_fpTanPiTest_b_replace_rdmux_q;
    ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_iq,
        address_a => ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_aa,
        data_a => ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_ia
    );
        ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_q <= ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_iq(6 downto 0);

	--memoryC0_uid456_sinPiZTableGenerator(LOOKUP,455)@12
    memoryC0_uid456_sinPiZTableGenerator: PROCESS (ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_q)
    BEGIN
        -- Begin reserved scope level
            CASE (ld_reg_zAddr_uid110_spix_uid43_fpTanPiTest_0_to_memoryC0_uid456_sinPiZTableGenerator_0_q_to_memoryC0_uid456_sinPiZTableGenerator_a_replace_mem_q) IS
                WHEN "0000000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100100001111110110101110";
                WHEN "0000001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100100001110100100000010";
                WHEN "0000010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100100001010101100000000";
                WHEN "0000011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100100000100001110101000";
                WHEN "0000100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100011111011001011111101";
                WHEN "0000101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100011101111100100000010";
                WHEN "0000110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100011100001010110111011";
                WHEN "0000111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100011010000100100101111";
                WHEN "0001000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100010111101001101100010";
                WHEN "0001001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100010100111010001011101";
                WHEN "0001010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100010001110110000100111";
                WHEN "0001011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100001110011101011001001";
                WHEN "0001100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100001010110000001001110";
                WHEN "0001101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100000110101110011000000";
                WHEN "0001110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100100000010011000000101011";
                WHEN "0001111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011111101101101010011101";
                WHEN "0010000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011111000101110000100010";
                WHEN "0010001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011110011011010011001011";
                WHEN "0010010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011101101110010010100101";
                WHEN "0010011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011100111110101111000011";
                WHEN "0010100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011100001100101000110101";
                WHEN "0010101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011011011000000000001111";
                WHEN "0010110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011010100000110101100011";
                WHEN "0010111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011001100111001001000110";
                WHEN "0011000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100011000101010111011001110";
                WHEN "0011001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100010111101100001100010000";
                WHEN "0011010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100010110101010111100100100";
                WHEN "0011011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100010101100111001100100010";
                WHEN "0011100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100010100100000111100100011";
                WHEN "0011101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100010011011000001101000000";
                WHEN "0011110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100010010001100111110010110";
                WHEN "0011111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100010000111111010000111111";
                WHEN "0100000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100001111101111000101010111";
                WHEN "0100001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100001110011100011011111110";
                WHEN "0100010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100001101000111010101010001";
                WHEN "0100011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100001011101111110001110000";
                WHEN "0100100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100001010010101110001111010";
                WHEN "0100101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100001000111001010110010010";
                WHEN "0100110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100000111011010011111011001";
                WHEN "0100111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100000101111001001101110010";
                WHEN "0101000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100000100010101100010000001";
                WHEN "0101001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100000010101111011100101011";
                WHEN "0101010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01100000001000110111110010101";
                WHEN "0101011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011111111011100000111100110";
                WHEN "0101100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011111101101110111001000101";
                WHEN "0101101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011111011111111010011011011";
                WHEN "0101110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011111010001101010111001111";
                WHEN "0101111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011111000011001000101001110";
                WHEN "0110000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011110110100010011110000000";
                WHEN "0110001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011110100101001100010010010";
                WHEN "0110010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011110010101110010010110000";
                WHEN "0110011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011110000110000110000001000";
                WHEN "0110100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011101110110000111011000111";
                WHEN "0110101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011101100101110110100011101";
                WHEN "0110110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011101010101010011100111001";
                WHEN "0110111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011101000100011110101001100";
                WHEN "0111000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011100110011010111110000111";
                WHEN "0111001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011100100001111111000011101";
                WHEN "0111010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011100010000010100101000000";
                WHEN "0111011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011011111110011000100100100";
                WHEN "0111100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011011101100001010111111110";
                WHEN "0111101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011011011001101100000000011";
                WHEN "0111110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011011000110111011101101010";
                WHEN "0111111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011010110011111010001101001";
                WHEN "1000000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011010100000100111100111000";
                WHEN "1000001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011010001101000100000001111";
                WHEN "1000010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011001111001001111100100111";
                WHEN "1000011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011001100101001010010111011";
                WHEN "1000100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011001010000110100100000101";
                WHEN "1000101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011000111100001110001000001";
                WHEN "1000110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011000100111010111010101011";
                WHEN "1000111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01011000010010010000001111111";
                WHEN "1001000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010111111100111000111111011";
                WHEN "1001001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010111100111010001101011110";
                WHEN "1001010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010111010001011010011100110";
                WHEN "1001011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010110111011010011011010011";
                WHEN "1001100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010110100100111100101100110";
                WHEN "1001101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010110001110010110011011111";
                WHEN "1001110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010101110111100000110000001";
                WHEN "1001111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010101100000011011110001110";
                WHEN "1010000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010101001001000111101001000";
                WHEN "1010001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010100110001100100011110100";
                WHEN "1010010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010100011001110010011010110";
                WHEN "1010011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010100000001110001100110010";
                WHEN "1010100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010011101001100010001001111";
                WHEN "1010101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010011010001000100001110100";
                WHEN "1010110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010010111000010111111100101";
                WHEN "1010111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010010011111011101011101100";
                WHEN "1011000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010010000110010100111010001";
                WHEN "1011001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010001101100111110011011011";
                WHEN "1011010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010001010011011010001010100";
                WHEN "1011011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010000111001101000010000111";
                WHEN "1011100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010000011111101000110111110";
                WHEN "1011101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01010000000101011100001000010";
                WHEN "1011110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001111101011000010001100001";
                WHEN "1011111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001111010000011011001100111";
                WHEN "1100000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001110110101100111010011111";
                WHEN "1100001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001110011010100110101010111";
                WHEN "1100010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001101111111011001011011101";
                WHEN "1100011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001101100011111111101111111";
                WHEN "1100100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001101001000011001110001011";
                WHEN "1100101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001100101100100111101010001";
                WHEN "1100110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001100010000101001100100001";
                WHEN "1100111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001011110100011111101001011";
                WHEN "1101000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001011011000001010000011111";
                WHEN "1101001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001010111011101000111101111";
                WHEN "1101010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001010011110111100100001011";
                WHEN "1101011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001010000010000100111000111";
                WHEN "1101100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001001100101000010001110101";
                WHEN "1101101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001001000111110100101100111";
                WHEN "1101110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001000101010011100011110001";
                WHEN "1101111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01001000001100111001101100110";
                WHEN "1110000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000111101111001100100011011";
                WHEN "1110001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000111010001010101001100101";
                WHEN "1110010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000110110011010011110010111";
                WHEN "1110011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000110010101001000100001000";
                WHEN "1110100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000101110110110011100001101";
                WHEN "1110101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000101011000010100111111100";
                WHEN "1110110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000100111001101101000101100";
                WHEN "1110111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000100011010111011111110011";
                WHEN "1111000" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000011111100000001110101000";
                WHEN "1111001" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000011011100111110110100010";
                WHEN "1111010" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000010111101110011000111010";
                WHEN "1111011" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000010011110011110111000111";
                WHEN "1111100" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000001111111000010010100010";
                WHEN "1111101" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000001011111011101100100011";
                WHEN "1111110" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000000111111110000110100011";
                WHEN "1111111" =>  memoryC0_uid456_sinPiZTableGenerator_q <= "01000000011111111100001111011";
                WHEN OTHERS =>
                    memoryC0_uid456_sinPiZTableGenerator_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--sumAHighB_uid469_sinPiZPolyEval(ADD,468)@12
    sumAHighB_uid469_sinPiZPolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid456_sinPiZTableGenerator_q(28)) & memoryC0_uid456_sinPiZTableGenerator_q);
    sumAHighB_uid469_sinPiZPolyEval_b <= STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid468_sinPiZPolyEval_b(21)) & highBBits_uid468_sinPiZPolyEval_b);
            sumAHighB_uid469_sinPiZPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid469_sinPiZPolyEval_a) + SIGNED(sumAHighB_uid469_sinPiZPolyEval_b));
    sumAHighB_uid469_sinPiZPolyEval_q <= sumAHighB_uid469_sinPiZPolyEval_o(29 downto 0);


	--lowRangeB_uid467_sinPiZPolyEval(BITSELECT,466)@12
    lowRangeB_uid467_sinPiZPolyEval_in <= prodXYTruncFR_uid617_pT2_uid466_sinPiZPolyEval_b(1 downto 0);
    lowRangeB_uid467_sinPiZPolyEval_b <= lowRangeB_uid467_sinPiZPolyEval_in(1 downto 0);

	--s2_uid467_uid470_sinPiZPolyEval(BITJOIN,469)@12
    s2_uid467_uid470_sinPiZPolyEval_q <= sumAHighB_uid469_sinPiZPolyEval_q & lowRangeB_uid467_sinPiZPolyEval_b;

	--fxpSinRes_uid113_spix_uid43_fpTanPiTest(BITSELECT,112)@12
    fxpSinRes_uid113_spix_uid43_fpTanPiTest_in <= s2_uid467_uid470_sinPiZPolyEval_q(29 downto 0);
    fxpSinRes_uid113_spix_uid43_fpTanPiTest_b <= fxpSinRes_uid113_spix_uid43_fpTanPiTest_in(29 downto 5);

	--ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_multRightOp_uid115_spix_uid43_fpTanPiTest_b(DELAY,847)@0
    ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_multRightOp_uid115_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => sinXIsX_uid77_spix_uid43_fpTanPiTest_c, xout => ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_multRightOp_uid115_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--multRightOp_uid115_spix_uid43_fpTanPiTest(MUX,114)@12
    multRightOp_uid115_spix_uid43_fpTanPiTest_s <= ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_multRightOp_uid115_spix_uid43_fpTanPiTest_b_q;
    multRightOp_uid115_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multRightOp_uid115_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE multRightOp_uid115_spix_uid43_fpTanPiTest_s IS
                      WHEN "0" => multRightOp_uid115_spix_uid43_fpTanPiTest_q <= fxpSinRes_uid113_spix_uid43_fpTanPiTest_b;
                      WHEN "1" => multRightOp_uid115_spix_uid43_fpTanPiTest_q <= piwFP2_uid114_spix_uid43_fpTanPiTest_q;
                      WHEN OTHERS => multRightOp_uid115_spix_uid43_fpTanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor(LOGICAL,1507)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_b <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_sticky_ena_q;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_q <= not (ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_a or ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_b);

	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_sticky_ena(REG,1508)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_nor_q = "1") THEN
                ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_sticky_ena_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd(LOGICAL,1509)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_a <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_sticky_ena_q;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_b <= en;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_a and ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_b;

	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor(LOGICAL,1483)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_b <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_sticky_ena_q;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_q <= not (ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_a or ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_b);

	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_mem_top(CONSTANT,1479)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_mem_top_q <= "0101";

	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp(LOGICAL,1480)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_a <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_mem_top_q;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q);
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_q <= "1" when ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_a = ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_b else "0";

	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg(REG,1481)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_sticky_ena(REG,1484)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_nor_q = "1") THEN
                ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_sticky_ena_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd(LOGICAL,1485)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_a <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_sticky_ena_q;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_b <= en;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_a and ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_b;

	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt(COUNTER,1475)
    -- every=1, low=0, high=5, step=1, init=1
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_i = 4 THEN
                      ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_eq = '1') THEN
                        ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_i <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_i - 5;
                    ELSE
                        ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_i <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_i,3));


	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg(REG,1476)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux(MUX,1477)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_s <= en;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux: PROCESS (ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_s, ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q, ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_q)
    BEGIN
            CASE ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_s IS
                  WHEN "0" => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q;
                  WHEN "1" => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdcnt_q;
                  WHEN OTHERS => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem(DUALMEM,1474)
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_reset0 <= areset;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_ia <= oFracX_uid27_uid27_fpTanPiTest_q;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_aa <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_ab <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q;
    ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 24,
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
        clocken1 => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_iq,
        address_a => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_aa,
        data_a => ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_ia
    );
        ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_iq(23 downto 0);

	--LeftShiftStage131dto0_uid451_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,450)@7
    LeftShiftStage131dto0_uid451_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q(31 downto 0);
    LeftShiftStage131dto0_uid451_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= LeftShiftStage131dto0_uid451_alignedZ_uid99_spix_uid43_fpTanPiTest_in(31 downto 0);

	--leftShiftStage2Idx3_uid452_alignedZ_uid99_spix_uid43_fpTanPiTest(BITJOIN,451)@7
    leftShiftStage2Idx3_uid452_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= LeftShiftStage131dto0_uid451_alignedZ_uid99_spix_uid43_fpTanPiTest_b & leftShiftStage2Idx3Pad3_uid380_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--LeftShiftStage132dto0_uid448_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,447)@7
    LeftShiftStage132dto0_uid448_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q(32 downto 0);
    LeftShiftStage132dto0_uid448_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= LeftShiftStage132dto0_uid448_alignedZ_uid99_spix_uid43_fpTanPiTest_in(32 downto 0);

	--leftShiftStage2Idx2_uid449_alignedZ_uid99_spix_uid43_fpTanPiTest(BITJOIN,448)@7
    leftShiftStage2Idx2_uid449_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= LeftShiftStage132dto0_uid448_alignedZ_uid99_spix_uid43_fpTanPiTest_b & z_uid306_tpix_uid45_fpTanPiTest_q;

	--LeftShiftStage133dto0_uid445_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,444)@7
    LeftShiftStage133dto0_uid445_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q(33 downto 0);
    LeftShiftStage133dto0_uid445_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= LeftShiftStage133dto0_uid445_alignedZ_uid99_spix_uid43_fpTanPiTest_in(33 downto 0);

	--leftShiftStage2Idx1_uid446_alignedZ_uid99_spix_uid43_fpTanPiTest(BITJOIN,445)@7
    leftShiftStage2Idx1_uid446_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= LeftShiftStage133dto0_uid445_alignedZ_uid99_spix_uid43_fpTanPiTest_b & GND_q;

	--vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,389)@3
    vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= z_uid96_spix_uid43_fpTanPiTest_q(2 downto 0);
    vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_in(2 downto 0);

	--ld_vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_b(DELAY,1168)@3
    ld_vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 3, depth => 2 )
    PORT MAP ( xin => vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b, xout => ld_vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest(BITJOIN,428)@5
    leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= ld_vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_b_q & leftShiftStage0Idx2Pad32_uid357_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--reg_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_4(REG,698)@5
    reg_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q <= leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,424)@3
    X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= z_uid96_spix_uid43_fpTanPiTest_q(18 downto 0);
    X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_in(18 downto 0);

	--ld_X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_b(DELAY,1167)@3
    ld_X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 19, depth => 2 )
    PORT MAP ( xin => X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_b, xout => ld_X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest(BITJOIN,425)@5
    leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= ld_X18dto0_uid425_alignedZ_uid99_spix_uid43_fpTanPiTest_b_to_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_b_q & leftShiftStage0Idx1Pad16_uid354_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--reg_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_3(REG,697)@5
    reg_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q <= leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_z_uid96_spix_uid43_fpTanPiTest_q_to_reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_a(DELAY,1362)@3
    ld_z_uid96_spix_uid43_fpTanPiTest_q_to_reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_a : dspba_delay
    GENERIC MAP ( width => 35, depth => 2 )
    PORT MAP ( xin => z_uid96_spix_uid43_fpTanPiTest_q, xout => ld_z_uid96_spix_uid43_fpTanPiTest_q_to_reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2(REG,696)@5
    reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q <= ld_z_uid96_spix_uid43_fpTanPiTest_q_to_reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,386)@3
    rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= z_uid96_spix_uid43_fpTanPiTest_q;
    rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_in(34 downto 3);

	--reg_rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_1(REG,686)@3
    reg_rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q <= rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest(LOGICAL,387)@4
    vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_a <= reg_rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q;
    vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= leftShiftStage0Idx2Pad32_uid357_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
    vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= "1" when vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_a = vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_b else "0";

	--ld_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_f(DELAY,1165)@4
    ld_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q, xout => ld_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_f_q, ena => en(0), clk => clk, aclr => areset );

	--cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest(BITJOIN,390)@3
    cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= vStage_uid390_lzcZ_uid98_spix_uid43_fpTanPiTest_b & mO_uid389_lzcZ_uid98_spix_uid43_fpTanPiTest_q;

	--reg_cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_3(REG,688)@3
    reg_cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q <= cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest(MUX,392)@4
    vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_s <= vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest: PROCESS (vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_s, en, reg_rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q, reg_cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q)
    BEGIN
            CASE vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= reg_rVStage_uid387_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q;
                  WHEN "1" => vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= reg_cStage_uid391_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q;
                  WHEN OTHERS => vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,394)@4
    rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_in(31 downto 16);

	--reg_rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_1(REG,689)@4
    reg_rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q <= rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest(LOGICAL,395)@5
    vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_a <= reg_rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q;
    vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= leftShiftStage0Idx1Pad16_uid354_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
    vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= "1" when vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_a = vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_b else "0";

	--ld_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_e(DELAY,1164)@5
    ld_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q, xout => ld_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,396)@4
    vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid393_lzcZ_uid98_spix_uid43_fpTanPiTest_q(15 downto 0);
    vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_in(15 downto 0);

	--reg_vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_3(REG,691)@4
    reg_vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q <= vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest(MUX,398)@5
    vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_s <= vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest: PROCESS (vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_s, en, reg_rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q, reg_vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q)
    BEGIN
            CASE vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= reg_rVStage_uid395_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q;
                  WHEN "1" => vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= reg_vStage_uid397_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q;
                  WHEN OTHERS => vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,400)@5
    rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest_in(15 downto 8);

	--vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest(LOGICAL,401)@5
    vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_a <= rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
    vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= cstAllZWE_uid8_fpTanPiTest_q;
    vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= "1" when vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_a = vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_b else "0";

	--reg_vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_3(REG,695)@5
    reg_vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q <= vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid403_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,402)@5
    vStage_uid403_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid399_lzcZ_uid98_spix_uid43_fpTanPiTest_q(7 downto 0);
    vStage_uid403_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= vStage_uid403_lzcZ_uid98_spix_uid43_fpTanPiTest_in(7 downto 0);

	--vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest(MUX,404)@5
    vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_s <= vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest: PROCESS (vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_s, en, rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest_b, vStage_uid403_lzcZ_uid98_spix_uid43_fpTanPiTest_b)
    BEGIN
            CASE vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= rVStage_uid401_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
                  WHEN "1" => vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= vStage_uid403_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
                  WHEN OTHERS => vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,406)@5
    rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_in(7 downto 4);

	--reg_rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_1(REG,692)@5
    reg_rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q <= rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest(LOGICAL,407)@6
    vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_a <= reg_rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q;
    vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= leftShiftStage1Idx1Pad4_uid363_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;
    vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= "1" when vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_a = vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_b else "0";

	--vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,408)@5
    vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid405_lzcZ_uid98_spix_uid43_fpTanPiTest_q(3 downto 0);
    vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_in(3 downto 0);

	--reg_vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_3(REG,694)@5
    reg_vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q <= vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest(MUX,410)@6
    vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_s <= vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest: PROCESS (vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_s, en, reg_rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q, reg_vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q)
    BEGIN
            CASE vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= reg_rVStage_uid407_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_1_q;
                  WHEN "1" => vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= reg_vStage_uid409_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q;
                  WHEN OTHERS => vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,412)@6
    rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest_in(3 downto 2);

	--vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest(LOGICAL,413)@6
    vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_a <= rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
    vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= z_uid306_tpix_uid45_fpTanPiTest_q;
    vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= "1" when vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_a = vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_b else "0";

	--vStage_uid415_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,414)@6
    vStage_uid415_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid411_lzcZ_uid98_spix_uid43_fpTanPiTest_q(1 downto 0);
    vStage_uid415_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= vStage_uid415_lzcZ_uid98_spix_uid43_fpTanPiTest_in(1 downto 0);

	--vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest(MUX,416)@6
    vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_s <= vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest: PROCESS (vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_s, en, rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest_b, vStage_uid415_lzcZ_uid98_spix_uid43_fpTanPiTest_b)
    BEGIN
            CASE vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_s IS
                  WHEN "0" => vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= rVStage_uid413_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
                  WHEN "1" => vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= vStage_uid415_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
                  WHEN OTHERS => vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid419_lzcZ_uid98_spix_uid43_fpTanPiTest(BITSELECT,418)@6
    rVStage_uid419_lzcZ_uid98_spix_uid43_fpTanPiTest_in <= vStagei_uid417_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    rVStage_uid419_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= rVStage_uid419_lzcZ_uid98_spix_uid43_fpTanPiTest_in(1 downto 1);

	--vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest(LOGICAL,419)@6
    vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_a <= rVStage_uid419_lzcZ_uid98_spix_uid43_fpTanPiTest_b;
    vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_b <= GND_q;
    vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= "1" when vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_a = vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_b else "0";

	--r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest(BITJOIN,420)@6
    r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_q <= ld_vCount_uid388_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_f_q & ld_vCount_uid396_lzcZ_uid98_spix_uid43_fpTanPiTest_q_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_e_q & reg_vCount_uid402_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_3_q & vCount_uid408_lzcZ_uid98_spix_uid43_fpTanPiTest_q & vCount_uid414_lzcZ_uid98_spix_uid43_fpTanPiTest_q & vCount_uid420_lzcZ_uid98_spix_uid43_fpTanPiTest_q;

	--leftShiftStageSel5Dto4_uid431_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,430)@6
    leftShiftStageSel5Dto4_uid431_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
    leftShiftStageSel5Dto4_uid431_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= leftShiftStageSel5Dto4_uid431_alignedZ_uid99_spix_uid43_fpTanPiTest_in(5 downto 4);

	--leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest(MUX,431)@6
    leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_s <= leftShiftStageSel5Dto4_uid431_alignedZ_uid99_spix_uid43_fpTanPiTest_b;
    leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest: PROCESS (leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_s, en, reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q, reg_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q, reg_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q, ozz_uid88_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= reg_z_uid96_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q;
                  WHEN "01" => leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage0Idx1_uid426_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q;
                  WHEN "10" => leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage0Idx2_uid429_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q;
                  WHEN "11" => leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= ozz_uid88_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage022dto0_uid440_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,439)@6
    LeftShiftStage022dto0_uid440_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q(22 downto 0);
    LeftShiftStage022dto0_uid440_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= LeftShiftStage022dto0_uid440_alignedZ_uid99_spix_uid43_fpTanPiTest_in(22 downto 0);

	--leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest(BITJOIN,440)@6
    leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= LeftShiftStage022dto0_uid440_alignedZ_uid99_spix_uid43_fpTanPiTest_b & leftShiftStage1Idx3Pad12_uid369_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--reg_leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_5(REG,703)@6
    reg_leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_5_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_5_q <= leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage026dto0_uid437_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,436)@6
    LeftShiftStage026dto0_uid437_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q(26 downto 0);
    LeftShiftStage026dto0_uid437_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= LeftShiftStage026dto0_uid437_alignedZ_uid99_spix_uid43_fpTanPiTest_in(26 downto 0);

	--leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest(BITJOIN,437)@6
    leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= LeftShiftStage026dto0_uid437_alignedZ_uid99_spix_uid43_fpTanPiTest_b & cstAllZWE_uid8_fpTanPiTest_q;

	--reg_leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_4(REG,702)@6
    reg_leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q <= leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage030dto0_uid434_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,433)@6
    LeftShiftStage030dto0_uid434_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q(30 downto 0);
    LeftShiftStage030dto0_uid434_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= LeftShiftStage030dto0_uid434_alignedZ_uid99_spix_uid43_fpTanPiTest_in(30 downto 0);

	--leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest(BITJOIN,434)@6
    leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= LeftShiftStage030dto0_uid434_alignedZ_uid99_spix_uid43_fpTanPiTest_b & leftShiftStage1Idx1Pad4_uid363_fixedPointX_uid84_spix_uid43_fpTanPiTest_q;

	--reg_leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_3(REG,701)@6
    reg_leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q <= leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_2(REG,700)@6
    reg_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q <= leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,441)@6
    leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_q(3 downto 0);
    leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_1(REG,699)@6
    reg_leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_1_q <= leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest(MUX,442)@7
    leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_s <= reg_leftShiftStageSel3Dto2_uid442_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_1_q;
    leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest: PROCESS (leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_s, en, reg_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q, reg_leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q, reg_leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q, reg_leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_5_q)
    BEGIN
            CASE leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage0_uid432_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage1Idx1_uid435_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_3_q;
                  WHEN "10" => leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage1Idx2_uid438_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_4_q;
                  WHEN "11" => leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= reg_leftShiftStage1Idx3_uid441_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest(BITSELECT,452)@6
    leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_in <= r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_q(1 downto 0);
    leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_b <= leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_in(1 downto 0);

	--reg_leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_1(REG,704)@6
    reg_leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_1_q <= leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest(MUX,453)@7
    leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_s <= reg_leftShiftStageSel1Dto0_uid453_alignedZ_uid99_spix_uid43_fpTanPiTest_0_to_leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_1_q;
    leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest: PROCESS (leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_s, en, leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q, leftShiftStage2Idx1_uid446_alignedZ_uid99_spix_uid43_fpTanPiTest_q, leftShiftStage2Idx2_uid449_alignedZ_uid99_spix_uid43_fpTanPiTest_q, leftShiftStage2Idx3_uid452_alignedZ_uid99_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_s IS
                  WHEN "00" => leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= leftShiftStage1_uid443_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
                  WHEN "01" => leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= leftShiftStage2Idx1_uid446_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
                  WHEN "10" => leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= leftShiftStage2Idx2_uid449_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
                  WHEN "11" => leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= leftShiftStage2Idx3_uid452_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--alignedZLow_uid100_spix_uid43_fpTanPiTest(BITSELECT,99)@7
    alignedZLow_uid100_spix_uid43_fpTanPiTest_in <= leftShiftStage2_uid454_alignedZ_uid99_spix_uid43_fpTanPiTest_q;
    alignedZLow_uid100_spix_uid43_fpTanPiTest_b <= alignedZLow_uid100_spix_uid43_fpTanPiTest_in(34 downto 12);

	--pHardCase_uid101_spix_uid43_fpTanPiTest(BITJOIN,100)@7
    pHardCase_uid101_spix_uid43_fpTanPiTest_q <= alignedZLow_uid100_spix_uid43_fpTanPiTest_b & GND_q;

	--ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_p_uid102_spix_uid43_fpTanPiTest_b(DELAY,834)@0
    ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_p_uid102_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 7 )
    PORT MAP ( xin => sinXIsX_uid77_spix_uid43_fpTanPiTest_c, xout => ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_p_uid102_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--p_uid102_spix_uid43_fpTanPiTest(MUX,101)@7
    p_uid102_spix_uid43_fpTanPiTest_s <= ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_p_uid102_spix_uid43_fpTanPiTest_b_q;
    p_uid102_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p_uid102_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE p_uid102_spix_uid43_fpTanPiTest_s IS
                      WHEN "0" => p_uid102_spix_uid43_fpTanPiTest_q <= pHardCase_uid101_spix_uid43_fpTanPiTest_q;
                      WHEN "1" => p_uid102_spix_uid43_fpTanPiTest_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_mem_q;
                      WHEN OTHERS => p_uid102_spix_uid43_fpTanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem(DUALMEM,1498)
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_reset0 <= areset;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_ia <= p_uid102_spix_uid43_fpTanPiTest_q;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_aa <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdreg_q;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_ab <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_rdmux_q;
    ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 24,
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
        clocken1 => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_iq,
        address_a => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_aa,
        data_a => ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_ia
    );
        ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_q <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_iq(23 downto 0);

	--mul2xSinRes_uid116_spix_uid43_fpTanPiTest(MULT,115)@13
    mul2xSinRes_uid116_spix_uid43_fpTanPiTest_pr <= UNSIGNED(mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a) * UNSIGNED(mul2xSinRes_uid116_spix_uid43_fpTanPiTest_b);
    mul2xSinRes_uid116_spix_uid43_fpTanPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a <= (others => '0');
            mul2xSinRes_uid116_spix_uid43_fpTanPiTest_b <= (others => '0');
            mul2xSinRes_uid116_spix_uid43_fpTanPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a <= ld_p_uid102_spix_uid43_fpTanPiTest_q_to_mul2xSinRes_uid116_spix_uid43_fpTanPiTest_a_replace_mem_q;
                mul2xSinRes_uid116_spix_uid43_fpTanPiTest_b <= multRightOp_uid115_spix_uid43_fpTanPiTest_q;
                mul2xSinRes_uid116_spix_uid43_fpTanPiTest_s1 <= STD_LOGIC_VECTOR(mul2xSinRes_uid116_spix_uid43_fpTanPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mul2xSinRes_uid116_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mul2xSinRes_uid116_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mul2xSinRes_uid116_spix_uid43_fpTanPiTest_q <= mul2xSinRes_uid116_spix_uid43_fpTanPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBit_uid117_spix_uid43_fpTanPiTest(BITSELECT,116)@16
    normBit_uid117_spix_uid43_fpTanPiTest_in <= mul2xSinRes_uid116_spix_uid43_fpTanPiTest_q;
    normBit_uid117_spix_uid43_fpTanPiTest_b <= normBit_uid117_spix_uid43_fpTanPiTest_in(48 downto 48);

	--rndExpUpdate_uid122_uid123_spix_uid43_fpTanPiTest(BITJOIN,122)@16
    rndExpUpdate_uid122_uid123_spix_uid43_fpTanPiTest_q <= normBit_uid117_spix_uid43_fpTanPiTest_b & cstAllZWF_uid53_spix_uid43_fpTanPiTest_q & VCC_q;

	--ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor(LOGICAL,1520)
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_b <= ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_sticky_ena_q;
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_q <= not (ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_a or ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_b);

	--ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_sticky_ena(REG,1521)
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_nor_q = "1") THEN
                ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_sticky_ena_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd(LOGICAL,1522)
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_a <= ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_sticky_ena_q;
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_b <= en;
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_q <= ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_a and ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_b;

	--ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor(LOGICAL,1495)
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_b <= ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_sticky_ena_q;
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_q <= not (ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_a or ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_b);

	--ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_sticky_ena(REG,1496)
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_nor_q = "1") THEN
                ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_sticky_ena_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd(LOGICAL,1497)
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_a <= ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_sticky_ena_q;
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_b <= en;
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_q <= ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_a and ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_b;

	--ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem(DUALMEM,1486)
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_reset0 <= areset;
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_ia <= exp_uid9_fpTanPiTest_b;
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_aa <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q;
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_ab <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q;
    ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 8,
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
        clocken1 => ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_iq,
        address_a => ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_aa,
        data_a => ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_ia
    );
        ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_q <= ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_iq(7 downto 0);

	--expXP1_uid105_spix_uid43_fpTanPiTest(ADD,104)@7
    expXP1_uid105_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & ld_exp_uid9_fpTanPiTest_b_to_expXP1_uid105_spix_uid43_fpTanPiTest_a_replace_mem_q);
    expXP1_uid105_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("00000000" & VCC_q);
            expXP1_uid105_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXP1_uid105_spix_uid43_fpTanPiTest_a) + UNSIGNED(expXP1_uid105_spix_uid43_fpTanPiTest_b));
    expXP1_uid105_spix_uid43_fpTanPiTest_q <= expXP1_uid105_spix_uid43_fpTanPiTest_o(8 downto 0);


	--expXP1R_uid106_spix_uid43_fpTanPiTest(BITSELECT,105)@7
    expXP1R_uid106_spix_uid43_fpTanPiTest_in <= expXP1_uid105_spix_uid43_fpTanPiTest_q(7 downto 0);
    expXP1R_uid106_spix_uid43_fpTanPiTest_b <= expXP1R_uid106_spix_uid43_fpTanPiTest_in(7 downto 0);

	--reg_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_expHardCase_uid104_spix_uid43_fpTanPiTest_1(REG,711)@6
    reg_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_expHardCase_uid104_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_expHardCase_uid104_spix_uid43_fpTanPiTest_1_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_expHardCase_uid104_spix_uid43_fpTanPiTest_1_q <= r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expHardCase_uid104_spix_uid43_fpTanPiTest(SUB,103)@7
    expHardCase_uid104_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & biasM1_uid74_spix_uid43_fpTanPiTest_q);
    expHardCase_uid104_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("000" & reg_r_uid421_lzcZ_uid98_spix_uid43_fpTanPiTest_0_to_expHardCase_uid104_spix_uid43_fpTanPiTest_1_q);
            expHardCase_uid104_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expHardCase_uid104_spix_uid43_fpTanPiTest_a) - UNSIGNED(expHardCase_uid104_spix_uid43_fpTanPiTest_b));
    expHardCase_uid104_spix_uid43_fpTanPiTest_q <= expHardCase_uid104_spix_uid43_fpTanPiTest_o(8 downto 0);


	--expHardCaseR_uid107_spix_uid43_fpTanPiTest(BITSELECT,106)@7
    expHardCaseR_uid107_spix_uid43_fpTanPiTest_in <= expHardCase_uid104_spix_uid43_fpTanPiTest_q(7 downto 0);
    expHardCaseR_uid107_spix_uid43_fpTanPiTest_b <= expHardCaseR_uid107_spix_uid43_fpTanPiTest_in(7 downto 0);

	--expP_uid108_spix_uid43_fpTanPiTest(MUX,107)@7
    expP_uid108_spix_uid43_fpTanPiTest_s <= ld_sinXIsX_uid77_spix_uid43_fpTanPiTest_c_to_p_uid102_spix_uid43_fpTanPiTest_b_q;
    expP_uid108_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expP_uid108_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expP_uid108_spix_uid43_fpTanPiTest_s IS
                      WHEN "0" => expP_uid108_spix_uid43_fpTanPiTest_q <= expHardCaseR_uid107_spix_uid43_fpTanPiTest_b;
                      WHEN "1" => expP_uid108_spix_uid43_fpTanPiTest_q <= expXP1R_uid106_spix_uid43_fpTanPiTest_b;
                      WHEN OTHERS => expP_uid108_spix_uid43_fpTanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem(DUALMEM,1511)
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_reset0 <= areset;
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_ia <= expP_uid108_spix_uid43_fpTanPiTest_q;
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_aa <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q;
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_ab <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q;
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 8,
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
        clocken1 => ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_iq,
        address_a => ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_aa,
        data_a => ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_ia
    );
        ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_q <= ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_iq(7 downto 0);

	--ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_outputreg(DELAY,1510)
    ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_replace_mem_q, xout => ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_outputreg_q, ena => en(0), clk => clk, aclr => areset );

	--highRes_uid118_spix_uid43_fpTanPiTest(BITSELECT,117)@16
    highRes_uid118_spix_uid43_fpTanPiTest_in <= mul2xSinRes_uid116_spix_uid43_fpTanPiTest_q(47 downto 0);
    highRes_uid118_spix_uid43_fpTanPiTest_b <= highRes_uid118_spix_uid43_fpTanPiTest_in(47 downto 24);

	--lowRes_uid119_spix_uid43_fpTanPiTest(BITSELECT,118)@16
    lowRes_uid119_spix_uid43_fpTanPiTest_in <= mul2xSinRes_uid116_spix_uid43_fpTanPiTest_q(46 downto 0);
    lowRes_uid119_spix_uid43_fpTanPiTest_b <= lowRes_uid119_spix_uid43_fpTanPiTest_in(46 downto 23);

	--fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest(MUX,119)@16
    fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_s <= normBit_uid117_spix_uid43_fpTanPiTest_b;
    fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest: PROCESS (fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_s, en, lowRes_uid119_spix_uid43_fpTanPiTest_b, highRes_uid118_spix_uid43_fpTanPiTest_b)
    BEGIN
            CASE fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_s IS
                  WHEN "0" => fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_q <= lowRes_uid119_spix_uid43_fpTanPiTest_b;
                  WHEN "1" => fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_q <= highRes_uid118_spix_uid43_fpTanPiTest_b;
                  WHEN OTHERS => fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest(BITJOIN,120)@16
    expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_q <= ld_expP_uid108_spix_uid43_fpTanPiTest_q_to_expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_b_outputreg_q & fracRCompPreRnd_uid120_spix_uid43_fpTanPiTest_q;

	--expFracComp_uid124_spix_uid43_fpTanPiTest(ADD,123)@16
    expFracComp_uid124_spix_uid43_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & expFracPreRnd_uid121_uid121_spix_uid43_fpTanPiTest_q);
    expFracComp_uid124_spix_uid43_fpTanPiTest_b <= STD_LOGIC_VECTOR("00000000" & rndExpUpdate_uid122_uid123_spix_uid43_fpTanPiTest_q);
            expFracComp_uid124_spix_uid43_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracComp_uid124_spix_uid43_fpTanPiTest_a) + UNSIGNED(expFracComp_uid124_spix_uid43_fpTanPiTest_b));
    expFracComp_uid124_spix_uid43_fpTanPiTest_q <= expFracComp_uid124_spix_uid43_fpTanPiTest_o(32 downto 0);


	--expRComp_uid126_spix_uid43_fpTanPiTest(BITSELECT,125)@16
    expRComp_uid126_spix_uid43_fpTanPiTest_in <= expFracComp_uid124_spix_uid43_fpTanPiTest_q(31 downto 0);
    expRComp_uid126_spix_uid43_fpTanPiTest_b <= expRComp_uid126_spix_uid43_fpTanPiTest_in(31 downto 24);

	--reg_xIsInt_uid130_spix_uid43_fpTanPiTest_0_to_rZOrXInt_uid139_spix_uid43_fpTanPiTest_2(REG,713)@2
    reg_xIsInt_uid130_spix_uid43_fpTanPiTest_0_to_rZOrXInt_uid139_spix_uid43_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xIsInt_uid130_spix_uid43_fpTanPiTest_0_to_rZOrXInt_uid139_spix_uid43_fpTanPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xIsInt_uid130_spix_uid43_fpTanPiTest_0_to_rZOrXInt_uid139_spix_uid43_fpTanPiTest_2_q <= xIsInt_uid130_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excRZero_uid134_spix_uid43_fpTanPiTest(LOGICAL,133)@2
    excRZero_uid134_spix_uid43_fpTanPiTest_a <= xIsInt_uid130_spix_uid43_fpTanPiTest_q;
    excRZero_uid134_spix_uid43_fpTanPiTest_b <= ld_expXIsZero_uid10_fpTanPiTest_q_to_excRZero_uid134_spix_uid43_fpTanPiTest_b_q;
    excRZero_uid134_spix_uid43_fpTanPiTest_c <= exc_I_uid66_spix_uid43_fpTanPiTest_q;
    excRZero_uid134_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZero_uid134_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            excRZero_uid134_spix_uid43_fpTanPiTest_q <= excRZero_uid134_spix_uid43_fpTanPiTest_a or excRZero_uid134_spix_uid43_fpTanPiTest_b or excRZero_uid134_spix_uid43_fpTanPiTest_c;
        END IF;
    END PROCESS;



	--rZOrXInt_uid139_spix_uid43_fpTanPiTest(LOGICAL,138)@3
    rZOrXInt_uid139_spix_uid43_fpTanPiTest_a <= excRZero_uid134_spix_uid43_fpTanPiTest_q;
    rZOrXInt_uid139_spix_uid43_fpTanPiTest_b <= reg_xIsInt_uid130_spix_uid43_fpTanPiTest_0_to_rZOrXInt_uid139_spix_uid43_fpTanPiTest_2_q;
    rZOrXInt_uid139_spix_uid43_fpTanPiTest_q <= rZOrXInt_uid139_spix_uid43_fpTanPiTest_a or rZOrXInt_uid139_spix_uid43_fpTanPiTest_b;

	--ld_rZOrXInt_uid139_spix_uid43_fpTanPiTest_q_to_expRPostExc1_uid142_spix_uid43_fpTanPiTest_b(DELAY,887)@3
    ld_rZOrXInt_uid139_spix_uid43_fpTanPiTest_q_to_expRPostExc1_uid142_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => rZOrXInt_uid139_spix_uid43_fpTanPiTest_q, xout => ld_rZOrXInt_uid139_spix_uid43_fpTanPiTest_q_to_expRPostExc1_uid142_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expRPostExc1_uid142_spix_uid43_fpTanPiTest(MUX,141)@16
    expRPostExc1_uid142_spix_uid43_fpTanPiTest_s <= ld_rZOrXInt_uid139_spix_uid43_fpTanPiTest_q_to_expRPostExc1_uid142_spix_uid43_fpTanPiTest_b_q;
    expRPostExc1_uid142_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc1_uid142_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRPostExc1_uid142_spix_uid43_fpTanPiTest_s IS
                      WHEN "0" => expRPostExc1_uid142_spix_uid43_fpTanPiTest_q <= expRComp_uid126_spix_uid43_fpTanPiTest_b;
                      WHEN "1" => expRPostExc1_uid142_spix_uid43_fpTanPiTest_q <= cstAllZWE_uid8_fpTanPiTest_q;
                      WHEN OTHERS => expRPostExc1_uid142_spix_uid43_fpTanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor(LOGICAL,1532)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_b <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_sticky_ena_q;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_q <= not (ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_a or ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_b);

	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_sticky_ena(REG,1533)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_nor_q = "1") THEN
                ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_sticky_ena_q <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd(LOGICAL,1534)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_a <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_sticky_ena_q;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_b <= en;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_q <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_a and ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_b;

	--xRyHalf_uid133_spix_uid43_fpTanPiTest(LOGICAL,132)@2
    xRyHalf_uid133_spix_uid43_fpTanPiTest_a <= exc_R_uid72_spix_uid43_fpTanPiTest_q;
    xRyHalf_uid133_spix_uid43_fpTanPiTest_b <= yIsZero_uid90_spix_uid43_fpTanPiTest_q;
    xRyHalf_uid133_spix_uid43_fpTanPiTest_c <= InvSinXIsX_uid127_spix_uid43_fpTanPiTest_q;
    xRyHalf_uid133_spix_uid43_fpTanPiTest_d <= InvXIntExp_uid131_spix_uid43_fpTanPiTest_q;
    xRyHalf_uid133_spix_uid43_fpTanPiTest_q <= xRyHalf_uid133_spix_uid43_fpTanPiTest_a and xRyHalf_uid133_spix_uid43_fpTanPiTest_b and xRyHalf_uid133_spix_uid43_fpTanPiTest_c and xRyHalf_uid133_spix_uid43_fpTanPiTest_d;

	--excRIoN_uid143_spix_uid43_fpTanPiTest(LOGICAL,142)@2
    excRIoN_uid143_spix_uid43_fpTanPiTest_a <= GND_q;
    excRIoN_uid143_spix_uid43_fpTanPiTest_b <= exc_N_uid68_spix_uid43_fpTanPiTest_q;
    excRIoN_uid143_spix_uid43_fpTanPiTest_q <= excRIoN_uid143_spix_uid43_fpTanPiTest_a or excRIoN_uid143_spix_uid43_fpTanPiTest_b;

	--join_uid144_spix_uid43_fpTanPiTest(BITJOIN,143)@2
    join_uid144_spix_uid43_fpTanPiTest_q <= xRyHalf_uid133_spix_uid43_fpTanPiTest_q & excRIoN_uid143_spix_uid43_fpTanPiTest_q;

	--reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1(REG,714)@2
    reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q <= join_uid144_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem(DUALMEM,1523)
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_reset0 <= areset;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_ia <= reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_aa <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdreg_q;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_ab <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_rdmux_q;
    ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 2,
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
        clocken1 => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_iq,
        address_a => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_aa,
        data_a => ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_ia
    );
        ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_q <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_iq(1 downto 0);

	--expRPostExc_uid145_spix_uid43_fpTanPiTest(MUX,144)@17
    expRPostExc_uid145_spix_uid43_fpTanPiTest_s <= ld_reg_join_uid144_spix_uid43_fpTanPiTest_0_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_1_q_to_expRPostExc_uid145_spix_uid43_fpTanPiTest_b_replace_mem_q;
    expRPostExc_uid145_spix_uid43_fpTanPiTest: PROCESS (expRPostExc_uid145_spix_uid43_fpTanPiTest_s, en, expRPostExc1_uid142_spix_uid43_fpTanPiTest_q, cstAllOWE_uid52_spix_uid43_fpTanPiTest_q, cstBias_uid54_spix_uid43_fpTanPiTest_q, cstBias_uid54_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE expRPostExc_uid145_spix_uid43_fpTanPiTest_s IS
                  WHEN "00" => expRPostExc_uid145_spix_uid43_fpTanPiTest_q <= expRPostExc1_uid142_spix_uid43_fpTanPiTest_q;
                  WHEN "01" => expRPostExc_uid145_spix_uid43_fpTanPiTest_q <= cstAllOWE_uid52_spix_uid43_fpTanPiTest_q;
                  WHEN "10" => expRPostExc_uid145_spix_uid43_fpTanPiTest_q <= cstBias_uid54_spix_uid43_fpTanPiTest_q;
                  WHEN "11" => expRPostExc_uid145_spix_uid43_fpTanPiTest_q <= cstBias_uid54_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => expRPostExc_uid145_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRComp_uid125_spix_uid43_fpTanPiTest(BITSELECT,124)@16
    fracRComp_uid125_spix_uid43_fpTanPiTest_in <= expFracComp_uid124_spix_uid43_fpTanPiTest_q(23 downto 0);
    fracRComp_uid125_spix_uid43_fpTanPiTest_b <= fracRComp_uid125_spix_uid43_fpTanPiTest_in(23 downto 1);

	--reg_xRyHalf_uid133_spix_uid43_fpTanPiTest_0_to_xHalfRZI_uid135_spix_uid43_fpTanPiTest_1(REG,683)@2
    reg_xRyHalf_uid133_spix_uid43_fpTanPiTest_0_to_xHalfRZI_uid135_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xRyHalf_uid133_spix_uid43_fpTanPiTest_0_to_xHalfRZI_uid135_spix_uid43_fpTanPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xRyHalf_uid133_spix_uid43_fpTanPiTest_0_to_xHalfRZI_uid135_spix_uid43_fpTanPiTest_1_q <= xRyHalf_uid133_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--xHalfRZI_uid135_spix_uid43_fpTanPiTest(LOGICAL,134)@3
    xHalfRZI_uid135_spix_uid43_fpTanPiTest_a <= reg_xRyHalf_uid133_spix_uid43_fpTanPiTest_0_to_xHalfRZI_uid135_spix_uid43_fpTanPiTest_1_q;
    xHalfRZI_uid135_spix_uid43_fpTanPiTest_b <= excRZero_uid134_spix_uid43_fpTanPiTest_q;
    xHalfRZI_uid135_spix_uid43_fpTanPiTest_c <= GND_q;
    xHalfRZI_uid135_spix_uid43_fpTanPiTest_q <= xHalfRZI_uid135_spix_uid43_fpTanPiTest_a or xHalfRZI_uid135_spix_uid43_fpTanPiTest_b or xHalfRZI_uid135_spix_uid43_fpTanPiTest_c;

	--ld_xHalfRZI_uid135_spix_uid43_fpTanPiTest_q_to_fracRPostExc1_uid136_spix_uid43_fpTanPiTest_b(DELAY,881)@3
    ld_xHalfRZI_uid135_spix_uid43_fpTanPiTest_q_to_fracRPostExc1_uid136_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => xHalfRZI_uid135_spix_uid43_fpTanPiTest_q, xout => ld_xHalfRZI_uid135_spix_uid43_fpTanPiTest_q_to_fracRPostExc1_uid136_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc1_uid136_spix_uid43_fpTanPiTest(MUX,135)@16
    fracRPostExc1_uid136_spix_uid43_fpTanPiTest_s <= ld_xHalfRZI_uid135_spix_uid43_fpTanPiTest_q_to_fracRPostExc1_uid136_spix_uid43_fpTanPiTest_b_q;
    fracRPostExc1_uid136_spix_uid43_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostExc1_uid136_spix_uid43_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracRPostExc1_uid136_spix_uid43_fpTanPiTest_s IS
                      WHEN "0" => fracRPostExc1_uid136_spix_uid43_fpTanPiTest_q <= fracRComp_uid125_spix_uid43_fpTanPiTest_b;
                      WHEN "1" => fracRPostExc1_uid136_spix_uid43_fpTanPiTest_q <= cstAllZWF_uid53_spix_uid43_fpTanPiTest_q;
                      WHEN OTHERS => fracRPostExc1_uid136_spix_uid43_fpTanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1(REG,712)@2
    reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q <= exc_N_uid68_spix_uid43_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_b(DELAY,883)@3
    ld_reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q, xout => ld_reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid138_spix_uid43_fpTanPiTest(MUX,137)@17
    fracRPostExc_uid138_spix_uid43_fpTanPiTest_s <= ld_reg_exc_N_uid68_spix_uid43_fpTanPiTest_0_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_1_q_to_fracRPostExc_uid138_spix_uid43_fpTanPiTest_b_q;
    fracRPostExc_uid138_spix_uid43_fpTanPiTest: PROCESS (fracRPostExc_uid138_spix_uid43_fpTanPiTest_s, en, fracRPostExc1_uid136_spix_uid43_fpTanPiTest_q, oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE fracRPostExc_uid138_spix_uid43_fpTanPiTest_s IS
                  WHEN "0" => fracRPostExc_uid138_spix_uid43_fpTanPiTest_q <= fracRPostExc1_uid136_spix_uid43_fpTanPiTest_q;
                  WHEN "1" => fracRPostExc_uid138_spix_uid43_fpTanPiTest_q <= oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid138_spix_uid43_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid152_spix_uid43_fpTanPiTest(BITJOIN,151)@17
    R_uid152_spix_uid43_fpTanPiTest_q <= ld_signR_uid151_spix_uid43_fpTanPiTest_q_to_R_uid152_spix_uid43_fpTanPiTest_c_q & expRPostExc_uid145_spix_uid43_fpTanPiTest_q & fracRPostExc_uid138_spix_uid43_fpTanPiTest_q;

	--fracX_uid256_tpix_uid45_fpTanPiTest(BITSELECT,255)@17
    fracX_uid256_tpix_uid45_fpTanPiTest_in <= R_uid152_spix_uid43_fpTanPiTest_q(22 downto 0);
    fracX_uid256_tpix_uid45_fpTanPiTest_b <= fracX_uid256_tpix_uid45_fpTanPiTest_in(22 downto 0);

	--fracXIsZero_uid270_tpix_uid45_fpTanPiTest(LOGICAL,269)@17
    fracXIsZero_uid270_tpix_uid45_fpTanPiTest_a <= fracX_uid256_tpix_uid45_fpTanPiTest_b;
    fracXIsZero_uid270_tpix_uid45_fpTanPiTest_b <= cstAllZWF_uid53_spix_uid43_fpTanPiTest_q;
    fracXIsZero_uid270_tpix_uid45_fpTanPiTest_q <= "1" when fracXIsZero_uid270_tpix_uid45_fpTanPiTest_a = fracXIsZero_uid270_tpix_uid45_fpTanPiTest_b else "0";

	--expX_uid255_tpix_uid45_fpTanPiTest(BITSELECT,254)@17
    expX_uid255_tpix_uid45_fpTanPiTest_in <= R_uid152_spix_uid43_fpTanPiTest_q(30 downto 0);
    expX_uid255_tpix_uid45_fpTanPiTest_b <= expX_uid255_tpix_uid45_fpTanPiTest_in(30 downto 23);

	--expXIsMax_uid268_tpix_uid45_fpTanPiTest(LOGICAL,267)@17
    expXIsMax_uid268_tpix_uid45_fpTanPiTest_a <= expX_uid255_tpix_uid45_fpTanPiTest_b;
    expXIsMax_uid268_tpix_uid45_fpTanPiTest_b <= cstAllOWE_uid52_spix_uid43_fpTanPiTest_q;
    expXIsMax_uid268_tpix_uid45_fpTanPiTest_q <= "1" when expXIsMax_uid268_tpix_uid45_fpTanPiTest_a = expXIsMax_uid268_tpix_uid45_fpTanPiTest_b else "0";

	--exc_I_uid271_tpix_uid45_fpTanPiTest(LOGICAL,270)@17
    exc_I_uid271_tpix_uid45_fpTanPiTest_a <= expXIsMax_uid268_tpix_uid45_fpTanPiTest_q;
    exc_I_uid271_tpix_uid45_fpTanPiTest_b <= fracXIsZero_uid270_tpix_uid45_fpTanPiTest_q;
    exc_I_uid271_tpix_uid45_fpTanPiTest_q <= exc_I_uid271_tpix_uid45_fpTanPiTest_a and exc_I_uid271_tpix_uid45_fpTanPiTest_b;

	--excXIYI_uid337_tpix_uid45_fpTanPiTest(LOGICAL,336)@17
    excXIYI_uid337_tpix_uid45_fpTanPiTest_a <= exc_I_uid271_tpix_uid45_fpTanPiTest_q;
    excXIYI_uid337_tpix_uid45_fpTanPiTest_b <= exc_I_uid287_tpix_uid45_fpTanPiTest_q;
    excXIYI_uid337_tpix_uid45_fpTanPiTest_q <= excXIYI_uid337_tpix_uid45_fpTanPiTest_a and excXIYI_uid337_tpix_uid45_fpTanPiTest_b;

	--InvFracXIsZero_uid288_tpix_uid45_fpTanPiTest(LOGICAL,287)@17
    InvFracXIsZero_uid288_tpix_uid45_fpTanPiTest_a <= fracXIsZero_uid286_tpix_uid45_fpTanPiTest_q;
    InvFracXIsZero_uid288_tpix_uid45_fpTanPiTest_q <= not InvFracXIsZero_uid288_tpix_uid45_fpTanPiTest_a;

	--exc_N_uid289_tpix_uid45_fpTanPiTest(LOGICAL,288)@17
    exc_N_uid289_tpix_uid45_fpTanPiTest_a <= expXIsMax_uid284_tpix_uid45_fpTanPiTest_q;
    exc_N_uid289_tpix_uid45_fpTanPiTest_b <= InvFracXIsZero_uid288_tpix_uid45_fpTanPiTest_q;
    exc_N_uid289_tpix_uid45_fpTanPiTest_q <= exc_N_uid289_tpix_uid45_fpTanPiTest_a and exc_N_uid289_tpix_uid45_fpTanPiTest_b;

	--InvFracXIsZero_uid272_tpix_uid45_fpTanPiTest(LOGICAL,271)@17
    InvFracXIsZero_uid272_tpix_uid45_fpTanPiTest_a <= fracXIsZero_uid270_tpix_uid45_fpTanPiTest_q;
    InvFracXIsZero_uid272_tpix_uid45_fpTanPiTest_q <= not InvFracXIsZero_uid272_tpix_uid45_fpTanPiTest_a;

	--exc_N_uid273_tpix_uid45_fpTanPiTest(LOGICAL,272)@17
    exc_N_uid273_tpix_uid45_fpTanPiTest_a <= expXIsMax_uid268_tpix_uid45_fpTanPiTest_q;
    exc_N_uid273_tpix_uid45_fpTanPiTest_b <= InvFracXIsZero_uid272_tpix_uid45_fpTanPiTest_q;
    exc_N_uid273_tpix_uid45_fpTanPiTest_q <= exc_N_uid273_tpix_uid45_fpTanPiTest_a and exc_N_uid273_tpix_uid45_fpTanPiTest_b;

	--expXIsZero_uid282_tpix_uid45_fpTanPiTest(LOGICAL,281)@17
    expXIsZero_uid282_tpix_uid45_fpTanPiTest_a <= expY_uid258_tpix_uid45_fpTanPiTest_b;
    expXIsZero_uid282_tpix_uid45_fpTanPiTest_b <= cstAllZWE_uid8_fpTanPiTest_q;
    expXIsZero_uid282_tpix_uid45_fpTanPiTest_q <= "1" when expXIsZero_uid282_tpix_uid45_fpTanPiTest_a = expXIsZero_uid282_tpix_uid45_fpTanPiTest_b else "0";

	--expXIsZero_uid266_tpix_uid45_fpTanPiTest(LOGICAL,265)@17
    expXIsZero_uid266_tpix_uid45_fpTanPiTest_a <= expX_uid255_tpix_uid45_fpTanPiTest_b;
    expXIsZero_uid266_tpix_uid45_fpTanPiTest_b <= cstAllZWE_uid8_fpTanPiTest_q;
    expXIsZero_uid266_tpix_uid45_fpTanPiTest_q <= "1" when expXIsZero_uid266_tpix_uid45_fpTanPiTest_a = expXIsZero_uid266_tpix_uid45_fpTanPiTest_b else "0";

	--excXZYZ_uid336_tpix_uid45_fpTanPiTest(LOGICAL,335)@17
    excXZYZ_uid336_tpix_uid45_fpTanPiTest_a <= expXIsZero_uid266_tpix_uid45_fpTanPiTest_q;
    excXZYZ_uid336_tpix_uid45_fpTanPiTest_b <= expXIsZero_uid282_tpix_uid45_fpTanPiTest_q;
    excXZYZ_uid336_tpix_uid45_fpTanPiTest_q <= excXZYZ_uid336_tpix_uid45_fpTanPiTest_a and excXZYZ_uid336_tpix_uid45_fpTanPiTest_b;

	--excRNaN_uid338_tpix_uid45_fpTanPiTest(LOGICAL,337)@17
    excRNaN_uid338_tpix_uid45_fpTanPiTest_a <= excXZYZ_uid336_tpix_uid45_fpTanPiTest_q;
    excRNaN_uid338_tpix_uid45_fpTanPiTest_b <= exc_N_uid273_tpix_uid45_fpTanPiTest_q;
    excRNaN_uid338_tpix_uid45_fpTanPiTest_c <= exc_N_uid289_tpix_uid45_fpTanPiTest_q;
    excRNaN_uid338_tpix_uid45_fpTanPiTest_d <= excXIYI_uid337_tpix_uid45_fpTanPiTest_q;
    excRNaN_uid338_tpix_uid45_fpTanPiTest_q <= excRNaN_uid338_tpix_uid45_fpTanPiTest_a or excRNaN_uid338_tpix_uid45_fpTanPiTest_b or excRNaN_uid338_tpix_uid45_fpTanPiTest_c or excRNaN_uid338_tpix_uid45_fpTanPiTest_d;

	--InvExcRNaN_uid349_tpix_uid45_fpTanPiTest(LOGICAL,348)@17
    InvExcRNaN_uid349_tpix_uid45_fpTanPiTest_a <= excRNaN_uid338_tpix_uid45_fpTanPiTest_q;
    InvExcRNaN_uid349_tpix_uid45_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExcRNaN_uid349_tpix_uid45_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            InvExcRNaN_uid349_tpix_uid45_fpTanPiTest_q <= not InvExcRNaN_uid349_tpix_uid45_fpTanPiTest_a;
        END IF;
    END PROCESS;



	--signY_uid260_tpix_uid45_fpTanPiTest(BITSELECT,259)@17
    signY_uid260_tpix_uid45_fpTanPiTest_in <= R_uid250_cpix_uid44_fpTanPiTest_q;
    signY_uid260_tpix_uid45_fpTanPiTest_b <= signY_uid260_tpix_uid45_fpTanPiTest_in(31 downto 31);

	--signX_uid257_tpix_uid45_fpTanPiTest(BITSELECT,256)@17
    signX_uid257_tpix_uid45_fpTanPiTest_in <= R_uid152_spix_uid43_fpTanPiTest_q;
    signX_uid257_tpix_uid45_fpTanPiTest_b <= signX_uid257_tpix_uid45_fpTanPiTest_in(31 downto 31);

	--signR_uid294_tpix_uid45_fpTanPiTest(LOGICAL,293)@17
    signR_uid294_tpix_uid45_fpTanPiTest_a <= signX_uid257_tpix_uid45_fpTanPiTest_b;
    signR_uid294_tpix_uid45_fpTanPiTest_b <= signY_uid260_tpix_uid45_fpTanPiTest_b;
    signR_uid294_tpix_uid45_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid294_tpix_uid45_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            signR_uid294_tpix_uid45_fpTanPiTest_q <= signR_uid294_tpix_uid45_fpTanPiTest_a xor signR_uid294_tpix_uid45_fpTanPiTest_b;
        END IF;
    END PROCESS;



	--sRPostExc_uid350_tpix_uid45_fpTanPiTest(LOGICAL,349)@18
    sRPostExc_uid350_tpix_uid45_fpTanPiTest_a <= signR_uid294_tpix_uid45_fpTanPiTest_q;
    sRPostExc_uid350_tpix_uid45_fpTanPiTest_b <= InvExcRNaN_uid349_tpix_uid45_fpTanPiTest_q;
    sRPostExc_uid350_tpix_uid45_fpTanPiTest_q <= sRPostExc_uid350_tpix_uid45_fpTanPiTest_a and sRPostExc_uid350_tpix_uid45_fpTanPiTest_b;

	--ld_sRPostExc_uid350_tpix_uid45_fpTanPiTest_q_to_divR_uid351_tpix_uid45_fpTanPiTest_c(DELAY,1093)@18
    ld_sRPostExc_uid350_tpix_uid45_fpTanPiTest_q_to_divR_uid351_tpix_uid45_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => sRPostExc_uid350_tpix_uid45_fpTanPiTest_q, xout => ld_sRPostExc_uid350_tpix_uid45_fpTanPiTest_q_to_divR_uid351_tpix_uid45_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor(LOGICAL,1581)
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_b <= ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_sticky_ena_q;
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_q <= not (ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_a or ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_b);

	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_mem_top(CONSTANT,1565)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_mem_top_q <= "01001";

	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp(LOGICAL,1566)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_a <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_mem_top_q;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_q);
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_q <= "1" when ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_a = ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_b else "0";

	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmpReg(REG,1567)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmpReg_q <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_sticky_ena(REG,1582)
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_nor_q = "1") THEN
                ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_sticky_ena_q <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd(LOGICAL,1583)
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_a <= ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_sticky_ena_q;
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_b <= en;
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_q <= ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_a and ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_b;

	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt(COUNTER,1561)
    -- every=1, low=0, high=9, step=1, init=1
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_i = 8 THEN
                      ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_eq = '1') THEN
                        ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_i <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_i - 9;
                    ELSE
                        ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_i <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_i,4));


	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg(REG,1562)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg_q <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux(MUX,1563)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_s <= en;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux: PROCESS (ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_s, ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg_q, ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_q <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_q <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem(DUALMEM,1572)
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_reset0 <= areset;
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_ia <= fracX_uid256_tpix_uid45_fpTanPiTest_b;
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_aa <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg_q;
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_ab <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_q;
    ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 23,
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
        clocken1 => ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_iq,
        address_a => ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_aa,
        data_a => ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_ia
    );
        ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_q <= ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_iq(22 downto 0);

	--lOAdded_uid304_tpix_uid45_fpTanPiTest(BITJOIN,303)@28
    lOAdded_uid304_tpix_uid45_fpTanPiTest_q <= VCC_q & ld_fracX_uid256_tpix_uid45_fpTanPiTest_b_to_lOAdded_uid304_tpix_uid45_fpTanPiTest_a_replace_mem_q;

	--ld_lOAdded_uid304_tpix_uid45_fpTanPiTest_q_to_oFracXExt_uid307_tpix_uid45_fpTanPiTest_b(DELAY,1027)@28
    ld_lOAdded_uid304_tpix_uid45_fpTanPiTest_q_to_oFracXExt_uid307_tpix_uid45_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => lOAdded_uid304_tpix_uid45_fpTanPiTest_q, xout => ld_lOAdded_uid304_tpix_uid45_fpTanPiTest_q_to_oFracXExt_uid307_tpix_uid45_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--oFracXExt_uid307_tpix_uid45_fpTanPiTest(BITJOIN,306)@30
    oFracXExt_uid307_tpix_uid45_fpTanPiTest_q <= ld_lOAdded_uid304_tpix_uid45_fpTanPiTest_q_to_oFracXExt_uid307_tpix_uid45_fpTanPiTest_b_q & z_uid306_tpix_uid45_fpTanPiTest_q;

	--reg_oFracXExt_uid307_tpix_uid45_fpTanPiTest_0_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_3(REG,757)@30
    reg_oFracXExt_uid307_tpix_uid45_fpTanPiTest_0_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracXExt_uid307_tpix_uid45_fpTanPiTest_0_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_3_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracXExt_uid307_tpix_uid45_fpTanPiTest_0_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_3_q <= oFracXExt_uid307_tpix_uid45_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--fracYAddr_uid298_tpix_uid45_fpTanPiTest(BITSELECT,297)@17
    fracYAddr_uid298_tpix_uid45_fpTanPiTest_in <= R_uid250_cpix_uid44_fpTanPiTest_q(22 downto 0);
    fracYAddr_uid298_tpix_uid45_fpTanPiTest_b <= fracYAddr_uid298_tpix_uid45_fpTanPiTest_in(22 downto 14);

	--memoryC2_uid596_invTab_lutmem(DUALMEM,646)@17
    memoryC2_uid596_invTab_lutmem_reset0 <= areset;
    memoryC2_uid596_invTab_lutmem_ia <= (others => '0');
    memoryC2_uid596_invTab_lutmem_aa <= (others => '0');
    memoryC2_uid596_invTab_lutmem_ab <= fracYAddr_uid298_tpix_uid45_fpTanPiTest_b;
    memoryC2_uid596_invTab_lutmem_dmem : altsyncram
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
        init_file => "fp_tanpi_s5_memoryC2_uid596_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid596_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid596_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid596_invTab_lutmem_iq,
        address_a => memoryC2_uid596_invTab_lutmem_aa,
        data_a => memoryC2_uid596_invTab_lutmem_ia
    );
        memoryC2_uid596_invTab_lutmem_q <= memoryC2_uid596_invTab_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid596_invTab_lutmem_0_to_prodXY_uid625_pT1_uid598_invPE_1(REG,753)@19
    reg_memoryC2_uid596_invTab_lutmem_0_to_prodXY_uid625_pT1_uid598_invPE_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid596_invTab_lutmem_0_to_prodXY_uid625_pT1_uid598_invPE_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid596_invTab_lutmem_0_to_prodXY_uid625_pT1_uid598_invPE_1_q <= memoryC2_uid596_invTab_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--yPE_uid299_tpix_uid45_fpTanPiTest(BITSELECT,298)@17
    yPE_uid299_tpix_uid45_fpTanPiTest_in <= R_uid250_cpix_uid44_fpTanPiTest_q(13 downto 0);
    yPE_uid299_tpix_uid45_fpTanPiTest_b <= yPE_uid299_tpix_uid45_fpTanPiTest_in(13 downto 0);

	--yT1_uid597_invPE(BITSELECT,596)@17
    yT1_uid597_invPE_in <= yPE_uid299_tpix_uid45_fpTanPiTest_b;
    yT1_uid597_invPE_b <= yT1_uid597_invPE_in(13 downto 2);

	--reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0(REG,752)@17
    reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q <= yT1_uid597_invPE_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q_to_prodXY_uid625_pT1_uid598_invPE_a(DELAY,1332)@18
    ld_reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q_to_prodXY_uid625_pT1_uid598_invPE_a : dspba_delay
    GENERIC MAP ( width => 12, depth => 2 )
    PORT MAP ( xin => reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q, xout => ld_reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q_to_prodXY_uid625_pT1_uid598_invPE_a_q, ena => en(0), clk => clk, aclr => areset );

	--prodXY_uid625_pT1_uid598_invPE(MULT,624)@20
    prodXY_uid625_pT1_uid598_invPE_pr <= signed(resize(UNSIGNED(prodXY_uid625_pT1_uid598_invPE_a),13)) * SIGNED(prodXY_uid625_pT1_uid598_invPE_b);
    prodXY_uid625_pT1_uid598_invPE_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid625_pT1_uid598_invPE_a <= (others => '0');
            prodXY_uid625_pT1_uid598_invPE_b <= (others => '0');
            prodXY_uid625_pT1_uid598_invPE_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid625_pT1_uid598_invPE_a <= ld_reg_yT1_uid597_invPE_0_to_prodXY_uid625_pT1_uid598_invPE_0_q_to_prodXY_uid625_pT1_uid598_invPE_a_q;
                prodXY_uid625_pT1_uid598_invPE_b <= reg_memoryC2_uid596_invTab_lutmem_0_to_prodXY_uid625_pT1_uid598_invPE_1_q;
                prodXY_uid625_pT1_uid598_invPE_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid625_pT1_uid598_invPE_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid625_pT1_uid598_invPE: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid625_pT1_uid598_invPE_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid625_pT1_uid598_invPE_q <= prodXY_uid625_pT1_uid598_invPE_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid626_pT1_uid598_invPE(BITSELECT,625)@23
    prodXYTruncFR_uid626_pT1_uid598_invPE_in <= prodXY_uid625_pT1_uid598_invPE_q;
    prodXYTruncFR_uid626_pT1_uid598_invPE_b <= prodXYTruncFR_uid626_pT1_uid598_invPE_in(23 downto 11);

	--highBBits_uid600_invPE(BITSELECT,599)@23
    highBBits_uid600_invPE_in <= prodXYTruncFR_uid626_pT1_uid598_invPE_b;
    highBBits_uid600_invPE_b <= highBBits_uid600_invPE_in(12 downto 1);

	--ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_inputreg(DELAY,1646)
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => fracYAddr_uid298_tpix_uid45_fpTanPiTest_b, xout => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC1_uid595_invTab_lutmem_a(DELAY,1339)@17
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC1_uid595_invTab_lutmem_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 3 )
    PORT MAP ( xin => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_inputreg_q, xout => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC1_uid595_invTab_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid595_invTab_lutmem(DUALMEM,645)@21
    memoryC1_uid595_invTab_lutmem_reset0 <= areset;
    memoryC1_uid595_invTab_lutmem_ia <= (others => '0');
    memoryC1_uid595_invTab_lutmem_aa <= (others => '0');
    memoryC1_uid595_invTab_lutmem_ab <= ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC1_uid595_invTab_lutmem_a_q;
    memoryC1_uid595_invTab_lutmem_dmem : altsyncram
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
        init_file => "fp_tanpi_s5_memoryC1_uid595_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid595_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid595_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid595_invTab_lutmem_iq,
        address_a => memoryC1_uid595_invTab_lutmem_aa,
        data_a => memoryC1_uid595_invTab_lutmem_ia
    );
        memoryC1_uid595_invTab_lutmem_q <= memoryC1_uid595_invTab_lutmem_iq(20 downto 0);

	--sumAHighB_uid601_invPE(ADD,600)@23
    sumAHighB_uid601_invPE_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid595_invTab_lutmem_q(20)) & memoryC1_uid595_invTab_lutmem_q);
    sumAHighB_uid601_invPE_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid600_invPE_b(11)) & highBBits_uid600_invPE_b);
            sumAHighB_uid601_invPE_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid601_invPE_a) + SIGNED(sumAHighB_uid601_invPE_b));
    sumAHighB_uid601_invPE_q <= sumAHighB_uid601_invPE_o(21 downto 0);


	--lowRangeB_uid599_invPE(BITSELECT,598)@23
    lowRangeB_uid599_invPE_in <= prodXYTruncFR_uid626_pT1_uid598_invPE_b(0 downto 0);
    lowRangeB_uid599_invPE_b <= lowRangeB_uid599_invPE_in(0 downto 0);

	--s1_uid599_uid602_invPE(BITJOIN,601)@23
    s1_uid599_uid602_invPE_q <= sumAHighB_uid601_invPE_q & lowRangeB_uid599_invPE_b;

	--reg_s1_uid599_uid602_invPE_0_to_prodXY_uid628_pT2_uid604_invPE_1(REG,755)@23
    reg_s1_uid599_uid602_invPE_0_to_prodXY_uid628_pT2_uid604_invPE_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid599_uid602_invPE_0_to_prodXY_uid628_pT2_uid604_invPE_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid599_uid602_invPE_0_to_prodXY_uid628_pT2_uid604_invPE_1_q <= s1_uid599_uid602_invPE_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor(LOGICAL,1643)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_b <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_sticky_ena_q;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_q <= not (ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_a or ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_b);

	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_mem_top(CONSTANT,1639)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_mem_top_q <= "0100";

	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp(LOGICAL,1640)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_a <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_mem_top_q;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_q);
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_q <= "1" when ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_a = ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_b else "0";

	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmpReg(REG,1641)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmpReg_q <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_sticky_ena(REG,1644)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_nor_q = "1") THEN
                ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_sticky_ena_q <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd(LOGICAL,1645)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_a <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_sticky_ena_q;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_b <= en;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_q <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_a and ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_b;

	--reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0(REG,754)@17
    reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q <= "00000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q <= yPE_uid299_tpix_uid45_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt(COUNTER,1635)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_i = 3 THEN
                      ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_i <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_i <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_i,3));


	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdreg(REG,1636)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdreg_q <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux(MUX,1637)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_s <= en;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux: PROCESS (ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_s, ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdreg_q, ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_q <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_q <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem(DUALMEM,1634)
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_reset0 <= areset;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_ia <= reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_aa <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdreg_q;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_ab <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_rdmux_q;
    ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_iq,
        address_a => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_aa,
        data_a => ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_ia
    );
        ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_q <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_iq(13 downto 0);

	--prodXY_uid628_pT2_uid604_invPE(MULT,627)@24
    prodXY_uid628_pT2_uid604_invPE_pr <= signed(resize(UNSIGNED(prodXY_uid628_pT2_uid604_invPE_a),15)) * SIGNED(prodXY_uid628_pT2_uid604_invPE_b);
    prodXY_uid628_pT2_uid604_invPE_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid628_pT2_uid604_invPE_a <= (others => '0');
            prodXY_uid628_pT2_uid604_invPE_b <= (others => '0');
            prodXY_uid628_pT2_uid604_invPE_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid628_pT2_uid604_invPE_a <= ld_reg_yPE_uid299_tpix_uid45_fpTanPiTest_0_to_prodXY_uid628_pT2_uid604_invPE_0_q_to_prodXY_uid628_pT2_uid604_invPE_a_replace_mem_q;
                prodXY_uid628_pT2_uid604_invPE_b <= reg_s1_uid599_uid602_invPE_0_to_prodXY_uid628_pT2_uid604_invPE_1_q;
                prodXY_uid628_pT2_uid604_invPE_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid628_pT2_uid604_invPE_pr,37));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid628_pT2_uid604_invPE: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid628_pT2_uid604_invPE_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid628_pT2_uid604_invPE_q <= prodXY_uid628_pT2_uid604_invPE_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid629_pT2_uid604_invPE(BITSELECT,628)@27
    prodXYTruncFR_uid629_pT2_uid604_invPE_in <= prodXY_uid628_pT2_uid604_invPE_q;
    prodXYTruncFR_uid629_pT2_uid604_invPE_b <= prodXYTruncFR_uid629_pT2_uid604_invPE_in(36 downto 13);

	--highBBits_uid606_invPE(BITSELECT,605)@27
    highBBits_uid606_invPE_in <= prodXYTruncFR_uid629_pT2_uid604_invPE_b;
    highBBits_uid606_invPE_b <= highBBits_uid606_invPE_in(23 downto 2);

	--ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor(LOGICAL,1656)
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_b <= ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_sticky_ena_q;
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_q <= not (ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_a or ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_b);

	--ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_sticky_ena(REG,1657)
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_nor_q = "1") THEN
                ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_sticky_ena_q <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd(LOGICAL,1658)
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_a <= ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_sticky_ena_q;
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_b <= en;
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_q <= ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_a and ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_b;

	--ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem(DUALMEM,1647)
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_reset0 <= areset;
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_ia <= ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_inputreg_q;
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_aa <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdreg_q;
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_ab <= ld_oFracX_uid27_uid27_fpTanPiTest_q_to_p_uid102_spix_uid43_fpTanPiTest_d_replace_rdmux_q;
    ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_iq,
        address_a => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_aa,
        data_a => ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_ia
    );
        ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_q <= ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_iq(8 downto 0);

	--memoryC0_uid594_invTab_lutmem(DUALMEM,644)@25
    memoryC0_uid594_invTab_lutmem_reset0 <= areset;
    memoryC0_uid594_invTab_lutmem_ia <= (others => '0');
    memoryC0_uid594_invTab_lutmem_aa <= (others => '0');
    memoryC0_uid594_invTab_lutmem_ab <= ld_fracYAddr_uid298_tpix_uid45_fpTanPiTest_b_to_memoryC0_uid594_invTab_lutmem_a_replace_mem_q;
    memoryC0_uid594_invTab_lutmem_dmem : altsyncram
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
        init_file => "fp_tanpi_s5_memoryC0_uid594_invTab_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid594_invTab_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid594_invTab_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid594_invTab_lutmem_iq,
        address_a => memoryC0_uid594_invTab_lutmem_aa,
        data_a => memoryC0_uid594_invTab_lutmem_ia
    );
        memoryC0_uid594_invTab_lutmem_q <= memoryC0_uid594_invTab_lutmem_iq(30 downto 0);

	--sumAHighB_uid607_invPE(ADD,606)@27
    sumAHighB_uid607_invPE_a <= STD_LOGIC_VECTOR((31 downto 31 => memoryC0_uid594_invTab_lutmem_q(30)) & memoryC0_uid594_invTab_lutmem_q);
    sumAHighB_uid607_invPE_b <= STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid606_invPE_b(21)) & highBBits_uid606_invPE_b);
            sumAHighB_uid607_invPE_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid607_invPE_a) + SIGNED(sumAHighB_uid607_invPE_b));
    sumAHighB_uid607_invPE_q <= sumAHighB_uid607_invPE_o(31 downto 0);


	--lowRangeB_uid605_invPE(BITSELECT,604)@27
    lowRangeB_uid605_invPE_in <= prodXYTruncFR_uid629_pT2_uid604_invPE_b(1 downto 0);
    lowRangeB_uid605_invPE_b <= lowRangeB_uid605_invPE_in(1 downto 0);

	--s2_uid605_uid608_invPE(BITJOIN,607)@27
    s2_uid605_uid608_invPE_q <= sumAHighB_uid607_invPE_q & lowRangeB_uid605_invPE_b;

	--invY_uid301_tpix_uid45_fpTanPiTest(BITSELECT,300)@27
    invY_uid301_tpix_uid45_fpTanPiTest_in <= s2_uid605_uid608_invPE_q(30 downto 0);
    invY_uid301_tpix_uid45_fpTanPiTest_b <= invY_uid301_tpix_uid45_fpTanPiTest_in(30 downto 5);

	--reg_invY_uid301_tpix_uid45_fpTanPiTest_0_to_prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_0(REG,756)@27
    reg_invY_uid301_tpix_uid45_fpTanPiTest_0_to_prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_invY_uid301_tpix_uid45_fpTanPiTest_0_to_prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_0_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_invY_uid301_tpix_uid45_fpTanPiTest_0_to_prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_0_q <= invY_uid301_tpix_uid45_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest(MULT,609)@28
    prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_pr <= UNSIGNED(prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_a) * UNSIGNED(prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_b);
    prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_a <= (others => '0');
            prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_b <= (others => '0');
            prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_a <= reg_invY_uid301_tpix_uid45_fpTanPiTest_0_to_prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_0_q;
                prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_b <= lOAdded_uid304_tpix_uid45_fpTanPiTest_q;
                prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_s1 <= STD_LOGIC_VECTOR(prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_q <= prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid611_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest(BITSELECT,610)@31
    prodXYTruncFR_uid611_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_in <= prodXY_uid610_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_q;
    prodXYTruncFR_uid611_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_b <= prodXYTruncFR_uid611_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_in(49 downto 24);

	--invYO_uid302_tpix_uid45_fpTanPiTest(BITSELECT,301)@27
    invYO_uid302_tpix_uid45_fpTanPiTest_in <= s2_uid605_uid608_invPE_q(31 downto 0);
    invYO_uid302_tpix_uid45_fpTanPiTest_b <= invYO_uid302_tpix_uid45_fpTanPiTest_in(31 downto 31);

	--fracYZero_uid261_tpix_uid45_fpTanPiTest(LOGICAL,260)@17
    fracYZero_uid261_tpix_uid45_fpTanPiTest_a <= fracY_uid259_tpix_uid45_fpTanPiTest_b;
    fracYZero_uid261_tpix_uid45_fpTanPiTest_b <= STD_LOGIC_VECTOR("0000000000000000000000" & GND_q);
    fracYZero_uid261_tpix_uid45_fpTanPiTest_q <= "1" when fracYZero_uid261_tpix_uid45_fpTanPiTest_a = fracYZero_uid261_tpix_uid45_fpTanPiTest_b else "0";

	--ld_fracYZero_uid261_tpix_uid45_fpTanPiTest_q_to_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_a(DELAY,1024)@17
    ld_fracYZero_uid261_tpix_uid45_fpTanPiTest_q_to_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 10 )
    PORT MAP ( xin => fracYZero_uid261_tpix_uid45_fpTanPiTest_q, xout => ld_fracYZero_uid261_tpix_uid45_fpTanPiTest_q_to_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--fracYPostZ_uid303_tpix_uid45_fpTanPiTest(LOGICAL,302)@27
    fracYPostZ_uid303_tpix_uid45_fpTanPiTest_a <= ld_fracYZero_uid261_tpix_uid45_fpTanPiTest_q_to_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_a_q;
    fracYPostZ_uid303_tpix_uid45_fpTanPiTest_b <= invYO_uid302_tpix_uid45_fpTanPiTest_b;
    fracYPostZ_uid303_tpix_uid45_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q <= fracYPostZ_uid303_tpix_uid45_fpTanPiTest_a or fracYPostZ_uid303_tpix_uid45_fpTanPiTest_b;
        END IF;
    END PROCESS;



	--ld_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_b(DELAY,1028)@28
    ld_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q, xout => ld_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest(MUX,308)@31
    divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_s <= ld_fracYPostZ_uid303_tpix_uid45_fpTanPiTest_q_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_b_q;
    divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest: PROCESS (divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_s, en, prodXYTruncFR_uid611_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_b, reg_oFracXExt_uid307_tpix_uid45_fpTanPiTest_0_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_3_q)
    BEGIN
            CASE divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_s IS
                  WHEN "0" => divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_q <= prodXYTruncFR_uid611_prodDivPreNormProd_uid305_tpix_uid45_fpTanPiTest_b;
                  WHEN "1" => divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_q <= reg_oFracXExt_uid307_tpix_uid45_fpTanPiTest_0_to_divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_3_q;
                  WHEN OTHERS => divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--norm_uid310_tpix_uid45_fpTanPiTest(BITSELECT,309)@31
    norm_uid310_tpix_uid45_fpTanPiTest_in <= divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_q;
    norm_uid310_tpix_uid45_fpTanPiTest_b <= norm_uid310_tpix_uid45_fpTanPiTest_in(25 downto 25);

	--rndOp_uid316_tpix_uid45_fpTanPiTest(BITJOIN,315)@31
    rndOp_uid316_tpix_uid45_fpTanPiTest_q <= norm_uid310_tpix_uid45_fpTanPiTest_b & cstAllZWF_uid53_spix_uid43_fpTanPiTest_q & VCC_q;

	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor(LOGICAL,1569)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_b <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_sticky_ena_q;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_q <= not (ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_a or ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_b);

	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_sticky_ena(REG,1570)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_nor_q = "1") THEN
                ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_sticky_ena_q <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd(LOGICAL,1571)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_a <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_sticky_ena_q;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_b <= en;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_q <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_a and ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_b;

	--expXmY_uid295_tpix_uid45_fpTanPiTest(SUB,294)@17
    expXmY_uid295_tpix_uid45_fpTanPiTest_a <= STD_LOGIC_VECTOR("0" & expX_uid255_tpix_uid45_fpTanPiTest_b);
    expXmY_uid295_tpix_uid45_fpTanPiTest_b <= STD_LOGIC_VECTOR("0" & expY_uid258_tpix_uid45_fpTanPiTest_b);
    expXmY_uid295_tpix_uid45_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid295_tpix_uid45_fpTanPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expXmY_uid295_tpix_uid45_fpTanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid295_tpix_uid45_fpTanPiTest_a) - UNSIGNED(expXmY_uid295_tpix_uid45_fpTanPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expXmY_uid295_tpix_uid45_fpTanPiTest_q <= expXmY_uid295_tpix_uid45_fpTanPiTest_o(8 downto 0);


	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_inputreg(DELAY,1559)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expXmY_uid295_tpix_uid45_fpTanPiTest_q, xout => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem(DUALMEM,1560)
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_reset0 <= areset;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_ia <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_inputreg_q;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_aa <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdreg_q;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_ab <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_rdmux_q;
    ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_iq,
        address_a => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_aa,
        data_a => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_ia
    );
        ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_q <= ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_iq(8 downto 0);

	--expR_uid296_tpix_uid45_fpTanPiTest(ADD,295)@30
    expR_uid296_tpix_uid45_fpTanPiTest_a <= STD_LOGIC_VECTOR((10 downto 9 => ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_q(8)) & ld_expXmY_uid295_tpix_uid45_fpTanPiTest_q_to_expR_uid296_tpix_uid45_fpTanPiTest_a_replace_mem_q);
    expR_uid296_tpix_uid45_fpTanPiTest_b <= STD_LOGIC_VECTOR('0' & "00" & biasM1_uid74_spix_uid43_fpTanPiTest_q);
    expR_uid296_tpix_uid45_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expR_uid296_tpix_uid45_fpTanPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expR_uid296_tpix_uid45_fpTanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid296_tpix_uid45_fpTanPiTest_a) + SIGNED(expR_uid296_tpix_uid45_fpTanPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expR_uid296_tpix_uid45_fpTanPiTest_q <= expR_uid296_tpix_uid45_fpTanPiTest_o(9 downto 0);


	--divValPreNormHigh_uid311_tpix_uid45_fpTanPiTest(BITSELECT,310)@31
    divValPreNormHigh_uid311_tpix_uid45_fpTanPiTest_in <= divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_q(24 downto 0);
    divValPreNormHigh_uid311_tpix_uid45_fpTanPiTest_b <= divValPreNormHigh_uid311_tpix_uid45_fpTanPiTest_in(24 downto 1);

	--divValPreNormLow_uid312_tpix_uid45_fpTanPiTest(BITSELECT,311)@31
    divValPreNormLow_uid312_tpix_uid45_fpTanPiTest_in <= divValPreNormTrunc_uid309_tpix_uid45_fpTanPiTest_q(23 downto 0);
    divValPreNormLow_uid312_tpix_uid45_fpTanPiTest_b <= divValPreNormLow_uid312_tpix_uid45_fpTanPiTest_in(23 downto 0);

	--normFracRnd_uid313_tpix_uid45_fpTanPiTest(MUX,312)@31
    normFracRnd_uid313_tpix_uid45_fpTanPiTest_s <= norm_uid310_tpix_uid45_fpTanPiTest_b;
    normFracRnd_uid313_tpix_uid45_fpTanPiTest: PROCESS (normFracRnd_uid313_tpix_uid45_fpTanPiTest_s, en, divValPreNormLow_uid312_tpix_uid45_fpTanPiTest_b, divValPreNormHigh_uid311_tpix_uid45_fpTanPiTest_b)
    BEGIN
            CASE normFracRnd_uid313_tpix_uid45_fpTanPiTest_s IS
                  WHEN "0" => normFracRnd_uid313_tpix_uid45_fpTanPiTest_q <= divValPreNormLow_uid312_tpix_uid45_fpTanPiTest_b;
                  WHEN "1" => normFracRnd_uid313_tpix_uid45_fpTanPiTest_q <= divValPreNormHigh_uid311_tpix_uid45_fpTanPiTest_b;
                  WHEN OTHERS => normFracRnd_uid313_tpix_uid45_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracRnd_uid314_tpix_uid45_fpTanPiTest(BITJOIN,313)@31
    expFracRnd_uid314_tpix_uid45_fpTanPiTest_q <= expR_uid296_tpix_uid45_fpTanPiTest_q & normFracRnd_uid313_tpix_uid45_fpTanPiTest_q;

	--expFracPostRnd_uid317_tpix_uid45_fpTanPiTest(ADD,316)@31
    expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_a <= STD_LOGIC_VECTOR((35 downto 34 => expFracRnd_uid314_tpix_uid45_fpTanPiTest_q(33)) & expFracRnd_uid314_tpix_uid45_fpTanPiTest_q);
    expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & rndOp_uid316_tpix_uid45_fpTanPiTest_q);
            expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_a) + SIGNED(expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_b));
    expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_q <= expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_o(34 downto 0);


	--excRPreExc_uid320_tpix_uid45_fpTanPiTest(BITSELECT,319)@31
    excRPreExc_uid320_tpix_uid45_fpTanPiTest_in <= expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_q(31 downto 0);
    excRPreExc_uid320_tpix_uid45_fpTanPiTest_b <= excRPreExc_uid320_tpix_uid45_fpTanPiTest_in(31 downto 24);

	--reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3(REG,768)@31
    reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q <= excRPreExc_uid320_tpix_uid45_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_d(DELAY,1087)@32
    ld_reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q, xout => ld_reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2(REG,765)@17
    reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q <= excRNaN_uid338_tpix_uid45_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q_to_concExc_uid339_tpix_uid45_fpTanPiTest_c(DELAY,1082)@18
    ld_reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q_to_concExc_uid339_tpix_uid45_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q, xout => ld_reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q_to_concExc_uid339_tpix_uid45_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid290_tpix_uid45_fpTanPiTest(LOGICAL,289)@17
    InvExc_N_uid290_tpix_uid45_fpTanPiTest_a <= exc_N_uid289_tpix_uid45_fpTanPiTest_q;
    InvExc_N_uid290_tpix_uid45_fpTanPiTest_q <= not InvExc_N_uid290_tpix_uid45_fpTanPiTest_a;

	--InvExc_I_uid291_tpix_uid45_fpTanPiTest(LOGICAL,290)@17
    InvExc_I_uid291_tpix_uid45_fpTanPiTest_a <= exc_I_uid287_tpix_uid45_fpTanPiTest_q;
    InvExc_I_uid291_tpix_uid45_fpTanPiTest_q <= not InvExc_I_uid291_tpix_uid45_fpTanPiTest_a;

	--InvExpXIsZero_uid292_tpix_uid45_fpTanPiTest(LOGICAL,291)@17
    InvExpXIsZero_uid292_tpix_uid45_fpTanPiTest_a <= expXIsZero_uid282_tpix_uid45_fpTanPiTest_q;
    InvExpXIsZero_uid292_tpix_uid45_fpTanPiTest_q <= not InvExpXIsZero_uid292_tpix_uid45_fpTanPiTest_a;

	--exc_R_uid293_tpix_uid45_fpTanPiTest(LOGICAL,292)@17
    exc_R_uid293_tpix_uid45_fpTanPiTest_a <= InvExpXIsZero_uid292_tpix_uid45_fpTanPiTest_q;
    exc_R_uid293_tpix_uid45_fpTanPiTest_b <= InvExc_I_uid291_tpix_uid45_fpTanPiTest_q;
    exc_R_uid293_tpix_uid45_fpTanPiTest_c <= InvExc_N_uid290_tpix_uid45_fpTanPiTest_q;
    exc_R_uid293_tpix_uid45_fpTanPiTest_q <= exc_R_uid293_tpix_uid45_fpTanPiTest_a and exc_R_uid293_tpix_uid45_fpTanPiTest_b and exc_R_uid293_tpix_uid45_fpTanPiTest_c;

	--excXIYR_uid334_tpix_uid45_fpTanPiTest(LOGICAL,333)@17
    excXIYR_uid334_tpix_uid45_fpTanPiTest_a <= exc_I_uid271_tpix_uid45_fpTanPiTest_q;
    excXIYR_uid334_tpix_uid45_fpTanPiTest_b <= exc_R_uid293_tpix_uid45_fpTanPiTest_q;
    excXIYR_uid334_tpix_uid45_fpTanPiTest_q <= excXIYR_uid334_tpix_uid45_fpTanPiTest_a and excXIYR_uid334_tpix_uid45_fpTanPiTest_b;

	--ld_excXIYR_uid334_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_d(DELAY,1071)@17
    ld_excXIYR_uid334_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => excXIYR_uid334_tpix_uid45_fpTanPiTest_q, xout => ld_excXIYR_uid334_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--excXIYZ_uid333_tpix_uid45_fpTanPiTest(LOGICAL,332)@17
    excXIYZ_uid333_tpix_uid45_fpTanPiTest_a <= exc_I_uid271_tpix_uid45_fpTanPiTest_q;
    excXIYZ_uid333_tpix_uid45_fpTanPiTest_b <= expXIsZero_uid282_tpix_uid45_fpTanPiTest_q;
    excXIYZ_uid333_tpix_uid45_fpTanPiTest_q <= excXIYZ_uid333_tpix_uid45_fpTanPiTest_a and excXIYZ_uid333_tpix_uid45_fpTanPiTest_b;

	--ld_excXIYZ_uid333_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_c(DELAY,1070)@17
    ld_excXIYZ_uid333_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => excXIYZ_uid333_tpix_uid45_fpTanPiTest_q, xout => ld_excXIYZ_uid333_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--expRExt_uid321_tpix_uid45_fpTanPiTest(BITSELECT,320)@31
    expRExt_uid321_tpix_uid45_fpTanPiTest_in <= expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_q;
    expRExt_uid321_tpix_uid45_fpTanPiTest_b <= expRExt_uid321_tpix_uid45_fpTanPiTest_in(34 downto 24);

	--reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1(REG,758)@31
    reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1_q <= expRExt_uid321_tpix_uid45_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid325_tpix_uid45_fpTanPiTest(COMPARE,324)@32
    expOvf_uid325_tpix_uid45_fpTanPiTest_cin <= GND_q;
    expOvf_uid325_tpix_uid45_fpTanPiTest_a <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1_q(10)) & reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1_q) & '0';
    expOvf_uid325_tpix_uid45_fpTanPiTest_b <= STD_LOGIC_VECTOR('0' & "0000" & cstAllOWE_uid52_spix_uid43_fpTanPiTest_q) & expOvf_uid325_tpix_uid45_fpTanPiTest_cin(0);
            expOvf_uid325_tpix_uid45_fpTanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid325_tpix_uid45_fpTanPiTest_a) - SIGNED(expOvf_uid325_tpix_uid45_fpTanPiTest_b));
    expOvf_uid325_tpix_uid45_fpTanPiTest_n(0) <= not expOvf_uid325_tpix_uid45_fpTanPiTest_o(13);


	--ld_exc_R_uid293_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_a(DELAY,1426)@17
    ld_exc_R_uid293_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => exc_R_uid293_tpix_uid45_fpTanPiTest_q, xout => ld_exc_R_uid293_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3(REG,760)@31
    reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_q <= ld_exc_R_uid293_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_a_q;
            END IF;
        END IF;
    END PROCESS;


	--InvExc_N_uid274_tpix_uid45_fpTanPiTest(LOGICAL,273)@17
    InvExc_N_uid274_tpix_uid45_fpTanPiTest_a <= exc_N_uid273_tpix_uid45_fpTanPiTest_q;
    InvExc_N_uid274_tpix_uid45_fpTanPiTest_q <= not InvExc_N_uid274_tpix_uid45_fpTanPiTest_a;

	--InvExc_I_uid275_tpix_uid45_fpTanPiTest(LOGICAL,274)@17
    InvExc_I_uid275_tpix_uid45_fpTanPiTest_a <= exc_I_uid271_tpix_uid45_fpTanPiTest_q;
    InvExc_I_uid275_tpix_uid45_fpTanPiTest_q <= not InvExc_I_uid275_tpix_uid45_fpTanPiTest_a;

	--InvExpXIsZero_uid276_tpix_uid45_fpTanPiTest(LOGICAL,275)@17
    InvExpXIsZero_uid276_tpix_uid45_fpTanPiTest_a <= expXIsZero_uid266_tpix_uid45_fpTanPiTest_q;
    InvExpXIsZero_uid276_tpix_uid45_fpTanPiTest_q <= not InvExpXIsZero_uid276_tpix_uid45_fpTanPiTest_a;

	--exc_R_uid277_tpix_uid45_fpTanPiTest(LOGICAL,276)@17
    exc_R_uid277_tpix_uid45_fpTanPiTest_a <= InvExpXIsZero_uid276_tpix_uid45_fpTanPiTest_q;
    exc_R_uid277_tpix_uid45_fpTanPiTest_b <= InvExc_I_uid275_tpix_uid45_fpTanPiTest_q;
    exc_R_uid277_tpix_uid45_fpTanPiTest_c <= InvExc_N_uid274_tpix_uid45_fpTanPiTest_q;
    exc_R_uid277_tpix_uid45_fpTanPiTest_q <= exc_R_uid277_tpix_uid45_fpTanPiTest_a and exc_R_uid277_tpix_uid45_fpTanPiTest_b and exc_R_uid277_tpix_uid45_fpTanPiTest_c;

	--reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1(REG,763)@17
    reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q <= exc_R_uid277_tpix_uid45_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_a(DELAY,1061)@18
    ld_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q, xout => ld_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excXRYROvf_uid332_tpix_uid45_fpTanPiTest(LOGICAL,331)@32
    excXRYROvf_uid332_tpix_uid45_fpTanPiTest_a <= ld_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_1_q_to_excXRYROvf_uid332_tpix_uid45_fpTanPiTest_a_q;
    excXRYROvf_uid332_tpix_uid45_fpTanPiTest_b <= reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_q;
    excXRYROvf_uid332_tpix_uid45_fpTanPiTest_c <= expOvf_uid325_tpix_uid45_fpTanPiTest_n;
    excXRYROvf_uid332_tpix_uid45_fpTanPiTest_q <= excXRYROvf_uid332_tpix_uid45_fpTanPiTest_a and excXRYROvf_uid332_tpix_uid45_fpTanPiTest_b and excXRYROvf_uid332_tpix_uid45_fpTanPiTest_c;

	--excXRYZ_uid331_tpix_uid45_fpTanPiTest(LOGICAL,330)@17
    excXRYZ_uid331_tpix_uid45_fpTanPiTest_a <= exc_R_uid277_tpix_uid45_fpTanPiTest_q;
    excXRYZ_uid331_tpix_uid45_fpTanPiTest_b <= expXIsZero_uid282_tpix_uid45_fpTanPiTest_q;
    excXRYZ_uid331_tpix_uid45_fpTanPiTest_q <= excXRYZ_uid331_tpix_uid45_fpTanPiTest_a and excXRYZ_uid331_tpix_uid45_fpTanPiTest_b;

	--ld_excXRYZ_uid331_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_a(DELAY,1068)@17
    ld_excXRYZ_uid331_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 15 )
    PORT MAP ( xin => excXRYZ_uid331_tpix_uid45_fpTanPiTest_q, xout => ld_excXRYZ_uid331_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid335_tpix_uid45_fpTanPiTest(LOGICAL,334)@32
    excRInf_uid335_tpix_uid45_fpTanPiTest_a <= ld_excXRYZ_uid331_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_a_q;
    excRInf_uid335_tpix_uid45_fpTanPiTest_b <= excXRYROvf_uid332_tpix_uid45_fpTanPiTest_q;
    excRInf_uid335_tpix_uid45_fpTanPiTest_c <= ld_excXIYZ_uid333_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_c_q;
    excRInf_uid335_tpix_uid45_fpTanPiTest_d <= ld_excXIYR_uid334_tpix_uid45_fpTanPiTest_q_to_excRInf_uid335_tpix_uid45_fpTanPiTest_d_q;
    excRInf_uid335_tpix_uid45_fpTanPiTest_q <= excRInf_uid335_tpix_uid45_fpTanPiTest_a or excRInf_uid335_tpix_uid45_fpTanPiTest_b or excRInf_uid335_tpix_uid45_fpTanPiTest_c or excRInf_uid335_tpix_uid45_fpTanPiTest_d;

	--reg_exc_I_uid287_tpix_uid45_fpTanPiTest_0_to_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_2(REG,761)@17
    reg_exc_I_uid287_tpix_uid45_fpTanPiTest_0_to_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_I_uid287_tpix_uid45_fpTanPiTest_0_to_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_I_uid287_tpix_uid45_fpTanPiTest_0_to_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_2_q <= exc_I_uid287_tpix_uid45_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--xRegOrZero_uid328_tpix_uid45_fpTanPiTest(LOGICAL,327)@17
    xRegOrZero_uid328_tpix_uid45_fpTanPiTest_a <= exc_R_uid277_tpix_uid45_fpTanPiTest_q;
    xRegOrZero_uid328_tpix_uid45_fpTanPiTest_b <= expXIsZero_uid266_tpix_uid45_fpTanPiTest_q;
    xRegOrZero_uid328_tpix_uid45_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xRegOrZero_uid328_tpix_uid45_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            xRegOrZero_uid328_tpix_uid45_fpTanPiTest_q <= xRegOrZero_uid328_tpix_uid45_fpTanPiTest_a or xRegOrZero_uid328_tpix_uid45_fpTanPiTest_b;
        END IF;
    END PROCESS;



	--regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest(LOGICAL,328)@18
    regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_a <= xRegOrZero_uid328_tpix_uid45_fpTanPiTest_q;
    regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_b <= reg_exc_I_uid287_tpix_uid45_fpTanPiTest_0_to_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_2_q;
    regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_q <= regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_a and regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_b;

	--ld_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_c(DELAY,1058)@18
    ld_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_q, xout => ld_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid277_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_a(DELAY,1425)@17
    ld_exc_R_uid277_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => exc_R_uid277_tpix_uid45_fpTanPiTest_q, xout => ld_exc_R_uid277_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2(REG,759)@31
    reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_q <= ld_exc_R_uid277_tpix_uid45_fpTanPiTest_q_to_reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_a_q;
            END IF;
        END IF;
    END PROCESS;


	--expUdf_uid322_tpix_uid45_fpTanPiTest(COMPARE,321)@32
    expUdf_uid322_tpix_uid45_fpTanPiTest_cin <= GND_q;
    expUdf_uid322_tpix_uid45_fpTanPiTest_a <= STD_LOGIC_VECTOR('0' & "00000000000" & GND_q) & '0';
    expUdf_uid322_tpix_uid45_fpTanPiTest_b <= STD_LOGIC_VECTOR((12 downto 11 => reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1_q(10)) & reg_expRExt_uid321_tpix_uid45_fpTanPiTest_0_to_expUdf_uid322_tpix_uid45_fpTanPiTest_1_q) & expUdf_uid322_tpix_uid45_fpTanPiTest_cin(0);
            expUdf_uid322_tpix_uid45_fpTanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid322_tpix_uid45_fpTanPiTest_a) - SIGNED(expUdf_uid322_tpix_uid45_fpTanPiTest_b));
    expUdf_uid322_tpix_uid45_fpTanPiTest_n(0) <= not expUdf_uid322_tpix_uid45_fpTanPiTest_o(13);


	--regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest(LOGICAL,326)@32
    regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_a <= expUdf_uid322_tpix_uid45_fpTanPiTest_n;
    regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_b <= reg_exc_R_uid277_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_2_q;
    regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_c <= reg_exc_R_uid293_tpix_uid45_fpTanPiTest_0_to_regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_3_q;
    regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_q <= regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_a and regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_b and regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_c;

	--zeroOverReg_uid326_tpix_uid45_fpTanPiTest(LOGICAL,325)@17
    zeroOverReg_uid326_tpix_uid45_fpTanPiTest_a <= expXIsZero_uid266_tpix_uid45_fpTanPiTest_q;
    zeroOverReg_uid326_tpix_uid45_fpTanPiTest_b <= exc_R_uid293_tpix_uid45_fpTanPiTest_q;
    zeroOverReg_uid326_tpix_uid45_fpTanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND en = "1") THEN
            zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q <= zeroOverReg_uid326_tpix_uid45_fpTanPiTest_a and zeroOverReg_uid326_tpix_uid45_fpTanPiTest_b;
        END IF;
    END PROCESS;



	--ld_zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_a(DELAY,1056)@18
    ld_zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 14 )
    PORT MAP ( xin => zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q, xout => ld_zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRZero_uid330_tpix_uid45_fpTanPiTest(LOGICAL,329)@32
    excRZero_uid330_tpix_uid45_fpTanPiTest_a <= ld_zeroOverReg_uid326_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_a_q;
    excRZero_uid330_tpix_uid45_fpTanPiTest_b <= regOverRegWithUf_uid327_tpix_uid45_fpTanPiTest_q;
    excRZero_uid330_tpix_uid45_fpTanPiTest_c <= ld_regOrZeroOverInf_uid329_tpix_uid45_fpTanPiTest_q_to_excRZero_uid330_tpix_uid45_fpTanPiTest_c_q;
    excRZero_uid330_tpix_uid45_fpTanPiTest_q <= excRZero_uid330_tpix_uid45_fpTanPiTest_a or excRZero_uid330_tpix_uid45_fpTanPiTest_b or excRZero_uid330_tpix_uid45_fpTanPiTest_c;

	--concExc_uid339_tpix_uid45_fpTanPiTest(BITJOIN,338)@32
    concExc_uid339_tpix_uid45_fpTanPiTest_q <= ld_reg_excRNaN_uid338_tpix_uid45_fpTanPiTest_0_to_concExc_uid339_tpix_uid45_fpTanPiTest_2_q_to_concExc_uid339_tpix_uid45_fpTanPiTest_c_q & excRInf_uid335_tpix_uid45_fpTanPiTest_q & excRZero_uid330_tpix_uid45_fpTanPiTest_q;

	--reg_concExc_uid339_tpix_uid45_fpTanPiTest_0_to_excREnc_uid340_tpix_uid45_fpTanPiTest_0(REG,766)@32
    reg_concExc_uid339_tpix_uid45_fpTanPiTest_0_to_excREnc_uid340_tpix_uid45_fpTanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid339_tpix_uid45_fpTanPiTest_0_to_excREnc_uid340_tpix_uid45_fpTanPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid339_tpix_uid45_fpTanPiTest_0_to_excREnc_uid340_tpix_uid45_fpTanPiTest_0_q <= concExc_uid339_tpix_uid45_fpTanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid340_tpix_uid45_fpTanPiTest(LOOKUP,339)@33
    excREnc_uid340_tpix_uid45_fpTanPiTest: PROCESS (reg_concExc_uid339_tpix_uid45_fpTanPiTest_0_to_excREnc_uid340_tpix_uid45_fpTanPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid339_tpix_uid45_fpTanPiTest_0_to_excREnc_uid340_tpix_uid45_fpTanPiTest_0_q) IS
                WHEN "000" =>  excREnc_uid340_tpix_uid45_fpTanPiTest_q <= "01";
                WHEN "001" =>  excREnc_uid340_tpix_uid45_fpTanPiTest_q <= "00";
                WHEN "010" =>  excREnc_uid340_tpix_uid45_fpTanPiTest_q <= "10";
                WHEN "011" =>  excREnc_uid340_tpix_uid45_fpTanPiTest_q <= "00";
                WHEN "100" =>  excREnc_uid340_tpix_uid45_fpTanPiTest_q <= "11";
                WHEN "101" =>  excREnc_uid340_tpix_uid45_fpTanPiTest_q <= "00";
                WHEN "110" =>  excREnc_uid340_tpix_uid45_fpTanPiTest_q <= "00";
                WHEN "111" =>  excREnc_uid340_tpix_uid45_fpTanPiTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid340_tpix_uid45_fpTanPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid348_tpix_uid45_fpTanPiTest(MUX,347)@33
    expRPostExc_uid348_tpix_uid45_fpTanPiTest_s <= excREnc_uid340_tpix_uid45_fpTanPiTest_q;
    expRPostExc_uid348_tpix_uid45_fpTanPiTest: PROCESS (expRPostExc_uid348_tpix_uid45_fpTanPiTest_s, en, cstAllZWE_uid8_fpTanPiTest_q, ld_reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_d_q, cstAllOWE_uid52_spix_uid43_fpTanPiTest_q, cstAllOWE_uid52_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE expRPostExc_uid348_tpix_uid45_fpTanPiTest_s IS
                  WHEN "00" => expRPostExc_uid348_tpix_uid45_fpTanPiTest_q <= cstAllZWE_uid8_fpTanPiTest_q;
                  WHEN "01" => expRPostExc_uid348_tpix_uid45_fpTanPiTest_q <= ld_reg_excRPreExc_uid320_tpix_uid45_fpTanPiTest_0_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_3_q_to_expRPostExc_uid348_tpix_uid45_fpTanPiTest_d_q;
                  WHEN "10" => expRPostExc_uid348_tpix_uid45_fpTanPiTest_q <= cstAllOWE_uid52_spix_uid43_fpTanPiTest_q;
                  WHEN "11" => expRPostExc_uid348_tpix_uid45_fpTanPiTest_q <= cstAllOWE_uid52_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => expRPostExc_uid348_tpix_uid45_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPreExc_uid319_tpix_uid45_fpTanPiTest(BITSELECT,318)@31
    fracRPreExc_uid319_tpix_uid45_fpTanPiTest_in <= expFracPostRnd_uid317_tpix_uid45_fpTanPiTest_q(23 downto 0);
    fracRPreExc_uid319_tpix_uid45_fpTanPiTest_b <= fracRPreExc_uid319_tpix_uid45_fpTanPiTest_in(23 downto 1);

	--reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3(REG,767)@31
    reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q <= fracRPreExc_uid319_tpix_uid45_fpTanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_d(DELAY,1085)@32
    ld_reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q, xout => ld_reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid344_tpix_uid45_fpTanPiTest(MUX,343)@33
    fracRPostExc_uid344_tpix_uid45_fpTanPiTest_s <= excREnc_uid340_tpix_uid45_fpTanPiTest_q;
    fracRPostExc_uid344_tpix_uid45_fpTanPiTest: PROCESS (fracRPostExc_uid344_tpix_uid45_fpTanPiTest_s, en, cstAllZWF_uid53_spix_uid43_fpTanPiTest_q, ld_reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_d_q, cstAllZWF_uid53_spix_uid43_fpTanPiTest_q, oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest_q)
    BEGIN
            CASE fracRPostExc_uid344_tpix_uid45_fpTanPiTest_s IS
                  WHEN "00" => fracRPostExc_uid344_tpix_uid45_fpTanPiTest_q <= cstAllZWF_uid53_spix_uid43_fpTanPiTest_q;
                  WHEN "01" => fracRPostExc_uid344_tpix_uid45_fpTanPiTest_q <= ld_reg_fracRPreExc_uid319_tpix_uid45_fpTanPiTest_0_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_3_q_to_fracRPostExc_uid344_tpix_uid45_fpTanPiTest_d_q;
                  WHEN "10" => fracRPostExc_uid344_tpix_uid45_fpTanPiTest_q <= cstAllZWF_uid53_spix_uid43_fpTanPiTest_q;
                  WHEN "11" => fracRPostExc_uid344_tpix_uid45_fpTanPiTest_q <= oneFracRPostExc2_uid137_spix_uid43_fpTanPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid344_tpix_uid45_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--divR_uid351_tpix_uid45_fpTanPiTest(BITJOIN,350)@33
    divR_uid351_tpix_uid45_fpTanPiTest_q <= ld_sRPostExc_uid350_tpix_uid45_fpTanPiTest_q_to_divR_uid351_tpix_uid45_fpTanPiTest_c_q & expRPostExc_uid348_tpix_uid45_fpTanPiTest_q & fracRPostExc_uid344_tpix_uid45_fpTanPiTest_q;

	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor(LOGICAL,1447)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_notEnable_q;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_b <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_sticky_ena_q;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_q <= not (ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_a or ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_b);

	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_mem_top(CONSTANT,1443)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_mem_top_q <= "011110";

	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp(LOGICAL,1444)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_mem_top_q;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_q);
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_q <= "1" when ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_a = ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_b else "0";

	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmpReg(REG,1445)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmpReg_q <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_sticky_ena(REG,1448)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_nor_q = "1") THEN
                ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_sticky_ena_q <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd(LOGICAL,1449)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_a <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_sticky_ena_q;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_b <= en;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_q <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_a and ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_b;

	--join_uid46_fpTanPiTest(BITJOIN,45)@0
    join_uid46_fpTanPiTest_q <= expXIsZero_uid10_fpTanPiTest_q & tanXIsX_uid28_fpTanPiTest_c;

	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_inputreg(DELAY,1437)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => join_uid46_fpTanPiTest_q, xout => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt(COUNTER,1439)
    -- every=1, low=0, high=30, step=1, init=1
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_i = 29 THEN
                      ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_eq = '1') THEN
                        ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_i <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_i - 30;
                    ELSE
                        ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_i <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_i,5));


	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdreg(REG,1440)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdreg_q <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux(MUX,1441)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_s <= en;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux: PROCESS (ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_s, ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdreg_q, ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_q <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_q <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem(DUALMEM,1438)
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_reset0 <= areset;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_ia <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_inputreg_q;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_aa <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdreg_q;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_ab <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_rdmux_q;
    ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 2,
        widthad_b => 5,
        numwords_b => 31,
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
        clocken1 => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_iq,
        address_a => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_aa,
        data_a => ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_ia
    );
        ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_q <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_iq(1 downto 0);

	--xIn(GPIN,3)@0

	--tanPiXOutMux_uid47_fpTanPiTest(MUX,46)@33
    tanPiXOutMux_uid47_fpTanPiTest_s <= ld_join_uid46_fpTanPiTest_q_to_tanPiXOutMux_uid47_fpTanPiTest_b_replace_mem_q;
    tanPiXOutMux_uid47_fpTanPiTest: PROCESS (tanPiXOutMux_uid47_fpTanPiTest_s, en, divR_uid351_tpix_uid45_fpTanPiTest_q, ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_q, ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_q, ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_q)
    BEGIN
            CASE tanPiXOutMux_uid47_fpTanPiTest_s IS
                  WHEN "00" => tanPiXOutMux_uid47_fpTanPiTest_q <= divR_uid351_tpix_uid45_fpTanPiTest_q;
                  WHEN "01" => tanPiXOutMux_uid47_fpTanPiTest_q <= ld_reg_join_uid41_fpTanPiTest_0_to_tanPiXOutMux_uid47_fpTanPiTest_3_q_to_tanPiXOutMux_uid47_fpTanPiTest_d_replace_mem_q;
                  WHEN "10" => tanPiXOutMux_uid47_fpTanPiTest_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_q;
                  WHEN "11" => tanPiXOutMux_uid47_fpTanPiTest_q <= ld_xIn_a_to_tanPiXOutMux_uid47_fpTanPiTest_e_replace_mem_q;
                  WHEN OTHERS => tanPiXOutMux_uid47_fpTanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--xOut(GPOUT,4)@33
    q <= tanPiXOutMux_uid47_fpTanPiTest_q;


end normal;
