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

-- VHDL created from fp_atanpi_s5
-- VHDL created on Tue Mar 12 11:23:23 2013


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

entity fp_atanpi_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_atanpi_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstBiasM2_uid6_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal ooPi_uid9_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q : std_logic_vector (22 downto 0);
    signal cstNaNWF_uid20_atanX_uid8_fpArctanPiTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal cstBias_uid22_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasM1_uid23_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal cstBiasMWF_uid24_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal cstWFP2_uid25_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal piO2_uid46_atanX_uid8_fpArctanPiTest_q : std_logic_vector (25 downto 0);
    signal piO4_uid47_atanX_uid8_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal biasMwShift_uid62_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal shiftBias_uid64_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal zS_uid67_atanX_uid8_fpArctanPiTest_q : std_logic_vector (8 downto 0);
    signal cst01pWShift_uid69_atanX_uid8_fpArctanPiTest_q : std_logic_vector (12 downto 0);
    signal mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a : std_logic_vector (23 downto 0);
    signal mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_b : std_logic_vector (26 downto 0);
    signal mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_s1 : std_logic_vector (50 downto 0);
    signal mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_pr : UNSIGNED (50 downto 0);
    signal mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_q : std_logic_vector (50 downto 0);
    signal fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q : std_logic_vector(1 downto 0);
    signal expSum_uid162_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(8 downto 0);
    signal expSum_uid162_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(8 downto 0);
    signal expSum_uid162_rAtanPi_uid13_fpArctanPiTest_o : std_logic_vector (8 downto 0);
    signal expSum_uid162_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (8 downto 0);
    signal biasInc_uid163_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (9 downto 0);
    signal expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(11 downto 0);
    signal expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(11 downto 0);
    signal expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_o : std_logic_vector (11 downto 0);
    signal expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (10 downto 0);
    signal prod_uid165_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector (23 downto 0);
    signal prod_uid165_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal prod_uid165_rAtanPi_uid13_fpArctanPiTest_s1 : std_logic_vector (47 downto 0);
    signal prod_uid165_rAtanPi_uid13_fpArctanPiTest_pr : UNSIGNED (47 downto 0);
    signal prod_uid165_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (47 downto 0);
    signal roundBitDetectionConstant_uid180_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (2 downto 0);
    signal signR_uid190_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid190_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid190_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal cst2BiasM1_uid230_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal cst2Bias_uid231_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (22 downto 0);
    signal expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal leftShiftStage0Idx1Pad4_uid276_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (3 downto 0);
    signal leftShiftStage0Idx3Pad12_uid282_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (11 downto 0);
    signal leftShiftStage1Idx2Pad2_uid290_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1Idx3Pad3_uid293_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (2 downto 0);
    signal rightShiftStage0Idx2Pad16_uid320_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (15 downto 0);
    signal rightShiftStage0Idx3Pad24_uid323_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage1Idx3Pad6_uid334_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (5 downto 0);
    signal prodXY_uid360_pT1_uid303_atanXOXPolyEval_a : std_logic_vector (12 downto 0);
    signal prodXY_uid360_pT1_uid303_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXY_uid360_pT1_uid303_atanXOXPolyEval_s1 : std_logic_vector (25 downto 0);
    signal prodXY_uid360_pT1_uid303_atanXOXPolyEval_pr : SIGNED (26 downto 0);
    signal prodXY_uid360_pT1_uid303_atanXOXPolyEval_q : std_logic_vector (25 downto 0);
    signal prodXY_uid363_pT2_uid309_atanXOXPolyEval_a : std_logic_vector (17 downto 0);
    signal prodXY_uid363_pT2_uid309_atanXOXPolyEval_b : std_logic_vector (22 downto 0);
    signal prodXY_uid363_pT2_uid309_atanXOXPolyEval_s1 : std_logic_vector (40 downto 0);
    signal prodXY_uid363_pT2_uid309_atanXOXPolyEval_pr : SIGNED (41 downto 0);
    signal prodXY_uid363_pT2_uid309_atanXOXPolyEval_q : std_logic_vector (40 downto 0);
    signal prodXY_uid366_pT1_uid348_invPolyEval_a : std_logic_vector (11 downto 0);
    signal prodXY_uid366_pT1_uid348_invPolyEval_b : std_logic_vector (11 downto 0);
    signal prodXY_uid366_pT1_uid348_invPolyEval_s1 : std_logic_vector (23 downto 0);
    signal prodXY_uid366_pT1_uid348_invPolyEval_pr : SIGNED (24 downto 0);
    signal prodXY_uid366_pT1_uid348_invPolyEval_q : std_logic_vector (23 downto 0);
    signal prodXY_uid369_pT2_uid354_invPolyEval_a : std_logic_vector (14 downto 0);
    signal prodXY_uid369_pT2_uid354_invPolyEval_b : std_logic_vector (21 downto 0);
    signal prodXY_uid369_pT2_uid354_invPolyEval_s1 : std_logic_vector (36 downto 0);
    signal prodXY_uid369_pT2_uid354_invPolyEval_pr : SIGNED (37 downto 0);
    signal prodXY_uid369_pT2_uid354_invPolyEval_q : std_logic_vector (36 downto 0);
    signal memoryC0_uid299_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid299_atanXOXTabGen_lutmem_ia : std_logic_vector (30 downto 0);
    signal memoryC0_uid299_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid299_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid299_atanXOXTabGen_lutmem_iq : std_logic_vector (30 downto 0);
    signal memoryC0_uid299_atanXOXTabGen_lutmem_q : std_logic_vector (30 downto 0);
    signal memoryC1_uid300_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid300_atanXOXTabGen_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid300_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid300_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid300_atanXOXTabGen_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid300_atanXOXTabGen_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid301_atanXOXTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid301_atanXOXTabGen_lutmem_ia : std_logic_vector (12 downto 0);
    signal memoryC2_uid301_atanXOXTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid301_atanXOXTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid301_atanXOXTabGen_lutmem_iq : std_logic_vector (12 downto 0);
    signal memoryC2_uid301_atanXOXTabGen_lutmem_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid344_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid344_invTabGen_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid344_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid344_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid344_invTabGen_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid344_invTabGen_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid345_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid345_invTabGen_lutmem_ia : std_logic_vector (19 downto 0);
    signal memoryC1_uid345_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid345_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid345_invTabGen_lutmem_iq : std_logic_vector (19 downto 0);
    signal memoryC1_uid345_invTabGen_lutmem_q : std_logic_vector (19 downto 0);
    signal memoryC2_uid346_invTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid346_invTabGen_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid346_invTabGen_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid346_invTabGen_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid346_invTabGen_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid346_invTabGen_lutmem_q : std_logic_vector (11 downto 0);
    signal reg_excSelBits_uid114_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid346_invTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid347_invPolyEval_0_to_prodXY_uid366_pT1_uid348_invPolyEval_0_q : std_logic_vector (11 downto 0);
    signal reg_memoryC2_uid346_invTabGen_lutmem_0_to_prodXY_uid366_pT1_uid348_invPolyEval_1_q : std_logic_vector (11 downto 0);
    signal reg_memoryC1_uid345_invTabGen_lutmem_0_to_sumAHighB_uid351_invPolyEval_0_q : std_logic_vector (19 downto 0);
    signal reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_q : std_logic_vector (14 downto 0);
    signal reg_s1_uid349_uid352_invPolyEval_0_to_prodXY_uid369_pT2_uid354_invPolyEval_1_q : std_logic_vector (21 downto 0);
    signal reg_memoryC0_uid344_invTabGen_lutmem_0_to_sumAHighB_uid357_invPolyEval_0_q : std_logic_vector (28 downto 0);
    signal reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q : std_logic_vector (0 downto 0);
    signal reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_expU_uid59_atanX_uid8_fpArctanPiTest_0_to_atanUIsU_uid63_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q : std_logic_vector (2 downto 0);
    signal reg_leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_oFracUExt_uid70_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_3_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_4_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_5_q : std_logic_vector (36 downto 0);
    signal reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q : std_logic_vector (36 downto 0);
    signal reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid301_atanXOXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_q : std_logic_vector (12 downto 0);
    signal reg_memoryC2_uid301_atanXOXTabGen_lutmem_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_1_q : std_logic_vector (12 downto 0);
    signal reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC1_uid300_atanXOXTabGen_lutmem_0_to_sumAHighB_uid306_atanXOXPolyEval_0_q : std_logic_vector (20 downto 0);
    signal reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q : std_logic_vector (17 downto 0);
    signal reg_s1_uid304_uid307_atanXOXPolyEval_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_1_q : std_logic_vector (22 downto 0);
    signal reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_q : std_logic_vector (7 downto 0);
    signal reg_memoryC0_uid299_atanXOXTabGen_lutmem_0_to_sumAHighB_uid312_atanXOXPolyEval_0_q : std_logic_vector (30 downto 0);
    signal reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q : std_logic_vector (23 downto 0);
    signal reg_fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (26 downto 0);
    signal reg_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_0_to_shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (8 downto 0);
    signal reg_rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (1 downto 0);
    signal reg_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_2_q : std_logic_vector (24 downto 0);
    signal reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (0 downto 0);
    signal reg_pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_0_to_path2Diff_uid97_atanX_uid8_fpArctanPiTest_1_q : std_logic_vector (25 downto 0);
    signal reg_expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_0_to_expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_0_q : std_logic_vector (31 downto 0);
    signal reg_expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_0_to_expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_0_q : std_logic_vector (32 downto 0);
    signal reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q : std_logic_vector (22 downto 0);
    signal reg_fracRPath2_uid106_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_3_q : std_logic_vector (22 downto 0);
    signal reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q : std_logic_vector (22 downto 0);
    signal reg_fracOutCst_uid110_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_5_q : std_logic_vector (22 downto 0);
    signal reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_q : std_logic_vector (7 downto 0);
    signal reg_expRPath2_uid107_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_3_q : std_logic_vector (7 downto 0);
    signal reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q : std_logic_vector (7 downto 0);
    signal reg_expOutCst_uid112_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_5_q : std_logic_vector (7 downto 0);
    signal reg_expX_uid122_rAtanPi_uid13_fpArctanPiTest_0_to_expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_1_q : std_logic_vector (7 downto 0);
    signal reg_fracX_uid126_rAtanPi_uid13_fpArctanPiTest_0_to_fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_1_q : std_logic_vector (22 downto 0);
    signal reg_add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_0_q : std_logic_vector (23 downto 0);
    signal reg_add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_1_q : std_logic_vector (23 downto 0);
    signal reg_expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_0_q : std_logic_vector (34 downto 0);
    signal reg_roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_1_q : std_logic_vector (25 downto 0);
    signal reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1_q : std_logic_vector (11 downto 0);
    signal reg_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_0_to_excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_0_q : std_logic_vector (2 downto 0);
    signal ld_reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q_to_u_uid58_atanX_uid8_fpArctanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracU_uid60_atanX_uid8_fpArctanPiTest_b_to_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_shiftOut_uid91_atanX_uid8_fpArctanPiTest_c_to_sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q_to_oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_a_q : std_logic_vector (23 downto 0);
    signal ld_path2_uid56_atanX_uid8_fpArctanPiTest_n_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_q : std_logic_vector (7 downto 0);
    signal ld_expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q_to_InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q_to_InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_expY_uid123_rAtanPi_uid13_fpArctanPiTest_b_to_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_b_q : std_logic_vector (7 downto 0);
    signal ld_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_q_to_expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_a_q : std_logic_vector (8 downto 0);
    signal ld_exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q_to_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b_to_fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_d_q : std_logic_vector (22 downto 0);
    signal ld_expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b_to_expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_d_q : std_logic_vector (7 downto 0);
    signal ld_signR_uid190_rAtanPi_uid13_fpArctanPiTest_q_to_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_q_to_R_uid221_rAtanPi_uid13_fpArctanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q_to_fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_b_q : std_logic_vector (1 downto 0);
    signal ld_reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_c_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q : std_logic_vector (35 downto 0);
    signal ld_LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q : std_logic_vector (34 downto 0);
    signal ld_LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q : std_logic_vector (33 downto 0);
    signal ld_RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q : std_logic_vector (22 downto 0);
    signal ld_RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q : std_logic_vector (20 downto 0);
    signal ld_RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q : std_logic_vector (18 downto 0);
    signal ld_reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid345_invTabGen_lutmem_0_q_to_memoryC1_uid345_invTabGen_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a_q : std_logic_vector (12 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_a_q : std_logic_vector (7 downto 0);
    signal ld_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_a_q : std_logic_vector (1 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq : std_logic;
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : signal is true;
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_sticky_ena_q : signal is true;
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_inputreg_q : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq : std_logic;
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : signal is true;
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_inputreg_q : std_logic_vector (23 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_ia : std_logic_vector (23 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_iq : std_logic_vector (23 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_q : std_logic_vector (23 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_sticky_ena_q : signal is true;
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_sticky_ena_q : signal is true;
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_sticky_ena_q : signal is true;
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : signal is true;
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_reset0 : std_logic;
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_sticky_ena_q : signal is true;
    signal ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0 : std_logic;
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_sticky_ena_q : signal is true;
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : signal is true;
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 : std_logic;
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq : std_logic;
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_sticky_ena_q : signal is true;
    signal ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_reset0 : std_logic;
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_sticky_ena_q : signal is true;
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_inputreg_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_ia : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_iq : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_q : std_logic_vector (17 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_sticky_ena_q : signal is true;
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_reset0 : std_logic;
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_sticky_ena_q : signal is true;
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a_inputreg_q : std_logic_vector (12 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_reset0 : std_logic;
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_sticky_ena_q : signal is true;
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_inputreg_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_reset0 : std_logic;
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_ia : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_iq : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_q : std_logic_vector (7 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_sticky_ena_q : signal is true;
    signal atanUIsU_uid63_atanX_uid8_fpArctanPiTest_a : std_logic_vector(10 downto 0);
    signal atanUIsU_uid63_atanX_uid8_fpArctanPiTest_b : std_logic_vector(10 downto 0);
    signal atanUIsU_uid63_atanX_uid8_fpArctanPiTest_o : std_logic_vector (10 downto 0);
    signal atanUIsU_uid63_atanX_uid8_fpArctanPiTest_cin : std_logic_vector (0 downto 0);
    signal atanUIsU_uid63_atanX_uid8_fpArctanPiTest_n : std_logic_vector (0 downto 0);
    signal shiftOut_uid91_atanX_uid8_fpArctanPiTest_a : std_logic_vector(10 downto 0);
    signal shiftOut_uid91_atanX_uid8_fpArctanPiTest_b : std_logic_vector(10 downto 0);
    signal shiftOut_uid91_atanX_uid8_fpArctanPiTest_o : std_logic_vector (10 downto 0);
    signal shiftOut_uid91_atanX_uid8_fpArctanPiTest_cin : std_logic_vector (0 downto 0);
    signal shiftOut_uid91_atanX_uid8_fpArctanPiTest_c : std_logic_vector (0 downto 0);
    signal excSelBits_uid114_atanX_uid8_fpArctanPiTest_q : std_logic_vector (2 downto 0);
    signal expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(14 downto 0);
    signal expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(14 downto 0);
    signal expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_o : std_logic_vector (14 downto 0);
    signal expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(14 downto 0);
    signal expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(14 downto 0);
    signal expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_o : std_logic_vector (14 downto 0);
    signal expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_n : std_logic_vector (0 downto 0);
    signal leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_a : std_logic_vector(33 downto 0);
    signal expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_b : std_logic_vector(33 downto 0);
    signal expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_o : std_logic_vector (33 downto 0);
    signal expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_q : std_logic_vector (33 downto 0);
    signal expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_a : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_b : std_logic_vector(32 downto 0);
    signal expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_o : std_logic_vector (32 downto 0);
    signal expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_q : std_logic_vector (32 downto 0);
    signal InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal expX_uid15_atanX_uid8_fpArctanPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid15_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid16_atanX_uid8_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid16_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal singX_uid17_atanX_uid8_fpArctanPiTest_in : std_logic_vector (31 downto 0);
    signal singX_uid17_atanX_uid8_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal expXIsZero_uid31_atanX_uid8_fpArctanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid31_atanX_uid8_fpArctanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid33_atanX_uid8_fpArctanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid33_atanX_uid8_fpArctanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid33_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid36_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid36_atanX_uid8_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid36_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsBias_uid44_atanX_uid8_fpArctanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsBias_uid44_atanX_uid8_fpArctanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsBias_uid44_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal inIsOne_uid45_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal inIsOne_uid45_atanX_uid8_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal inIsOne_uid45_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal path2_uid56_atanX_uid8_fpArctanPiTest_a : std_logic_vector(10 downto 0);
    signal path2_uid56_atanX_uid8_fpArctanPiTest_b : std_logic_vector(10 downto 0);
    signal path2_uid56_atanX_uid8_fpArctanPiTest_o : std_logic_vector (10 downto 0);
    signal path2_uid56_atanX_uid8_fpArctanPiTest_cin : std_logic_vector (0 downto 0);
    signal path2_uid56_atanX_uid8_fpArctanPiTest_n : std_logic_vector (0 downto 0);
    signal shiftValue_uid65_atanX_uid8_fpArctanPiTest_a : std_logic_vector(8 downto 0);
    signal shiftValue_uid65_atanX_uid8_fpArctanPiTest_b : std_logic_vector(8 downto 0);
    signal shiftValue_uid65_atanX_uid8_fpArctanPiTest_o : std_logic_vector (8 downto 0);
    signal shiftValue_uid65_atanX_uid8_fpArctanPiTest_q : std_logic_vector (8 downto 0);
    signal shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_a : std_logic_vector(10 downto 0);
    signal shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_b : std_logic_vector(10 downto 0);
    signal shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_o : std_logic_vector (10 downto 0);
    signal shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_q : std_logic_vector (9 downto 0);
    signal path2Diff_uid97_atanX_uid8_fpArctanPiTest_a : std_logic_vector(26 downto 0);
    signal path2Diff_uid97_atanX_uid8_fpArctanPiTest_b : std_logic_vector(26 downto 0);
    signal path2Diff_uid97_atanX_uid8_fpArctanPiTest_o : std_logic_vector (26 downto 0);
    signal path2Diff_uid97_atanX_uid8_fpArctanPiTest_q : std_logic_vector (26 downto 0);
    signal fracRCalc_uid111_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal fracRCalc_uid111_atanX_uid8_fpArctanPiTest_q : std_logic_vector (22 downto 0);
    signal expRCalc_uid113_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal expRCalc_uid113_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid117_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid117_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(36 downto 0);
    signal expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_o : std_logic_vector (36 downto 0);
    signal expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (35 downto 0);
    signal excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_c : std_logic_vector(0 downto 0);
    signal excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_d : std_logic_vector(0 downto 0);
    signal excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_c : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_a : std_logic_vector(8 downto 0);
    signal expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector(8 downto 0);
    signal expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_o : std_logic_vector (8 downto 0);
    signal expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (8 downto 0);
    signal expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_a : std_logic_vector(8 downto 0);
    signal expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector(8 downto 0);
    signal expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_o : std_logic_vector (8 downto 0);
    signal expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (8 downto 0);
    signal outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (22 downto 0);
    signal leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal fracOOPi_uid10_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal fracOOPi_uid10_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal cstPiO2_uid48_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal cstPiO2_uid48_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal cstPiO4_uid51_atanX_uid8_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal cstPiO4_uid51_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal oFracUExt_uid70_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal normBit_uid80_atanX_uid8_fpArctanPiTest_in : std_logic_vector (49 downto 0);
    signal normBit_uid80_atanX_uid8_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal fracRPath3High_uid81_atanX_uid8_fpArctanPiTest_in : std_logic_vector (48 downto 0);
    signal fracRPath3High_uid81_atanX_uid8_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal fracRPath3Low_uid82_atanX_uid8_fpArctanPiTest_in : std_logic_vector (47 downto 0);
    signal fracRPath3Low_uid82_atanX_uid8_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (47 downto 0);
    signal normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal fracRPostNormHigh_uid168_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (46 downto 0);
    signal fracRPostNormHigh_uid168_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal fracRPostNormLow_uid169_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (45 downto 0);
    signal fracRPostNormLow_uid169_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal stickyRange_uid171_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (21 downto 0);
    signal stickyRange_uid171_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (21 downto 0);
    signal Prod22_uid172_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal Prod22_uid172_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal prodXYTruncFR_uid361_pT1_uid303_atanXOXPolyEval_in : std_logic_vector (25 downto 0);
    signal prodXYTruncFR_uid361_pT1_uid303_atanXOXPolyEval_b : std_logic_vector (13 downto 0);
    signal prodXYTruncFR_uid364_pT2_uid309_atanXOXPolyEval_in : std_logic_vector (40 downto 0);
    signal prodXYTruncFR_uid364_pT2_uid309_atanXOXPolyEval_b : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid367_pT1_uid348_invPolyEval_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid367_pT1_uid348_invPolyEval_b : std_logic_vector (12 downto 0);
    signal prodXYTruncFR_uid370_pT2_uid354_invPolyEval_in : std_logic_vector (36 downto 0);
    signal prodXYTruncFR_uid370_pT2_uid354_invPolyEval_b : std_logic_vector (22 downto 0);
    signal leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal pathSelBits_uid108_atanX_uid8_fpArctanPiTest_q : std_logic_vector (2 downto 0);
    signal concExc_uid208_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (2 downto 0);
    signal R_uid221_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_in : std_logic_vector (14 downto 0);
    signal yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector (14 downto 0);
    signal R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal fpPiO4C_uid52_atanX_uid8_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_a : std_logic_vector(6 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_b : std_logic_vector(6 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal constOut_uid54_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal constOut_uid54_atanX_uid8_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal u_uid58_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal u_uid58_atanX_uid8_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_a : std_logic_vector(4 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_b : std_logic_vector(4 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_q : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal R_uid120_atanX_uid8_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_a : std_logic_vector(6 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_b : std_logic_vector(6 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_q : std_logic_vector(0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_a : std_logic_vector(0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_b : std_logic_vector(0 downto 0);
    signal ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_q : std_logic_vector(0 downto 0);
    signal fracRPath3_uid88_atanX_uid8_fpArctanPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPath3_uid88_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal expRPath3_uid89_atanX_uid8_fpArctanPiTest_in : std_logic_vector (31 downto 0);
    signal expRPath3_uid89_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal fracRPath2_uid106_atanX_uid8_fpArctanPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPath2_uid106_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal expRPath2_uid107_atanX_uid8_fpArctanPiTest_in : std_logic_vector (31 downto 0);
    signal expRPath2_uid107_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal X24dto8_uid316_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal X24dto8_uid316_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (16 downto 0);
    signal X24dto16_uid319_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal X24dto16_uid319_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (8 downto 0);
    signal X24dto24_uid322_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal X24dto24_uid322_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal oFracX_uid249_uid249_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid247_z_uid57_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid247_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid37_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid37_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid246_z_uid57_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid246_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal ShiftValue8_uid66_atanX_uid8_fpArctanPiTest_in : std_logic_vector (8 downto 0);
    signal ShiftValue8_uid66_atanX_uid8_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_q : std_logic_vector (8 downto 0);
    signal shiftValPath2PreSubR_uid92_atanX_uid8_fpArctanPiTest_in : std_logic_vector (7 downto 0);
    signal shiftValPath2PreSubR_uid92_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal normBitPath2Diff_uid99_atanX_uid8_fpArctanPiTest_in : std_logic_vector (25 downto 0);
    signal normBitPath2Diff_uid99_atanX_uid8_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal path2DiffHigh_uid100_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal path2DiffHigh_uid100_atanX_uid8_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal path2DiffLow_uid101_atanX_uid8_fpArctanPiTest_in : std_logic_vector (23 downto 0);
    signal path2DiffLow_uid101_atanX_uid8_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal InvExpXIsZero_uid144_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid144_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid140_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid140_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid143_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid143_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid159_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid159_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (35 downto 0);
    signal expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (11 downto 0);
    signal expRComp_uid258_z_uid57_atanX_uid8_fpArctanPiTest_in : std_logic_vector (7 downto 0);
    signal expRComp_uid258_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal udf_uid259_z_uid57_atanX_uid8_fpArctanPiTest_in : std_logic_vector (9 downto 0);
    signal udf_uid259_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal expRCompYIsOne_uid261_z_uid57_atanX_uid8_fpArctanPiTest_in : std_logic_vector (7 downto 0);
    signal expRCompYIsOne_uid261_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_in : std_logic_vector (35 downto 0);
    signal LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : std_logic_vector (35 downto 0);
    signal LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_in : std_logic_vector (34 downto 0);
    signal LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : std_logic_vector (34 downto 0);
    signal LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_in : std_logic_vector (33 downto 0);
    signal LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : std_logic_vector (33 downto 0);
    signal fpOOPi_uid11_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal X32dto0_uid277_fxpU_uid72_atanX_uid8_fpArctanPiTest_in : std_logic_vector (32 downto 0);
    signal X32dto0_uid277_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : std_logic_vector (32 downto 0);
    signal X28dto0_uid280_fxpU_uid72_atanX_uid8_fpArctanPiTest_in : std_logic_vector (28 downto 0);
    signal X28dto0_uid280_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : std_logic_vector (28 downto 0);
    signal X24dto0_uid283_fxpU_uid72_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal X24dto0_uid283_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : std_logic_vector (24 downto 0);
    signal fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal InvNormBit_uid84_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvNormBit_uid84_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (0 downto 0);
    signal stickyExtendedRange_uid174_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (22 downto 0);
    signal lowRangeB_uid304_atanXOXPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid304_atanXOXPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid305_atanXOXPolyEval_in : std_logic_vector (13 downto 0);
    signal highBBits_uid305_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal lowRangeB_uid310_atanXOXPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid310_atanXOXPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid311_atanXOXPolyEval_in : std_logic_vector (23 downto 0);
    signal highBBits_uid311_atanXOXPolyEval_b : std_logic_vector (21 downto 0);
    signal lowRangeB_uid349_invPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid349_invPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid350_invPolyEval_in : std_logic_vector (12 downto 0);
    signal highBBits_uid350_invPolyEval_b : std_logic_vector (11 downto 0);
    signal lowRangeB_uid355_invPolyEval_in : std_logic_vector (1 downto 0);
    signal lowRangeB_uid355_invPolyEval_b : std_logic_vector (1 downto 0);
    signal highBBits_uid356_invPolyEval_in : std_logic_vector (22 downto 0);
    signal highBBits_uid356_invPolyEval_b : std_logic_vector (20 downto 0);
    signal y_uid73_atanX_uid8_fpArctanPiTest_in : std_logic_vector (35 downto 0);
    signal y_uid73_atanX_uid8_fpArctanPiTest_b : std_logic_vector (34 downto 0);
    signal RightShiftStage124dto1_uid338_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage124dto1_uid338_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal yT1_uid347_invPolyEval_in : std_logic_vector (14 downto 0);
    signal yT1_uid347_invPolyEval_b : std_logic_vector (11 downto 0);
    signal fracOutCst_uid110_atanX_uid8_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal fracOutCst_uid110_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal expOutCst_uid112_atanX_uid8_fpArctanPiTest_in : std_logic_vector (30 downto 0);
    signal expOutCst_uid112_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal expU_uid59_atanX_uid8_fpArctanPiTest_in : std_logic_vector (30 downto 0);
    signal expU_uid59_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal fracU_uid60_atanX_uid8_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal fracU_uid60_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal expX_uid122_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (30 downto 0);
    signal expX_uid122_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal signX_uid124_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (31 downto 0);
    signal signX_uid124_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal fracX_uid126_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid126_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal rightShiftStage0Idx1_uid318_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx2_uid321_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal rightShiftStage0Idx3_uid324_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal exc_N_uid38_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid38_atanX_uid8_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid38_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal fxpShifterBits_uid71_atanX_uid8_fpArctanPiTest_in : std_logic_vector (3 downto 0);
    signal fxpShifterBits_uid71_atanX_uid8_fpArctanPiTest_b : std_logic_vector (3 downto 0);
    signal sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal fracRPath2_uid102_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal fracRPath2_uid102_atanX_uid8_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal expRPath2_uid103_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal expRPath2_uid103_atanX_uid8_fpArctanPiTest_q : std_logic_vector (7 downto 0);
    signal exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (7 downto 0);
    signal expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal expY_uid123_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (30 downto 0);
    signal expY_uid123_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal signY_uid125_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (31 downto 0);
    signal signY_uid125_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal fracY_uid128_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid128_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_q : std_logic_vector (36 downto 0);
    signal expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a : std_logic_vector(8 downto 0);
    signal expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_b : std_logic_vector(8 downto 0);
    signal expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_o : std_logic_vector (8 downto 0);
    signal expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_q : std_logic_vector (8 downto 0);
    signal FracRPostNorm1dto0_uid178_rAtanPi_uid13_fpArctanPiTest_in : std_logic_vector (1 downto 0);
    signal FracRPostNorm1dto0_uid178_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector (1 downto 0);
    signal expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (34 downto 0);
    signal stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(22 downto 0);
    signal stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid306_atanXOXPolyEval_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid306_atanXOXPolyEval_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid306_atanXOXPolyEval_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid306_atanXOXPolyEval_q : std_logic_vector (21 downto 0);
    signal sumAHighB_uid312_atanXOXPolyEval_a : std_logic_vector(31 downto 0);
    signal sumAHighB_uid312_atanXOXPolyEval_b : std_logic_vector(31 downto 0);
    signal sumAHighB_uid312_atanXOXPolyEval_o : std_logic_vector (31 downto 0);
    signal sumAHighB_uid312_atanXOXPolyEval_q : std_logic_vector (31 downto 0);
    signal sumAHighB_uid351_invPolyEval_a : std_logic_vector(20 downto 0);
    signal sumAHighB_uid351_invPolyEval_b : std_logic_vector(20 downto 0);
    signal sumAHighB_uid351_invPolyEval_o : std_logic_vector (20 downto 0);
    signal sumAHighB_uid351_invPolyEval_q : std_logic_vector (20 downto 0);
    signal sumAHighB_uid357_invPolyEval_a : std_logic_vector(29 downto 0);
    signal sumAHighB_uid357_invPolyEval_b : std_logic_vector(29 downto 0);
    signal sumAHighB_uid357_invPolyEval_o : std_logic_vector (29 downto 0);
    signal sumAHighB_uid357_invPolyEval_q : std_logic_vector (29 downto 0);
    signal yAddr_uid75_atanX_uid8_fpArctanPiTest_in : std_logic_vector (34 downto 0);
    signal yAddr_uid75_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_in : std_logic_vector (26 downto 0);
    signal yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_b : std_logic_vector (17 downto 0);
    signal rightShiftStage2Idx1_uid340_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s : std_logic_vector (1 downto 0);
    signal rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector (7 downto 0);
    signal InvExc_N_uid118_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid118_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_in : std_logic_vector (3 downto 0);
    signal leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : std_logic_vector (1 downto 0);
    signal sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest_in : std_logic_vector (4 downto 0);
    signal sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest_b : std_logic_vector (4 downto 0);
    signal expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_q : std_logic_vector (31 downto 0);
    signal InvExc_N_uid142_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid142_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (23 downto 0);
    signal fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_q : std_logic_vector (32 downto 0);
    signal sticky_uid177_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal sticky_uid177_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal s1_uid304_uid307_atanXOXPolyEval_q : std_logic_vector (22 downto 0);
    signal s2_uid310_uid313_atanXOXPolyEval_q : std_logic_vector (33 downto 0);
    signal s1_uid349_uid352_invPolyEval_q : std_logic_vector (21 downto 0);
    signal s2_uid355_uid358_invPolyEval_q : std_logic_vector (31 downto 0);
    signal yT1_uid302_atanXOXPolyEval_in : std_logic_vector (17 downto 0);
    signal yT1_uid302_atanXOXPolyEval_b : std_logic_vector (12 downto 0);
    signal rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s : std_logic_vector (0 downto 0);
    signal rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (20 downto 0);
    signal RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (24 downto 0);
    signal RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (18 downto 0);
    signal signR_uid119_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal signR_uid119_atanX_uid8_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal signR_uid119_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (2 downto 0);
    signal rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (1 downto 0);
    signal rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in : std_logic_vector (0 downto 0);
    signal rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : std_logic_vector (0 downto 0);
    signal exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid156_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid156_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal lrs_uid179_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (2 downto 0);
    signal fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_in : std_logic_vector (31 downto 0);
    signal fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_b : std_logic_vector (26 downto 0);
    signal fxpInverseRes_uid256_z_uid57_atanX_uid8_fpArctanPiTest_in : std_logic_vector (28 downto 0);
    signal fxpInverseRes_uid256_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector (23 downto 0);
    signal pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_q : std_logic_vector (25 downto 0);
    signal xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_b : std_logic_vector(2 downto 0);
    signal roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal fxpInverseResFrac_uid262_z_uid57_atanX_uid8_fpArctanPiTest_in : std_logic_vector (22 downto 0);
    signal fxpInverseResFrac_uid262_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector (22 downto 0);
    signal xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_b : std_logic_vector(0 downto 0);
    signal xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal roundBit_uid182_rAtanPi_uid13_fpArctanPiTest_a : std_logic_vector(0 downto 0);
    signal roundBit_uid182_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector(0 downto 0);
    signal excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_q : std_logic_vector (2 downto 0);
    signal roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_q : std_logic_vector (25 downto 0);
begin


	--xIn(GPIN,3)@0

	--cstAllZWF_uid19_atanX_uid8_fpArctanPiTest(CONSTANT,18)
    cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q <= "00000000000000000000000";

	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable(LOGICAL,878)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_a <= en;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q <= not ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_a;

	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor(LOGICAL,1008)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_b <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_q <= not (ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_a or ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_b);

	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_mem_top(CONSTANT,1004)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_mem_top_q <= "0100001";

	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp(LOGICAL,1005)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_a <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_mem_top_q;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q);
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_q <= "1" when ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_a = ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_b else "0";

	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmpReg(REG,1006)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmpReg_q <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_sticky_ena(REG,1009)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_nor_q = "1") THEN
                ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd(LOGICAL,1010)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_a <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_b <= en;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_q <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_a and ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_b;

	--fracX_uid16_atanX_uid8_fpArctanPiTest(BITSELECT,15)@0
    fracX_uid16_atanX_uid8_fpArctanPiTest_in <= a(22 downto 0);
    fracX_uid16_atanX_uid8_fpArctanPiTest_b <= fracX_uid16_atanX_uid8_fpArctanPiTest_in(22 downto 0);

	--fracXIsZero_uid35_atanX_uid8_fpArctanPiTest(LOGICAL,34)@0
    fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_a <= fracX_uid16_atanX_uid8_fpArctanPiTest_b;
    fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_b <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
    fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_q <= "1" when fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_a = fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_b else "0";

	--InvFracXIsZero_uid37_atanX_uid8_fpArctanPiTest(LOGICAL,36)@0
    InvFracXIsZero_uid37_atanX_uid8_fpArctanPiTest_a <= fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_q;
    InvFracXIsZero_uid37_atanX_uid8_fpArctanPiTest_q <= not InvFracXIsZero_uid37_atanX_uid8_fpArctanPiTest_a;

	--cstAllOWE_uid18_atanX_uid8_fpArctanPiTest(CONSTANT,17)
    cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q <= "11111111";

	--expX_uid15_atanX_uid8_fpArctanPiTest(BITSELECT,14)@0
    expX_uid15_atanX_uid8_fpArctanPiTest_in <= a(30 downto 0);
    expX_uid15_atanX_uid8_fpArctanPiTest_b <= expX_uid15_atanX_uid8_fpArctanPiTest_in(30 downto 23);

	--expXIsMax_uid33_atanX_uid8_fpArctanPiTest(LOGICAL,32)@0
    expXIsMax_uid33_atanX_uid8_fpArctanPiTest_a <= expX_uid15_atanX_uid8_fpArctanPiTest_b;
    expXIsMax_uid33_atanX_uid8_fpArctanPiTest_b <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
    expXIsMax_uid33_atanX_uid8_fpArctanPiTest_q <= "1" when expXIsMax_uid33_atanX_uid8_fpArctanPiTest_a = expXIsMax_uid33_atanX_uid8_fpArctanPiTest_b else "0";

	--exc_N_uid38_atanX_uid8_fpArctanPiTest(LOGICAL,37)@0
    exc_N_uid38_atanX_uid8_fpArctanPiTest_a <= expXIsMax_uid33_atanX_uid8_fpArctanPiTest_q;
    exc_N_uid38_atanX_uid8_fpArctanPiTest_b <= InvFracXIsZero_uid37_atanX_uid8_fpArctanPiTest_q;
    exc_N_uid38_atanX_uid8_fpArctanPiTest_q <= exc_N_uid38_atanX_uid8_fpArctanPiTest_a and exc_N_uid38_atanX_uid8_fpArctanPiTest_b;

	--InvExc_N_uid118_atanX_uid8_fpArctanPiTest(LOGICAL,117)@0
    InvExc_N_uid118_atanX_uid8_fpArctanPiTest_a <= exc_N_uid38_atanX_uid8_fpArctanPiTest_q;
    InvExc_N_uid118_atanX_uid8_fpArctanPiTest_q <= not InvExc_N_uid118_atanX_uid8_fpArctanPiTest_a;

	--singX_uid17_atanX_uid8_fpArctanPiTest(BITSELECT,16)@0
    singX_uid17_atanX_uid8_fpArctanPiTest_in <= a;
    singX_uid17_atanX_uid8_fpArctanPiTest_b <= singX_uid17_atanX_uid8_fpArctanPiTest_in(31 downto 31);

	--signR_uid119_atanX_uid8_fpArctanPiTest(LOGICAL,118)@0
    signR_uid119_atanX_uid8_fpArctanPiTest_a <= singX_uid17_atanX_uid8_fpArctanPiTest_b;
    signR_uid119_atanX_uid8_fpArctanPiTest_b <= InvExc_N_uid118_atanX_uid8_fpArctanPiTest_q;
    signR_uid119_atanX_uid8_fpArctanPiTest_q <= signR_uid119_atanX_uid8_fpArctanPiTest_a and signR_uid119_atanX_uid8_fpArctanPiTest_b;

	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_inputreg(DELAY,998)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signR_uid119_atanX_uid8_fpArctanPiTest_q, xout => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt(COUNTER,1000)
    -- every=1, low=0, high=33, step=1, init=1
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i = 32 THEN
                      ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq = '1') THEN
                        ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i - 33;
                    ELSE
                        ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i,6));


	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdreg(REG,1001)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux(MUX,1002)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s <= en;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux: PROCESS (ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s, ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q, ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
                  WHEN "1" => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem(DUALMEM,999)
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_ia <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_inputreg_q;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_aa <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_ab <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q;
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 34,
        width_b => 1,
        widthad_b => 6,
        numwords_b => 34,
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
        clocken1 => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_iq,
        address_a => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_aa,
        data_a => ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_ia
    );
    ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 <= areset;
        ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_q <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_iq(0 downto 0);

	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor(LOGICAL,879)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_b <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_q <= not (ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_a or ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_b);

	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_mem_top(CONSTANT,875)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_mem_top_q <= "0100000";

	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp(LOGICAL,876)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_mem_top_q;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q);
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_q <= "1" when ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_a = ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_b else "0";

	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg(REG,877)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_sticky_ena(REG,880)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_nor_q = "1") THEN
                ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd(LOGICAL,881)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_b <= en;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_a and ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_b;

	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_inputreg(DELAY,869)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => singX_uid17_atanX_uid8_fpArctanPiTest_b, xout => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt(COUNTER,871)
    -- every=1, low=0, high=32, step=1, init=1
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i = 31 THEN
                      ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq = '1') THEN
                        ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i - 32;
                    ELSE
                        ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i,6));


	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg(REG,872)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux(MUX,873)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s <= en;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux: PROCESS (ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s, ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q, ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
                  WHEN "1" => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem(DUALMEM,870)
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_ia <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_inputreg_q;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_aa <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_ab <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q;
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 1,
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
        clocken1 => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_iq,
        address_a => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_aa,
        data_a => ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_ia
    );
    ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 <= areset;
        ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_iq(0 downto 0);

	--cstBias_uid22_atanX_uid8_fpArctanPiTest(CONSTANT,21)
    cstBias_uid22_atanX_uid8_fpArctanPiTest_q <= "01111111";

	--piO2_uid46_atanX_uid8_fpArctanPiTest(CONSTANT,45)
    piO2_uid46_atanX_uid8_fpArctanPiTest_q <= "11001001000011111101101011";

	--cstPiO2_uid48_atanX_uid8_fpArctanPiTest(BITSELECT,47)@35
    cstPiO2_uid48_atanX_uid8_fpArctanPiTest_in <= piO2_uid46_atanX_uid8_fpArctanPiTest_q(24 downto 0);
    cstPiO2_uid48_atanX_uid8_fpArctanPiTest_b <= cstPiO2_uid48_atanX_uid8_fpArctanPiTest_in(24 downto 2);

	--fpPiO2C_uid49_atanX_uid8_fpArctanPiTest(BITJOIN,48)@35
    fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_q & cstBias_uid22_atanX_uid8_fpArctanPiTest_q & cstPiO2_uid48_atanX_uid8_fpArctanPiTest_b;

	--cstBiasM1_uid23_atanX_uid8_fpArctanPiTest(CONSTANT,22)
    cstBiasM1_uid23_atanX_uid8_fpArctanPiTest_q <= "01111110";

	--piO4_uid47_atanX_uid8_fpArctanPiTest(CONSTANT,46)
    piO4_uid47_atanX_uid8_fpArctanPiTest_q <= "110010010000111111011011";

	--cstPiO4_uid51_atanX_uid8_fpArctanPiTest(BITSELECT,50)@35
    cstPiO4_uid51_atanX_uid8_fpArctanPiTest_in <= piO4_uid47_atanX_uid8_fpArctanPiTest_q(22 downto 0);
    cstPiO4_uid51_atanX_uid8_fpArctanPiTest_b <= cstPiO4_uid51_atanX_uid8_fpArctanPiTest_in(22 downto 0);

	--fpPiO4C_uid52_atanX_uid8_fpArctanPiTest(BITJOIN,51)@35
    fpPiO4C_uid52_atanX_uid8_fpArctanPiTest_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_mem_q & cstBiasM1_uid23_atanX_uid8_fpArctanPiTest_q & cstPiO4_uid51_atanX_uid8_fpArctanPiTest_b;

	--ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor(LOGICAL,892)
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_b <= ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_sticky_ena_q;
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_q <= not (ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_a or ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_b);

	--ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_sticky_ena(REG,893)
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_nor_q = "1") THEN
                ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_sticky_ena_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd(LOGICAL,894)
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_a <= ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_sticky_ena_q;
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_b <= en;
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_q <= ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_a and ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_b;

	--exc_I_uid36_atanX_uid8_fpArctanPiTest(LOGICAL,35)@0
    exc_I_uid36_atanX_uid8_fpArctanPiTest_a <= expXIsMax_uid33_atanX_uid8_fpArctanPiTest_q;
    exc_I_uid36_atanX_uid8_fpArctanPiTest_b <= fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_q;
    exc_I_uid36_atanX_uid8_fpArctanPiTest_q <= exc_I_uid36_atanX_uid8_fpArctanPiTest_a and exc_I_uid36_atanX_uid8_fpArctanPiTest_b;

	--ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_inputreg(DELAY,882)
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid36_atanX_uid8_fpArctanPiTest_q, xout => ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem(DUALMEM,883)
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_ia <= ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_inputreg_q;
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_aa <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_ab <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q;
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 1,
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
        clocken1 => ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_iq,
        address_a => ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_aa,
        data_a => ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_ia
    );
    ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_reset0 <= areset;
        ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_q <= ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_iq(0 downto 0);

	--constOut_uid54_atanX_uid8_fpArctanPiTest(MUX,53)@35
    constOut_uid54_atanX_uid8_fpArctanPiTest_s <= ld_exc_I_uid36_atanX_uid8_fpArctanPiTest_q_to_constOut_uid54_atanX_uid8_fpArctanPiTest_b_replace_mem_q;
    constOut_uid54_atanX_uid8_fpArctanPiTest: PROCESS (constOut_uid54_atanX_uid8_fpArctanPiTest_s, en, fpPiO4C_uid52_atanX_uid8_fpArctanPiTest_q, fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE constOut_uid54_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "0" => constOut_uid54_atanX_uid8_fpArctanPiTest_q <= fpPiO4C_uid52_atanX_uid8_fpArctanPiTest_q;
                  WHEN "1" => constOut_uid54_atanX_uid8_fpArctanPiTest_q <= fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => constOut_uid54_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expOutCst_uid112_atanX_uid8_fpArctanPiTest(BITSELECT,111)@35
    expOutCst_uid112_atanX_uid8_fpArctanPiTest_in <= constOut_uid54_atanX_uid8_fpArctanPiTest_q(30 downto 0);
    expOutCst_uid112_atanX_uid8_fpArctanPiTest_b <= expOutCst_uid112_atanX_uid8_fpArctanPiTest_in(30 downto 23);

	--reg_expOutCst_uid112_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_5(REG,428)@35
    reg_expOutCst_uid112_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expOutCst_uid112_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_5_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expOutCst_uid112_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_5_q <= expOutCst_uid112_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--cst01pWShift_uid69_atanX_uid8_fpArctanPiTest(CONSTANT,68)
    cst01pWShift_uid69_atanX_uid8_fpArctanPiTest_q <= "0000000000000";

	--reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2(REG,389)@0
    reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q <= signR_uid119_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_c(DELAY,707)@1
    ld_reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q, xout => ld_reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor(LOGICAL,1022)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_b <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_sticky_ena_q;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_q <= not (ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_a or ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_b);

	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_mem_top(CONSTANT,1018)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_mem_top_q <= "0111";

	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp(LOGICAL,1019)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_a <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_mem_top_q;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_q);
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_q <= "1" when ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_a = ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_b else "0";

	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmpReg(REG,1020)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmpReg_q <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_sticky_ena(REG,1023)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_nor_q = "1") THEN
                ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_sticky_ena_q <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd(LOGICAL,1024)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_a <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_sticky_ena_q;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_b <= en;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_q <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_a and ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_b;

	--cst2Bias_uid231_z_uid57_atanX_uid8_fpArctanPiTest(CONSTANT,230)
    cst2Bias_uid231_z_uid57_atanX_uid8_fpArctanPiTest_q <= "11111110";

	--expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest(SUB,259)@0
    expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid231_z_uid57_atanX_uid8_fpArctanPiTest_q);
    expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("0" & expX_uid15_atanX_uid8_fpArctanPiTest_b);
            expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_a) - UNSIGNED(expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_b));
    expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_q <= expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_o(8 downto 0);


	--expRCompYIsOne_uid261_z_uid57_atanX_uid8_fpArctanPiTest(BITSELECT,260)@0
    expRCompYIsOne_uid261_z_uid57_atanX_uid8_fpArctanPiTest_in <= expRCompYIsOneExt_uid260_z_uid57_atanX_uid8_fpArctanPiTest_q(7 downto 0);
    expRCompYIsOne_uid261_z_uid57_atanX_uid8_fpArctanPiTest_b <= expRCompYIsOne_uid261_z_uid57_atanX_uid8_fpArctanPiTest_in(7 downto 0);

	--cst2BiasM1_uid230_z_uid57_atanX_uid8_fpArctanPiTest(CONSTANT,229)
    cst2BiasM1_uid230_z_uid57_atanX_uid8_fpArctanPiTest_q <= "11111101";

	--expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest(SUB,256)@0
    expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid230_z_uid57_atanX_uid8_fpArctanPiTest_q);
    expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("0" & expX_uid15_atanX_uid8_fpArctanPiTest_b);
            expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_a) - UNSIGNED(expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_b));
    expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_q <= expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_o(8 downto 0);


	--expRComp_uid258_z_uid57_atanX_uid8_fpArctanPiTest(BITSELECT,257)@0
    expRComp_uid258_z_uid57_atanX_uid8_fpArctanPiTest_in <= expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_q(7 downto 0);
    expRComp_uid258_z_uid57_atanX_uid8_fpArctanPiTest_b <= expRComp_uid258_z_uid57_atanX_uid8_fpArctanPiTest_in(7 downto 0);

	--GND(CONSTANT,0)
    GND_q <= "0";

	--fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest(LOGICAL,249)@0
    fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_a <= fracX_uid16_atanX_uid8_fpArctanPiTest_b;
    fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("0000000000000000000000" & GND_q);
    fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q <= "1" when fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_a = fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_b else "0";

	--expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest(MUX,263)@0
    expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_s <= fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q;
    expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_s IS
                      WHEN "0" => expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_q <= expRComp_uid258_z_uid57_atanX_uid8_fpArctanPiTest_b;
                      WHEN "1" => expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_q <= expRCompYIsOne_uid261_z_uid57_atanX_uid8_fpArctanPiTest_b;
                      WHEN OTHERS => expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--expXIsZero_uid31_atanX_uid8_fpArctanPiTest(LOGICAL,30)@0
    expXIsZero_uid31_atanX_uid8_fpArctanPiTest_a <= expX_uid15_atanX_uid8_fpArctanPiTest_b;
    expXIsZero_uid31_atanX_uid8_fpArctanPiTest_b <= cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q;
    expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q <= "1" when expXIsZero_uid31_atanX_uid8_fpArctanPiTest_a = expXIsZero_uid31_atanX_uid8_fpArctanPiTest_b else "0";

	--udf_uid259_z_uid57_atanX_uid8_fpArctanPiTest(BITSELECT,258)@0
    udf_uid259_z_uid57_atanX_uid8_fpArctanPiTest_in <= STD_LOGIC_VECTOR((9 downto 9 => expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_q(8)) & expRCompExt_uid257_z_uid57_atanX_uid8_fpArctanPiTest_q);
    udf_uid259_z_uid57_atanX_uid8_fpArctanPiTest_b <= udf_uid259_z_uid57_atanX_uid8_fpArctanPiTest_in(9 downto 9);

	--InvExc_I_uid246_z_uid57_atanX_uid8_fpArctanPiTest(LOGICAL,245)@0
    InvExc_I_uid246_z_uid57_atanX_uid8_fpArctanPiTest_a <= exc_I_uid36_atanX_uid8_fpArctanPiTest_q;
    InvExc_I_uid246_z_uid57_atanX_uid8_fpArctanPiTest_q <= not InvExc_I_uid246_z_uid57_atanX_uid8_fpArctanPiTest_a;

	--InvExpXIsZero_uid247_z_uid57_atanX_uid8_fpArctanPiTest(LOGICAL,246)@0
    InvExpXIsZero_uid247_z_uid57_atanX_uid8_fpArctanPiTest_a <= expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q;
    InvExpXIsZero_uid247_z_uid57_atanX_uid8_fpArctanPiTest_q <= not InvExpXIsZero_uid247_z_uid57_atanX_uid8_fpArctanPiTest_a;

	--exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest(LOGICAL,247)@0
    exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_a <= InvExpXIsZero_uid247_z_uid57_atanX_uid8_fpArctanPiTest_q;
    exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_b <= InvExc_I_uid246_z_uid57_atanX_uid8_fpArctanPiTest_q;
    exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_c <= InvExc_N_uid118_atanX_uid8_fpArctanPiTest_q;
    exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_q <= exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_a and exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_b and exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_c;

	--xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest(LOGICAL,264)@0
    xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_a <= exc_R_uid248_z_uid57_atanX_uid8_fpArctanPiTest_q;
    xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_b <= udf_uid259_z_uid57_atanX_uid8_fpArctanPiTest_b;
    xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_q <= xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_a and xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_b;

	--xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest(LOGICAL,265)@0
    xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_a <= exc_I_uid36_atanX_uid8_fpArctanPiTest_q;
    xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_b <= xRegAndUdf_uid265_z_uid57_atanX_uid8_fpArctanPiTest_q;
    xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_q <= xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_a or xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_b;

	--excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest(BITJOIN,266)@0
    excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_q <= exc_N_uid38_atanX_uid8_fpArctanPiTest_q & expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q & xIOrXRUdf_uid266_z_uid57_atanX_uid8_fpArctanPiTest_q;

	--reg_excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0(REG,378)@0
    reg_excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_q <= excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest(LOOKUP,267)@1
    outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest: PROCESS (reg_excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid267_z_uid57_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest(MUX,269)@1
    expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_s <= outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q;
    expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_s IS
                      WHEN "00" => expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q <= cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q;
                      WHEN "01" => expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q <= expRCalc_uid264_z_uid57_atanX_uid8_fpArctanPiTest_q;
                      WHEN "10" => expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
                      WHEN "11" => expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
                      WHEN OTHERS => expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_inputreg(DELAY,1012)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q, xout => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt(COUNTER,1014)
    -- every=1, low=0, high=7, step=1, init=1
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_i <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_i,3));


	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdreg(REG,1015)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdreg_q <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux(MUX,1016)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_s <= en;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux: PROCESS (ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_s, ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdreg_q, ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_s IS
                  WHEN "0" => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_q <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdreg_q;
                  WHEN "1" => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_q <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem(DUALMEM,1013)
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_ia <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_inputreg_q;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_aa <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdreg_q;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_ab <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_rdmux_q;
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_iq,
        address_a => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_aa,
        data_a => ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_ia
    );
    ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_reset0 <= areset;
        ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_q <= ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_iq(7 downto 0);

	--cstNaNWF_uid20_atanX_uid8_fpArctanPiTest(CONSTANT,19)
    cstNaNWF_uid20_atanX_uid8_fpArctanPiTest_q <= "00000000000000000000001";

	--oFracX_uid249_uid249_z_uid57_atanX_uid8_fpArctanPiTest(BITJOIN,248)@0
    oFracX_uid249_uid249_z_uid57_atanX_uid8_fpArctanPiTest_q <= VCC_q & fracX_uid16_atanX_uid8_fpArctanPiTest_b;

	--y_uid251_z_uid57_atanX_uid8_fpArctanPiTest(BITSELECT,250)@0
    y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_in <= oFracX_uid249_uid249_z_uid57_atanX_uid8_fpArctanPiTest_q(22 downto 0);
    y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b <= y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_in(22 downto 0);

	--yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest(BITSELECT,252)@0
    yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_in <= y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b;
    yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_b <= yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_in(22 downto 15);

	--reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid346_invTabGen_lutmem_0(REG,379)@0
    reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid346_invTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid346_invTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid346_invTabGen_lutmem_0_q <= yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid346_invTabGen_lutmem(DUALMEM,376)@1
    memoryC2_uid346_invTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid346_invTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid346_invTabGen_lutmem_ab <= reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid346_invTabGen_lutmem_0_q;
    memoryC2_uid346_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atanpi_s5_memoryC2_uid346_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid346_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid346_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid346_invTabGen_lutmem_iq,
        address_a => memoryC2_uid346_invTabGen_lutmem_aa,
        data_a => memoryC2_uid346_invTabGen_lutmem_ia
    );
    memoryC2_uid346_invTabGen_lutmem_reset0 <= areset;
        memoryC2_uid346_invTabGen_lutmem_q <= memoryC2_uid346_invTabGen_lutmem_iq(11 downto 0);

	--reg_memoryC2_uid346_invTabGen_lutmem_0_to_prodXY_uid366_pT1_uid348_invPolyEval_1(REG,381)@3
    reg_memoryC2_uid346_invTabGen_lutmem_0_to_prodXY_uid366_pT1_uid348_invPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid346_invTabGen_lutmem_0_to_prodXY_uid366_pT1_uid348_invPolyEval_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid346_invTabGen_lutmem_0_to_prodXY_uid366_pT1_uid348_invPolyEval_1_q <= memoryC2_uid346_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a_inputreg(DELAY,1011)
    ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b, xout => ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a(DELAY,680)@0
    ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a_inputreg_q, xout => ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest(BITSELECT,253)@3
    yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_in <= ld_y_uid251_z_uid57_atanX_uid8_fpArctanPiTest_b_to_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_a_q(14 downto 0);
    yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b <= yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_in(14 downto 0);

	--yT1_uid347_invPolyEval(BITSELECT,346)@3
    yT1_uid347_invPolyEval_in <= yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b;
    yT1_uid347_invPolyEval_b <= yT1_uid347_invPolyEval_in(14 downto 3);

	--reg_yT1_uid347_invPolyEval_0_to_prodXY_uid366_pT1_uid348_invPolyEval_0(REG,380)@3
    reg_yT1_uid347_invPolyEval_0_to_prodXY_uid366_pT1_uid348_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid347_invPolyEval_0_to_prodXY_uid366_pT1_uid348_invPolyEval_0_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid347_invPolyEval_0_to_prodXY_uid366_pT1_uid348_invPolyEval_0_q <= yT1_uid347_invPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid366_pT1_uid348_invPolyEval(MULT,365)@4
    prodXY_uid366_pT1_uid348_invPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid366_pT1_uid348_invPolyEval_a),13)) * SIGNED(prodXY_uid366_pT1_uid348_invPolyEval_b);
    prodXY_uid366_pT1_uid348_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid366_pT1_uid348_invPolyEval_a <= (others => '0');
            prodXY_uid366_pT1_uid348_invPolyEval_b <= (others => '0');
            prodXY_uid366_pT1_uid348_invPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid366_pT1_uid348_invPolyEval_a <= reg_yT1_uid347_invPolyEval_0_to_prodXY_uid366_pT1_uid348_invPolyEval_0_q;
                prodXY_uid366_pT1_uid348_invPolyEval_b <= reg_memoryC2_uid346_invTabGen_lutmem_0_to_prodXY_uid366_pT1_uid348_invPolyEval_1_q;
                prodXY_uid366_pT1_uid348_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid366_pT1_uid348_invPolyEval_pr,24));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid366_pT1_uid348_invPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid366_pT1_uid348_invPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid366_pT1_uid348_invPolyEval_q <= prodXY_uid366_pT1_uid348_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid367_pT1_uid348_invPolyEval(BITSELECT,366)@7
    prodXYTruncFR_uid367_pT1_uid348_invPolyEval_in <= prodXY_uid366_pT1_uid348_invPolyEval_q;
    prodXYTruncFR_uid367_pT1_uid348_invPolyEval_b <= prodXYTruncFR_uid367_pT1_uid348_invPolyEval_in(23 downto 11);

	--highBBits_uid350_invPolyEval(BITSELECT,349)@7
    highBBits_uid350_invPolyEval_in <= prodXYTruncFR_uid367_pT1_uid348_invPolyEval_b;
    highBBits_uid350_invPolyEval_b <= highBBits_uid350_invPolyEval_in(12 downto 1);

	--ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid345_invTabGen_lutmem_0_q_to_memoryC1_uid345_invTabGen_lutmem_a(DELAY,804)@1
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid345_invTabGen_lutmem_0_q_to_memoryC1_uid345_invTabGen_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid346_invTabGen_lutmem_0_q, xout => ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid345_invTabGen_lutmem_0_q_to_memoryC1_uid345_invTabGen_lutmem_a_q, ena => en(0), clk => clk, aclr => areset );

	--memoryC1_uid345_invTabGen_lutmem(DUALMEM,375)@4
    memoryC1_uid345_invTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid345_invTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid345_invTabGen_lutmem_ab <= ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid345_invTabGen_lutmem_0_q_to_memoryC1_uid345_invTabGen_lutmem_a_q;
    memoryC1_uid345_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atanpi_s5_memoryC1_uid345_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid345_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid345_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid345_invTabGen_lutmem_iq,
        address_a => memoryC1_uid345_invTabGen_lutmem_aa,
        data_a => memoryC1_uid345_invTabGen_lutmem_ia
    );
    memoryC1_uid345_invTabGen_lutmem_reset0 <= areset;
        memoryC1_uid345_invTabGen_lutmem_q <= memoryC1_uid345_invTabGen_lutmem_iq(19 downto 0);

	--reg_memoryC1_uid345_invTabGen_lutmem_0_to_sumAHighB_uid351_invPolyEval_0(REG,383)@6
    reg_memoryC1_uid345_invTabGen_lutmem_0_to_sumAHighB_uid351_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid345_invTabGen_lutmem_0_to_sumAHighB_uid351_invPolyEval_0_q <= "00000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid345_invTabGen_lutmem_0_to_sumAHighB_uid351_invPolyEval_0_q <= memoryC1_uid345_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid351_invPolyEval(ADD,350)@7
    sumAHighB_uid351_invPolyEval_a <= STD_LOGIC_VECTOR((20 downto 20 => reg_memoryC1_uid345_invTabGen_lutmem_0_to_sumAHighB_uid351_invPolyEval_0_q(19)) & reg_memoryC1_uid345_invTabGen_lutmem_0_to_sumAHighB_uid351_invPolyEval_0_q);
    sumAHighB_uid351_invPolyEval_b <= STD_LOGIC_VECTOR((20 downto 12 => highBBits_uid350_invPolyEval_b(11)) & highBBits_uid350_invPolyEval_b);
            sumAHighB_uid351_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid351_invPolyEval_a) + SIGNED(sumAHighB_uid351_invPolyEval_b));
    sumAHighB_uid351_invPolyEval_q <= sumAHighB_uid351_invPolyEval_o(20 downto 0);


	--lowRangeB_uid349_invPolyEval(BITSELECT,348)@7
    lowRangeB_uid349_invPolyEval_in <= prodXYTruncFR_uid367_pT1_uid348_invPolyEval_b(0 downto 0);
    lowRangeB_uid349_invPolyEval_b <= lowRangeB_uid349_invPolyEval_in(0 downto 0);

	--s1_uid349_uid352_invPolyEval(BITJOIN,351)@7
    s1_uid349_uid352_invPolyEval_q <= sumAHighB_uid351_invPolyEval_q & lowRangeB_uid349_invPolyEval_b;

	--reg_s1_uid349_uid352_invPolyEval_0_to_prodXY_uid369_pT2_uid354_invPolyEval_1(REG,385)@7
    reg_s1_uid349_uid352_invPolyEval_0_to_prodXY_uid369_pT2_uid354_invPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid349_uid352_invPolyEval_0_to_prodXY_uid369_pT2_uid354_invPolyEval_1_q <= "0000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid349_uid352_invPolyEval_0_to_prodXY_uid369_pT2_uid354_invPolyEval_1_q <= s1_uid349_uid352_invPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor(LOGICAL,1059)
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_b <= ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_q <= not (ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_a or ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_b);

	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_cmpReg(REG,966)
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_sticky_ena(REG,1060)
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_nor_q = "1") THEN
                ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_sticky_ena_q <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd(LOGICAL,1061)
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_a <= ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_sticky_ena_q;
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_b <= en;
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_q <= ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_a and ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_b;

	--ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_inputreg(DELAY,1051)
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b, xout => ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt(COUNTER,962)
    -- every=1, low=0, high=1, step=1, init=1
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_i <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_i,1));


	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg(REG,963)
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg_q <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux(MUX,964)
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_s <= en;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux: PROCESS (ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_s, ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg_q, ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_s IS
                  WHEN "0" => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_q <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg_q;
                  WHEN "1" => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_q <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem(DUALMEM,1052)
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_ia <= ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_inputreg_q;
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_aa <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg_q;
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_ab <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_q;
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_iq,
        address_a => ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_aa,
        data_a => ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_ia
    );
    ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_reset0 <= areset;
        ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_q <= ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_iq(14 downto 0);

	--reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0(REG,384)@7
    reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_q <= "000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_q <= ld_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_b_to_reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid369_pT2_uid354_invPolyEval(MULT,368)@8
    prodXY_uid369_pT2_uid354_invPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid369_pT2_uid354_invPolyEval_a),16)) * SIGNED(prodXY_uid369_pT2_uid354_invPolyEval_b);
    prodXY_uid369_pT2_uid354_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid369_pT2_uid354_invPolyEval_a <= (others => '0');
            prodXY_uid369_pT2_uid354_invPolyEval_b <= (others => '0');
            prodXY_uid369_pT2_uid354_invPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid369_pT2_uid354_invPolyEval_a <= reg_yPPolyEval_uid254_z_uid57_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid369_pT2_uid354_invPolyEval_0_q;
                prodXY_uid369_pT2_uid354_invPolyEval_b <= reg_s1_uid349_uid352_invPolyEval_0_to_prodXY_uid369_pT2_uid354_invPolyEval_1_q;
                prodXY_uid369_pT2_uid354_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid369_pT2_uid354_invPolyEval_pr,37));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid369_pT2_uid354_invPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid369_pT2_uid354_invPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid369_pT2_uid354_invPolyEval_q <= prodXY_uid369_pT2_uid354_invPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid370_pT2_uid354_invPolyEval(BITSELECT,369)@11
    prodXYTruncFR_uid370_pT2_uid354_invPolyEval_in <= prodXY_uid369_pT2_uid354_invPolyEval_q;
    prodXYTruncFR_uid370_pT2_uid354_invPolyEval_b <= prodXYTruncFR_uid370_pT2_uid354_invPolyEval_in(36 downto 14);

	--highBBits_uid356_invPolyEval(BITSELECT,355)@11
    highBBits_uid356_invPolyEval_in <= prodXYTruncFR_uid370_pT2_uid354_invPolyEval_b;
    highBBits_uid356_invPolyEval_b <= highBBits_uid356_invPolyEval_in(22 downto 2);

	--ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor(LOGICAL,1048)
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_b <= ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_q <= not (ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_a or ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_b);

	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_mem_top(CONSTANT,1031)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_mem_top_q <= "0100";

	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp(LOGICAL,1032)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_a <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_mem_top_q;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_q);
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_q <= "1" when ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_a = ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_b else "0";

	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmpReg(REG,1033)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmpReg_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_sticky_ena(REG,1049)
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_nor_q = "1") THEN
                ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_sticky_ena_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd(LOGICAL,1050)
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_a <= ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_sticky_ena_q;
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_b <= en;
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_q <= ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_a and ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_b;

	--ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_inputreg(DELAY,1038)
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid346_invTabGen_lutmem_0_q, xout => ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt(COUNTER,1027)
    -- every=1, low=0, high=4, step=1, init=1
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_i = 3 THEN
                      ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_i - 4;
                    ELSE
                        ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_i <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_i,3));


	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg(REG,1028)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux(MUX,1029)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_s <= en;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux: PROCESS (ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_s, ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg_q, ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem(DUALMEM,1039)
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_ia <= ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_inputreg_q;
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_aa <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg_q;
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_ab <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_q;
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_iq,
        address_a => ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_aa,
        data_a => ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_ia
    );
    ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_reset0 <= areset;
        ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_q <= ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_iq(7 downto 0);

	--memoryC0_uid344_invTabGen_lutmem(DUALMEM,374)@8
    memoryC0_uid344_invTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid344_invTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid344_invTabGen_lutmem_ab <= ld_reg_yAddr_uid253_z_uid57_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid344_invTabGen_lutmem_0_q_to_memoryC0_uid344_invTabGen_lutmem_a_replace_mem_q;
    memoryC0_uid344_invTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atanpi_s5_memoryC0_uid344_invTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid344_invTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid344_invTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid344_invTabGen_lutmem_iq,
        address_a => memoryC0_uid344_invTabGen_lutmem_aa,
        data_a => memoryC0_uid344_invTabGen_lutmem_ia
    );
    memoryC0_uid344_invTabGen_lutmem_reset0 <= areset;
        memoryC0_uid344_invTabGen_lutmem_q <= memoryC0_uid344_invTabGen_lutmem_iq(28 downto 0);

	--reg_memoryC0_uid344_invTabGen_lutmem_0_to_sumAHighB_uid357_invPolyEval_0(REG,387)@10
    reg_memoryC0_uid344_invTabGen_lutmem_0_to_sumAHighB_uid357_invPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid344_invTabGen_lutmem_0_to_sumAHighB_uid357_invPolyEval_0_q <= "00000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid344_invTabGen_lutmem_0_to_sumAHighB_uid357_invPolyEval_0_q <= memoryC0_uid344_invTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid357_invPolyEval(ADD,356)@11
    sumAHighB_uid357_invPolyEval_a <= STD_LOGIC_VECTOR((29 downto 29 => reg_memoryC0_uid344_invTabGen_lutmem_0_to_sumAHighB_uid357_invPolyEval_0_q(28)) & reg_memoryC0_uid344_invTabGen_lutmem_0_to_sumAHighB_uid357_invPolyEval_0_q);
    sumAHighB_uid357_invPolyEval_b <= STD_LOGIC_VECTOR((29 downto 21 => highBBits_uid356_invPolyEval_b(20)) & highBBits_uid356_invPolyEval_b);
            sumAHighB_uid357_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid357_invPolyEval_a) + SIGNED(sumAHighB_uid357_invPolyEval_b));
    sumAHighB_uid357_invPolyEval_q <= sumAHighB_uid357_invPolyEval_o(29 downto 0);


	--lowRangeB_uid355_invPolyEval(BITSELECT,354)@11
    lowRangeB_uid355_invPolyEval_in <= prodXYTruncFR_uid370_pT2_uid354_invPolyEval_b(1 downto 0);
    lowRangeB_uid355_invPolyEval_b <= lowRangeB_uid355_invPolyEval_in(1 downto 0);

	--s2_uid355_uid358_invPolyEval(BITJOIN,357)@11
    s2_uid355_uid358_invPolyEval_q <= sumAHighB_uid357_invPolyEval_q & lowRangeB_uid355_invPolyEval_b;

	--fxpInverseRes_uid256_z_uid57_atanX_uid8_fpArctanPiTest(BITSELECT,255)@11
    fxpInverseRes_uid256_z_uid57_atanX_uid8_fpArctanPiTest_in <= s2_uid355_uid358_invPolyEval_q(28 downto 0);
    fxpInverseRes_uid256_z_uid57_atanX_uid8_fpArctanPiTest_b <= fxpInverseRes_uid256_z_uid57_atanX_uid8_fpArctanPiTest_in(28 downto 5);

	--fxpInverseResFrac_uid262_z_uid57_atanX_uid8_fpArctanPiTest(BITSELECT,261)@11
    fxpInverseResFrac_uid262_z_uid57_atanX_uid8_fpArctanPiTest_in <= fxpInverseRes_uid256_z_uid57_atanX_uid8_fpArctanPiTest_b(22 downto 0);
    fxpInverseResFrac_uid262_z_uid57_atanX_uid8_fpArctanPiTest_b <= fxpInverseResFrac_uid262_z_uid57_atanX_uid8_fpArctanPiTest_in(22 downto 0);

	--ld_fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q_to_fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_b(DELAY,688)@0
    ld_fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q_to_fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q, xout => ld_fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q_to_fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest(MUX,262)@11
    fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_s <= ld_fracXIsZero_uid250_z_uid57_atanX_uid8_fpArctanPiTest_q_to_fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_b_q;
    fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_s IS
                      WHEN "0" => fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_q <= fxpInverseResFrac_uid262_z_uid57_atanX_uid8_fpArctanPiTest_b;
                      WHEN "1" => fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_q <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
                      WHEN OTHERS => fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1(REG,388)@1
    reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q <= outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_b(DELAY,701)@2
    ld_reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 10 )
    PORT MAP ( xin => reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q, xout => ld_reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest(MUX,268)@12
    fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_s <= ld_reg_outMuxSelEnc_uid268_z_uid57_atanX_uid8_fpArctanPiTest_0_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_1_q_to_fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_b_q;
    fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest: PROCESS (fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_s, en, cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q, fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_q, cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q, cstNaNWF_uid20_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_q <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
                  WHEN "01" => fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_q <= fracRCalc_uid263_z_uid57_atanX_uid8_fpArctanPiTest_q;
                  WHEN "10" => fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_q <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
                  WHEN "11" => fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_q <= cstNaNWF_uid20_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid273_z_uid57_atanX_uid8_fpArctanPiTest(BITJOIN,272)@12
    R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_q <= ld_reg_signR_uid119_atanX_uid8_fpArctanPiTest_0_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_2_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_c_q & ld_expRPostExc_uid270_z_uid57_atanX_uid8_fpArctanPiTest_q_to_R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_b_replace_mem_q & fracRPostExc_uid269_z_uid57_atanX_uid8_fpArctanPiTest_q;

	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor(LOGICAL,905)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_b <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_q <= not (ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_a or ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_b);

	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_mem_top(CONSTANT,901)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_mem_top_q <= "01001";

	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp(LOGICAL,902)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_a <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_mem_top_q;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q);
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_q <= "1" when ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_a = ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_b else "0";

	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmpReg(REG,903)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmpReg_q <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_sticky_ena(REG,906)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_nor_q = "1") THEN
                ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd(LOGICAL,907)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_a <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_b <= en;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_q <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_a and ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_b;

	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_inputreg(DELAY,895)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => a, xout => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt(COUNTER,897)
    -- every=1, low=0, high=9, step=1, init=1
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i = 8 THEN
                      ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_eq = '1') THEN
                        ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i - 9;
                    ELSE
                        ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_i,4));


	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdreg(REG,898)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux(MUX,899)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s <= en;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux: PROCESS (ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s, ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q, ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q)
    BEGIN
            CASE ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_s IS
                  WHEN "0" => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
                  WHEN "1" => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdcnt_q;
                  WHEN OTHERS => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem(DUALMEM,896)
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_ia <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_inputreg_q;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_aa <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_ab <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q;
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 10,
        width_b => 32,
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
        clocken1 => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_iq,
        address_a => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_aa,
        data_a => ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_ia
    );
    ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 <= areset;
        ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_q <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_iq(31 downto 0);

	--path2_uid56_atanX_uid8_fpArctanPiTest(COMPARE,55)@0
    path2_uid56_atanX_uid8_fpArctanPiTest_cin <= GND_q;
    path2_uid56_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("00" & expX_uid15_atanX_uid8_fpArctanPiTest_b) & '0';
    path2_uid56_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("00" & cstBias_uid22_atanX_uid8_fpArctanPiTest_q) & path2_uid56_atanX_uid8_fpArctanPiTest_cin(0);
            path2_uid56_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2_uid56_atanX_uid8_fpArctanPiTest_a) - UNSIGNED(path2_uid56_atanX_uid8_fpArctanPiTest_b));
    path2_uid56_atanX_uid8_fpArctanPiTest_n(0) <= not path2_uid56_atanX_uid8_fpArctanPiTest_o(10);


	--reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1(REG,390)@0
    reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q <= path2_uid56_atanX_uid8_fpArctanPiTest_n;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q_to_u_uid58_atanX_uid8_fpArctanPiTest_b(DELAY,466)@1
    ld_reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q_to_u_uid58_atanX_uid8_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 11 )
    PORT MAP ( xin => reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q, xout => ld_reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q_to_u_uid58_atanX_uid8_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--u_uid58_atanX_uid8_fpArctanPiTest(MUX,57)@12
    u_uid58_atanX_uid8_fpArctanPiTest_s <= ld_reg_path2_uid56_atanX_uid8_fpArctanPiTest_2_to_u_uid58_atanX_uid8_fpArctanPiTest_1_q_to_u_uid58_atanX_uid8_fpArctanPiTest_b_q;
    u_uid58_atanX_uid8_fpArctanPiTest: PROCESS (u_uid58_atanX_uid8_fpArctanPiTest_s, en, ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_q, R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE u_uid58_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "0" => u_uid58_atanX_uid8_fpArctanPiTest_q <= ld_xIn_a_to_u_uid58_atanX_uid8_fpArctanPiTest_c_replace_mem_q;
                  WHEN "1" => u_uid58_atanX_uid8_fpArctanPiTest_q <= R_uid273_z_uid57_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => u_uid58_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracU_uid60_atanX_uid8_fpArctanPiTest(BITSELECT,59)@12
    fracU_uid60_atanX_uid8_fpArctanPiTest_in <= u_uid58_atanX_uid8_fpArctanPiTest_q(22 downto 0);
    fracU_uid60_atanX_uid8_fpArctanPiTest_b <= fracU_uid60_atanX_uid8_fpArctanPiTest_in(22 downto 0);

	--ld_fracU_uid60_atanX_uid8_fpArctanPiTest_b_to_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_a(DELAY,471)@12
    ld_fracU_uid60_atanX_uid8_fpArctanPiTest_b_to_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracU_uid60_atanX_uid8_fpArctanPiTest_b, xout => ld_fracU_uid60_atanX_uid8_fpArctanPiTest_b_to_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest(BITJOIN,60)@13
    oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_q <= VCC_q & ld_fracU_uid60_atanX_uid8_fpArctanPiTest_b_to_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_a_q;

	--oFracUExt_uid70_atanX_uid8_fpArctanPiTest(BITJOIN,69)@13
    oFracUExt_uid70_atanX_uid8_fpArctanPiTest_q <= cst01pWShift_uid69_atanX_uid8_fpArctanPiTest_q & oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_q;

	--X24dto0_uid283_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITSELECT,282)@13
    X24dto0_uid283_fxpU_uid72_atanX_uid8_fpArctanPiTest_in <= oFracUExt_uid70_atanX_uid8_fpArctanPiTest_q(24 downto 0);
    X24dto0_uid283_fxpU_uid72_atanX_uid8_fpArctanPiTest_b <= X24dto0_uid283_fxpU_uid72_atanX_uid8_fpArctanPiTest_in(24 downto 0);

	--leftShiftStage0Idx3Pad12_uid282_fxpU_uid72_atanX_uid8_fpArctanPiTest(CONSTANT,281)
    leftShiftStage0Idx3Pad12_uid282_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= "000000000000";

	--leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITJOIN,283)@13
    leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= X24dto0_uid283_fxpU_uid72_atanX_uid8_fpArctanPiTest_b & leftShiftStage0Idx3Pad12_uid282_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;

	--reg_leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_5(REG,399)@13
    reg_leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_5_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_5_q <= leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X28dto0_uid280_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITSELECT,279)@13
    X28dto0_uid280_fxpU_uid72_atanX_uid8_fpArctanPiTest_in <= oFracUExt_uid70_atanX_uid8_fpArctanPiTest_q(28 downto 0);
    X28dto0_uid280_fxpU_uid72_atanX_uid8_fpArctanPiTest_b <= X28dto0_uid280_fxpU_uid72_atanX_uid8_fpArctanPiTest_in(28 downto 0);

	--leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITJOIN,280)@13
    leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= X28dto0_uid280_fxpU_uid72_atanX_uid8_fpArctanPiTest_b & cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q;

	--reg_leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_4(REG,398)@13
    reg_leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_4_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_4_q <= leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--X32dto0_uid277_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITSELECT,276)@13
    X32dto0_uid277_fxpU_uid72_atanX_uid8_fpArctanPiTest_in <= oFracUExt_uid70_atanX_uid8_fpArctanPiTest_q(32 downto 0);
    X32dto0_uid277_fxpU_uid72_atanX_uid8_fpArctanPiTest_b <= X32dto0_uid277_fxpU_uid72_atanX_uid8_fpArctanPiTest_in(32 downto 0);

	--leftShiftStage0Idx1Pad4_uid276_fxpU_uid72_atanX_uid8_fpArctanPiTest(CONSTANT,275)
    leftShiftStage0Idx1Pad4_uid276_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= "0000";

	--leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITJOIN,277)@13
    leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= X32dto0_uid277_fxpU_uid72_atanX_uid8_fpArctanPiTest_b & leftShiftStage0Idx1Pad4_uid276_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;

	--reg_leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_3(REG,397)@13
    reg_leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_3_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_3_q <= leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_oFracUExt_uid70_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_2(REG,396)@13
    reg_oFracUExt_uid70_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracUExt_uid70_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracUExt_uid70_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q <= oFracUExt_uid70_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--zS_uid67_atanX_uid8_fpArctanPiTest(CONSTANT,66)
    zS_uid67_atanX_uid8_fpArctanPiTest_q <= "000000000";

	--shiftBias_uid64_atanX_uid8_fpArctanPiTest(CONSTANT,63)
    shiftBias_uid64_atanX_uid8_fpArctanPiTest_q <= "01110010";

	--expU_uid59_atanX_uid8_fpArctanPiTest(BITSELECT,58)@12
    expU_uid59_atanX_uid8_fpArctanPiTest_in <= u_uid58_atanX_uid8_fpArctanPiTest_q(30 downto 0);
    expU_uid59_atanX_uid8_fpArctanPiTest_b <= expU_uid59_atanX_uid8_fpArctanPiTest_in(30 downto 23);

	--reg_expU_uid59_atanX_uid8_fpArctanPiTest_0_to_atanUIsU_uid63_atanX_uid8_fpArctanPiTest_1(REG,391)@12
    reg_expU_uid59_atanX_uid8_fpArctanPiTest_0_to_atanUIsU_uid63_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expU_uid59_atanX_uid8_fpArctanPiTest_0_to_atanUIsU_uid63_atanX_uid8_fpArctanPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expU_uid59_atanX_uid8_fpArctanPiTest_0_to_atanUIsU_uid63_atanX_uid8_fpArctanPiTest_1_q <= expU_uid59_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--shiftValue_uid65_atanX_uid8_fpArctanPiTest(SUB,64)@13
    shiftValue_uid65_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expU_uid59_atanX_uid8_fpArctanPiTest_0_to_atanUIsU_uid63_atanX_uid8_fpArctanPiTest_1_q);
    shiftValue_uid65_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid64_atanX_uid8_fpArctanPiTest_q);
            shiftValue_uid65_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid65_atanX_uid8_fpArctanPiTest_a) - UNSIGNED(shiftValue_uid65_atanX_uid8_fpArctanPiTest_b));
    shiftValue_uid65_atanX_uid8_fpArctanPiTest_q <= shiftValue_uid65_atanX_uid8_fpArctanPiTest_o(8 downto 0);


	--ShiftValue8_uid66_atanX_uid8_fpArctanPiTest(BITSELECT,65)@13
    ShiftValue8_uid66_atanX_uid8_fpArctanPiTest_in <= shiftValue_uid65_atanX_uid8_fpArctanPiTest_q;
    ShiftValue8_uid66_atanX_uid8_fpArctanPiTest_b <= ShiftValue8_uid66_atanX_uid8_fpArctanPiTest_in(8 downto 8);

	--shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest(MUX,67)@13
    shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_s <= ShiftValue8_uid66_atanX_uid8_fpArctanPiTest_b;
    shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest: PROCESS (shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_s, en, shiftValue_uid65_atanX_uid8_fpArctanPiTest_q, zS_uid67_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "0" => shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_q <= shiftValue_uid65_atanX_uid8_fpArctanPiTest_q;
                  WHEN "1" => shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_q <= zS_uid67_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fxpShifterBits_uid71_atanX_uid8_fpArctanPiTest(BITSELECT,70)@13
    fxpShifterBits_uid71_atanX_uid8_fpArctanPiTest_in <= shiftValuePostNeg_uid68_atanX_uid8_fpArctanPiTest_q(3 downto 0);
    fxpShifterBits_uid71_atanX_uid8_fpArctanPiTest_b <= fxpShifterBits_uid71_atanX_uid8_fpArctanPiTest_in(3 downto 0);

	--leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITSELECT,284)@13
    leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_in <= fxpShifterBits_uid71_atanX_uid8_fpArctanPiTest_b;
    leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_b <= leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_in(3 downto 2);

	--reg_leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_1(REG,395)@13
    reg_leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_q <= leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest(MUX,285)@14
    leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_s <= reg_leftShiftStageSel3Dto2_uid285_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_q;
    leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest: PROCESS (leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_s, en, reg_oFracUExt_uid70_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q, reg_leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_3_q, reg_leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_4_q, reg_leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_5_q)
    BEGIN
            CASE leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= reg_oFracUExt_uid70_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q;
                  WHEN "01" => leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= reg_leftShiftStage0Idx1_uid278_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_3_q;
                  WHEN "10" => leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= reg_leftShiftStage0Idx2_uid281_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_4_q;
                  WHEN "11" => leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= reg_leftShiftStage0Idx3_uid284_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_5_q;
                  WHEN OTHERS => leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITSELECT,293)@14
    LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_in <= leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q(33 downto 0);
    LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_b <= LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_in(33 downto 0);

	--ld_LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_b(DELAY,725)@14
    ld_LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_b, xout => ld_LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx3Pad3_uid293_fxpU_uid72_atanX_uid8_fpArctanPiTest(CONSTANT,292)
    leftShiftStage1Idx3Pad3_uid293_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= "000";

	--leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITJOIN,294)@15
    leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= ld_LeftShiftStage033dto0_uid294_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q & leftShiftStage1Idx3Pad3_uid293_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;

	--LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITSELECT,290)@14
    LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_in <= leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q(34 downto 0);
    LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_b <= LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_in(34 downto 0);

	--ld_LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_b(DELAY,723)@14
    ld_LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_b, xout => ld_LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx2Pad2_uid290_fxpU_uid72_atanX_uid8_fpArctanPiTest(CONSTANT,289)
    leftShiftStage1Idx2Pad2_uid290_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= "00";

	--leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITJOIN,291)@15
    leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= ld_LeftShiftStage034dto0_uid291_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q & leftShiftStage1Idx2Pad2_uid290_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;

	--LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITSELECT,287)@14
    LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_in <= leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q(35 downto 0);
    LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_b <= LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_in(35 downto 0);

	--ld_LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_b(DELAY,721)@14
    ld_LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 36, depth => 1 )
    PORT MAP ( xin => LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_b, xout => ld_LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITJOIN,288)@15
    leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= ld_LeftShiftStage035dto0_uid288_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_q & GND_q;

	--reg_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_2(REG,401)@14
    reg_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q <= "0000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q <= leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest(BITSELECT,295)@13
    leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_in <= fxpShifterBits_uid71_atanX_uid8_fpArctanPiTest_b(1 downto 0);
    leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_b <= leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_in(1 downto 0);

	--ld_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_a(DELAY,829)@13
    ld_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_b, xout => ld_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1(REG,400)@14
    reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_q <= ld_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_b_to_reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest(MUX,296)@15
    leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_s <= reg_leftShiftStageSel1Dto0_uid296_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_1_q;
    leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest: PROCESS (leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_s, en, reg_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q, leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_q, leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_q, leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= reg_leftShiftStage0_uid286_fxpU_uid72_atanX_uid8_fpArctanPiTest_0_to_leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_2_q;
                  WHEN "01" => leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= leftShiftStage1Idx1_uid289_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;
                  WHEN "10" => leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= leftShiftStage1Idx2_uid292_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;
                  WHEN "11" => leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= leftShiftStage1Idx3_uid295_fxpU_uid72_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--y_uid73_atanX_uid8_fpArctanPiTest(BITSELECT,72)@15
    y_uid73_atanX_uid8_fpArctanPiTest_in <= leftShiftStage1_uid297_fxpU_uid72_atanX_uid8_fpArctanPiTest_q(35 downto 0);
    y_uid73_atanX_uid8_fpArctanPiTest_b <= y_uid73_atanX_uid8_fpArctanPiTest_in(35 downto 1);

	--yAddr_uid75_atanX_uid8_fpArctanPiTest(BITSELECT,74)@15
    yAddr_uid75_atanX_uid8_fpArctanPiTest_in <= y_uid73_atanX_uid8_fpArctanPiTest_b;
    yAddr_uid75_atanX_uid8_fpArctanPiTest_b <= yAddr_uid75_atanX_uid8_fpArctanPiTest_in(34 downto 27);

	--reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid301_atanXOXTabGen_lutmem_0(REG,402)@15
    reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid301_atanXOXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid301_atanXOXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid301_atanXOXTabGen_lutmem_0_q <= yAddr_uid75_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid301_atanXOXTabGen_lutmem(DUALMEM,373)@16
    memoryC2_uid301_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid301_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid301_atanXOXTabGen_lutmem_ab <= reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC2_uid301_atanXOXTabGen_lutmem_0_q;
    memoryC2_uid301_atanXOXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atanpi_s5_memoryC2_uid301_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid301_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid301_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid301_atanXOXTabGen_lutmem_iq,
        address_a => memoryC2_uid301_atanXOXTabGen_lutmem_aa,
        data_a => memoryC2_uid301_atanXOXTabGen_lutmem_ia
    );
    memoryC2_uid301_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC2_uid301_atanXOXTabGen_lutmem_q <= memoryC2_uid301_atanXOXTabGen_lutmem_iq(12 downto 0);

	--reg_memoryC2_uid301_atanXOXTabGen_lutmem_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_1(REG,404)@18
    reg_memoryC2_uid301_atanXOXTabGen_lutmem_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid301_atanXOXTabGen_lutmem_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_1_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid301_atanXOXTabGen_lutmem_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_1_q <= memoryC2_uid301_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--yPPolyEval_uid76_atanX_uid8_fpArctanPiTest(BITSELECT,75)@15
    yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_in <= y_uid73_atanX_uid8_fpArctanPiTest_b(26 downto 0);
    yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_b <= yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_in(26 downto 9);

	--yT1_uid302_atanXOXPolyEval(BITSELECT,301)@15
    yT1_uid302_atanXOXPolyEval_in <= yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_b;
    yT1_uid302_atanXOXPolyEval_b <= yT1_uid302_atanXOXPolyEval_in(17 downto 5);

	--ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a_inputreg(DELAY,1062)
    ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 13, depth => 1 )
    PORT MAP ( xin => yT1_uid302_atanXOXPolyEval_b, xout => ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a(DELAY,832)@15
    ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a : dspba_delay
    GENERIC MAP ( width => 13, depth => 2 )
    PORT MAP ( xin => ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a_inputreg_q, xout => ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0(REG,403)@18
    reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_q <= "0000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_q <= ld_yT1_uid302_atanXOXPolyEval_b_to_reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid360_pT1_uid303_atanXOXPolyEval(MULT,359)@19
    prodXY_uid360_pT1_uid303_atanXOXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid360_pT1_uid303_atanXOXPolyEval_a),14)) * SIGNED(prodXY_uid360_pT1_uid303_atanXOXPolyEval_b);
    prodXY_uid360_pT1_uid303_atanXOXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid360_pT1_uid303_atanXOXPolyEval_a <= (others => '0');
            prodXY_uid360_pT1_uid303_atanXOXPolyEval_b <= (others => '0');
            prodXY_uid360_pT1_uid303_atanXOXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid360_pT1_uid303_atanXOXPolyEval_a <= reg_yT1_uid302_atanXOXPolyEval_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_0_q;
                prodXY_uid360_pT1_uid303_atanXOXPolyEval_b <= reg_memoryC2_uid301_atanXOXTabGen_lutmem_0_to_prodXY_uid360_pT1_uid303_atanXOXPolyEval_1_q;
                prodXY_uid360_pT1_uid303_atanXOXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid360_pT1_uid303_atanXOXPolyEval_pr,26));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid360_pT1_uid303_atanXOXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid360_pT1_uid303_atanXOXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid360_pT1_uid303_atanXOXPolyEval_q <= prodXY_uid360_pT1_uid303_atanXOXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid361_pT1_uid303_atanXOXPolyEval(BITSELECT,360)@22
    prodXYTruncFR_uid361_pT1_uid303_atanXOXPolyEval_in <= prodXY_uid360_pT1_uid303_atanXOXPolyEval_q;
    prodXYTruncFR_uid361_pT1_uid303_atanXOXPolyEval_b <= prodXYTruncFR_uid361_pT1_uid303_atanXOXPolyEval_in(25 downto 12);

	--highBBits_uid305_atanXOXPolyEval(BITSELECT,304)@22
    highBBits_uid305_atanXOXPolyEval_in <= prodXYTruncFR_uid361_pT1_uid303_atanXOXPolyEval_b;
    highBBits_uid305_atanXOXPolyEval_b <= highBBits_uid305_atanXOXPolyEval_in(13 downto 1);

	--ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_a(DELAY,834)@15
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => yAddr_uid75_atanX_uid8_fpArctanPiTest_b, xout => ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0(REG,405)@18
    reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_q <= ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid300_atanXOXTabGen_lutmem(DUALMEM,372)@19
    memoryC1_uid300_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid300_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid300_atanXOXTabGen_lutmem_ab <= reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC1_uid300_atanXOXTabGen_lutmem_0_q;
    memoryC1_uid300_atanXOXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atanpi_s5_memoryC1_uid300_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid300_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid300_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid300_atanXOXTabGen_lutmem_iq,
        address_a => memoryC1_uid300_atanXOXTabGen_lutmem_aa,
        data_a => memoryC1_uid300_atanXOXTabGen_lutmem_ia
    );
    memoryC1_uid300_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC1_uid300_atanXOXTabGen_lutmem_q <= memoryC1_uid300_atanXOXTabGen_lutmem_iq(20 downto 0);

	--reg_memoryC1_uid300_atanXOXTabGen_lutmem_0_to_sumAHighB_uid306_atanXOXPolyEval_0(REG,406)@21
    reg_memoryC1_uid300_atanXOXTabGen_lutmem_0_to_sumAHighB_uid306_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid300_atanXOXTabGen_lutmem_0_to_sumAHighB_uid306_atanXOXPolyEval_0_q <= "000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid300_atanXOXTabGen_lutmem_0_to_sumAHighB_uid306_atanXOXPolyEval_0_q <= memoryC1_uid300_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid306_atanXOXPolyEval(ADD,305)@22
    sumAHighB_uid306_atanXOXPolyEval_a <= STD_LOGIC_VECTOR((21 downto 21 => reg_memoryC1_uid300_atanXOXTabGen_lutmem_0_to_sumAHighB_uid306_atanXOXPolyEval_0_q(20)) & reg_memoryC1_uid300_atanXOXTabGen_lutmem_0_to_sumAHighB_uid306_atanXOXPolyEval_0_q);
    sumAHighB_uid306_atanXOXPolyEval_b <= STD_LOGIC_VECTOR((21 downto 13 => highBBits_uid305_atanXOXPolyEval_b(12)) & highBBits_uid305_atanXOXPolyEval_b);
            sumAHighB_uid306_atanXOXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid306_atanXOXPolyEval_a) + SIGNED(sumAHighB_uid306_atanXOXPolyEval_b));
    sumAHighB_uid306_atanXOXPolyEval_q <= sumAHighB_uid306_atanXOXPolyEval_o(21 downto 0);


	--lowRangeB_uid304_atanXOXPolyEval(BITSELECT,303)@22
    lowRangeB_uid304_atanXOXPolyEval_in <= prodXYTruncFR_uid361_pT1_uid303_atanXOXPolyEval_b(0 downto 0);
    lowRangeB_uid304_atanXOXPolyEval_b <= lowRangeB_uid304_atanXOXPolyEval_in(0 downto 0);

	--s1_uid304_uid307_atanXOXPolyEval(BITJOIN,306)@22
    s1_uid304_uid307_atanXOXPolyEval_q <= sumAHighB_uid306_atanXOXPolyEval_q & lowRangeB_uid304_atanXOXPolyEval_b;

	--reg_s1_uid304_uid307_atanXOXPolyEval_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_1(REG,408)@22
    reg_s1_uid304_uid307_atanXOXPolyEval_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_s1_uid304_uid307_atanXOXPolyEval_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_s1_uid304_uid307_atanXOXPolyEval_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_1_q <= s1_uid304_uid307_atanXOXPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor(LOGICAL,1035)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_b <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_q <= not (ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_a or ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_b);

	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_sticky_ena(REG,1036)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_nor_q = "1") THEN
                ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_sticky_ena_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd(LOGICAL,1037)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_a <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_sticky_ena_q;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_b <= en;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_a and ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_b;

	--reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0(REG,407)@15
    reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q <= yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_inputreg(DELAY,1025)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q, xout => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem(DUALMEM,1026)
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_ia <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_inputreg_q;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_aa <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg_q;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_ab <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_q;
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_iq,
        address_a => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_aa,
        data_a => ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_ia
    );
    ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_reset0 <= areset;
        ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_iq(17 downto 0);

	--prodXY_uid363_pT2_uid309_atanXOXPolyEval(MULT,362)@23
    prodXY_uid363_pT2_uid309_atanXOXPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid363_pT2_uid309_atanXOXPolyEval_a),19)) * SIGNED(prodXY_uid363_pT2_uid309_atanXOXPolyEval_b);
    prodXY_uid363_pT2_uid309_atanXOXPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid363_pT2_uid309_atanXOXPolyEval_a <= (others => '0');
            prodXY_uid363_pT2_uid309_atanXOXPolyEval_b <= (others => '0');
            prodXY_uid363_pT2_uid309_atanXOXPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid363_pT2_uid309_atanXOXPolyEval_a <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_mem_q;
                prodXY_uid363_pT2_uid309_atanXOXPolyEval_b <= reg_s1_uid304_uid307_atanXOXPolyEval_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_1_q;
                prodXY_uid363_pT2_uid309_atanXOXPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid363_pT2_uid309_atanXOXPolyEval_pr,41));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid363_pT2_uid309_atanXOXPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid363_pT2_uid309_atanXOXPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid363_pT2_uid309_atanXOXPolyEval_q <= prodXY_uid363_pT2_uid309_atanXOXPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid364_pT2_uid309_atanXOXPolyEval(BITSELECT,363)@26
    prodXYTruncFR_uid364_pT2_uid309_atanXOXPolyEval_in <= prodXY_uid363_pT2_uid309_atanXOXPolyEval_q;
    prodXYTruncFR_uid364_pT2_uid309_atanXOXPolyEval_b <= prodXYTruncFR_uid364_pT2_uid309_atanXOXPolyEval_in(40 downto 17);

	--highBBits_uid311_atanXOXPolyEval(BITSELECT,310)@26
    highBBits_uid311_atanXOXPolyEval_in <= prodXYTruncFR_uid364_pT2_uid309_atanXOXPolyEval_b;
    highBBits_uid311_atanXOXPolyEval_b <= highBBits_uid311_atanXOXPolyEval_in(23 downto 2);

	--ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor(LOGICAL,1073)
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_b <= ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_sticky_ena_q;
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_q <= not (ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_a or ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_b);

	--ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_sticky_ena(REG,1074)
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_nor_q = "1") THEN
                ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_sticky_ena_q <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd(LOGICAL,1075)
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_a <= ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_sticky_ena_q;
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_b <= en;
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_q <= ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_a and ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_b;

	--ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_inputreg(DELAY,1063)
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => yAddr_uid75_atanX_uid8_fpArctanPiTest_b, xout => ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem(DUALMEM,1064)
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_ia <= ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_inputreg_q;
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_aa <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdreg_q;
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_ab <= ld_reg_yPPolyEval_uid76_atanX_uid8_fpArctanPiTest_0_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_0_q_to_prodXY_uid363_pT2_uid309_atanXOXPolyEval_a_replace_rdmux_q;
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_iq,
        address_a => ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_aa,
        data_a => ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_ia
    );
    ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_reset0 <= areset;
        ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_q <= ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_iq(7 downto 0);

	--reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0(REG,409)@22
    reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_q <= ld_yAddr_uid75_atanX_uid8_fpArctanPiTest_b_to_reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid299_atanXOXTabGen_lutmem(DUALMEM,371)@23
    memoryC0_uid299_atanXOXTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid299_atanXOXTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid299_atanXOXTabGen_lutmem_ab <= reg_yAddr_uid75_atanX_uid8_fpArctanPiTest_0_to_memoryC0_uid299_atanXOXTabGen_lutmem_0_q;
    memoryC0_uid299_atanXOXTabGen_lutmem_dmem : altsyncram
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
        init_file => "fp_atanpi_s5_memoryC0_uid299_atanXOXTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid299_atanXOXTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid299_atanXOXTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid299_atanXOXTabGen_lutmem_iq,
        address_a => memoryC0_uid299_atanXOXTabGen_lutmem_aa,
        data_a => memoryC0_uid299_atanXOXTabGen_lutmem_ia
    );
    memoryC0_uid299_atanXOXTabGen_lutmem_reset0 <= areset;
        memoryC0_uid299_atanXOXTabGen_lutmem_q <= memoryC0_uid299_atanXOXTabGen_lutmem_iq(30 downto 0);

	--reg_memoryC0_uid299_atanXOXTabGen_lutmem_0_to_sumAHighB_uid312_atanXOXPolyEval_0(REG,410)@25
    reg_memoryC0_uid299_atanXOXTabGen_lutmem_0_to_sumAHighB_uid312_atanXOXPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid299_atanXOXTabGen_lutmem_0_to_sumAHighB_uid312_atanXOXPolyEval_0_q <= "0000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid299_atanXOXTabGen_lutmem_0_to_sumAHighB_uid312_atanXOXPolyEval_0_q <= memoryC0_uid299_atanXOXTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid312_atanXOXPolyEval(ADD,311)@26
    sumAHighB_uid312_atanXOXPolyEval_a <= STD_LOGIC_VECTOR((31 downto 31 => reg_memoryC0_uid299_atanXOXTabGen_lutmem_0_to_sumAHighB_uid312_atanXOXPolyEval_0_q(30)) & reg_memoryC0_uid299_atanXOXTabGen_lutmem_0_to_sumAHighB_uid312_atanXOXPolyEval_0_q);
    sumAHighB_uid312_atanXOXPolyEval_b <= STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid311_atanXOXPolyEval_b(21)) & highBBits_uid311_atanXOXPolyEval_b);
            sumAHighB_uid312_atanXOXPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid312_atanXOXPolyEval_a) + SIGNED(sumAHighB_uid312_atanXOXPolyEval_b));
    sumAHighB_uid312_atanXOXPolyEval_q <= sumAHighB_uid312_atanXOXPolyEval_o(31 downto 0);


	--lowRangeB_uid310_atanXOXPolyEval(BITSELECT,309)@26
    lowRangeB_uid310_atanXOXPolyEval_in <= prodXYTruncFR_uid364_pT2_uid309_atanXOXPolyEval_b(1 downto 0);
    lowRangeB_uid310_atanXOXPolyEval_b <= lowRangeB_uid310_atanXOXPolyEval_in(1 downto 0);

	--s2_uid310_uid313_atanXOXPolyEval(BITJOIN,312)@26
    s2_uid310_uid313_atanXOXPolyEval_q <= sumAHighB_uid312_atanXOXPolyEval_q & lowRangeB_uid310_atanXOXPolyEval_b;

	--fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest(BITSELECT,77)@26
    fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_in <= s2_uid310_uid313_atanXOXPolyEval_q(31 downto 0);
    fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_b <= fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_in(31 downto 5);

	--reg_fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_1(REG,412)@26
    reg_fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_1_q <= fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor(LOGICAL,918)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_b <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_sticky_ena_q;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_q <= not (ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_a or ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_b);

	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_mem_top(CONSTANT,914)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_mem_top_q <= "01010";

	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp(LOGICAL,915)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_a <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_mem_top_q;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q);
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_q <= "1" when ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_a = ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_b else "0";

	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmpReg(REG,916)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmpReg_q <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_sticky_ena(REG,919)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_nor_q = "1") THEN
                ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_sticky_ena_q <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd(LOGICAL,920)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_a <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_sticky_ena_q;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_b <= en;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_q <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_a and ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_b;

	--reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0(REG,411)@13
    reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q <= oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_inputreg(DELAY,908)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q, xout => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt(COUNTER,910)
    -- every=1, low=0, high=10, step=1, init=1
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i = 9 THEN
                      ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i - 10;
                    ELSE
                        ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i,4));


	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdreg(REG,911)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux(MUX,912)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s <= en;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux: PROCESS (ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s, ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q, ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem(DUALMEM,909)
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_ia <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_inputreg_q;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_aa <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_ab <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q;
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_iq,
        address_a => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_aa,
        data_a => ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_ia
    );
    ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0 <= areset;
        ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_q <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_iq(23 downto 0);

	--mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest(MULT,78)@27
    mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_pr <= UNSIGNED(mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a) * UNSIGNED(mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_b);
    mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a <= (others => '0');
            mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_b <= (others => '0');
            mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a <= ld_reg_oFracU_uid61_uid61_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_0_q_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_a_replace_mem_q;
                mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_b <= reg_fxpAtanXOXRes_uid78_atanX_uid8_fpArctanPiTest_0_to_mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_1_q;
                mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_s1 <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_q <= mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normBit_uid80_atanX_uid8_fpArctanPiTest(BITSELECT,79)@30
    normBit_uid80_atanX_uid8_fpArctanPiTest_in <= mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_q(49 downto 0);
    normBit_uid80_atanX_uid8_fpArctanPiTest_b <= normBit_uid80_atanX_uid8_fpArctanPiTest_in(49 downto 49);

	--InvNormBit_uid84_atanX_uid8_fpArctanPiTest(LOGICAL,83)@30
    InvNormBit_uid84_atanX_uid8_fpArctanPiTest_a <= normBit_uid80_atanX_uid8_fpArctanPiTest_b;
    InvNormBit_uid84_atanX_uid8_fpArctanPiTest_q <= not InvNormBit_uid84_atanX_uid8_fpArctanPiTest_a;

	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor(LOGICAL,931)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_b <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_sticky_ena_q;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_q <= not (ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_a or ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_b);

	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_mem_top(CONSTANT,927)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_mem_top_q <= "01111";

	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp(LOGICAL,928)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_a <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_mem_top_q;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q);
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_q <= "1" when ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_a = ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_b else "0";

	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmpReg(REG,929)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmpReg_q <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_sticky_ena(REG,932)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_nor_q = "1") THEN
                ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_sticky_ena_q <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd(LOGICAL,933)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_a <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_sticky_ena_q;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_b <= en;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_q <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_a and ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_b;

	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_inputreg(DELAY,921)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expU_uid59_atanX_uid8_fpArctanPiTest_b, xout => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt(COUNTER,923)
    -- every=1, low=0, high=15, step=1, init=1
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i,4));


	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdreg(REG,924)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux(MUX,925)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s <= en;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux: PROCESS (ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s, ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q, ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem(DUALMEM,922)
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_ia <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_inputreg_q;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_aa <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_ab <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q;
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_iq,
        address_a => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_aa,
        data_a => ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_ia
    );
    ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0 <= areset;
        ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_q <= ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_iq(7 downto 0);

	--expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest(SUB,84)@30
    expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("0" & ld_expU_uid59_atanX_uid8_fpArctanPiTest_b_to_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a_replace_mem_q);
    expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("00000000" & InvNormBit_uid84_atanX_uid8_fpArctanPiTest_q);
            expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_a) - UNSIGNED(expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_b));
    expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_q <= expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_o(8 downto 0);


	--fracRPath3High_uid81_atanX_uid8_fpArctanPiTest(BITSELECT,80)@30
    fracRPath3High_uid81_atanX_uid8_fpArctanPiTest_in <= mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_q(48 downto 0);
    fracRPath3High_uid81_atanX_uid8_fpArctanPiTest_b <= fracRPath3High_uid81_atanX_uid8_fpArctanPiTest_in(48 downto 25);

	--fracRPath3Low_uid82_atanX_uid8_fpArctanPiTest(BITSELECT,81)@30
    fracRPath3Low_uid82_atanX_uid8_fpArctanPiTest_in <= mulXAtanXOXRes_uid79_atanX_uid8_fpArctanPiTest_q(47 downto 0);
    fracRPath3Low_uid82_atanX_uid8_fpArctanPiTest_b <= fracRPath3Low_uid82_atanX_uid8_fpArctanPiTest_in(47 downto 24);

	--fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest(MUX,82)@30
    fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_s <= normBit_uid80_atanX_uid8_fpArctanPiTest_b;
    fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest: PROCESS (fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_s, en, fracRPath3Low_uid82_atanX_uid8_fpArctanPiTest_b, fracRPath3High_uid81_atanX_uid8_fpArctanPiTest_b)
    BEGIN
            CASE fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "0" => fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q <= fracRPath3Low_uid82_atanX_uid8_fpArctanPiTest_b;
                  WHEN "1" => fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q <= fracRPath3High_uid81_atanX_uid8_fpArctanPiTest_b;
                  WHEN OTHERS => fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest(BITJOIN,85)@30
    expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_q <= expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_q & fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q;

	--reg_expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_0_to_expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_0(REG,420)@30
    reg_expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_0_to_expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_0_to_expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_0_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_0_to_expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_0_q <= expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest(ADD,86)@31
    expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracPreRnd_uid86_atanX_uid8_fpArctanPiTest_0_to_expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_0_q);
    expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000" & VCC_q);
            expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_a) + UNSIGNED(expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_b));
    expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_q <= expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_o(33 downto 0);


	--expRPath3_uid89_atanX_uid8_fpArctanPiTest(BITSELECT,88)@31
    expRPath3_uid89_atanX_uid8_fpArctanPiTest_in <= expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_q(31 downto 0);
    expRPath3_uid89_atanX_uid8_fpArctanPiTest_b <= expRPath3_uid89_atanX_uid8_fpArctanPiTest_in(31 downto 24);

	--reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4(REG,427)@31
    reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q <= expRPath3_uid89_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_inputreg(DELAY,971)
    ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q, xout => ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e(DELAY,534)@32
    ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_inputreg_q, xout => ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_q, ena => en(0), clk => clk, aclr => areset );

	--RightShiftStage124dto1_uid338_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,337)@33
    RightShiftStage124dto1_uid338_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
    RightShiftStage124dto1_uid338_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= RightShiftStage124dto1_uid338_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(24 downto 1);

	--rightShiftStage2Idx1_uid340_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITJOIN,339)@33
    rightShiftStage2Idx1_uid340_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= GND_q & RightShiftStage124dto1_uid338_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b;

	--rightShiftStage1Idx3Pad6_uid334_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(CONSTANT,333)
    rightShiftStage1Idx3Pad6_uid334_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= "000000";

	--rightShiftStage0Idx3Pad24_uid323_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(CONSTANT,322)
    rightShiftStage0Idx3Pad24_uid323_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= "000000000000000000000000";

	--X24dto24_uid322_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,321)@32
    X24dto24_uid322_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_q;
    X24dto24_uid322_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= X24dto24_uid322_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(24 downto 24);

	--rightShiftStage0Idx3_uid324_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITJOIN,323)@32
    rightShiftStage0Idx3_uid324_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage0Idx3Pad24_uid323_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q & X24dto24_uid322_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b;

	--rightShiftStage0Idx2Pad16_uid320_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(CONSTANT,319)
    rightShiftStage0Idx2Pad16_uid320_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= "0000000000000000";

	--X24dto16_uid319_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,318)@32
    X24dto16_uid319_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_q;
    X24dto16_uid319_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= X24dto16_uid319_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(24 downto 16);

	--rightShiftStage0Idx2_uid321_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITJOIN,320)@32
    rightShiftStage0Idx2_uid321_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage0Idx2Pad16_uid320_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q & X24dto16_uid319_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b;

	--X24dto8_uid316_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,315)@32
    X24dto8_uid316_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_q;
    X24dto8_uid316_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= X24dto8_uid316_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(24 downto 8);

	--rightShiftStage0Idx1_uid318_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITJOIN,317)@32
    rightShiftStage0Idx1_uid318_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q & X24dto8_uid316_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b;

	--ld_fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q_to_oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_a(DELAY,504)@30
    ld_fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q_to_oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q, xout => ld_fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q_to_oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest(BITJOIN,93)@32
    oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_q <= VCC_q & ld_fracRPath3Pre_uid83_atanX_uid8_fpArctanPiTest_q_to_oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_a_q;

	--cstWFP2_uid25_atanX_uid8_fpArctanPiTest(CONSTANT,24)
    cstWFP2_uid25_atanX_uid8_fpArctanPiTest_q <= "00011001";

	--reg_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_0_to_shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_1(REG,413)@30
    reg_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_0_to_shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_0_to_shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_1_q <= "000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_0_to_shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_1_q <= expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest(SUB,89)@31
    shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR('0' & "00" & cstBias_uid22_atanX_uid8_fpArctanPiTest_q);
    shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR((10 downto 9 => reg_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_0_to_shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_1_q(8)) & reg_expRPath3Ext_uid85_atanX_uid8_fpArctanPiTest_0_to_shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_1_q);
            shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_a) - SIGNED(shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_b));
    shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_q <= shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_o(9 downto 0);


	--shiftValPath2PreSubR_uid92_atanX_uid8_fpArctanPiTest(BITSELECT,91)@31
    shiftValPath2PreSubR_uid92_atanX_uid8_fpArctanPiTest_in <= shiftValPath2PreSub_uid90_atanX_uid8_fpArctanPiTest_q(7 downto 0);
    shiftValPath2PreSubR_uid92_atanX_uid8_fpArctanPiTest_b <= shiftValPath2PreSubR_uid92_atanX_uid8_fpArctanPiTest_in(7 downto 0);

	--cstBiasMWF_uid24_atanX_uid8_fpArctanPiTest(CONSTANT,23)
    cstBiasMWF_uid24_atanX_uid8_fpArctanPiTest_q <= "01101000";

	--shiftOut_uid91_atanX_uid8_fpArctanPiTest(COMPARE,90)@13
    shiftOut_uid91_atanX_uid8_fpArctanPiTest_cin <= GND_q;
    shiftOut_uid91_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("00" & reg_expU_uid59_atanX_uid8_fpArctanPiTest_0_to_atanUIsU_uid63_atanX_uid8_fpArctanPiTest_1_q) & '0';
    shiftOut_uid91_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid24_atanX_uid8_fpArctanPiTest_q) & shiftOut_uid91_atanX_uid8_fpArctanPiTest_cin(0);
            shiftOut_uid91_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftOut_uid91_atanX_uid8_fpArctanPiTest_a) - UNSIGNED(shiftOut_uid91_atanX_uid8_fpArctanPiTest_b));
    shiftOut_uid91_atanX_uid8_fpArctanPiTest_c(0) <= shiftOut_uid91_atanX_uid8_fpArctanPiTest_o(10);


	--ld_shiftOut_uid91_atanX_uid8_fpArctanPiTest_c_to_sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_b(DELAY,502)@13
    ld_shiftOut_uid91_atanX_uid8_fpArctanPiTest_c_to_sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => shiftOut_uid91_atanX_uid8_fpArctanPiTest_c, xout => ld_shiftOut_uid91_atanX_uid8_fpArctanPiTest_c_to_sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--sValPostSOut_uid93_atanX_uid8_fpArctanPiTest(MUX,92)@31
    sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_s <= ld_shiftOut_uid91_atanX_uid8_fpArctanPiTest_c_to_sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_b_q;
    sValPostSOut_uid93_atanX_uid8_fpArctanPiTest: PROCESS (sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_s, en, shiftValPath2PreSubR_uid92_atanX_uid8_fpArctanPiTest_b, cstWFP2_uid25_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "0" => sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_q <= shiftValPath2PreSubR_uid92_atanX_uid8_fpArctanPiTest_b;
                  WHEN "1" => sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_q <= cstWFP2_uid25_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest(BITSELECT,94)@31
    sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest_in <= sValPostSOut_uid93_atanX_uid8_fpArctanPiTest_q(4 downto 0);
    sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest_b <= sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest_in(4 downto 0);

	--rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,324)@31
    rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest_b;
    rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(4 downto 3);

	--reg_rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1(REG,414)@31
    reg_rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q <= rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(MUX,325)@32
    rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s <= reg_rightShiftStageSel4Dto3_uid325_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q;
    rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest: PROCESS (rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s, en, oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_q, rightShiftStage0Idx1_uid318_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q, rightShiftStage0Idx2_uid321_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q, rightShiftStage0Idx3_uid324_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= oFracRPath2_uid94_uid94_atanX_uid8_fpArctanPiTest_q;
                  WHEN "01" => rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage0Idx1_uid318_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
                  WHEN "10" => rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage0Idx2_uid321_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
                  WHEN "11" => rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage0Idx3_uid324_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,332)@32
    RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
    RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(24 downto 6);

	--ld_RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a(DELAY,762)@32
    ld_RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b, xout => ld_RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITJOIN,334)@33
    rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage1Idx3Pad6_uid334_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q & ld_RightShiftStage024dto6_uid333_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q;

	--RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,329)@32
    RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
    RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(24 downto 4);

	--ld_RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a(DELAY,760)@32
    ld_RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b, xout => ld_RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITJOIN,331)@33
    rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= leftShiftStage0Idx1Pad4_uid276_fxpU_uid72_atanX_uid8_fpArctanPiTest_q & ld_RightShiftStage024dto4_uid330_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q;

	--RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,326)@32
    RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
    RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(24 downto 2);

	--ld_RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a(DELAY,758)@32
    ld_RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b, xout => ld_RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITJOIN,328)@33
    rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= leftShiftStage1Idx2Pad2_uid290_fxpU_uid72_atanX_uid8_fpArctanPiTest_q & ld_RightShiftStage024dto2_uid327_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_a_q;

	--reg_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_2(REG,416)@32
    reg_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_2_q <= "0000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_2_q <= rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,335)@31
    rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest_b(2 downto 0);
    rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(2 downto 1);

	--ld_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_a(DELAY,844)@31
    ld_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_a : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b, xout => ld_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1(REG,415)@32
    reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q <= ld_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_to_reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(MUX,336)@33
    rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s <= reg_rightShiftStageSel2Dto1_uid336_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q;
    rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest: PROCESS (rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s, en, reg_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_2_q, rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q, rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q, rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= reg_rightShiftStage0_uid326_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_2_q;
                  WHEN "01" => rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage1Idx1_uid329_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
                  WHEN "10" => rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage1Idx2_uid332_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
                  WHEN "11" => rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage1Idx3_uid335_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(BITSELECT,340)@31
    rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in <= sValPostSOutR_uid95_atanX_uid8_fpArctanPiTest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b <= rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_in(0 downto 0);

	--reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1(REG,417)@31
    reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q <= rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b(DELAY,772)@32
    ld_reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q, xout => ld_reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest(MUX,341)@33
    rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s <= ld_reg_rightShiftStageSel0Dto0_uid341_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_0_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_1_q_to_rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_b_q;
    rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest: PROCESS (rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s, en, rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q, rightShiftStage2Idx1_uid340_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "0" => rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage1_uid337_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
                  WHEN "1" => rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= rightShiftStage2Idx1_uid340_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest(BITJOIN,96)@33
    pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_q <= rightShiftStage2_uid342_fxpOp2Path2_uid96_atanX_uid8_fpArctanPiTest_q & GND_q;

	--reg_pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_0_to_path2Diff_uid97_atanX_uid8_fpArctanPiTest_1(REG,418)@33
    reg_pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_0_to_path2Diff_uid97_atanX_uid8_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_0_to_path2Diff_uid97_atanX_uid8_fpArctanPiTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_0_to_path2Diff_uid97_atanX_uid8_fpArctanPiTest_1_q <= pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--path2Diff_uid97_atanX_uid8_fpArctanPiTest(SUB,97)@34
    path2Diff_uid97_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("0" & piO2_uid46_atanX_uid8_fpArctanPiTest_q);
    path2Diff_uid97_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("0" & reg_pad_fxpOp2Path2_uid96_uid97_atanX_uid8_fpArctanPiTest_0_to_path2Diff_uid97_atanX_uid8_fpArctanPiTest_1_q);
            path2Diff_uid97_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid97_atanX_uid8_fpArctanPiTest_a) - UNSIGNED(path2Diff_uid97_atanX_uid8_fpArctanPiTest_b));
    path2Diff_uid97_atanX_uid8_fpArctanPiTest_q <= path2Diff_uid97_atanX_uid8_fpArctanPiTest_o(26 downto 0);


	--normBitPath2Diff_uid99_atanX_uid8_fpArctanPiTest(BITSELECT,98)@34
    normBitPath2Diff_uid99_atanX_uid8_fpArctanPiTest_in <= path2Diff_uid97_atanX_uid8_fpArctanPiTest_q(25 downto 0);
    normBitPath2Diff_uid99_atanX_uid8_fpArctanPiTest_b <= normBitPath2Diff_uid99_atanX_uid8_fpArctanPiTest_in(25 downto 25);

	--expRPath2_uid103_atanX_uid8_fpArctanPiTest(MUX,102)@34
    expRPath2_uid103_atanX_uid8_fpArctanPiTest_s <= normBitPath2Diff_uid99_atanX_uid8_fpArctanPiTest_b;
    expRPath2_uid103_atanX_uid8_fpArctanPiTest: PROCESS (expRPath2_uid103_atanX_uid8_fpArctanPiTest_s, en, cstBiasM1_uid23_atanX_uid8_fpArctanPiTest_q, cstBias_uid22_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE expRPath2_uid103_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "0" => expRPath2_uid103_atanX_uid8_fpArctanPiTest_q <= cstBiasM1_uid23_atanX_uid8_fpArctanPiTest_q;
                  WHEN "1" => expRPath2_uid103_atanX_uid8_fpArctanPiTest_q <= cstBias_uid22_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => expRPath2_uid103_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--path2DiffHigh_uid100_atanX_uid8_fpArctanPiTest(BITSELECT,99)@34
    path2DiffHigh_uid100_atanX_uid8_fpArctanPiTest_in <= path2Diff_uid97_atanX_uid8_fpArctanPiTest_q(24 downto 0);
    path2DiffHigh_uid100_atanX_uid8_fpArctanPiTest_b <= path2DiffHigh_uid100_atanX_uid8_fpArctanPiTest_in(24 downto 1);

	--path2DiffLow_uid101_atanX_uid8_fpArctanPiTest(BITSELECT,100)@34
    path2DiffLow_uid101_atanX_uid8_fpArctanPiTest_in <= path2Diff_uid97_atanX_uid8_fpArctanPiTest_q(23 downto 0);
    path2DiffLow_uid101_atanX_uid8_fpArctanPiTest_b <= path2DiffLow_uid101_atanX_uid8_fpArctanPiTest_in(23 downto 0);

	--fracRPath2_uid102_atanX_uid8_fpArctanPiTest(MUX,101)@34
    fracRPath2_uid102_atanX_uid8_fpArctanPiTest_s <= normBitPath2Diff_uid99_atanX_uid8_fpArctanPiTest_b;
    fracRPath2_uid102_atanX_uid8_fpArctanPiTest: PROCESS (fracRPath2_uid102_atanX_uid8_fpArctanPiTest_s, en, path2DiffLow_uid101_atanX_uid8_fpArctanPiTest_b, path2DiffHigh_uid100_atanX_uid8_fpArctanPiTest_b)
    BEGIN
            CASE fracRPath2_uid102_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "0" => fracRPath2_uid102_atanX_uid8_fpArctanPiTest_q <= path2DiffLow_uid101_atanX_uid8_fpArctanPiTest_b;
                  WHEN "1" => fracRPath2_uid102_atanX_uid8_fpArctanPiTest_q <= path2DiffHigh_uid100_atanX_uid8_fpArctanPiTest_b;
                  WHEN OTHERS => fracRPath2_uid102_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest(BITJOIN,103)@34
    expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_q <= expRPath2_uid103_atanX_uid8_fpArctanPiTest_q & fracRPath2_uid102_atanX_uid8_fpArctanPiTest_q;

	--reg_expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_0_to_expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_0(REG,419)@34
    reg_expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_0_to_expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_0_to_expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_0_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_0_to_expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_0_q <= expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest(ADD,104)@35
    expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid104_uid104_atanX_uid8_fpArctanPiTest_0_to_expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_0_q);
    expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & VCC_q);
            expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_a) + UNSIGNED(expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_b));
    expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_q <= expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_o(32 downto 0);


	--expRPath2_uid107_atanX_uid8_fpArctanPiTest(BITSELECT,106)@35
    expRPath2_uid107_atanX_uid8_fpArctanPiTest_in <= expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_q(31 downto 0);
    expRPath2_uid107_atanX_uid8_fpArctanPiTest_b <= expRPath2_uid107_atanX_uid8_fpArctanPiTest_in(31 downto 24);

	--reg_expRPath2_uid107_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_3(REG,426)@35
    reg_expRPath2_uid107_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPath2_uid107_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPath2_uid107_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_3_q <= expRPath2_uid107_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor(LOGICAL,1086)
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_b <= ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_sticky_ena_q;
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_q <= not (ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_a or ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_b);

	--ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_sticky_ena(REG,1087)
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_nor_q = "1") THEN
                ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_sticky_ena_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd(LOGICAL,1088)
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_a <= ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_sticky_ena_q;
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_b <= en;
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_q <= ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_a and ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_b;

	--ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_inputreg(DELAY,1076)
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_inputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid15_atanX_uid8_fpArctanPiTest_b, xout => ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem(DUALMEM,1077)
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_ia <= ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_inputreg_q;
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_aa <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_ab <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q;
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_iq,
        address_a => ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_aa,
        data_a => ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_ia
    );
    ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_reset0 <= areset;
        ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_q <= ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_iq(7 downto 0);

	--reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2(REG,425)@35
    reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_q <= ld_expX_uid15_atanX_uid8_fpArctanPiTest_b_to_reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor(LOGICAL,944)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_b <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_sticky_ena_q;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_q <= not (ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_a or ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_b);

	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_mem_top(CONSTANT,940)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_mem_top_q <= "010010";

	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp(LOGICAL,941)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_a <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_mem_top_q;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q);
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_q <= "1" when ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_a = ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_b else "0";

	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmpReg(REG,942)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmpReg_q <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_sticky_ena(REG,945)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_nor_q = "1") THEN
                ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_sticky_ena_q <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd(LOGICAL,946)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_a <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_sticky_ena_q;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_b <= en;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_q <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_a and ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_b;

	--expXIsBias_uid44_atanX_uid8_fpArctanPiTest(LOGICAL,43)@0
    expXIsBias_uid44_atanX_uid8_fpArctanPiTest_a <= expX_uid15_atanX_uid8_fpArctanPiTest_b;
    expXIsBias_uid44_atanX_uid8_fpArctanPiTest_b <= cstBias_uid22_atanX_uid8_fpArctanPiTest_q;
    expXIsBias_uid44_atanX_uid8_fpArctanPiTest_q <= "1" when expXIsBias_uid44_atanX_uid8_fpArctanPiTest_a = expXIsBias_uid44_atanX_uid8_fpArctanPiTest_b else "0";

	--inIsOne_uid45_atanX_uid8_fpArctanPiTest(LOGICAL,44)@0
    inIsOne_uid45_atanX_uid8_fpArctanPiTest_a <= fracXIsZero_uid35_atanX_uid8_fpArctanPiTest_q;
    inIsOne_uid45_atanX_uid8_fpArctanPiTest_b <= expXIsBias_uid44_atanX_uid8_fpArctanPiTest_q;
    inIsOne_uid45_atanX_uid8_fpArctanPiTest_q <= inIsOne_uid45_atanX_uid8_fpArctanPiTest_a and inIsOne_uid45_atanX_uid8_fpArctanPiTest_b;

	--arctanIsConst_uid55_atanX_uid8_fpArctanPiTest(LOGICAL,54)@0
    arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_a <= exc_I_uid36_atanX_uid8_fpArctanPiTest_q;
    arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_b <= inIsOne_uid45_atanX_uid8_fpArctanPiTest_q;
    arctanIsConst_uid55_atanX_uid8_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q <= arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_a or arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_b;
        END IF;
        END IF;
    END PROCESS;



	--ld_arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_c(DELAY,522)@1
    ld_arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q, xout => ld_arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--biasMwShift_uid62_atanX_uid8_fpArctanPiTest(CONSTANT,61)
    biasMwShift_uid62_atanX_uid8_fpArctanPiTest_q <= "01110011";

	--atanUIsU_uid63_atanX_uid8_fpArctanPiTest(COMPARE,62)@13
    atanUIsU_uid63_atanX_uid8_fpArctanPiTest_cin <= GND_q;
    atanUIsU_uid63_atanX_uid8_fpArctanPiTest_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid62_atanX_uid8_fpArctanPiTest_q) & '0';
    atanUIsU_uid63_atanX_uid8_fpArctanPiTest_b <= STD_LOGIC_VECTOR("00" & reg_expU_uid59_atanX_uid8_fpArctanPiTest_0_to_atanUIsU_uid63_atanX_uid8_fpArctanPiTest_1_q) & atanUIsU_uid63_atanX_uid8_fpArctanPiTest_cin(0);
            atanUIsU_uid63_atanX_uid8_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(atanUIsU_uid63_atanX_uid8_fpArctanPiTest_a) - UNSIGNED(atanUIsU_uid63_atanX_uid8_fpArctanPiTest_b));
    atanUIsU_uid63_atanX_uid8_fpArctanPiTest_n(0) <= not atanUIsU_uid63_atanX_uid8_fpArctanPiTest_o(10);


	--ld_path2_uid56_atanX_uid8_fpArctanPiTest_n_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_a(DELAY,520)@0
    ld_path2_uid56_atanX_uid8_fpArctanPiTest_n_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 13 )
    PORT MAP ( xin => path2_uid56_atanX_uid8_fpArctanPiTest_n, xout => ld_path2_uid56_atanX_uid8_fpArctanPiTest_n_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--pathSelBits_uid108_atanX_uid8_fpArctanPiTest(BITJOIN,107)@13
    pathSelBits_uid108_atanX_uid8_fpArctanPiTest_q <= ld_arctanIsConst_uid55_atanX_uid8_fpArctanPiTest_q_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_c_q & atanUIsU_uid63_atanX_uid8_fpArctanPiTest_n & ld_path2_uid56_atanX_uid8_fpArctanPiTest_n_to_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_a_q;

	--reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0(REG,392)@13
    reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q <= pathSelBits_uid108_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_inputreg(DELAY,934)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q, xout => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt(COUNTER,936)
    -- every=1, low=0, high=18, step=1, init=1
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i = 17 THEN
                      ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i - 18;
                    ELSE
                        ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_i,5));


	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdreg(REG,937)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux(MUX,938)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s <= en;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux: PROCESS (ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s, ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q, ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem(DUALMEM,935)
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_ia <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_inputreg_q;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_aa <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdreg_q;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_ab <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_rdmux_q;
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_iq,
        address_a => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_aa,
        data_a => ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_ia
    );
    ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0 <= areset;
        ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_q <= ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_iq(2 downto 0);

	--fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest(LOOKUP,108)@35
    fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "10";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_pathSelBits_uid108_atanX_uid8_fpArctanPiTest_0_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_0_q_to_fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_a_replace_mem_q) IS
                WHEN "000" =>  fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "10";
                WHEN "001" =>  fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "010" =>  fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "00";
                WHEN "011" =>  fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "100" =>  fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "11";
                WHEN "101" =>  fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "11";
                WHEN "110" =>  fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "11";
                WHEN "111" =>  fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= "11";
                WHEN OTHERS =>
                    fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q <= (others => '-');
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--expRCalc_uid113_atanX_uid8_fpArctanPiTest(MUX,112)@36
    expRCalc_uid113_atanX_uid8_fpArctanPiTest_s <= fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q;
    expRCalc_uid113_atanX_uid8_fpArctanPiTest: PROCESS (expRCalc_uid113_atanX_uid8_fpArctanPiTest_s, en, reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_q, reg_expRPath2_uid107_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_3_q, ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_q, reg_expOutCst_uid112_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_5_q)
    BEGIN
            CASE expRCalc_uid113_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => expRCalc_uid113_atanX_uid8_fpArctanPiTest_q <= reg_expX_uid15_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_2_q;
                  WHEN "01" => expRCalc_uid113_atanX_uid8_fpArctanPiTest_q <= reg_expRPath2_uid107_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_3_q;
                  WHEN "10" => expRCalc_uid113_atanX_uid8_fpArctanPiTest_q <= ld_reg_expRPath3_uid89_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_4_q_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_e_q;
                  WHEN "11" => expRCalc_uid113_atanX_uid8_fpArctanPiTest_q <= reg_expOutCst_uid112_atanX_uid8_fpArctanPiTest_0_to_expRCalc_uid113_atanX_uid8_fpArctanPiTest_5_q;
                  WHEN OTHERS => expRCalc_uid113_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--cstAllZWE_uid21_atanX_uid8_fpArctanPiTest(CONSTANT,20)
    cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q <= "00000000";

	--ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor(LOGICAL,995)
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_b <= ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_q <= not (ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_a or ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_b);

	--ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_sticky_ena(REG,996)
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_nor_q = "1") THEN
                ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd(LOGICAL,997)
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_a <= ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_b <= en;
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_q <= ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_a and ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_b;

	--ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_inputreg(DELAY,985)
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid38_atanX_uid8_fpArctanPiTest_q, xout => ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem(DUALMEM,986)
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_ia <= ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_inputreg_q;
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_aa <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_ab <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q;
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 1,
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
        clocken1 => ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_iq,
        address_a => ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_aa,
        data_a => ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_ia
    );
    ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 <= areset;
        ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_q <= ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_iq(0 downto 0);

	--ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor(LOGICAL,982)
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_b <= ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_sticky_ena_q;
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_q <= not (ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_a or ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_b);

	--ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_sticky_ena(REG,983)
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_nor_q = "1") THEN
                ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_sticky_ena_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd(LOGICAL,984)
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_a <= ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_sticky_ena_q;
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_b <= en;
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_q <= ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_a and ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_b;

	--ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_inputreg(DELAY,972)
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q, xout => ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem(DUALMEM,973)
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_ia <= ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_inputreg_q;
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_aa <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_ab <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q;
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 6,
        numwords_a => 33,
        width_b => 1,
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
        clocken1 => ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_iq,
        address_a => ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_aa,
        data_a => ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_ia
    );
    ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_reset0 <= areset;
        ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_q <= ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_iq(0 downto 0);

	--excSelBits_uid114_atanX_uid8_fpArctanPiTest(BITJOIN,113)@35
    excSelBits_uid114_atanX_uid8_fpArctanPiTest_q <= ld_exc_N_uid38_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_c_replace_mem_q & GND_q & ld_expXIsZero_uid31_atanX_uid8_fpArctanPiTest_q_to_excSelBits_uid114_atanX_uid8_fpArctanPiTest_a_replace_mem_q;

	--reg_excSelBits_uid114_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_0(REG,377)@35
    reg_excSelBits_uid114_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excSelBits_uid114_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_excSelBits_uid114_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_0_q <= excSelBits_uid114_atanX_uid8_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest(LOOKUP,114)@36
    outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest: PROCESS (reg_excSelBits_uid114_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excSelBits_uid114_atanX_uid8_fpArctanPiTest_0_to_outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_0_q) IS
                WHEN "000" =>  outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "001" =>  outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= "00";
                WHEN "010" =>  outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= "10";
                WHEN "011" =>  outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "100" =>  outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= "11";
                WHEN "101" =>  outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "110" =>  outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN "111" =>  outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= "01";
                WHEN OTHERS =>
                    outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid117_atanX_uid8_fpArctanPiTest(MUX,116)@36
    expRPostExc_uid117_atanX_uid8_fpArctanPiTest_s <= outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q;
    expRPostExc_uid117_atanX_uid8_fpArctanPiTest: PROCESS (expRPostExc_uid117_atanX_uid8_fpArctanPiTest_s, en, cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q, expRCalc_uid113_atanX_uid8_fpArctanPiTest_q, cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q, cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE expRPostExc_uid117_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => expRPostExc_uid117_atanX_uid8_fpArctanPiTest_q <= cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q;
                  WHEN "01" => expRPostExc_uid117_atanX_uid8_fpArctanPiTest_q <= expRCalc_uid113_atanX_uid8_fpArctanPiTest_q;
                  WHEN "10" => expRPostExc_uid117_atanX_uid8_fpArctanPiTest_q <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
                  WHEN "11" => expRPostExc_uid117_atanX_uid8_fpArctanPiTest_q <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => expRPostExc_uid117_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracOutCst_uid110_atanX_uid8_fpArctanPiTest(BITSELECT,109)@35
    fracOutCst_uid110_atanX_uid8_fpArctanPiTest_in <= constOut_uid54_atanX_uid8_fpArctanPiTest_q(22 downto 0);
    fracOutCst_uid110_atanX_uid8_fpArctanPiTest_b <= fracOutCst_uid110_atanX_uid8_fpArctanPiTest_in(22 downto 0);

	--reg_fracOutCst_uid110_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_5(REG,424)@35
    reg_fracOutCst_uid110_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracOutCst_uid110_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_5_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracOutCst_uid110_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_5_q <= fracOutCst_uid110_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor(LOGICAL,968)
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_b <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_sticky_ena_q;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_q <= not (ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_a or ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_b);

	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_sticky_ena(REG,969)
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_nor_q = "1") THEN
                ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_sticky_ena_q <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd(LOGICAL,970)
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_a <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_sticky_ena_q;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_b <= en;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_q <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_a and ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_b;

	--fracRPath3_uid88_atanX_uid8_fpArctanPiTest(BITSELECT,87)@31
    fracRPath3_uid88_atanX_uid8_fpArctanPiTest_in <= expfracRPath3PostRnd_uid87_atanX_uid8_fpArctanPiTest_q(23 downto 0);
    fracRPath3_uid88_atanX_uid8_fpArctanPiTest_b <= fracRPath3_uid88_atanX_uid8_fpArctanPiTest_in(23 downto 1);

	--reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4(REG,423)@31
    reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q <= fracRPath3_uid88_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_inputreg(DELAY,960)
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q, xout => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem(DUALMEM,961)
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_ia <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_inputreg_q;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_aa <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdreg_q;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_ab <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_rdmux_q;
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_iq,
        address_a => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_aa,
        data_a => ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_ia
    );
    ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_reset0 <= areset;
        ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_q <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_iq(22 downto 0);

	--fracRPath2_uid106_atanX_uid8_fpArctanPiTest(BITSELECT,105)@35
    fracRPath2_uid106_atanX_uid8_fpArctanPiTest_in <= expFracRPath2PostRnd_uid105_atanX_uid8_fpArctanPiTest_q(23 downto 0);
    fracRPath2_uid106_atanX_uid8_fpArctanPiTest_b <= fracRPath2_uid106_atanX_uid8_fpArctanPiTest_in(23 downto 1);

	--reg_fracRPath2_uid106_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_3(REG,422)@35
    reg_fracRPath2_uid106_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracRPath2_uid106_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_3_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracRPath2_uid106_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_3_q <= fracRPath2_uid106_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor(LOGICAL,957)
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_a <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_notEnable_q;
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_b <= ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_q <= not (ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_a or ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_b);

	--ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_sticky_ena(REG,958)
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_nor_q = "1") THEN
                ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_sticky_ena_q <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd(LOGICAL,959)
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_a <= ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_sticky_ena_q;
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_b <= en;
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_q <= ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_a and ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_b;

	--reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2(REG,421)@0
    reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q <= fracX_uid16_atanX_uid8_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_inputreg(DELAY,947)
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q, xout => ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem(DUALMEM,948)
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_ia <= ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_inputreg_q;
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_aa <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdreg_q;
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_ab <= ld_singX_uid17_atanX_uid8_fpArctanPiTest_b_to_fpPiO2C_uid49_atanX_uid8_fpArctanPiTest_c_replace_rdmux_q;
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_iq,
        address_a => ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_aa,
        data_a => ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_ia
    );
    ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_reset0 <= areset;
        ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_q <= ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_iq(22 downto 0);

	--fracRCalc_uid111_atanX_uid8_fpArctanPiTest(MUX,110)@36
    fracRCalc_uid111_atanX_uid8_fpArctanPiTest_s <= fracOutMuxSelEnc_uid109_atanX_uid8_fpArctanPiTest_q;
    fracRCalc_uid111_atanX_uid8_fpArctanPiTest: PROCESS (fracRCalc_uid111_atanX_uid8_fpArctanPiTest_s, en, ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_q, reg_fracRPath2_uid106_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_3_q, ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_q, reg_fracOutCst_uid110_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_5_q)
    BEGIN
            CASE fracRCalc_uid111_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => fracRCalc_uid111_atanX_uid8_fpArctanPiTest_q <= ld_reg_fracX_uid16_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_2_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_c_replace_mem_q;
                  WHEN "01" => fracRCalc_uid111_atanX_uid8_fpArctanPiTest_q <= reg_fracRPath2_uid106_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_3_q;
                  WHEN "10" => fracRCalc_uid111_atanX_uid8_fpArctanPiTest_q <= ld_reg_fracRPath3_uid88_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_4_q_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_e_replace_mem_q;
                  WHEN "11" => fracRCalc_uid111_atanX_uid8_fpArctanPiTest_q <= reg_fracOutCst_uid110_atanX_uid8_fpArctanPiTest_0_to_fracRCalc_uid111_atanX_uid8_fpArctanPiTest_5_q;
                  WHEN OTHERS => fracRCalc_uid111_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPostExc_uid116_atanX_uid8_fpArctanPiTest(MUX,115)@36
    fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_s <= outMuxSelEnc_uid115_atanX_uid8_fpArctanPiTest_q;
    fracRPostExc_uid116_atanX_uid8_fpArctanPiTest: PROCESS (fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_s, en, cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q, fracRCalc_uid111_atanX_uid8_fpArctanPiTest_q, cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q, cstNaNWF_uid20_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_s IS
                  WHEN "00" => fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_q <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
                  WHEN "01" => fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_q <= fracRCalc_uid111_atanX_uid8_fpArctanPiTest_q;
                  WHEN "10" => fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_q <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
                  WHEN "11" => fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_q <= cstNaNWF_uid20_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid120_atanX_uid8_fpArctanPiTest(BITJOIN,119)@36
    R_uid120_atanX_uid8_fpArctanPiTest_q <= ld_signR_uid119_atanX_uid8_fpArctanPiTest_q_to_R_uid120_atanX_uid8_fpArctanPiTest_c_replace_mem_q & expRPostExc_uid117_atanX_uid8_fpArctanPiTest_q & fracRPostExc_uid116_atanX_uid8_fpArctanPiTest_q;

	--fracX_uid126_rAtanPi_uid13_fpArctanPiTest(BITSELECT,125)@36
    fracX_uid126_rAtanPi_uid13_fpArctanPiTest_in <= R_uid120_atanX_uid8_fpArctanPiTest_q(22 downto 0);
    fracX_uid126_rAtanPi_uid13_fpArctanPiTest_b <= fracX_uid126_rAtanPi_uid13_fpArctanPiTest_in(22 downto 0);

	--reg_fracX_uid126_rAtanPi_uid13_fpArctanPiTest_0_to_fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_1(REG,431)@36
    reg_fracX_uid126_rAtanPi_uid13_fpArctanPiTest_0_to_fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracX_uid126_rAtanPi_uid13_fpArctanPiTest_0_to_fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_1_q <= "00000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracX_uid126_rAtanPi_uid13_fpArctanPiTest_0_to_fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_1_q <= fracX_uid126_rAtanPi_uid13_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest(LOGICAL,137)@37
    fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_a <= reg_fracX_uid126_rAtanPi_uid13_fpArctanPiTest_0_to_fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_1_q;
    fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_b <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
    fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_q <= "1" when fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_a = fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_b else "0";

	--expX_uid122_rAtanPi_uid13_fpArctanPiTest(BITSELECT,121)@36
    expX_uid122_rAtanPi_uid13_fpArctanPiTest_in <= R_uid120_atanX_uid8_fpArctanPiTest_q(30 downto 0);
    expX_uid122_rAtanPi_uid13_fpArctanPiTest_b <= expX_uid122_rAtanPi_uid13_fpArctanPiTest_in(30 downto 23);

	--reg_expX_uid122_rAtanPi_uid13_fpArctanPiTest_0_to_expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_1(REG,429)@36
    reg_expX_uid122_rAtanPi_uid13_fpArctanPiTest_0_to_expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expX_uid122_rAtanPi_uid13_fpArctanPiTest_0_to_expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expX_uid122_rAtanPi_uid13_fpArctanPiTest_0_to_expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_1_q <= expX_uid122_rAtanPi_uid13_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest(LOGICAL,135)@37
    expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_a <= reg_expX_uid122_rAtanPi_uid13_fpArctanPiTest_0_to_expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_1_q;
    expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_b <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
    expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_q <= "1" when expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_a = expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_b else "0";

	--exc_I_uid139_rAtanPi_uid13_fpArctanPiTest(LOGICAL,138)@37
    exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_a <= expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_q;
    exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_b <= fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_q;
    exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_q <= exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_a and exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_b;

	--cstBiasM2_uid6_fpArctanPiTest(CONSTANT,5)
    cstBiasM2_uid6_fpArctanPiTest_q <= "01111101";

	--ooPi_uid9_fpArctanPiTest(CONSTANT,8)
    ooPi_uid9_fpArctanPiTest_q <= "101000101111100110000011";

	--fracOOPi_uid10_fpArctanPiTest(BITSELECT,9)@36
    fracOOPi_uid10_fpArctanPiTest_in <= ooPi_uid9_fpArctanPiTest_q(22 downto 0);
    fracOOPi_uid10_fpArctanPiTest_b <= fracOOPi_uid10_fpArctanPiTest_in(22 downto 0);

	--fpOOPi_uid11_fpArctanPiTest(BITJOIN,10)@36
    fpOOPi_uid11_fpArctanPiTest_q <= GND_q & cstBiasM2_uid6_fpArctanPiTest_q & fracOOPi_uid10_fpArctanPiTest_b;

	--expY_uid123_rAtanPi_uid13_fpArctanPiTest(BITSELECT,122)@36
    expY_uid123_rAtanPi_uid13_fpArctanPiTest_in <= fpOOPi_uid11_fpArctanPiTest_q(30 downto 0);
    expY_uid123_rAtanPi_uid13_fpArctanPiTest_b <= expY_uid123_rAtanPi_uid13_fpArctanPiTest_in(30 downto 23);

	--expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest(LOGICAL,149)@36
    expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_a <= expY_uid123_rAtanPi_uid13_fpArctanPiTest_b;
    expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_b <= cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q;
    expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q <= "1" when expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_a = expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_b else "0";

	--ld_expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q_to_InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a(DELAY,581)@36
    ld_expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q_to_InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q_to_InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest(LOGICAL,203)@37
    excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_a <= ld_expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q_to_InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a_q;
    excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_b <= exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_q;
    excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_q <= excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_a and excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_b;

	--fracY_uid128_rAtanPi_uid13_fpArctanPiTest(BITSELECT,127)@36
    fracY_uid128_rAtanPi_uid13_fpArctanPiTest_in <= fpOOPi_uid11_fpArctanPiTest_q(22 downto 0);
    fracY_uid128_rAtanPi_uid13_fpArctanPiTest_b <= fracY_uid128_rAtanPi_uid13_fpArctanPiTest_in(22 downto 0);

	--fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest(LOGICAL,153)@36
    fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_a <= fracY_uid128_rAtanPi_uid13_fpArctanPiTest_b;
    fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_b <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
    fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q <= "1" when fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_a = fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_b else "0";

	--ld_fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_b(DELAY,575)@36
    ld_fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest(LOGICAL,151)@36
    expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_a <= expY_uid123_rAtanPi_uid13_fpArctanPiTest_b;
    expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_b <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
    expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q <= "1" when expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_a = expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_b else "0";

	--ld_expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_a(DELAY,574)@36
    ld_expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--exc_I_uid155_rAtanPi_uid13_fpArctanPiTest(LOGICAL,154)@37
    exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_a <= ld_expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_a_q;
    exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_b <= ld_fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q_to_exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_b_q;
    exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_q <= exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_a and exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_b;

	--expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest(LOGICAL,133)@37
    expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_a <= reg_expX_uid122_rAtanPi_uid13_fpArctanPiTest_0_to_expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_1_q;
    expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_b <= cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q;
    expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_q <= "1" when expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_a = expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_b else "0";

	--excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest(LOGICAL,204)@37
    excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_a <= expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_q;
    excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_b <= exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_q;
    excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_q <= excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_a and excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_b;

	--ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest(LOGICAL,205)@37
    ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_a <= excXZAndExcYI_uid205_rAtanPi_uid13_fpArctanPiTest_q;
    ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_b <= excYZAndExcXI_uid204_rAtanPi_uid13_fpArctanPiTest_q;
    ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_q <= ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_a or ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_b;

	--InvFracXIsZero_uid156_rAtanPi_uid13_fpArctanPiTest(LOGICAL,155)@36
    InvFracXIsZero_uid156_rAtanPi_uid13_fpArctanPiTest_a <= fracXIsZero_uid154_rAtanPi_uid13_fpArctanPiTest_q;
    InvFracXIsZero_uid156_rAtanPi_uid13_fpArctanPiTest_q <= not InvFracXIsZero_uid156_rAtanPi_uid13_fpArctanPiTest_a;

	--exc_N_uid157_rAtanPi_uid13_fpArctanPiTest(LOGICAL,156)@36
    exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_a <= expXIsMax_uid152_rAtanPi_uid13_fpArctanPiTest_q;
    exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_b <= InvFracXIsZero_uid156_rAtanPi_uid13_fpArctanPiTest_q;
    exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q <= exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_a and exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_b;

	--ld_exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q_to_InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a(DELAY,579)@36
    ld_exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q_to_InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q_to_InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--InvFracXIsZero_uid140_rAtanPi_uid13_fpArctanPiTest(LOGICAL,139)@37
    InvFracXIsZero_uid140_rAtanPi_uid13_fpArctanPiTest_a <= fracXIsZero_uid138_rAtanPi_uid13_fpArctanPiTest_q;
    InvFracXIsZero_uid140_rAtanPi_uid13_fpArctanPiTest_q <= not InvFracXIsZero_uid140_rAtanPi_uid13_fpArctanPiTest_a;

	--exc_N_uid141_rAtanPi_uid13_fpArctanPiTest(LOGICAL,140)@37
    exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_a <= expXIsMax_uid136_rAtanPi_uid13_fpArctanPiTest_q;
    exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_b <= InvFracXIsZero_uid140_rAtanPi_uid13_fpArctanPiTest_q;
    exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_q <= exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_a and exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_b;

	--excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest(LOGICAL,206)@37
    excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_a <= exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_q;
    excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_b <= ld_exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q_to_InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a_q;
    excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_c <= ZeroTimesInf_uid206_rAtanPi_uid13_fpArctanPiTest_q;
    excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q <= excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_a or excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_b or excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_c;

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest(LOGICAL,218)@37
    InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest_a <= excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q;
    InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
            InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest_q <= not InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest_a;
        END IF;
    END PROCESS;



	--signY_uid125_rAtanPi_uid13_fpArctanPiTest(BITSELECT,124)@36
    signY_uid125_rAtanPi_uid13_fpArctanPiTest_in <= fpOOPi_uid11_fpArctanPiTest_q;
    signY_uid125_rAtanPi_uid13_fpArctanPiTest_b <= signY_uid125_rAtanPi_uid13_fpArctanPiTest_in(31 downto 31);

	--signX_uid124_rAtanPi_uid13_fpArctanPiTest(BITSELECT,123)@36
    signX_uid124_rAtanPi_uid13_fpArctanPiTest_in <= R_uid120_atanX_uid8_fpArctanPiTest_q;
    signX_uid124_rAtanPi_uid13_fpArctanPiTest_b <= signX_uid124_rAtanPi_uid13_fpArctanPiTest_in(31 downto 31);

	--signR_uid190_rAtanPi_uid13_fpArctanPiTest(LOGICAL,189)@36
    signR_uid190_rAtanPi_uid13_fpArctanPiTest_a <= signX_uid124_rAtanPi_uid13_fpArctanPiTest_b;
    signR_uid190_rAtanPi_uid13_fpArctanPiTest_b <= signY_uid125_rAtanPi_uid13_fpArctanPiTest_b;
    signR_uid190_rAtanPi_uid13_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            signR_uid190_rAtanPi_uid13_fpArctanPiTest_q <= (others => '0');
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            signR_uid190_rAtanPi_uid13_fpArctanPiTest_q <= signR_uid190_rAtanPi_uid13_fpArctanPiTest_a xor signR_uid190_rAtanPi_uid13_fpArctanPiTest_b;
        END IF;
        END IF;
    END PROCESS;



	--ld_signR_uid190_rAtanPi_uid13_fpArctanPiTest_q_to_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_a(DELAY,666)@37
    ld_signR_uid190_rAtanPi_uid13_fpArctanPiTest_q_to_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signR_uid190_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_signR_uid190_rAtanPi_uid13_fpArctanPiTest_q_to_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest(LOGICAL,219)@38
    signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_a <= ld_signR_uid190_rAtanPi_uid13_fpArctanPiTest_q_to_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_a_q;
    signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_b <= InvExcRNaN_uid219_rAtanPi_uid13_fpArctanPiTest_q;
    signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_q <= signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_a and signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_b;

	--ld_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_q_to_R_uid221_rAtanPi_uid13_fpArctanPiTest_c(DELAY,670)@38
    ld_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_q_to_R_uid221_rAtanPi_uid13_fpArctanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_q_to_R_uid221_rAtanPi_uid13_fpArctanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest(BITJOIN,128)@36
    add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_q <= VCC_q & fracY_uid128_rAtanPi_uid13_fpArctanPiTest_b;

	--reg_add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_1(REG,433)@36
    reg_add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_1_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_1_q <= add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest(BITJOIN,126)@36
    add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_q <= VCC_q & fracX_uid126_rAtanPi_uid13_fpArctanPiTest_b;

	--reg_add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_0(REG,432)@36
    reg_add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_0_q <= "000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_0_q <= add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--prod_uid165_rAtanPi_uid13_fpArctanPiTest(MULT,164)@37
    prod_uid165_rAtanPi_uid13_fpArctanPiTest_pr <= UNSIGNED(prod_uid165_rAtanPi_uid13_fpArctanPiTest_a) * UNSIGNED(prod_uid165_rAtanPi_uid13_fpArctanPiTest_b);
    prod_uid165_rAtanPi_uid13_fpArctanPiTest_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid165_rAtanPi_uid13_fpArctanPiTest_a <= (others => '0');
            prod_uid165_rAtanPi_uid13_fpArctanPiTest_b <= (others => '0');
            prod_uid165_rAtanPi_uid13_fpArctanPiTest_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid165_rAtanPi_uid13_fpArctanPiTest_a <= reg_add_one_fracX_uid126_uid127_uid127_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_0_q;
                prod_uid165_rAtanPi_uid13_fpArctanPiTest_b <= reg_add_one_fracY_uid128_uid129_uid129_rAtanPi_uid13_fpArctanPiTest_0_to_prod_uid165_rAtanPi_uid13_fpArctanPiTest_1_q;
                prod_uid165_rAtanPi_uid13_fpArctanPiTest_s1 <= STD_LOGIC_VECTOR(prod_uid165_rAtanPi_uid13_fpArctanPiTest_pr);
            END IF;
        END IF;
    END PROCESS;
    prod_uid165_rAtanPi_uid13_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prod_uid165_rAtanPi_uid13_fpArctanPiTest_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prod_uid165_rAtanPi_uid13_fpArctanPiTest_q <= prod_uid165_rAtanPi_uid13_fpArctanPiTest_s1;
            END IF;
        END IF;
    END PROCESS;

	--normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest(BITSELECT,165)@40
    normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest_in <= prod_uid165_rAtanPi_uid13_fpArctanPiTest_q;
    normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest_b <= normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest_in(47 downto 47);

	--roundBitDetectionConstant_uid180_rAtanPi_uid13_fpArctanPiTest(CONSTANT,179)
    roundBitDetectionConstant_uid180_rAtanPi_uid13_fpArctanPiTest_q <= "010";

	--fracRPostNormHigh_uid168_rAtanPi_uid13_fpArctanPiTest(BITSELECT,167)@40
    fracRPostNormHigh_uid168_rAtanPi_uid13_fpArctanPiTest_in <= prod_uid165_rAtanPi_uid13_fpArctanPiTest_q(46 downto 0);
    fracRPostNormHigh_uid168_rAtanPi_uid13_fpArctanPiTest_b <= fracRPostNormHigh_uid168_rAtanPi_uid13_fpArctanPiTest_in(46 downto 23);

	--fracRPostNormLow_uid169_rAtanPi_uid13_fpArctanPiTest(BITSELECT,168)@40
    fracRPostNormLow_uid169_rAtanPi_uid13_fpArctanPiTest_in <= prod_uid165_rAtanPi_uid13_fpArctanPiTest_q(45 downto 0);
    fracRPostNormLow_uid169_rAtanPi_uid13_fpArctanPiTest_b <= fracRPostNormLow_uid169_rAtanPi_uid13_fpArctanPiTest_in(45 downto 22);

	--fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest(MUX,169)@40
    fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_s <= normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest_b;
    fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest: PROCESS (fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_s, en, fracRPostNormLow_uid169_rAtanPi_uid13_fpArctanPiTest_b, fracRPostNormHigh_uid168_rAtanPi_uid13_fpArctanPiTest_b)
    BEGIN
            CASE fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_s IS
                  WHEN "0" => fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_q <= fracRPostNormLow_uid169_rAtanPi_uid13_fpArctanPiTest_b;
                  WHEN "1" => fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_q <= fracRPostNormHigh_uid168_rAtanPi_uid13_fpArctanPiTest_b;
                  WHEN OTHERS => fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--FracRPostNorm1dto0_uid178_rAtanPi_uid13_fpArctanPiTest(BITSELECT,177)@40
    FracRPostNorm1dto0_uid178_rAtanPi_uid13_fpArctanPiTest_in <= fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_q(1 downto 0);
    FracRPostNorm1dto0_uid178_rAtanPi_uid13_fpArctanPiTest_b <= FracRPostNorm1dto0_uid178_rAtanPi_uid13_fpArctanPiTest_in(1 downto 0);

	--Prod22_uid172_rAtanPi_uid13_fpArctanPiTest(BITSELECT,171)@40
    Prod22_uid172_rAtanPi_uid13_fpArctanPiTest_in <= prod_uid165_rAtanPi_uid13_fpArctanPiTest_q(22 downto 0);
    Prod22_uid172_rAtanPi_uid13_fpArctanPiTest_b <= Prod22_uid172_rAtanPi_uid13_fpArctanPiTest_in(22 downto 22);

	--extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest(MUX,172)@40
    extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_s <= normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest_b;
    extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest: PROCESS (extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_s, en, GND_q, Prod22_uid172_rAtanPi_uid13_fpArctanPiTest_b)
    BEGIN
            CASE extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_s IS
                  WHEN "0" => extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_q <= GND_q;
                  WHEN "1" => extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_q <= Prod22_uid172_rAtanPi_uid13_fpArctanPiTest_b;
                  WHEN OTHERS => extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--stickyRange_uid171_rAtanPi_uid13_fpArctanPiTest(BITSELECT,170)@40
    stickyRange_uid171_rAtanPi_uid13_fpArctanPiTest_in <= prod_uid165_rAtanPi_uid13_fpArctanPiTest_q(21 downto 0);
    stickyRange_uid171_rAtanPi_uid13_fpArctanPiTest_b <= stickyRange_uid171_rAtanPi_uid13_fpArctanPiTest_in(21 downto 0);

	--stickyExtendedRange_uid174_rAtanPi_uid13_fpArctanPiTest(BITJOIN,173)@40
    stickyExtendedRange_uid174_rAtanPi_uid13_fpArctanPiTest_q <= extraStickyBit_uid173_rAtanPi_uid13_fpArctanPiTest_q & stickyRange_uid171_rAtanPi_uid13_fpArctanPiTest_b;

	--stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest(LOGICAL,175)@40
    stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_a <= stickyExtendedRange_uid174_rAtanPi_uid13_fpArctanPiTest_q;
    stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_b <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
    stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_q <= "1" when stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_a = stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_b else "0";

	--sticky_uid177_rAtanPi_uid13_fpArctanPiTest(LOGICAL,176)@40
    sticky_uid177_rAtanPi_uid13_fpArctanPiTest_a <= stickyRangeComparator_uid176_rAtanPi_uid13_fpArctanPiTest_q;
    sticky_uid177_rAtanPi_uid13_fpArctanPiTest_q <= not sticky_uid177_rAtanPi_uid13_fpArctanPiTest_a;

	--lrs_uid179_rAtanPi_uid13_fpArctanPiTest(BITJOIN,178)@40
    lrs_uid179_rAtanPi_uid13_fpArctanPiTest_q <= FracRPostNorm1dto0_uid178_rAtanPi_uid13_fpArctanPiTest_b & sticky_uid177_rAtanPi_uid13_fpArctanPiTest_q;

	--roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest(LOGICAL,180)@40
    roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_a <= lrs_uid179_rAtanPi_uid13_fpArctanPiTest_q;
    roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_b <= roundBitDetectionConstant_uid180_rAtanPi_uid13_fpArctanPiTest_q;
    roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_q <= "1" when roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_a = roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_b else "0";

	--roundBit_uid182_rAtanPi_uid13_fpArctanPiTest(LOGICAL,181)@40
    roundBit_uid182_rAtanPi_uid13_fpArctanPiTest_a <= roundBitDetectionPattern_uid181_rAtanPi_uid13_fpArctanPiTest_q;
    roundBit_uid182_rAtanPi_uid13_fpArctanPiTest_q <= not roundBit_uid182_rAtanPi_uid13_fpArctanPiTest_a;

	--roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest(BITJOIN,184)@40
    roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_q <= GND_q & normalizeBit_uid166_rAtanPi_uid13_fpArctanPiTest_b & cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q & roundBit_uid182_rAtanPi_uid13_fpArctanPiTest_q;

	--reg_roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_1(REG,436)@40
    reg_roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_1_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_1_q <= roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--biasInc_uid163_rAtanPi_uid13_fpArctanPiTest(CONSTANT,162)
    biasInc_uid163_rAtanPi_uid13_fpArctanPiTest_q <= "0001111111";

	--ld_expY_uid123_rAtanPi_uid13_fpArctanPiTest_b_to_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_b(DELAY,586)@36
    ld_expY_uid123_rAtanPi_uid13_fpArctanPiTest_b_to_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expY_uid123_rAtanPi_uid13_fpArctanPiTest_b, xout => ld_expY_uid123_rAtanPi_uid13_fpArctanPiTest_b_to_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--expSum_uid162_rAtanPi_uid13_fpArctanPiTest(ADD,161)@37
    expSum_uid162_rAtanPi_uid13_fpArctanPiTest_a <= STD_LOGIC_VECTOR("0" & reg_expX_uid122_rAtanPi_uid13_fpArctanPiTest_0_to_expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_1_q);
    expSum_uid162_rAtanPi_uid13_fpArctanPiTest_b <= STD_LOGIC_VECTOR("0" & ld_expY_uid123_rAtanPi_uid13_fpArctanPiTest_b_to_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_b_q);
    expSum_uid162_rAtanPi_uid13_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid162_rAtanPi_uid13_fpArctanPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSum_uid162_rAtanPi_uid13_fpArctanPiTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid162_rAtanPi_uid13_fpArctanPiTest_a) + UNSIGNED(expSum_uid162_rAtanPi_uid13_fpArctanPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSum_uid162_rAtanPi_uid13_fpArctanPiTest_q <= expSum_uid162_rAtanPi_uid13_fpArctanPiTest_o(8 downto 0);


	--ld_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_q_to_expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_a(DELAY,587)@38
    ld_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_q_to_expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expSum_uid162_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_q_to_expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest(SUB,163)@39
    expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_a <= STD_LOGIC_VECTOR('0' & "00" & ld_expSum_uid162_rAtanPi_uid13_fpArctanPiTest_q_to_expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_a_q);
    expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_b <= STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid163_rAtanPi_uid13_fpArctanPiTest_q(9)) & biasInc_uid163_rAtanPi_uid13_fpArctanPiTest_q);
    expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_a) - SIGNED(expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_b));
            END IF;
        END IF;
    END PROCESS;
    expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_q <= expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_o(10 downto 0);


	--expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest(BITJOIN,182)@40
    expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_q <= expSumMBias_uid164_rAtanPi_uid13_fpArctanPiTest_q & fracRPostNorm_uid170_rAtanPi_uid13_fpArctanPiTest_q;

	--reg_expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_0(REG,435)@40
    reg_expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_0_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_0_q <= expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest(ADD,185)@41
    expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_a <= STD_LOGIC_VECTOR((36 downto 35 => reg_expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_0_q(34)) & reg_expFracPreRound_uid183_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_0_q);
    expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_b <= STD_LOGIC_VECTOR('0' & "0000000000" & reg_roundBitAndNormalizationOp_uid185_rAtanPi_uid13_fpArctanPiTest_0_to_expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_1_q);
            expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_a) + SIGNED(expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_b));
    expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_q <= expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_o(35 downto 0);


	--expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest(BITSELECT,187)@41
    expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_in <= expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_q;
    expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_b <= expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_in(35 downto 24);

	--expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest(BITSELECT,188)@41
    expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_in <= expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_b(7 downto 0);
    expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b <= expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_in(7 downto 0);

	--ld_expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b_to_expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_d(DELAY,664)@41
    ld_expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b_to_expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b, xout => ld_expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b_to_expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q_to_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_c(DELAY,659)@37
    ld_excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q_to_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q_to_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1(REG,437)@41
    reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1_q <= "000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1_q <= expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_b;
            END IF;
        END IF;
    END PROCESS;


	--expOvf_uid193_rAtanPi_uid13_fpArctanPiTest(COMPARE,192)@42
    expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_cin <= GND_q;
    expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_a <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1_q(11)) & reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1_q) & '0';
    expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_b <= STD_LOGIC_VECTOR('0' & "00000" & cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q) & expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_cin(0);
            expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_a) - SIGNED(expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_b));
    expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_n(0) <= not expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_o(14);


	--InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest(LOGICAL,157)@37
    InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a <= ld_exc_N_uid157_rAtanPi_uid13_fpArctanPiTest_q_to_InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a_q;
    InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_q <= not InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_a;

	--InvExc_I_uid159_rAtanPi_uid13_fpArctanPiTest(LOGICAL,158)@37
    InvExc_I_uid159_rAtanPi_uid13_fpArctanPiTest_a <= exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_q;
    InvExc_I_uid159_rAtanPi_uid13_fpArctanPiTest_q <= not InvExc_I_uid159_rAtanPi_uid13_fpArctanPiTest_a;

	--InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest(LOGICAL,159)@37
    InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a <= ld_expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q_to_InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a_q;
    InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_q <= not InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a;

	--exc_R_uid161_rAtanPi_uid13_fpArctanPiTest(LOGICAL,160)@37
    exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_a <= InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_q;
    exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_b <= InvExc_I_uid159_rAtanPi_uid13_fpArctanPiTest_q;
    exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_c <= InvExc_N_uid158_rAtanPi_uid13_fpArctanPiTest_q;
    exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q <= exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_a and exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_b and exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_c;

	--ld_exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b(DELAY,629)@37
    ld_exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--InvExc_N_uid142_rAtanPi_uid13_fpArctanPiTest(LOGICAL,141)@37
    InvExc_N_uid142_rAtanPi_uid13_fpArctanPiTest_a <= exc_N_uid141_rAtanPi_uid13_fpArctanPiTest_q;
    InvExc_N_uid142_rAtanPi_uid13_fpArctanPiTest_q <= not InvExc_N_uid142_rAtanPi_uid13_fpArctanPiTest_a;

	--InvExc_I_uid143_rAtanPi_uid13_fpArctanPiTest(LOGICAL,142)@37
    InvExc_I_uid143_rAtanPi_uid13_fpArctanPiTest_a <= exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_q;
    InvExc_I_uid143_rAtanPi_uid13_fpArctanPiTest_q <= not InvExc_I_uid143_rAtanPi_uid13_fpArctanPiTest_a;

	--InvExpXIsZero_uid144_rAtanPi_uid13_fpArctanPiTest(LOGICAL,143)@37
    InvExpXIsZero_uid144_rAtanPi_uid13_fpArctanPiTest_a <= expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_q;
    InvExpXIsZero_uid144_rAtanPi_uid13_fpArctanPiTest_q <= not InvExpXIsZero_uid144_rAtanPi_uid13_fpArctanPiTest_a;

	--exc_R_uid145_rAtanPi_uid13_fpArctanPiTest(LOGICAL,144)@37
    exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_a <= InvExpXIsZero_uid144_rAtanPi_uid13_fpArctanPiTest_q;
    exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_b <= InvExc_I_uid143_rAtanPi_uid13_fpArctanPiTest_q;
    exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_c <= InvExc_N_uid142_rAtanPi_uid13_fpArctanPiTest_q;
    exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q <= exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_a and exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_b and exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_c;

	--ld_exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a(DELAY,628)@37
    ld_exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest(LOGICAL,201)@42
    ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_a <= ld_exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a_q;
    ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_b <= ld_exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b_q;
    ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_c <= expOvf_uid193_rAtanPi_uid13_fpArctanPiTest_n;
    ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_q <= ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_a and ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_b and ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_c;

	--excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest(LOGICAL,200)@37
    excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_a <= exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q;
    excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_b <= exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_q;
    excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_q <= excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_a and excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_b;

	--ld_excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_c(DELAY,646)@37
    ld_excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest(LOGICAL,199)@37
    excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_a <= exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q;
    excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_b <= exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_q;
    excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_q <= excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_a and excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_b;

	--ld_excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_b(DELAY,645)@37
    ld_excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest(LOGICAL,198)@37
    excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_a <= exc_I_uid139_rAtanPi_uid13_fpArctanPiTest_q;
    excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_b <= exc_I_uid155_rAtanPi_uid13_fpArctanPiTest_q;
    excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_q <= excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_a and excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_b;

	--ld_excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_a(DELAY,644)@37
    ld_excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRInf_uid203_rAtanPi_uid13_fpArctanPiTest(LOGICAL,202)@42
    excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_a <= ld_excXIAndExcYI_uid199_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_a_q;
    excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_b <= ld_excXRAndExcYI_uid200_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_b_q;
    excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_c <= ld_excYRAndExcXI_uid201_rAtanPi_uid13_fpArctanPiTest_q_to_excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_c_q;
    excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_d <= ExcROvfAndInReg_uid202_rAtanPi_uid13_fpArctanPiTest_q;
    excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_q <= excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_a or excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_b or excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_c or excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_d;

	--expUdf_uid191_rAtanPi_uid13_fpArctanPiTest(COMPARE,190)@42
    expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_cin <= GND_q;
    expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_a <= STD_LOGIC_VECTOR('0' & "000000000000" & GND_q) & '0';
    expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_b <= STD_LOGIC_VECTOR((13 downto 12 => reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1_q(11)) & reg_expRPreExcExt_uid188_rAtanPi_uid13_fpArctanPiTest_0_to_expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_1_q) & expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_cin(0);
            expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_a) - SIGNED(expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_b));
    expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_n(0) <= not expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_o(14);


	--excZC3_uid197_rAtanPi_uid13_fpArctanPiTest(LOGICAL,196)@42
    excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a <= ld_exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a_q;
    excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b <= ld_exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q_to_excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b_q;
    excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_c <= expUdf_uid191_rAtanPi_uid13_fpArctanPiTest_n;
    excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_q <= excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_a and excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_b and excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_c;

	--excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest(LOGICAL,195)@37
    excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_a <= ld_expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q_to_InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a_q;
    excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_b <= exc_R_uid145_rAtanPi_uid13_fpArctanPiTest_q;
    excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_q <= excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_a and excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_b;

	--ld_excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_c(DELAY,633)@37
    ld_excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_c_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest(LOGICAL,194)@37
    excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_a <= expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_q;
    excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_b <= exc_R_uid161_rAtanPi_uid13_fpArctanPiTest_q;
    excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_q <= excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_a and excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_b;

	--ld_excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_b(DELAY,632)@37
    ld_excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_b_q, ena => en(0), clk => clk, aclr => areset );

	--excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest(LOGICAL,193)@37
    excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_a <= expXIsZero_uid134_rAtanPi_uid13_fpArctanPiTest_q;
    excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_b <= ld_expXIsZero_uid150_rAtanPi_uid13_fpArctanPiTest_q_to_InvExpXIsZero_uid160_rAtanPi_uid13_fpArctanPiTest_a_q;
    excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_q <= excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_a and excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_b;

	--ld_excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_a(DELAY,631)@37
    ld_excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_q, xout => ld_excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_a_q, ena => en(0), clk => clk, aclr => areset );

	--excRZero_uid198_rAtanPi_uid13_fpArctanPiTest(LOGICAL,197)@42
    excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_a <= ld_excXZAndExcYZ_uid194_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_a_q;
    excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_b <= ld_excXZAndExcYR_uid195_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_b_q;
    excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_c <= ld_excYZAndExcXR_uid196_rAtanPi_uid13_fpArctanPiTest_q_to_excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_c_q;
    excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_d <= excZC3_uid197_rAtanPi_uid13_fpArctanPiTest_q;
    excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_q <= excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_a or excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_b or excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_c or excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_d;

	--concExc_uid208_rAtanPi_uid13_fpArctanPiTest(BITJOIN,207)@42
    concExc_uid208_rAtanPi_uid13_fpArctanPiTest_q <= ld_excRNaN_uid207_rAtanPi_uid13_fpArctanPiTest_q_to_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_c_q & excRInf_uid203_rAtanPi_uid13_fpArctanPiTest_q & excRZero_uid198_rAtanPi_uid13_fpArctanPiTest_q;

	--reg_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_0_to_excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_0(REG,439)@42
    reg_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_0_to_excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_0_to_excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_0_to_excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_0_q <= concExc_uid208_rAtanPi_uid13_fpArctanPiTest_q;
            END IF;
        END IF;
    END PROCESS;


	--excREnc_uid209_rAtanPi_uid13_fpArctanPiTest(LOOKUP,208)@43
    excREnc_uid209_rAtanPi_uid13_fpArctanPiTest: PROCESS (reg_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_0_to_excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_concExc_uid208_rAtanPi_uid13_fpArctanPiTest_0_to_excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_0_q) IS
                WHEN "000" =>  excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= "01";
                WHEN "001" =>  excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= "00";
                WHEN "010" =>  excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= "10";
                WHEN "011" =>  excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= "00";
                WHEN "100" =>  excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= "11";
                WHEN "101" =>  excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= "00";
                WHEN "110" =>  excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= "00";
                WHEN "111" =>  excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest(MUX,217)@43
    expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_s <= excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q;
    expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest: PROCESS (expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_s, en, cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q, ld_expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b_to_expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_d_q, cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q, cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_s IS
                  WHEN "00" => expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_q <= cstAllZWE_uid21_atanX_uid8_fpArctanPiTest_q;
                  WHEN "01" => expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_q <= ld_expRPreExc_uid189_rAtanPi_uid13_fpArctanPiTest_b_to_expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_d_q;
                  WHEN "10" => expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_q <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
                  WHEN "11" => expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_q <= cstAllOWE_uid18_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest(BITSELECT,186)@41
    fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_in <= expFracRPostRounding_uid186_rAtanPi_uid13_fpArctanPiTest_q(23 downto 0);
    fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b <= fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_in(23 downto 1);

	--ld_fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b_to_fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_d(DELAY,662)@41
    ld_fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b_to_fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b, xout => ld_fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b_to_fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_d_q, ena => en(0), clk => clk, aclr => areset );

	--fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest(MUX,212)@43
    fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_s <= excREnc_uid209_rAtanPi_uid13_fpArctanPiTest_q;
    fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest: PROCESS (fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_s, en, cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q, ld_fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b_to_fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_d_q, cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q, cstNaNWF_uid20_atanX_uid8_fpArctanPiTest_q)
    BEGIN
            CASE fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_s IS
                  WHEN "00" => fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_q <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
                  WHEN "01" => fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_q <= ld_fracRPreExc_uid187_rAtanPi_uid13_fpArctanPiTest_b_to_fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_d_q;
                  WHEN "10" => fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_q <= cstAllZWF_uid19_atanX_uid8_fpArctanPiTest_q;
                  WHEN "11" => fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_q <= cstNaNWF_uid20_atanX_uid8_fpArctanPiTest_q;
                  WHEN OTHERS => fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid221_rAtanPi_uid13_fpArctanPiTest(BITJOIN,220)@43
    R_uid221_rAtanPi_uid13_fpArctanPiTest_q <= ld_signRPostExc_uid220_rAtanPi_uid13_fpArctanPiTest_q_to_R_uid221_rAtanPi_uid13_fpArctanPiTest_c_q & expRPostExc_uid218_rAtanPi_uid13_fpArctanPiTest_q & fracRPostExc_uid213_rAtanPi_uid13_fpArctanPiTest_q;

	--xOut(GPOUT,4)@43
    q <= R_uid221_rAtanPi_uid13_fpArctanPiTest_q;


end normal;
