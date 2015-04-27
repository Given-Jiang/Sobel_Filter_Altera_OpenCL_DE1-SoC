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

-- VHDL created from fp_ln_double_s5
-- VHDL created on Mon Apr  8 15:29:06 2013


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

entity fp_ln_double_s5 is
    port (
        a : in std_logic_vector(63 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(63 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_ln_double_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllZWF_uid8_fpLogETest_q : std_logic_vector (51 downto 0);
    signal cstBias_uid9_fpLogETest_q : std_logic_vector (10 downto 0);
    signal cstBiasMO_uid10_fpLogETest_q : std_logic_vector (10 downto 0);
    signal cstAllOWE_uid12_fpLogETest_q : std_logic_vector (10 downto 0);
    signal cstAllZWE_uid14_fpLogETest_q : std_logic_vector (10 downto 0);
    signal exc_R_uid27_fpLogETest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid27_fpLogETest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid27_fpLogETest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid27_fpLogETest_q_i : std_logic_vector(0 downto 0);
    signal exc_R_uid27_fpLogETest_q : std_logic_vector(0 downto 0);
    signal oMz_uid38_fpLogETest_a : std_logic_vector(53 downto 0);
    signal oMz_uid38_fpLogETest_b : std_logic_vector(53 downto 0);
    signal oMz_uid38_fpLogETest_o : std_logic_vector (53 downto 0);
    signal oMz_uid38_fpLogETest_q : std_logic_vector (53 downto 0);
    signal z2_uid40_fpLogETest_q : std_logic_vector (1 downto 0);
    signal wideZero_uid44_fpLogETest_q : std_logic_vector (66 downto 0);
    signal addTermOne_uid45_fpLogETest_s : std_logic_vector (0 downto 0);
    signal addTermOne_uid45_fpLogETest_q : std_logic_vector (66 downto 0);
    signal finalSumOneComp_uid52_fpLogETest_a : std_logic_vector(117 downto 0);
    signal finalSumOneComp_uid52_fpLogETest_b : std_logic_vector(117 downto 0);
    signal finalSumOneComp_uid52_fpLogETest_q_i : std_logic_vector(117 downto 0);
    signal finalSumOneComp_uid52_fpLogETest_q : std_logic_vector(117 downto 0);
    signal cstMSBFinalSumPBias_uid56_fpLogETest_q : std_logic_vector (11 downto 0);
    signal expRExt_uid57_fpLogETest_a : std_logic_vector(12 downto 0);
    signal expRExt_uid57_fpLogETest_b : std_logic_vector(12 downto 0);
    signal expRExt_uid57_fpLogETest_o : std_logic_vector (12 downto 0);
    signal expRExt_uid57_fpLogETest_q : std_logic_vector (12 downto 0);
    signal signRC1_uid73_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signRC1_uid73_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signRC1_uid73_fpLogETest_q_i : std_logic_vector(0 downto 0);
    signal signRC1_uid73_fpLogETest_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid76_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid76_fpLogETest_q_i : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid76_fpLogETest_q : std_logic_vector(0 downto 0);
    signal signRFull_uid77_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signRFull_uid77_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signRFull_uid77_fpLogETest_q_i : std_logic_vector(0 downto 0);
    signal signRFull_uid77_fpLogETest_q : std_logic_vector(0 downto 0);
    signal excREnc_uid79_fpLogETest_q : std_logic_vector(1 downto 0);
    signal oneFracRPostExc2_uid80_fpLogETest_q : std_logic_vector (51 downto 0);
    signal p1_uid92_constMult_q : std_logic_vector(68 downto 0);
    signal rndBit_uid130_natLogPolyEval_q : std_logic_vector (1 downto 0);
    signal rndBit_uid142_natLogPolyEval_q : std_logic_vector (2 downto 0);
    signal zs_uid147_countZ_uid54_fpLogETest_q : std_logic_vector (63 downto 0);
    signal mO_uid150_countZ_uid54_fpLogETest_q : std_logic_vector (8 downto 0);
    signal zs_uid155_countZ_uid54_fpLogETest_q : std_logic_vector (31 downto 0);
    signal zs_uid161_countZ_uid54_fpLogETest_q : std_logic_vector (15 downto 0);
    signal zs_uid167_countZ_uid54_fpLogETest_q : std_logic_vector (7 downto 0);
    signal vCount_uid169_countZ_uid54_fpLogETest_a : std_logic_vector(7 downto 0);
    signal vCount_uid169_countZ_uid54_fpLogETest_b : std_logic_vector(7 downto 0);
    signal vCount_uid169_countZ_uid54_fpLogETest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid169_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal zs_uid173_countZ_uid54_fpLogETest_q : std_logic_vector (3 downto 0);
    signal vCount_uid181_countZ_uid54_fpLogETest_a : std_logic_vector(1 downto 0);
    signal vCount_uid181_countZ_uid54_fpLogETest_b : std_logic_vector(1 downto 0);
    signal vCount_uid181_countZ_uid54_fpLogETest_q_i : std_logic_vector(0 downto 0);
    signal vCount_uid181_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage0Idx3Pad96_uid197_normVal_uid55_fpLogETest_q : std_logic_vector (95 downto 0);
    signal leftShiftStage1Idx3Pad24_uid208_normVal_uid55_fpLogETest_q : std_logic_vector (23 downto 0);
    signal leftShiftStage2Idx3Pad6_uid219_normVal_uid55_fpLogETest_q : std_logic_vector (5 downto 0);
    signal prodXY_uid230_pT1_uid123_natLogPolyEval_a : std_logic_vector (16 downto 0);
    signal prodXY_uid230_pT1_uid123_natLogPolyEval_b : std_logic_vector (16 downto 0);
    signal prodXY_uid230_pT1_uid123_natLogPolyEval_s1 : std_logic_vector (33 downto 0);
    signal prodXY_uid230_pT1_uid123_natLogPolyEval_pr : SIGNED (34 downto 0);
    signal prodXY_uid230_pT1_uid123_natLogPolyEval_q : std_logic_vector (33 downto 0);
    signal topProd_uid235_pT2_uid129_natLogPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid235_pT2_uid129_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid235_pT2_uid129_natLogPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid235_pT2_uid129_natLogPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid235_pT2_uid129_natLogPolyEval_q : std_logic_vector (53 downto 0);
    signal sm0_uid238_pT2_uid129_natLogPolyEval_a : std_logic_vector (2 downto 0);
    signal sm0_uid238_pT2_uid129_natLogPolyEval_b : std_logic_vector (3 downto 0);
    signal sm0_uid238_pT2_uid129_natLogPolyEval_s1 : std_logic_vector (6 downto 0);
    signal sm0_uid238_pT2_uid129_natLogPolyEval_pr : UNSIGNED (6 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid238_pT2_uid129_natLogPolyEval_pr: signal is "logic";
    signal sm0_uid238_pT2_uid129_natLogPolyEval_q : std_logic_vector (6 downto 0);
    signal sm1_uid241_pT2_uid129_natLogPolyEval_a : std_logic_vector (5 downto 0);
    signal sm1_uid241_pT2_uid129_natLogPolyEval_b : std_logic_vector (0 downto 0);
    signal sm1_uid241_pT2_uid129_natLogPolyEval_s1 : std_logic_vector (6 downto 0);
    signal sm1_uid241_pT2_uid129_natLogPolyEval_pr : SIGNED (7 downto 0);
    attribute multstyle of sm1_uid241_pT2_uid129_natLogPolyEval_pr: signal is "logic";
    signal sm1_uid241_pT2_uid129_natLogPolyEval_q : std_logic_vector (6 downto 0);
    signal topProd_uid248_pT3_uid135_natLogPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid248_pT3_uid135_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid248_pT3_uid135_natLogPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid248_pT3_uid135_natLogPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid248_pT3_uid135_natLogPolyEval_q : std_logic_vector (53 downto 0);
    signal topProd_uid265_pT4_uid141_natLogPolyEval_a : std_logic_vector (26 downto 0);
    signal topProd_uid265_pT4_uid141_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal topProd_uid265_pT4_uid141_natLogPolyEval_s1 : std_logic_vector (53 downto 0);
    signal topProd_uid265_pT4_uid141_natLogPolyEval_pr : SIGNED (54 downto 0);
    signal topProd_uid265_pT4_uid141_natLogPolyEval_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b0_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b0_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b0_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b0_pr : UNSIGNED (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b0_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b0_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b0_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b0_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b0_pr : SIGNED (54 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b0_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b1_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b1_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b1_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b1_pr : UNSIGNED (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b1_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b1_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b1_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b1_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b1_pr : SIGNED (54 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b1_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b2_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b2_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b2_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b2_pr : SIGNED (54 downto 0);
    signal postPEMul_uid43_fpLogETest_a0_b2_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b2_a : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b2_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b2_s1 : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b2_pr : SIGNED (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a1_b2_q : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_0_0_a : std_logic_vector(84 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_0_0_b : std_logic_vector(84 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_0_0_o : std_logic_vector (84 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_0_0_q : std_logic_vector (83 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid97_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid97_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid98_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid98_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid98_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid98_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid98_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid98_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid99_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid99_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid99_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid99_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid99_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid99_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid100_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid100_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid100_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid100_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid100_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid100_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid101_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid101_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid101_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid101_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid101_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid101_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC0_uid102_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC0_uid102_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC0_uid102_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC0_uid102_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC0_uid102_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC0_uid102_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid104_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid104_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC1_uid104_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid104_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid104_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC1_uid104_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid105_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid105_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC1_uid105_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid105_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid105_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC1_uid105_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid106_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid106_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC1_uid106_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid106_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid106_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC1_uid106_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid107_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid107_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC1_uid107_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid107_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid107_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC1_uid107_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC1_uid108_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC1_uid108_natLogTabGen_lutmem_ia : std_logic_vector (7 downto 0);
    signal memoryC1_uid108_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC1_uid108_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC1_uid108_natLogTabGen_lutmem_iq : std_logic_vector (7 downto 0);
    signal memoryC1_uid108_natLogTabGen_lutmem_q : std_logic_vector (7 downto 0);
    signal memoryC2_uid110_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid110_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC2_uid110_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC2_uid110_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC2_uid110_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC2_uid110_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC2_uid111_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid111_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC2_uid111_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC2_uid111_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC2_uid111_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC2_uid111_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC2_uid112_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid112_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC2_uid112_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC2_uid112_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC2_uid112_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC2_uid112_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC2_uid113_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC2_uid113_natLogTabGen_lutmem_ia : std_logic_vector (7 downto 0);
    signal memoryC2_uid113_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC2_uid113_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC2_uid113_natLogTabGen_lutmem_iq : std_logic_vector (7 downto 0);
    signal memoryC2_uid113_natLogTabGen_lutmem_q : std_logic_vector (7 downto 0);
    signal memoryC3_uid115_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid115_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC3_uid115_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC3_uid115_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC3_uid115_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC3_uid115_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC3_uid116_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid116_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC3_uid116_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC3_uid116_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC3_uid116_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC3_uid116_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC3_uid117_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC3_uid117_natLogTabGen_lutmem_ia : std_logic_vector (7 downto 0);
    signal memoryC3_uid117_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC3_uid117_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC3_uid117_natLogTabGen_lutmem_iq : std_logic_vector (7 downto 0);
    signal memoryC3_uid117_natLogTabGen_lutmem_q : std_logic_vector (7 downto 0);
    signal memoryC4_uid119_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC4_uid119_natLogTabGen_lutmem_ia : std_logic_vector (9 downto 0);
    signal memoryC4_uid119_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC4_uid119_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC4_uid119_natLogTabGen_lutmem_iq : std_logic_vector (9 downto 0);
    signal memoryC4_uid119_natLogTabGen_lutmem_q : std_logic_vector (9 downto 0);
    signal memoryC4_uid120_natLogTabGen_lutmem_reset0 : std_logic;
    signal memoryC4_uid120_natLogTabGen_lutmem_ia : std_logic_vector (6 downto 0);
    signal memoryC4_uid120_natLogTabGen_lutmem_aa : std_logic_vector (10 downto 0);
    signal memoryC4_uid120_natLogTabGen_lutmem_ab : std_logic_vector (10 downto 0);
    signal memoryC4_uid120_natLogTabGen_lutmem_iq : std_logic_vector (6 downto 0);
    signal memoryC4_uid120_natLogTabGen_lutmem_q : std_logic_vector (6 downto 0);
    type multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a_type is array(0 to 1) of UNSIGNED(17 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a : multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a_type;
    attribute preserve : boolean;
    attribute preserve of multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a : signal is true;
    type multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c_type is array(0 to 1) of SIGNED(17 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c : multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c_type;
    attribute preserve of multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c : signal is true;
    type multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_l_type is array(0 to 1) of SIGNED(18 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_l : multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_l_type;
    type multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_p_type is array(0 to 1) of SIGNED(36 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_p : multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_p_type;
    type multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_w_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_w : multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_w_type;
    type multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_x_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_x : multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_x_type;
    type multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_y_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_y : multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_y_type;
    type multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_s_type is array(0 to 0) of SIGNED(37 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_s : multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_s_type;
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_s0 : std_logic_vector(36 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_q : std_logic_vector (36 downto 0);
    type multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a_type is array(0 to 1) of UNSIGNED(26 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a : multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a_type;
    attribute preserve of multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a : signal is true;
    type multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c_type is array(0 to 1) of SIGNED(26 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c : multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c_type;
    attribute preserve of multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c : signal is true;
    type multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_l_type is array(0 to 1) of SIGNED(27 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_l : multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_l_type;
    type multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_p_type is array(0 to 1) of SIGNED(54 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_p : multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_p_type;
    type multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_w_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_w : multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_w_type;
    type multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_x_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_x : multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_x_type;
    type multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_y_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_y : multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_y_type;
    type multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s_type is array(0 to 1) of SIGNED(55 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s : multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s_type;
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s0 : std_logic_vector(54 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_q : std_logic_vector (54 downto 0);
    signal reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q : std_logic_vector (2 downto 0);
    signal reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q : std_logic_vector (0 downto 0);
    signal reg_sEz_uid41_fpLogETest_0_to_multTermOne_uid42_fpLogETest_2_q : std_logic_vector (53 downto 0);
    signal reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q : std_logic_vector (10 downto 0);
    signal reg_memoryC0_uid97_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid98_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_1_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid99_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_2_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid100_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_3_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid101_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_4_q : std_logic_vector (9 downto 0);
    signal reg_memoryC0_uid102_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_5_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid104_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid105_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_1_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid106_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_2_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid107_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_3_q : std_logic_vector (9 downto 0);
    signal reg_memoryC1_uid108_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_4_q : std_logic_vector (7 downto 0);
    signal reg_memoryC2_uid110_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC2_uid111_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_1_q : std_logic_vector (9 downto 0);
    signal reg_memoryC2_uid112_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_2_q : std_logic_vector (9 downto 0);
    signal reg_memoryC2_uid113_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_3_q : std_logic_vector (7 downto 0);
    signal reg_memoryC4_uid119_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC4_uid120_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_1_q : std_logic_vector (6 downto 0);
    signal reg_yT1_uid122_natLogPolyEval_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_0_q : std_logic_vector (16 downto 0);
    signal reg_os_uid121_natLogTabGen_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_1_q : std_logic_vector (16 downto 0);
    signal reg_memoryC3_uid115_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_0_q : std_logic_vector (9 downto 0);
    signal reg_memoryC3_uid116_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_1_q : std_logic_vector (9 downto 0);
    signal reg_memoryC3_uid117_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_2_q : std_logic_vector (7 downto 0);
    signal reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid234_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_sSM0H_uid236_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_0_q : std_logic_vector (2 downto 0);
    signal reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_q : std_logic_vector (3 downto 0);
    signal reg_sSM1H_uid239_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_0_q : std_logic_vector (5 downto 0);
    signal reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q : std_logic_vector (0 downto 0);
    signal reg_cIncludingRoundingBit_uid131_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_0_q : std_logic_vector (39 downto 0);
    signal reg_R_uid245_pT2_uid129_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_1_q : std_logic_vector (29 downto 0);
    signal reg_xTop18Bits_uid249_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_4_q : std_logic_vector (17 downto 0);
    signal reg_pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_6_q : std_logic_vector (17 downto 0);
    signal reg_pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_7_q : std_logic_vector (16 downto 0);
    signal reg_yTop18Bits_uid252_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_9_q : std_logic_vector (17 downto 0);
    signal reg_xTop27Bits_uid246_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_0_q : std_logic_vector (26 downto 0);
    signal reg_yTop27Bits_uid247_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_1_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid137_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_0_q : std_logic_vector (49 downto 0);
    signal reg_R_uid262_pT3_uid135_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_1_q : std_logic_vector (40 downto 0);
    signal reg_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_4_q : std_logic_vector (26 downto 0);
    signal reg_pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_6_q : std_logic_vector (26 downto 0);
    signal reg_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_7_q : std_logic_vector (25 downto 0);
    signal reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_9_q : std_logic_vector (26 downto 0);
    signal reg_cIncludingRoundingBit_uid143_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_0_q : std_logic_vector (62 downto 0);
    signal reg_R_uid277_pT4_uid141_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_1_q : std_logic_vector (51 downto 0);
    signal reg_postPEMul_uid43_fpLogETest_a_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid43_fpLogETest_b_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_1_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid43_fpLogETest_a_1_0_to_postPEMul_uid43_fpLogETest_a1_b0_0_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid43_fpLogETest_b_1_0_to_postPEMul_uid43_fpLogETest_a0_b1_1_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid43_fpLogETest_align_0_0_to_postPEMul_uid43_fpLogETest_result_add_0_0_0_q : std_logic_vector (53 downto 0);
    signal reg_postPEMul_uid43_fpLogETest_b_2_0_to_postPEMul_uid43_fpLogETest_a0_b2_1_q : std_logic_vector (26 downto 0);
    signal reg_postPEMul_uid43_fpLogETest_align_2_0_to_postPEMul_uid43_fpLogETest_result_add_0_1_0_q : std_logic_vector (108 downto 0);
    signal reg_xv1_uid91_constMult_0_to_p1_uid92_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_q : std_logic_vector (5 downto 0);
    signal reg_sR_uid95_constMult_0_to_addTermOne_uid45_fpLogETest_2_q : std_logic_vector (66 downto 0);
    signal reg_highBBits_uid47_fpLogETest_0_to_sumAHighB_uid48_fpLogETest_1_q : std_logic_vector (58 downto 0);
    signal reg_lowRangeB_uid46_fpLogETest_0_to_finalSum_uid46_uid49_fpLogETest_0_q : std_logic_vector (49 downto 0);
    signal reg_rVStage_uid148_countZ_uid54_fpLogETest_0_to_vCount_uid149_countZ_uid54_fpLogETest_1_q : std_logic_vector (63 downto 0);
    signal reg_rVStage_uid156_countZ_uid54_fpLogETest_0_to_vCount_uid157_countZ_uid54_fpLogETest_1_q : std_logic_vector (31 downto 0);
    signal reg_vStage_uid158_countZ_uid54_fpLogETest_0_to_vStagei_uid160_countZ_uid54_fpLogETest_3_q : std_logic_vector (31 downto 0);
    signal reg_rVStage_uid162_countZ_uid54_fpLogETest_0_to_vCount_uid163_countZ_uid54_fpLogETest_1_q : std_logic_vector (15 downto 0);
    signal reg_vStage_uid164_countZ_uid54_fpLogETest_0_to_vStagei_uid166_countZ_uid54_fpLogETest_3_q : std_logic_vector (15 downto 0);
    signal reg_rVStage_uid168_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_2_q : std_logic_vector (7 downto 0);
    signal reg_vStage_uid170_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_3_q : std_logic_vector (7 downto 0);
    signal reg_rVStage_uid180_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_2_q : std_logic_vector (1 downto 0);
    signal reg_vStage_uid182_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_3_q : std_logic_vector (1 downto 0);
    signal reg_vCount_uid175_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_2_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_q : std_logic_vector (0 downto 0);
    signal reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q : std_logic_vector (0 downto 0);
    signal reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_q : std_logic_vector (118 downto 0);
    signal reg_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_3_q : std_logic_vector (118 downto 0);
    signal reg_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_4_q : std_logic_vector (118 downto 0);
    signal reg_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_5_q : std_logic_vector (118 downto 0);
    signal reg_leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage0_uid201_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_2_q : std_logic_vector (118 downto 0);
    signal reg_leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_3_q : std_logic_vector (118 downto 0);
    signal reg_leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_4_q : std_logic_vector (118 downto 0);
    signal reg_leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_5_q : std_logic_vector (118 downto 0);
    signal reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q : std_logic_vector (1 downto 0);
    signal reg_leftShiftStage1_uid212_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_2_q : std_logic_vector (118 downto 0);
    signal reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0_q : std_logic_vector (65 downto 0);
    signal reg_fracR_uid61_fpLogETest_0_to_fracRPostExc_uid83_fpLogETest_3_q : std_logic_vector (51 downto 0);
    signal reg_expR_uid62_fpLogETest_0_to_expRPostExc_uid87_fpLogETest_3_q : std_logic_vector (10 downto 0);
    signal reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q : std_logic_vector (0 downto 0);
    signal ld_FullSumAB117_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b_q : std_logic_vector (0 downto 0);
    signal ld_r_uid188_countZ_uid54_fpLogETest_q_to_expRExt_uid57_fpLogETest_b_q : std_logic_vector (6 downto 0);
    signal ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c_q : std_logic_vector (0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_cStage_uid152_countZ_uid54_fpLogETest_b_q : std_logic_vector (54 downto 0);
    signal ld_rVStage_uid148_countZ_uid54_fpLogETest_b_to_vStagei_uid154_countZ_uid54_fpLogETest_c_q : std_logic_vector (63 downto 0);
    signal ld_vCount_uid169_countZ_uid54_fpLogETest_q_to_r_uid188_countZ_uid54_fpLogETest_d_q : std_logic_vector (0 downto 0);
    signal ld_reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q_to_r_uid188_countZ_uid54_fpLogETest_g_q : std_logic_vector (0 downto 0);
    signal ld_LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_b_q : std_logic_vector (116 downto 0);
    signal ld_LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_b_q : std_logic_vector (114 downto 0);
    signal ld_LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_b_q : std_logic_vector (112 downto 0);
    signal ld_reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_b_q : std_logic_vector (1 downto 0);
    signal ld_leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_b_to_leftShiftStage3_uid228_normVal_uid55_fpLogETest_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q_to_sm1_uid241_pT2_uid129_natLogPolyEval_b_q : std_logic_vector (0 downto 0);
    signal ld_reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_topProd_uid265_pT4_uid141_natLogPolyEval_1_q_to_topProd_uid265_pT4_uid141_natLogPolyEval_b_q : std_logic_vector (26 downto 0);
    signal ld_yBottomBits_uid266_pT4_uid141_natLogPolyEval_b_to_spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval_a_q : std_logic_vector (22 downto 0);
    signal ld_postPEMul_uid43_fpLogETest_addcol_1_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_1_a_q : std_logic_vector (55 downto 0);
    signal ld_postPEMul_uid43_fpLogETest_addcol_2_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_2_a_q : std_logic_vector (54 downto 0);
    signal ld_postPEMul_uid43_fpLogETest_a1_b2_q_to_postPEMul_uid43_fpLogETest_align_3_a_q : std_logic_vector (53 downto 0);
    signal ld_sSM0W_uid237_pT2_uid129_natLogPolyEval_b_to_reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_a_q : std_logic_vector (3 downto 0);
    signal ld_xv0_uid90_constMult_b_to_reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_a_q : std_logic_vector (5 downto 0);
    signal ld_vCount_uid163_countZ_uid54_fpLogETest_q_to_reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_a_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid157_countZ_uid54_fpLogETest_q_to_reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_a_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_inputreg_q : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ia : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_iq : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_q : std_logic_vector (10 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq : std_logic;
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_inputreg_q : std_logic_vector (51 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_ia : std_logic_vector (51 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_iq : std_logic_vector (51 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_q : std_logic_vector (51 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_reset0 : std_logic;
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_ia : std_logic_vector (51 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_iq : std_logic_vector (51 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_q : std_logic_vector (51 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_eq : std_logic;
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_sticky_ena_q : signal is true;
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_sticky_ena_q : signal is true;
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_reset0 : std_logic;
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_eq : std_logic;
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_sticky_ena_q : signal is true;
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_eq : std_logic;
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_inputreg_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_inputreg_q : std_logic_vector (2 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_reset0 : std_logic;
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_ia : std_logic_vector (2 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_aa : std_logic_vector (5 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_ab : std_logic_vector (5 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_iq : std_logic_vector (2 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_q : std_logic_vector (2 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_i : unsigned(5 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_eq : std_logic;
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_mem_top_q : std_logic_vector (6 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_sticky_ena_q : signal is true;
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_inputreg_q : std_logic_vector (27 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_ia : std_logic_vector (27 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_iq : std_logic_vector (27 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_q : std_logic_vector (27 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_sticky_ena_q : signal is true;
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_inputreg_q : std_logic_vector (37 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_ia : std_logic_vector (37 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_iq : std_logic_vector (37 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_q : std_logic_vector (37 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_sticky_ena_q : signal is true;
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_inputreg_q : std_logic_vector (41 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_ia : std_logic_vector (41 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_aa : std_logic_vector (2 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_ab : std_logic_vector (2 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_iq : std_logic_vector (41 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_q : std_logic_vector (41 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_i : unsigned(2 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_mem_top_q : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_sticky_ena_q : signal is true;
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_inputreg_q : std_logic_vector (47 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_ia : std_logic_vector (47 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_iq : std_logic_vector (47 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_q : std_logic_vector (47 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_sticky_ena_q : signal is true;
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_inputreg_q : std_logic_vector (59 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_ia : std_logic_vector (59 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_iq : std_logic_vector (59 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_q : std_logic_vector (59 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdreg_q : std_logic_vector (4 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_sticky_ena_q : signal is true;
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_inputreg_q : std_logic_vector (86 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_reset0 : std_logic;
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_ia : std_logic_vector (86 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_iq : std_logic_vector (86 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_q : std_logic_vector (86 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_sticky_ena_q : signal is true;
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_reset0 : std_logic;
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_ia : std_logic_vector (54 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_iq : std_logic_vector (54 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_q : std_logic_vector (54 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_sticky_ena_q : signal is true;
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_inputreg_q : std_logic_vector (22 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_reset0 : std_logic;
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_ia : std_logic_vector (22 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_iq : std_logic_vector (22 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_q : std_logic_vector (22 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_sticky_ena_q : signal is true;
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_reset0 : std_logic;
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_ia : std_logic_vector (41 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_iq : std_logic_vector (41 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_q : std_logic_vector (41 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_eq : std_logic;
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_sticky_ena_q : signal is true;
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_inputreg_q : std_logic_vector (14 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_reset0 : std_logic;
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_ia : std_logic_vector (14 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_iq : std_logic_vector (14 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_q : std_logic_vector (14 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_eq : std_logic;
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_sticky_ena_q : signal is true;
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_inputreg_q : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_reset0 : std_logic;
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_ia : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_iq : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_q : std_logic_vector (26 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_sticky_ena_q : signal is true;
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_inputreg_q : std_logic_vector (118 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_reset0 : std_logic;
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_ia : std_logic_vector (118 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_iq : std_logic_vector (118 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_q : std_logic_vector (118 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_sticky_ena_q : std_logic_vector (0 downto 0);
    attribute preserve of ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_sticky_ena_q : signal is true;
    signal pad_o_uid11_uid38_fpLogETest_q : std_logic_vector (52 downto 0);
    signal FPOne_uid63_fpLogETest_q : std_logic_vector (63 downto 0);
    signal pad_sm0_uid238_uid242_pT2_uid129_natLogPolyEval_q : std_logic_vector (26 downto 0);
    signal pad_sm1_uid241_uid243_pT2_uid129_natLogPolyEval_q : std_logic_vector (26 downto 0);
    signal spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval_q : std_logic_vector (23 downto 0);
    signal pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_q : std_logic_vector (25 downto 0);
    signal pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_q : std_logic_vector (26 downto 0);
    signal expFracPostRnd_uid60_fpLogETest_a : std_logic_vector(66 downto 0);
    signal expFracPostRnd_uid60_fpLogETest_b : std_logic_vector(66 downto 0);
    signal expFracPostRnd_uid60_fpLogETest_o : std_logic_vector (66 downto 0);
    signal expFracPostRnd_uid60_fpLogETest_q : std_logic_vector (66 downto 0);
    signal notC_uid71_fpLogETest_a : std_logic_vector(0 downto 0);
    signal notC_uid71_fpLogETest_q : std_logic_vector(0 downto 0);
    signal postPEMul_uid43_fpLogETest_addcol_1_add_0_0_a : std_logic_vector(56 downto 0);
    signal postPEMul_uid43_fpLogETest_addcol_1_add_0_0_b : std_logic_vector(56 downto 0);
    signal postPEMul_uid43_fpLogETest_addcol_1_add_0_0_o : std_logic_vector (56 downto 0);
    signal postPEMul_uid43_fpLogETest_addcol_1_add_0_0_q : std_logic_vector (55 downto 0);
    signal postPEMul_uid43_fpLogETest_addcol_2_add_0_0_a : std_logic_vector(54 downto 0);
    signal postPEMul_uid43_fpLogETest_addcol_2_add_0_0_b : std_logic_vector(54 downto 0);
    signal postPEMul_uid43_fpLogETest_addcol_2_add_0_0_o : std_logic_vector (54 downto 0);
    signal postPEMul_uid43_fpLogETest_addcol_2_add_0_0_q : std_logic_vector (54 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_q : std_logic_vector (4 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal expX_uid6_fpLogETest_in : std_logic_vector (62 downto 0);
    signal expX_uid6_fpLogETest_b : std_logic_vector (10 downto 0);
    signal signX_uid7_fpLogETest_in : std_logic_vector (63 downto 0);
    signal signX_uid7_fpLogETest_b : std_logic_vector (0 downto 0);
    signal frac_uid19_fpLogETest_in : std_logic_vector (51 downto 0);
    signal frac_uid19_fpLogETest_b : std_logic_vector (51 downto 0);
    signal excRZero_uid64_fpLogETest_a : std_logic_vector(63 downto 0);
    signal excRZero_uid64_fpLogETest_b : std_logic_vector(63 downto 0);
    signal excRZero_uid64_fpLogETest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid16_fpLogETest_a : std_logic_vector(10 downto 0);
    signal expXIsZero_uid16_fpLogETest_b : std_logic_vector(10 downto 0);
    signal expXIsZero_uid16_fpLogETest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid18_fpLogETest_a : std_logic_vector(10 downto 0);
    signal expXIsMax_uid18_fpLogETest_b : std_logic_vector(10 downto 0);
    signal expXIsMax_uid18_fpLogETest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid20_fpLogETest_a : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid20_fpLogETest_b : std_logic_vector(51 downto 0);
    signal fracXIsZero_uid20_fpLogETest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid21_fpLogETest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid21_fpLogETest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid21_fpLogETest_q : std_logic_vector(0 downto 0);
    signal e_uid29_fpLogETest_a : std_logic_vector(11 downto 0);
    signal e_uid29_fpLogETest_b : std_logic_vector(11 downto 0);
    signal e_uid29_fpLogETest_o : std_logic_vector (11 downto 0);
    signal e_uid29_fpLogETest_q : std_logic_vector (11 downto 0);
    signal c_uid31_fpLogETest_a : std_logic_vector(10 downto 0);
    signal c_uid31_fpLogETest_b : std_logic_vector(10 downto 0);
    signal c_uid31_fpLogETest_q : std_logic_vector(0 downto 0);
    signal multTermOne_uid42_fpLogETest_s : std_logic_vector (0 downto 0);
    signal multTermOne_uid42_fpLogETest_q : std_logic_vector (53 downto 0);
    signal sumAHighB_uid48_fpLogETest_a : std_logic_vector(67 downto 0);
    signal sumAHighB_uid48_fpLogETest_b : std_logic_vector(67 downto 0);
    signal sumAHighB_uid48_fpLogETest_o : std_logic_vector (67 downto 0);
    signal sumAHighB_uid48_fpLogETest_q : std_logic_vector (67 downto 0);
    signal finalSumAbs_uid53_fpLogETest_a : std_logic_vector(118 downto 0);
    signal finalSumAbs_uid53_fpLogETest_b : std_logic_vector(118 downto 0);
    signal finalSumAbs_uid53_fpLogETest_o : std_logic_vector (118 downto 0);
    signal finalSumAbs_uid53_fpLogETest_q : std_logic_vector (118 downto 0);
    signal signRC11_uid74_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signRC11_uid74_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signRC11_uid74_fpLogETest_q : std_logic_vector(0 downto 0);
    signal signR_uid75_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signR_uid75_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signR_uid75_fpLogETest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid83_fpLogETest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid83_fpLogETest_q : std_logic_vector (51 downto 0);
    signal expRPostExc_uid87_fpLogETest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid87_fpLogETest_q : std_logic_vector (10 downto 0);
    signal p0_uid93_constMult_q : std_logic_vector(62 downto 0);
    signal lev1_a0_uid94_constMult_a : std_logic_vector(70 downto 0);
    signal lev1_a0_uid94_constMult_b : std_logic_vector(70 downto 0);
    signal lev1_a0_uid94_constMult_o : std_logic_vector (70 downto 0);
    signal lev1_a0_uid94_constMult_q : std_logic_vector (69 downto 0);
    signal ts2_uid132_natLogPolyEval_a : std_logic_vector(40 downto 0);
    signal ts2_uid132_natLogPolyEval_b : std_logic_vector(40 downto 0);
    signal ts2_uid132_natLogPolyEval_o : std_logic_vector (40 downto 0);
    signal ts2_uid132_natLogPolyEval_q : std_logic_vector (40 downto 0);
    signal ts3_uid138_natLogPolyEval_a : std_logic_vector(50 downto 0);
    signal ts3_uid138_natLogPolyEval_b : std_logic_vector(50 downto 0);
    signal ts3_uid138_natLogPolyEval_o : std_logic_vector (50 downto 0);
    signal ts3_uid138_natLogPolyEval_q : std_logic_vector (50 downto 0);
    signal ts4_uid144_natLogPolyEval_a : std_logic_vector(63 downto 0);
    signal ts4_uid144_natLogPolyEval_b : std_logic_vector(63 downto 0);
    signal ts4_uid144_natLogPolyEval_o : std_logic_vector (63 downto 0);
    signal ts4_uid144_natLogPolyEval_q : std_logic_vector (63 downto 0);
    signal vCount_uid149_countZ_uid54_fpLogETest_a : std_logic_vector(63 downto 0);
    signal vCount_uid149_countZ_uid54_fpLogETest_b : std_logic_vector(63 downto 0);
    signal vCount_uid149_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vCount_uid157_countZ_uid54_fpLogETest_a : std_logic_vector(31 downto 0);
    signal vCount_uid157_countZ_uid54_fpLogETest_b : std_logic_vector(31 downto 0);
    signal vCount_uid157_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid160_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid160_countZ_uid54_fpLogETest_q : std_logic_vector (31 downto 0);
    signal vCount_uid163_countZ_uid54_fpLogETest_a : std_logic_vector(15 downto 0);
    signal vCount_uid163_countZ_uid54_fpLogETest_b : std_logic_vector(15 downto 0);
    signal vCount_uid163_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid166_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid166_countZ_uid54_fpLogETest_q : std_logic_vector (15 downto 0);
    signal vStagei_uid172_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid172_countZ_uid54_fpLogETest_q : std_logic_vector (7 downto 0);
    signal vStagei_uid184_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid184_countZ_uid54_fpLogETest_q : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid212_normVal_uid55_fpLogETest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid212_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal add0_uid242_pT2_uid129_natLogPolyEval_a : std_logic_vector (54 downto 0);
    signal add0_uid242_pT2_uid129_natLogPolyEval_b : std_logic_vector (54 downto 0);
    signal add0_uid242_pT2_uid129_natLogPolyEval_c : std_logic_vector (54 downto 0);
    signal add0_uid242_pT2_uid129_natLogPolyEval_o : std_logic_vector (54 downto 0);
    signal add0_uid242_pT2_uid129_natLogPolyEval_q : std_logic_vector (54 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal sEz_uid41_fpLogETest_q : std_logic_vector (53 downto 0);
    signal leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal cIncludingRoundingBit_uid131_natLogPolyEval_q : std_logic_vector (39 downto 0);
    signal cIncludingRoundingBit_uid137_natLogPolyEval_q : std_logic_vector (49 downto 0);
    signal cIncludingRoundingBit_uid143_natLogPolyEval_q : std_logic_vector (62 downto 0);
    signal leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal cStage_uid152_countZ_uid54_fpLogETest_q : std_logic_vector (63 downto 0);
    signal leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal prodXYTruncFR_uid231_pT1_uid123_natLogPolyEval_in : std_logic_vector (33 downto 0);
    signal prodXYTruncFR_uid231_pT1_uid123_natLogPolyEval_b : std_logic_vector (18 downto 0);
    signal postPEMul_uid43_fpLogETest_align_0_q_int : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_align_0_q : std_logic_vector (53 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_in : std_logic_vector (36 downto 0);
    signal multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_b : std_logic_vector (32 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_in : std_logic_vector (54 downto 0);
    signal multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_b : std_logic_vector (51 downto 0);
    signal os_uid103_natLogTabGen_q : std_logic_vector (59 downto 0);
    signal os_uid109_natLogTabGen_q : std_logic_vector (47 downto 0);
    signal os_uid114_natLogTabGen_q : std_logic_vector (37 downto 0);
    signal os_uid121_natLogTabGen_q : std_logic_vector (16 downto 0);
    signal os_uid118_natLogTabGen_q : std_logic_vector (27 downto 0);
    signal finalSum_uid46_uid49_fpLogETest_q : std_logic_vector (117 downto 0);
    signal leftShiftStage2_uid223_normVal_uid55_fpLogETest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage2_uid223_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal RLn_uid88_fpLogETest_q : std_logic_vector (63 downto 0);
    signal vStagei_uid154_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid154_countZ_uid54_fpLogETest_q : std_logic_vector (63 downto 0);
    signal postPEMul_uid43_fpLogETest_align_1_q_int : std_logic_vector (82 downto 0);
    signal postPEMul_uid43_fpLogETest_align_1_q : std_logic_vector (82 downto 0);
    signal postPEMul_uid43_fpLogETest_align_2_q_int : std_logic_vector (108 downto 0);
    signal postPEMul_uid43_fpLogETest_align_2_q : std_logic_vector (108 downto 0);
    signal postPEMul_uid43_fpLogETest_align_3_q_int : std_logic_vector (134 downto 0);
    signal postPEMul_uid43_fpLogETest_align_3_q : std_logic_vector (134 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal zPPolyEval_uid35_fpLogETest_in : std_logic_vector (41 downto 0);
    signal zPPolyEval_uid35_fpLogETest_b : std_logic_vector (41 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_a : std_logic_vector(5 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_b : std_logic_vector(5 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_a : std_logic_vector(6 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_b : std_logic_vector(6 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_a : std_logic_vector(3 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_b : std_logic_vector(3 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal yT3_uid134_natLogPolyEval_in : std_logic_vector (41 downto 0);
    signal yT3_uid134_natLogPolyEval_b : std_logic_vector (37 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_a : std_logic_vector(3 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_b : std_logic_vector(3 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_a : std_logic_vector(5 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_b : std_logic_vector(5 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_q : std_logic_vector(0 downto 0);
    signal xTop27Bits_uid263_pT4_uid141_natLogPolyEval_in : std_logic_vector (41 downto 0);
    signal xTop27Bits_uid263_pT4_uid141_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_a : std_logic_vector(4 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_b : std_logic_vector(4 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_q : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_a : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_b : std_logic_vector(0 downto 0);
    signal ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_q : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_q : std_logic_vector(0 downto 0);
    signal fracR_uid61_fpLogETest_in : std_logic_vector (52 downto 0);
    signal fracR_uid61_fpLogETest_b : std_logic_vector (51 downto 0);
    signal expR_uid62_fpLogETest_in : std_logic_vector (63 downto 0);
    signal expR_uid62_fpLogETest_b : std_logic_vector (10 downto 0);
    signal InvSignX_uid65_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid65_fpLogETest_q : std_logic_vector(0 downto 0);
    signal zAddrLow_uid33_fpLogETest_in : std_logic_vector (51 downto 0);
    signal zAddrLow_uid33_fpLogETest_b : std_logic_vector (9 downto 0);
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
    signal xv1_uid91_constMult_in : std_logic_vector (11 downto 0);
    signal xv1_uid91_constMult_b : std_logic_vector (5 downto 0);
    signal addr_uid34_fpLogETest_q : std_logic_vector (10 downto 0);
    signal postPEMul_uid43_fpLogETest_a_0_in : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a_0_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_a_1_in : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_a_1_b : std_logic_vector (26 downto 0);
    signal rVStage_uid148_countZ_uid54_fpLogETest_in : std_logic_vector (118 downto 0);
    signal rVStage_uid148_countZ_uid54_fpLogETest_b : std_logic_vector (63 downto 0);
    signal vStage_uid151_countZ_uid54_fpLogETest_in : std_logic_vector (54 downto 0);
    signal vStage_uid151_countZ_uid54_fpLogETest_b : std_logic_vector (54 downto 0);
    signal X86dto0_uid192_normVal_uid55_fpLogETest_in : std_logic_vector (86 downto 0);
    signal X86dto0_uid192_normVal_uid55_fpLogETest_b : std_logic_vector (86 downto 0);
    signal X22dto0_uid198_normVal_uid55_fpLogETest_in : std_logic_vector (22 downto 0);
    signal X22dto0_uid198_normVal_uid55_fpLogETest_b : std_logic_vector (22 downto 0);
    signal sR_uid95_constMult_in : std_logic_vector (68 downto 0);
    signal sR_uid95_constMult_b : std_logic_vector (66 downto 0);
    signal s2_uid133_natLogPolyEval_in : std_logic_vector (40 downto 0);
    signal s2_uid133_natLogPolyEval_b : std_logic_vector (39 downto 0);
    signal s3_uid139_natLogPolyEval_in : std_logic_vector (50 downto 0);
    signal s3_uid139_natLogPolyEval_b : std_logic_vector (49 downto 0);
    signal s4_uid145_natLogPolyEval_in : std_logic_vector (63 downto 0);
    signal s4_uid145_natLogPolyEval_b : std_logic_vector (62 downto 0);
    signal rVStage_uid162_countZ_uid54_fpLogETest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid162_countZ_uid54_fpLogETest_b : std_logic_vector (15 downto 0);
    signal vStage_uid164_countZ_uid54_fpLogETest_in : std_logic_vector (15 downto 0);
    signal vStage_uid164_countZ_uid54_fpLogETest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid168_countZ_uid54_fpLogETest_in : std_logic_vector (15 downto 0);
    signal rVStage_uid168_countZ_uid54_fpLogETest_b : std_logic_vector (7 downto 0);
    signal vStage_uid170_countZ_uid54_fpLogETest_in : std_logic_vector (7 downto 0);
    signal vStage_uid170_countZ_uid54_fpLogETest_b : std_logic_vector (7 downto 0);
    signal rVStage_uid174_countZ_uid54_fpLogETest_in : std_logic_vector (7 downto 0);
    signal rVStage_uid174_countZ_uid54_fpLogETest_b : std_logic_vector (3 downto 0);
    signal vStage_uid176_countZ_uid54_fpLogETest_in : std_logic_vector (3 downto 0);
    signal vStage_uid176_countZ_uid54_fpLogETest_b : std_logic_vector (3 downto 0);
    signal rVStage_uid186_countZ_uid54_fpLogETest_in : std_logic_vector (1 downto 0);
    signal rVStage_uid186_countZ_uid54_fpLogETest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_in : std_logic_vector (116 downto 0);
    signal LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_b : std_logic_vector (116 downto 0);
    signal LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_in : std_logic_vector (114 downto 0);
    signal LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_b : std_logic_vector (114 downto 0);
    signal LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_in : std_logic_vector (112 downto 0);
    signal LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_b : std_logic_vector (112 downto 0);
    signal R_uid245_pT2_uid129_natLogPolyEval_in : std_logic_vector (53 downto 0);
    signal R_uid245_pT2_uid129_natLogPolyEval_b : std_logic_vector (29 downto 0);
    signal lowRangeB_uid124_natLogPolyEval_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid124_natLogPolyEval_b : std_logic_vector (0 downto 0);
    signal highBBits_uid125_natLogPolyEval_in : std_logic_vector (18 downto 0);
    signal highBBits_uid125_natLogPolyEval_b : std_logic_vector (17 downto 0);
    signal lowRangeB_uid258_pT3_uid135_natLogPolyEval_in : std_logic_vector (3 downto 0);
    signal lowRangeB_uid258_pT3_uid135_natLogPolyEval_b : std_logic_vector (3 downto 0);
    signal highBBits_uid259_pT3_uid135_natLogPolyEval_in : std_logic_vector (32 downto 0);
    signal highBBits_uid259_pT3_uid135_natLogPolyEval_b : std_logic_vector (28 downto 0);
    signal lowRangeB_uid273_pT4_uid141_natLogPolyEval_in : std_logic_vector (22 downto 0);
    signal lowRangeB_uid273_pT4_uid141_natLogPolyEval_b : std_logic_vector (22 downto 0);
    signal highBBits_uid274_pT4_uid141_natLogPolyEval_in : std_logic_vector (51 downto 0);
    signal highBBits_uid274_pT4_uid141_natLogPolyEval_b : std_logic_vector (28 downto 0);
    signal FullSumAB117_uid50_fpLogETest_in : std_logic_vector (117 downto 0);
    signal FullSumAB117_uid50_fpLogETest_b : std_logic_vector (0 downto 0);
    signal LeftShiftStage2117dto0_uid225_normVal_uid55_fpLogETest_in : std_logic_vector (117 downto 0);
    signal LeftShiftStage2117dto0_uid225_normVal_uid55_fpLogETest_b : std_logic_vector (117 downto 0);
    signal rVStage_uid156_countZ_uid54_fpLogETest_in : std_logic_vector (63 downto 0);
    signal rVStage_uid156_countZ_uid54_fpLogETest_b : std_logic_vector (31 downto 0);
    signal vStage_uid158_countZ_uid54_fpLogETest_in : std_logic_vector (31 downto 0);
    signal vStage_uid158_countZ_uid54_fpLogETest_b : std_logic_vector (31 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_0_1_a : std_logic_vector(135 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_0_1_b : std_logic_vector(135 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_0_1_o : std_logic_vector (135 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_0_1_q : std_logic_vector (135 downto 0);
    signal yT1_uid122_natLogPolyEval_in : std_logic_vector (41 downto 0);
    signal yT1_uid122_natLogPolyEval_b : std_logic_vector (16 downto 0);
    signal yT2_uid128_natLogPolyEval_in : std_logic_vector (41 downto 0);
    signal yT2_uid128_natLogPolyEval_b : std_logic_vector (27 downto 0);
    signal xBottomBits_uid267_pT4_uid141_natLogPolyEval_in : std_logic_vector (14 downto 0);
    signal xBottomBits_uid267_pT4_uid141_natLogPolyEval_b : std_logic_vector (14 downto 0);
    signal xTop27Bits_uid246_pT3_uid135_natLogPolyEval_in : std_logic_vector (37 downto 0);
    signal xTop27Bits_uid246_pT3_uid135_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal xTop18Bits_uid249_pT3_uid135_natLogPolyEval_in : std_logic_vector (37 downto 0);
    signal xTop18Bits_uid249_pT3_uid135_natLogPolyEval_b : std_logic_vector (17 downto 0);
    signal xBottomBits_uid251_pT3_uid135_natLogPolyEval_in : std_logic_vector (10 downto 0);
    signal xBottomBits_uid251_pT3_uid135_natLogPolyEval_b : std_logic_vector (10 downto 0);
    signal negNonZero_uid69_fpLogETest_a : std_logic_vector(0 downto 0);
    signal negNonZero_uid69_fpLogETest_b : std_logic_vector(0 downto 0);
    signal negNonZero_uid69_fpLogETest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid23_fpLogETest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid23_fpLogETest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid23_fpLogETest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid67_fpLogETest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid67_fpLogETest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid67_fpLogETest_q : std_logic_vector(0 downto 0);
    signal yTop27Bits_uid247_pT3_uid135_natLogPolyEval_in : std_logic_vector (39 downto 0);
    signal yTop27Bits_uid247_pT3_uid135_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid250_pT3_uid135_natLogPolyEval_in : std_logic_vector (12 downto 0);
    signal yBottomBits_uid250_pT3_uid135_natLogPolyEval_b : std_logic_vector (12 downto 0);
    signal yTop18Bits_uid252_pT3_uid135_natLogPolyEval_in : std_logic_vector (39 downto 0);
    signal yTop18Bits_uid252_pT3_uid135_natLogPolyEval_b : std_logic_vector (17 downto 0);
    signal yTop27Bits_uid264_pT4_uid141_natLogPolyEval_in : std_logic_vector (49 downto 0);
    signal yTop27Bits_uid264_pT4_uid141_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal yBottomBits_uid266_pT4_uid141_natLogPolyEval_in : std_logic_vector (22 downto 0);
    signal yBottomBits_uid266_pT4_uid141_natLogPolyEval_b : std_logic_vector (22 downto 0);
    signal peOR_uid37_fpLogETest_in : std_logic_vector (61 downto 0);
    signal peOR_uid37_fpLogETest_b : std_logic_vector (54 downto 0);
    signal vCount_uid175_countZ_uid54_fpLogETest_a : std_logic_vector(3 downto 0);
    signal vCount_uid175_countZ_uid54_fpLogETest_b : std_logic_vector(3 downto 0);
    signal vCount_uid175_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid178_countZ_uid54_fpLogETest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid178_countZ_uid54_fpLogETest_q : std_logic_vector (3 downto 0);
    signal vCount_uid187_countZ_uid54_fpLogETest_a : std_logic_vector(0 downto 0);
    signal vCount_uid187_countZ_uid54_fpLogETest_b : std_logic_vector(0 downto 0);
    signal vCount_uid187_countZ_uid54_fpLogETest_q : std_logic_vector(0 downto 0);
    signal sumAHighB_uid126_natLogPolyEval_a : std_logic_vector(28 downto 0);
    signal sumAHighB_uid126_natLogPolyEval_b : std_logic_vector(28 downto 0);
    signal sumAHighB_uid126_natLogPolyEval_o : std_logic_vector (28 downto 0);
    signal sumAHighB_uid126_natLogPolyEval_q : std_logic_vector (28 downto 0);
    signal sumAHighB_uid260_pT3_uid135_natLogPolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid260_pT3_uid135_natLogPolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid260_pT3_uid135_natLogPolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid260_pT3_uid135_natLogPolyEval_q : std_logic_vector (54 downto 0);
    signal sumAHighB_uid275_pT4_uid141_natLogPolyEval_a : std_logic_vector(54 downto 0);
    signal sumAHighB_uid275_pT4_uid141_natLogPolyEval_b : std_logic_vector(54 downto 0);
    signal sumAHighB_uid275_pT4_uid141_natLogPolyEval_o : std_logic_vector (54 downto 0);
    signal sumAHighB_uid275_pT4_uid141_natLogPolyEval_q : std_logic_vector (54 downto 0);
    signal signTerm2_uid72_fpLogETest_a : std_logic_vector(0 downto 0);
    signal signTerm2_uid72_fpLogETest_b : std_logic_vector(0 downto 0);
    signal signTerm2_uid72_fpLogETest_q : std_logic_vector(0 downto 0);
    signal leftShiftStage3Idx1_uid226_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_1_0_a : std_logic_vector(136 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_1_0_b : std_logic_vector(136 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_1_0_o : std_logic_vector (136 downto 0);
    signal postPEMul_uid43_fpLogETest_result_add_1_0_q : std_logic_vector (136 downto 0);
    signal xTop27Bits_uid233_pT2_uid129_natLogPolyEval_in : std_logic_vector (27 downto 0);
    signal xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal sSM0W_uid237_pT2_uid129_natLogPolyEval_in : std_logic_vector (27 downto 0);
    signal sSM0W_uid237_pT2_uid129_natLogPolyEval_b : std_logic_vector (3 downto 0);
    signal sSM1W_uid240_pT2_uid129_natLogPolyEval_in : std_logic_vector (0 downto 0);
    signal sSM1W_uid240_pT2_uid129_natLogPolyEval_b : std_logic_vector (0 downto 0);
    signal pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_q : std_logic_vector (16 downto 0);
    signal excRNaN_uid70_fpLogETest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid70_fpLogETest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid70_fpLogETest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid24_fpLogETest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid24_fpLogETest_q : std_logic_vector(0 downto 0);
    signal concExc_uid78_fpLogETest_q : std_logic_vector (2 downto 0);
    signal spad_yBottomBits_uid250_uid253_pT3_uid135_natLogPolyEval_q : std_logic_vector (13 downto 0);
    signal postPEMul_uid43_fpLogETest_b_0_in : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_b_0_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_b_1_in : std_logic_vector (53 downto 0);
    signal postPEMul_uid43_fpLogETest_b_1_b : std_logic_vector (26 downto 0);
    signal postPEMul_uid43_fpLogETest_b_2_in : std_logic_vector (80 downto 0);
    signal postPEMul_uid43_fpLogETest_b_2_b : std_logic_vector (26 downto 0);
    signal rVStage_uid180_countZ_uid54_fpLogETest_in : std_logic_vector (3 downto 0);
    signal rVStage_uid180_countZ_uid54_fpLogETest_b : std_logic_vector (1 downto 0);
    signal vStage_uid182_countZ_uid54_fpLogETest_in : std_logic_vector (1 downto 0);
    signal vStage_uid182_countZ_uid54_fpLogETest_b : std_logic_vector (1 downto 0);
    signal r_uid188_countZ_uid54_fpLogETest_q : std_logic_vector (6 downto 0);
    signal s1_uid124_uid127_natLogPolyEval_q : std_logic_vector (29 downto 0);
    signal add0_uid258_uid261_pT3_uid135_natLogPolyEval_q : std_logic_vector (58 downto 0);
    signal add0_uid273_uid276_pT4_uid141_natLogPolyEval_q : std_logic_vector (77 downto 0);
    signal leftShiftStage3_uid228_normVal_uid55_fpLogETest_s : std_logic_vector (0 downto 0);
    signal leftShiftStage3_uid228_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal lowRangeB_uid46_fpLogETest_in : std_logic_vector (49 downto 0);
    signal lowRangeB_uid46_fpLogETest_b : std_logic_vector (49 downto 0);
    signal highBBits_uid47_fpLogETest_in : std_logic_vector (108 downto 0);
    signal highBBits_uid47_fpLogETest_b : std_logic_vector (58 downto 0);
    signal pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_q : std_logic_vector (17 downto 0);
    signal leftShiftStageSel6Dto5_uid200_normVal_uid55_fpLogETest_in : std_logic_vector (6 downto 0);
    signal leftShiftStageSel6Dto5_uid200_normVal_uid55_fpLogETest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_in : std_logic_vector (2 downto 0);
    signal leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_b : std_logic_vector (1 downto 0);
    signal leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_in : std_logic_vector (0 downto 0);
    signal leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_b : std_logic_vector (0 downto 0);
    signal yTop27Bits_uid234_pT2_uid129_natLogPolyEval_in : std_logic_vector (29 downto 0);
    signal yTop27Bits_uid234_pT2_uid129_natLogPolyEval_b : std_logic_vector (26 downto 0);
    signal sSM0H_uid236_pT2_uid129_natLogPolyEval_in : std_logic_vector (2 downto 0);
    signal sSM0H_uid236_pT2_uid129_natLogPolyEval_b : std_logic_vector (2 downto 0);
    signal sSM1H_uid239_pT2_uid129_natLogPolyEval_in : std_logic_vector (29 downto 0);
    signal sSM1H_uid239_pT2_uid129_natLogPolyEval_b : std_logic_vector (5 downto 0);
    signal R_uid262_pT3_uid135_natLogPolyEval_in : std_logic_vector (57 downto 0);
    signal R_uid262_pT3_uid135_natLogPolyEval_b : std_logic_vector (40 downto 0);
    signal R_uid277_pT4_uid141_natLogPolyEval_in : std_logic_vector (76 downto 0);
    signal R_uid277_pT4_uid141_natLogPolyEval_b : std_logic_vector (51 downto 0);
    signal fracR_uid58_fpLogETest_in : std_logic_vector (117 downto 0);
    signal fracR_uid58_fpLogETest_b : std_logic_vector (52 downto 0);
    signal leftShiftStage0_uid201_normVal_uid55_fpLogETest_s : std_logic_vector (1 downto 0);
    signal leftShiftStage0_uid201_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal expFracConc_uid59_fpLogETest_q : std_logic_vector (65 downto 0);
    signal LeftShiftStage0110dto0_uid203_normVal_uid55_fpLogETest_in : std_logic_vector (110 downto 0);
    signal LeftShiftStage0110dto0_uid203_normVal_uid55_fpLogETest_b : std_logic_vector (110 downto 0);
    signal LeftShiftStage0102dto0_uid206_normVal_uid55_fpLogETest_in : std_logic_vector (102 downto 0);
    signal LeftShiftStage0102dto0_uid206_normVal_uid55_fpLogETest_b : std_logic_vector (102 downto 0);
    signal LeftShiftStage094dto0_uid209_normVal_uid55_fpLogETest_in : std_logic_vector (94 downto 0);
    signal LeftShiftStage094dto0_uid209_normVal_uid55_fpLogETest_b : std_logic_vector (94 downto 0);
    signal leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
    signal leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_q : std_logic_vector (118 downto 0);
begin


	--xIn(GPIN,3)@0

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable(LOGICAL,902)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_a <= en;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q <= not ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_a;

	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor(LOGICAL,914)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_b <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_sticky_ena_q;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_q <= not (ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_a or ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_b);

	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg(REG,912)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_sticky_ena(REG,915)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_nor_q = "1") THEN
                ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd(LOGICAL,916)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_a <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_sticky_ena_q;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_b <= en;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_a and ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_b;

	--frac_uid19_fpLogETest(BITSELECT,18)@0
    frac_uid19_fpLogETest_in <= a(51 downto 0);
    frac_uid19_fpLogETest_b <= frac_uid19_fpLogETest_in(51 downto 0);

	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_inputreg(DELAY,906)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1 )
    PORT MAP ( xin => frac_uid19_fpLogETest_b, xout => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt(COUNTER,908)
    -- every=1, low=0, high=1, step=1, init=1
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_i <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_i,1));


	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg(REG,909)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux(MUX,910)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_s <= en;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux: PROCESS (ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_s, ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q, ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q;
                  WHEN "1" => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem(DUALMEM,907)
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_ia <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_inputreg_q;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q;
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 52,
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
        clocken1 => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_iq,
        address_a => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_aa,
        data_a => ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_ia
    );
    ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_reset0 <= areset;
        ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_iq(51 downto 0);

	--zPPolyEval_uid35_fpLogETest(BITSELECT,34)@4
    zPPolyEval_uid35_fpLogETest_in <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_mem_q(41 downto 0);
    zPPolyEval_uid35_fpLogETest_b <= zPPolyEval_uid35_fpLogETest_in(41 downto 0);

	--yT2_uid128_natLogPolyEval(BITSELECT,127)@4
    yT2_uid128_natLogPolyEval_in <= zPPolyEval_uid35_fpLogETest_b;
    yT2_uid128_natLogPolyEval_b <= yT2_uid128_natLogPolyEval_in(41 downto 14);

	--sSM1W_uid240_pT2_uid129_natLogPolyEval(BITSELECT,239)@4
    sSM1W_uid240_pT2_uid129_natLogPolyEval_in <= yT2_uid128_natLogPolyEval_b(0 downto 0);
    sSM1W_uid240_pT2_uid129_natLogPolyEval_b <= sSM1W_uid240_pT2_uid129_natLogPolyEval_in(0 downto 0);

	--reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1(REG,369)@4
    reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q <= sSM1W_uid240_pT2_uid129_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q_to_sm1_uid241_pT2_uid129_natLogPolyEval_b(DELAY,672)@5
    ld_reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q_to_sm1_uid241_pT2_uid129_natLogPolyEval_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q, xout => ld_reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q_to_sm1_uid241_pT2_uid129_natLogPolyEval_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstBiasMO_uid10_fpLogETest(CONSTANT,9)
    cstBiasMO_uid10_fpLogETest_q <= "01111111110";

	--expX_uid6_fpLogETest(BITSELECT,5)@0
    expX_uid6_fpLogETest_in <= a(62 downto 0);
    expX_uid6_fpLogETest_b <= expX_uid6_fpLogETest_in(62 downto 52);

	--c_uid31_fpLogETest(LOGICAL,30)@0
    c_uid31_fpLogETest_a <= expX_uid6_fpLogETest_b;
    c_uid31_fpLogETest_b <= cstBiasMO_uid10_fpLogETest_q;
    c_uid31_fpLogETest_q <= "1" when c_uid31_fpLogETest_a = c_uid31_fpLogETest_b else "0";

	--zAddrLow_uid33_fpLogETest(BITSELECT,32)@0
    zAddrLow_uid33_fpLogETest_in <= frac_uid19_fpLogETest_b;
    zAddrLow_uid33_fpLogETest_b <= zAddrLow_uid33_fpLogETest_in(51 downto 42);

	--addr_uid34_fpLogETest(BITJOIN,33)@0
    addr_uid34_fpLogETest_q <= c_uid31_fpLogETest_q & zAddrLow_uid33_fpLogETest_b;

	--reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0(REG,322)@0
    reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q <= addr_uid34_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC4_uid120_natLogTabGen_lutmem(DUALMEM,316)@1
    memoryC4_uid120_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC4_uid120_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC4_uid120_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC4_uid120_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 7,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC4_uid120_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC4_uid120_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC4_uid120_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC4_uid120_natLogTabGen_lutmem_iq,
        address_a => memoryC4_uid120_natLogTabGen_lutmem_aa,
        data_a => memoryC4_uid120_natLogTabGen_lutmem_ia
    );
    memoryC4_uid120_natLogTabGen_lutmem_reset0 <= areset;
        memoryC4_uid120_natLogTabGen_lutmem_q <= memoryC4_uid120_natLogTabGen_lutmem_iq(6 downto 0);

	--reg_memoryC4_uid120_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_1(REG,355)@3
    reg_memoryC4_uid120_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC4_uid120_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_1_q <= "0000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC4_uid120_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_1_q <= memoryC4_uid120_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC4_uid119_natLogTabGen_lutmem(DUALMEM,315)@1
    memoryC4_uid119_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC4_uid119_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC4_uid119_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC4_uid119_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC4_uid119_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC4_uid119_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC4_uid119_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC4_uid119_natLogTabGen_lutmem_iq,
        address_a => memoryC4_uid119_natLogTabGen_lutmem_aa,
        data_a => memoryC4_uid119_natLogTabGen_lutmem_ia
    );
    memoryC4_uid119_natLogTabGen_lutmem_reset0 <= areset;
        memoryC4_uid119_natLogTabGen_lutmem_q <= memoryC4_uid119_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC4_uid119_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_0(REG,354)@3
    reg_memoryC4_uid119_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC4_uid119_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC4_uid119_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_0_q <= memoryC4_uid119_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid121_natLogTabGen(BITJOIN,120)@4
    os_uid121_natLogTabGen_q <= reg_memoryC4_uid120_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_1_q & reg_memoryC4_uid119_natLogTabGen_lutmem_0_to_os_uid121_natLogTabGen_0_q;

	--reg_os_uid121_natLogTabGen_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_1(REG,357)@4
    reg_os_uid121_natLogTabGen_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_os_uid121_natLogTabGen_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_1_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_os_uid121_natLogTabGen_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_1_q <= os_uid121_natLogTabGen_q;
            END IF;
        END IF;
    END PROCESS;


	--yT1_uid122_natLogPolyEval(BITSELECT,121)@4
    yT1_uid122_natLogPolyEval_in <= zPPolyEval_uid35_fpLogETest_b;
    yT1_uid122_natLogPolyEval_b <= yT1_uid122_natLogPolyEval_in(41 downto 25);

	--reg_yT1_uid122_natLogPolyEval_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_0(REG,356)@4
    reg_yT1_uid122_natLogPolyEval_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yT1_uid122_natLogPolyEval_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_0_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yT1_uid122_natLogPolyEval_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_0_q <= yT1_uid122_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--prodXY_uid230_pT1_uid123_natLogPolyEval(MULT,229)@5
    prodXY_uid230_pT1_uid123_natLogPolyEval_pr <= signed(resize(UNSIGNED(prodXY_uid230_pT1_uid123_natLogPolyEval_a),18)) * SIGNED(prodXY_uid230_pT1_uid123_natLogPolyEval_b);
    prodXY_uid230_pT1_uid123_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid230_pT1_uid123_natLogPolyEval_a <= (others => '0');
            prodXY_uid230_pT1_uid123_natLogPolyEval_b <= (others => '0');
            prodXY_uid230_pT1_uid123_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid230_pT1_uid123_natLogPolyEval_a <= reg_yT1_uid122_natLogPolyEval_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_0_q;
                prodXY_uid230_pT1_uid123_natLogPolyEval_b <= reg_os_uid121_natLogTabGen_0_to_prodXY_uid230_pT1_uid123_natLogPolyEval_1_q;
                prodXY_uid230_pT1_uid123_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(prodXY_uid230_pT1_uid123_natLogPolyEval_pr,34));
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid230_pT1_uid123_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid230_pT1_uid123_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                prodXY_uid230_pT1_uid123_natLogPolyEval_q <= prodXY_uid230_pT1_uid123_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--prodXYTruncFR_uid231_pT1_uid123_natLogPolyEval(BITSELECT,230)@8
    prodXYTruncFR_uid231_pT1_uid123_natLogPolyEval_in <= prodXY_uid230_pT1_uid123_natLogPolyEval_q;
    prodXYTruncFR_uid231_pT1_uid123_natLogPolyEval_b <= prodXYTruncFR_uid231_pT1_uid123_natLogPolyEval_in(33 downto 15);

	--highBBits_uid125_natLogPolyEval(BITSELECT,124)@8
    highBBits_uid125_natLogPolyEval_in <= prodXYTruncFR_uid231_pT1_uid123_natLogPolyEval_b;
    highBBits_uid125_natLogPolyEval_b <= highBBits_uid125_natLogPolyEval_in(18 downto 1);

	--ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor(LOGICAL,1029)
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_b <= ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_sticky_ena_q;
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_q <= not (ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_a or ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_b);

	--ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_sticky_ena(REG,1030)
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_nor_q = "1") THEN
                ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd(LOGICAL,1031)
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_a <= ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_sticky_ena_q;
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_b <= en;
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_q <= ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_a and ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_b;

	--memoryC3_uid117_natLogTabGen_lutmem(DUALMEM,314)@1
    memoryC3_uid117_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC3_uid117_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC3_uid117_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC3_uid117_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 8,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC3_uid117_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC3_uid117_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC3_uid117_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC3_uid117_natLogTabGen_lutmem_iq,
        address_a => memoryC3_uid117_natLogTabGen_lutmem_aa,
        data_a => memoryC3_uid117_natLogTabGen_lutmem_ia
    );
    memoryC3_uid117_natLogTabGen_lutmem_reset0 <= areset;
        memoryC3_uid117_natLogTabGen_lutmem_q <= memoryC3_uid117_natLogTabGen_lutmem_iq(7 downto 0);

	--reg_memoryC3_uid117_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_2(REG,363)@3
    reg_memoryC3_uid117_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC3_uid117_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC3_uid117_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_2_q <= memoryC3_uid117_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC3_uid116_natLogTabGen_lutmem(DUALMEM,313)@1
    memoryC3_uid116_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC3_uid116_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC3_uid116_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC3_uid116_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC3_uid116_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC3_uid116_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC3_uid116_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC3_uid116_natLogTabGen_lutmem_iq,
        address_a => memoryC3_uid116_natLogTabGen_lutmem_aa,
        data_a => memoryC3_uid116_natLogTabGen_lutmem_ia
    );
    memoryC3_uid116_natLogTabGen_lutmem_reset0 <= areset;
        memoryC3_uid116_natLogTabGen_lutmem_q <= memoryC3_uid116_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC3_uid116_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_1(REG,362)@3
    reg_memoryC3_uid116_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC3_uid116_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_1_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC3_uid116_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_1_q <= memoryC3_uid116_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC3_uid115_natLogTabGen_lutmem(DUALMEM,312)@1
    memoryC3_uid115_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC3_uid115_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC3_uid115_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC3_uid115_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC3_uid115_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC3_uid115_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC3_uid115_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC3_uid115_natLogTabGen_lutmem_iq,
        address_a => memoryC3_uid115_natLogTabGen_lutmem_aa,
        data_a => memoryC3_uid115_natLogTabGen_lutmem_ia
    );
    memoryC3_uid115_natLogTabGen_lutmem_reset0 <= areset;
        memoryC3_uid115_natLogTabGen_lutmem_q <= memoryC3_uid115_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC3_uid115_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_0(REG,361)@3
    reg_memoryC3_uid115_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC3_uid115_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC3_uid115_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_0_q <= memoryC3_uid115_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid118_natLogTabGen(BITJOIN,117)@4
    os_uid118_natLogTabGen_q <= reg_memoryC3_uid117_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_2_q & reg_memoryC3_uid116_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_1_q & reg_memoryC3_uid115_natLogTabGen_lutmem_0_to_os_uid118_natLogTabGen_0_q;

	--ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_inputreg(DELAY,1021)
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 28, depth => 1 )
    PORT MAP ( xin => os_uid118_natLogTabGen_q, xout => ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem(DUALMEM,1022)
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_ia <= ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_inputreg_q;
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q;
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q;
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 28,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 28,
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
        clocken1 => ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_iq,
        address_a => ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_aa,
        data_a => ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_ia
    );
    ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_reset0 <= areset;
        ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_q <= ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_iq(27 downto 0);

	--sumAHighB_uid126_natLogPolyEval(ADD,125)@8
    sumAHighB_uid126_natLogPolyEval_a <= STD_LOGIC_VECTOR((28 downto 28 => ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_q(27)) & ld_os_uid118_natLogTabGen_q_to_sumAHighB_uid126_natLogPolyEval_a_replace_mem_q);
    sumAHighB_uid126_natLogPolyEval_b <= STD_LOGIC_VECTOR((28 downto 18 => highBBits_uid125_natLogPolyEval_b(17)) & highBBits_uid125_natLogPolyEval_b);
            sumAHighB_uid126_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid126_natLogPolyEval_a) + SIGNED(sumAHighB_uid126_natLogPolyEval_b));
    sumAHighB_uid126_natLogPolyEval_q <= sumAHighB_uid126_natLogPolyEval_o(28 downto 0);


	--lowRangeB_uid124_natLogPolyEval(BITSELECT,123)@8
    lowRangeB_uid124_natLogPolyEval_in <= prodXYTruncFR_uid231_pT1_uid123_natLogPolyEval_b(0 downto 0);
    lowRangeB_uid124_natLogPolyEval_b <= lowRangeB_uid124_natLogPolyEval_in(0 downto 0);

	--s1_uid124_uid127_natLogPolyEval(BITJOIN,126)@8
    s1_uid124_uid127_natLogPolyEval_q <= sumAHighB_uid126_natLogPolyEval_q & lowRangeB_uid124_natLogPolyEval_b;

	--sSM1H_uid239_pT2_uid129_natLogPolyEval(BITSELECT,238)@8
    sSM1H_uid239_pT2_uid129_natLogPolyEval_in <= s1_uid124_uid127_natLogPolyEval_q;
    sSM1H_uid239_pT2_uid129_natLogPolyEval_b <= sSM1H_uid239_pT2_uid129_natLogPolyEval_in(29 downto 24);

	--reg_sSM1H_uid239_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_0(REG,368)@8
    reg_sSM1H_uid239_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM1H_uid239_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM1H_uid239_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_0_q <= sSM1H_uid239_pT2_uid129_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--sm1_uid241_pT2_uid129_natLogPolyEval(MULT,240)@9
    sm1_uid241_pT2_uid129_natLogPolyEval_pr <= SIGNED(sm1_uid241_pT2_uid129_natLogPolyEval_a) * signed(resize(UNSIGNED(sm1_uid241_pT2_uid129_natLogPolyEval_b),2));
    sm1_uid241_pT2_uid129_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm1_uid241_pT2_uid129_natLogPolyEval_a <= (others => '0');
            sm1_uid241_pT2_uid129_natLogPolyEval_b <= (others => '0');
            sm1_uid241_pT2_uid129_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm1_uid241_pT2_uid129_natLogPolyEval_a <= reg_sSM1H_uid239_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_0_q;
                sm1_uid241_pT2_uid129_natLogPolyEval_b <= ld_reg_sSM1W_uid240_pT2_uid129_natLogPolyEval_0_to_sm1_uid241_pT2_uid129_natLogPolyEval_1_q_to_sm1_uid241_pT2_uid129_natLogPolyEval_b_q;
                sm1_uid241_pT2_uid129_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(sm1_uid241_pT2_uid129_natLogPolyEval_pr,7));
            END IF;
        END IF;
    END PROCESS;
    sm1_uid241_pT2_uid129_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm1_uid241_pT2_uid129_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm1_uid241_pT2_uid129_natLogPolyEval_q <= sm1_uid241_pT2_uid129_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--GND(CONSTANT,0)
    GND_q <= "0";

	--pad_sm1_uid241_uid243_pT2_uid129_natLogPolyEval(BITJOIN,242)@12
    pad_sm1_uid241_uid243_pT2_uid129_natLogPolyEval_q <= sm1_uid241_pT2_uid129_natLogPolyEval_q & STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);

	--sSM0W_uid237_pT2_uid129_natLogPolyEval(BITSELECT,236)@4
    sSM0W_uid237_pT2_uid129_natLogPolyEval_in <= yT2_uid128_natLogPolyEval_b;
    sSM0W_uid237_pT2_uid129_natLogPolyEval_b <= sSM0W_uid237_pT2_uid129_natLogPolyEval_in(27 downto 24);

	--ld_sSM0W_uid237_pT2_uid129_natLogPolyEval_b_to_reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_a(DELAY,822)@4
    ld_sSM0W_uid237_pT2_uid129_natLogPolyEval_b_to_reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_a : dspba_delay
    GENERIC MAP ( width => 4, depth => 4 )
    PORT MAP ( xin => sSM0W_uid237_pT2_uid129_natLogPolyEval_b, xout => ld_sSM0W_uid237_pT2_uid129_natLogPolyEval_b_to_reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1(REG,367)@8
    reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_q <= ld_sSM0W_uid237_pT2_uid129_natLogPolyEval_b_to_reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_a_q;
            END IF;
        END IF;
    END PROCESS;


	--sSM0H_uid236_pT2_uid129_natLogPolyEval(BITSELECT,235)@8
    sSM0H_uid236_pT2_uid129_natLogPolyEval_in <= s1_uid124_uid127_natLogPolyEval_q(2 downto 0);
    sSM0H_uid236_pT2_uid129_natLogPolyEval_b <= sSM0H_uid236_pT2_uid129_natLogPolyEval_in(2 downto 0);

	--reg_sSM0H_uid236_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_0(REG,366)@8
    reg_sSM0H_uid236_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sSM0H_uid236_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sSM0H_uid236_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_0_q <= sSM0H_uid236_pT2_uid129_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--sm0_uid238_pT2_uid129_natLogPolyEval(MULT,237)@9
    sm0_uid238_pT2_uid129_natLogPolyEval_pr <= UNSIGNED(sm0_uid238_pT2_uid129_natLogPolyEval_a) * UNSIGNED(sm0_uid238_pT2_uid129_natLogPolyEval_b);
    sm0_uid238_pT2_uid129_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid238_pT2_uid129_natLogPolyEval_a <= (others => '0');
            sm0_uid238_pT2_uid129_natLogPolyEval_b <= (others => '0');
            sm0_uid238_pT2_uid129_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid238_pT2_uid129_natLogPolyEval_a <= reg_sSM0H_uid236_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_0_q;
                sm0_uid238_pT2_uid129_natLogPolyEval_b <= reg_sSM0W_uid237_pT2_uid129_natLogPolyEval_0_to_sm0_uid238_pT2_uid129_natLogPolyEval_1_q;
                sm0_uid238_pT2_uid129_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid238_pT2_uid129_natLogPolyEval_pr);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid238_pT2_uid129_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid238_pT2_uid129_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                sm0_uid238_pT2_uid129_natLogPolyEval_q <= sm0_uid238_pT2_uid129_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--pad_sm0_uid238_uid242_pT2_uid129_natLogPolyEval(BITJOIN,241)@12
    pad_sm0_uid238_uid242_pT2_uid129_natLogPolyEval_q <= sm0_uid238_pT2_uid129_natLogPolyEval_q & STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);

	--yTop27Bits_uid234_pT2_uid129_natLogPolyEval(BITSELECT,233)@8
    yTop27Bits_uid234_pT2_uid129_natLogPolyEval_in <= s1_uid124_uid127_natLogPolyEval_q;
    yTop27Bits_uid234_pT2_uid129_natLogPolyEval_b <= yTop27Bits_uid234_pT2_uid129_natLogPolyEval_in(29 downto 3);

	--reg_yTop27Bits_uid234_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_1(REG,365)@8
    reg_yTop27Bits_uid234_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid234_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid234_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_1_q <= yTop27Bits_uid234_pT2_uid129_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor(LOGICAL,1151)
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_b <= ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_sticky_ena_q;
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_q <= not (ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_a or ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_b);

	--ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_sticky_ena(REG,1152)
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_nor_q = "1") THEN
                ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd(LOGICAL,1153)
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_a <= ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_sticky_ena_q;
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_b <= en;
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_q <= ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_a and ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_b;

	--xTop27Bits_uid233_pT2_uid129_natLogPolyEval(BITSELECT,232)@4
    xTop27Bits_uid233_pT2_uid129_natLogPolyEval_in <= yT2_uid128_natLogPolyEval_b;
    xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b <= xTop27Bits_uid233_pT2_uid129_natLogPolyEval_in(27 downto 1);

	--ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_inputreg(DELAY,1143)
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_inputreg : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b, xout => ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem(DUALMEM,1144)
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_ia <= ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_inputreg_q;
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q;
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q;
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_iq,
        address_a => ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_aa,
        data_a => ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_ia
    );
    ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_reset0 <= areset;
        ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_q <= ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_iq(26 downto 0);

	--reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0(REG,364)@8
    reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_q <= ld_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_b_to_reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid235_pT2_uid129_natLogPolyEval(MULT,234)@9
    topProd_uid235_pT2_uid129_natLogPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid235_pT2_uid129_natLogPolyEval_a),28)) * SIGNED(topProd_uid235_pT2_uid129_natLogPolyEval_b);
    topProd_uid235_pT2_uid129_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid235_pT2_uid129_natLogPolyEval_a <= (others => '0');
            topProd_uid235_pT2_uid129_natLogPolyEval_b <= (others => '0');
            topProd_uid235_pT2_uid129_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid235_pT2_uid129_natLogPolyEval_a <= reg_xTop27Bits_uid233_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_0_q;
                topProd_uid235_pT2_uid129_natLogPolyEval_b <= reg_yTop27Bits_uid234_pT2_uid129_natLogPolyEval_0_to_topProd_uid235_pT2_uid129_natLogPolyEval_1_q;
                topProd_uid235_pT2_uid129_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid235_pT2_uid129_natLogPolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid235_pT2_uid129_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid235_pT2_uid129_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid235_pT2_uid129_natLogPolyEval_q <= topProd_uid235_pT2_uid129_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--add0_uid242_pT2_uid129_natLogPolyEval(ADDSUB3,243)@12
    add0_uid242_pT2_uid129_natLogPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid235_pT2_uid129_natLogPolyEval_q(53)) & topProd_uid235_pT2_uid129_natLogPolyEval_q);
    add0_uid242_pT2_uid129_natLogPolyEval_b <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000" & pad_sm0_uid238_uid242_pT2_uid129_natLogPolyEval_q);
    add0_uid242_pT2_uid129_natLogPolyEval_c <= STD_LOGIC_VECTOR((54 downto 27 => pad_sm1_uid241_uid243_pT2_uid129_natLogPolyEval_q(26)) & pad_sm1_uid241_uid243_pT2_uid129_natLogPolyEval_q);
    add0_uid242_pT2_uid129_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(add0_uid242_pT2_uid129_natLogPolyEval_a) + SIGNED(add0_uid242_pT2_uid129_natLogPolyEval_b) + SIGNED(add0_uid242_pT2_uid129_natLogPolyEval_c));
    add0_uid242_pT2_uid129_natLogPolyEval_q <= add0_uid242_pT2_uid129_natLogPolyEval_o(54 downto 0);


	--R_uid245_pT2_uid129_natLogPolyEval(BITSELECT,244)@12
    R_uid245_pT2_uid129_natLogPolyEval_in <= add0_uid242_pT2_uid129_natLogPolyEval_q(53 downto 0);
    R_uid245_pT2_uid129_natLogPolyEval_b <= R_uid245_pT2_uid129_natLogPolyEval_in(53 downto 24);

	--reg_R_uid245_pT2_uid129_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_1(REG,371)@12
    reg_R_uid245_pT2_uid129_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid245_pT2_uid129_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_1_q <= "000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid245_pT2_uid129_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_1_q <= R_uid245_pT2_uid129_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor(LOGICAL,1042)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_b <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_q <= not (ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_a or ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_b);

	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_mem_top(CONSTANT,1038)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_mem_top_q <= "0101";

	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp(LOGICAL,1039)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_a <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_mem_top_q;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_q);
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_q <= "1" when ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_a = ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_b else "0";

	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmpReg(REG,1040)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmpReg_q <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_sticky_ena(REG,1043)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_nor_q = "1") THEN
                ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_sticky_ena_q <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd(LOGICAL,1044)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_a <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_b <= en;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_q <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_a and ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_b;

	--memoryC2_uid113_natLogTabGen_lutmem(DUALMEM,311)@1
    memoryC2_uid113_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid113_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid113_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC2_uid113_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 8,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC2_uid113_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid113_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid113_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid113_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid113_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid113_natLogTabGen_lutmem_ia
    );
    memoryC2_uid113_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid113_natLogTabGen_lutmem_q <= memoryC2_uid113_natLogTabGen_lutmem_iq(7 downto 0);

	--reg_memoryC2_uid113_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_3(REG,351)@3
    reg_memoryC2_uid113_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid113_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid113_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_3_q <= memoryC2_uid113_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid112_natLogTabGen_lutmem(DUALMEM,310)@1
    memoryC2_uid112_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid112_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid112_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC2_uid112_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC2_uid112_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid112_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid112_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid112_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid112_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid112_natLogTabGen_lutmem_ia
    );
    memoryC2_uid112_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid112_natLogTabGen_lutmem_q <= memoryC2_uid112_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC2_uid112_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_2(REG,350)@3
    reg_memoryC2_uid112_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid112_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_2_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid112_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_2_q <= memoryC2_uid112_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid111_natLogTabGen_lutmem(DUALMEM,309)@1
    memoryC2_uid111_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid111_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid111_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC2_uid111_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC2_uid111_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid111_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid111_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid111_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid111_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid111_natLogTabGen_lutmem_ia
    );
    memoryC2_uid111_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid111_natLogTabGen_lutmem_q <= memoryC2_uid111_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC2_uid111_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_1(REG,349)@3
    reg_memoryC2_uid111_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid111_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_1_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid111_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_1_q <= memoryC2_uid111_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC2_uid110_natLogTabGen_lutmem(DUALMEM,308)@1
    memoryC2_uid110_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC2_uid110_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC2_uid110_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC2_uid110_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC2_uid110_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC2_uid110_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid110_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid110_natLogTabGen_lutmem_iq,
        address_a => memoryC2_uid110_natLogTabGen_lutmem_aa,
        data_a => memoryC2_uid110_natLogTabGen_lutmem_ia
    );
    memoryC2_uid110_natLogTabGen_lutmem_reset0 <= areset;
        memoryC2_uid110_natLogTabGen_lutmem_q <= memoryC2_uid110_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC2_uid110_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_0(REG,348)@3
    reg_memoryC2_uid110_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC2_uid110_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC2_uid110_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_0_q <= memoryC2_uid110_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid114_natLogTabGen(BITJOIN,113)@4
    os_uid114_natLogTabGen_q <= reg_memoryC2_uid113_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_3_q & reg_memoryC2_uid112_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_2_q & reg_memoryC2_uid111_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_1_q & reg_memoryC2_uid110_natLogTabGen_lutmem_0_to_os_uid114_natLogTabGen_0_q;

	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_inputreg(DELAY,1032)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 38, depth => 1 )
    PORT MAP ( xin => os_uid114_natLogTabGen_q, xout => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt(COUNTER,1034)
    -- every=1, low=0, high=5, step=1, init=1
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_i = 4 THEN
                      ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_i - 5;
                    ELSE
                        ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_i,3));


	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdreg(REG,1035)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdreg_q <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux(MUX,1036)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_s <= en;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux: PROCESS (ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_s, ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdreg_q, ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem(DUALMEM,1033)
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_ia <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_inputreg_q;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_aa <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdreg_q;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_ab <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_rdmux_q;
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 38,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 38,
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
        clocken1 => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_iq,
        address_a => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_aa,
        data_a => ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_ia
    );
    ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_reset0 <= areset;
        ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_q <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_iq(37 downto 0);

	--rndBit_uid130_natLogPolyEval(CONSTANT,129)
    rndBit_uid130_natLogPolyEval_q <= "01";

	--cIncludingRoundingBit_uid131_natLogPolyEval(BITJOIN,130)@12
    cIncludingRoundingBit_uid131_natLogPolyEval_q <= ld_os_uid114_natLogTabGen_q_to_cIncludingRoundingBit_uid131_natLogPolyEval_b_replace_mem_q & rndBit_uid130_natLogPolyEval_q;

	--reg_cIncludingRoundingBit_uid131_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_0(REG,370)@12
    reg_cIncludingRoundingBit_uid131_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid131_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_0_q <= "0000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid131_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_0_q <= cIncludingRoundingBit_uid131_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts2_uid132_natLogPolyEval(ADD,131)@13
    ts2_uid132_natLogPolyEval_a <= STD_LOGIC_VECTOR((40 downto 40 => reg_cIncludingRoundingBit_uid131_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_0_q(39)) & reg_cIncludingRoundingBit_uid131_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_0_q);
    ts2_uid132_natLogPolyEval_b <= STD_LOGIC_VECTOR((40 downto 30 => reg_R_uid245_pT2_uid129_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_1_q(29)) & reg_R_uid245_pT2_uid129_natLogPolyEval_0_to_ts2_uid132_natLogPolyEval_1_q);
            ts2_uid132_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid132_natLogPolyEval_a) + SIGNED(ts2_uid132_natLogPolyEval_b));
    ts2_uid132_natLogPolyEval_q <= ts2_uid132_natLogPolyEval_o(40 downto 0);


	--s2_uid133_natLogPolyEval(BITSELECT,132)@13
    s2_uid133_natLogPolyEval_in <= ts2_uid132_natLogPolyEval_q;
    s2_uid133_natLogPolyEval_b <= s2_uid133_natLogPolyEval_in(40 downto 1);

	--yTop18Bits_uid252_pT3_uid135_natLogPolyEval(BITSELECT,251)@13
    yTop18Bits_uid252_pT3_uid135_natLogPolyEval_in <= s2_uid133_natLogPolyEval_b;
    yTop18Bits_uid252_pT3_uid135_natLogPolyEval_b <= yTop18Bits_uid252_pT3_uid135_natLogPolyEval_in(39 downto 22);

	--reg_yTop18Bits_uid252_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_9(REG,375)@13
    reg_yTop18Bits_uid252_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop18Bits_uid252_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_9_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop18Bits_uid252_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_9_q <= yTop18Bits_uid252_pT3_uid135_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor(LOGICAL,1055)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_b <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_q <= not (ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_a or ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_b);

	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_mem_top(CONSTANT,1051)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_mem_top_q <= "0110";

	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp(LOGICAL,1052)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_a <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_mem_top_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_q);
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_q <= "1" when ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_a = ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_b else "0";

	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmpReg(REG,1053)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmpReg_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_sticky_ena(REG,1056)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_nor_q = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_sticky_ena_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd(LOGICAL,1057)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_a <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_b <= en;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_a and ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_b;

	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_inputreg(DELAY,1045)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_inputreg : dspba_delay
    GENERIC MAP ( width => 42, depth => 1 )
    PORT MAP ( xin => zPPolyEval_uid35_fpLogETest_b, xout => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt(COUNTER,1047)
    -- every=1, low=0, high=6, step=1, init=1
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_i = 5 THEN
                      ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_i - 6;
                    ELSE
                        ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_i,3));


	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdreg(REG,1048)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdreg_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdreg_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux(MUX,1049)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_s <= en;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux: PROCESS (ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_s, ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdreg_q, ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem(DUALMEM,1046)
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_ia <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_inputreg_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_aa <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdreg_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_ab <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_rdmux_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 42,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 42,
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
        clocken1 => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_ia
    );
    ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_reset0 <= areset;
        ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_iq(41 downto 0);

	--yT3_uid134_natLogPolyEval(BITSELECT,133)@13
    yT3_uid134_natLogPolyEval_in <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_replace_mem_q;
    yT3_uid134_natLogPolyEval_b <= yT3_uid134_natLogPolyEval_in(41 downto 4);

	--xBottomBits_uid251_pT3_uid135_natLogPolyEval(BITSELECT,250)@13
    xBottomBits_uid251_pT3_uid135_natLogPolyEval_in <= yT3_uid134_natLogPolyEval_b(10 downto 0);
    xBottomBits_uid251_pT3_uid135_natLogPolyEval_b <= xBottomBits_uid251_pT3_uid135_natLogPolyEval_in(10 downto 0);

	--pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval(BITJOIN,253)@13
    pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_q <= xBottomBits_uid251_pT3_uid135_natLogPolyEval_b & STD_LOGIC_VECTOR((5 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_7(REG,374)@13
    reg_pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_7_q <= "00000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_7_q <= pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid250_pT3_uid135_natLogPolyEval(BITSELECT,249)@13
    yBottomBits_uid250_pT3_uid135_natLogPolyEval_in <= s2_uid133_natLogPolyEval_b(12 downto 0);
    yBottomBits_uid250_pT3_uid135_natLogPolyEval_b <= yBottomBits_uid250_pT3_uid135_natLogPolyEval_in(12 downto 0);

	--spad_yBottomBits_uid250_uid253_pT3_uid135_natLogPolyEval(BITJOIN,252)@13
    spad_yBottomBits_uid250_uid253_pT3_uid135_natLogPolyEval_q <= GND_q & yBottomBits_uid250_pT3_uid135_natLogPolyEval_b;

	--pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval(BITJOIN,254)@13
    pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_q <= spad_yBottomBits_uid250_uid253_pT3_uid135_natLogPolyEval_q & STD_LOGIC_VECTOR((3 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_6(REG,373)@13
    reg_pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_6_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_6_q <= pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--xTop18Bits_uid249_pT3_uid135_natLogPolyEval(BITSELECT,248)@13
    xTop18Bits_uid249_pT3_uid135_natLogPolyEval_in <= yT3_uid134_natLogPolyEval_b;
    xTop18Bits_uid249_pT3_uid135_natLogPolyEval_b <= xTop18Bits_uid249_pT3_uid135_natLogPolyEval_in(37 downto 20);

	--reg_xTop18Bits_uid249_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_4(REG,372)@13
    reg_xTop18Bits_uid249_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop18Bits_uid249_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_4_q <= "000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop18Bits_uid249_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_4_q <= xTop18Bits_uid249_pT3_uid135_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma(CHAINMULTADD,317)@14
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a(0),19));
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a(1),19));
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_p(0) <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_l(0) * multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c(0);
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_p(1) <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_l(1) * multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c(1);
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_w(0) <= RESIZE(multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_p(0),38) + RESIZE(multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_p(1),38);
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_x(0) <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_w(0);
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_y(0) <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_x(0);
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop18Bits_uid249_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_4_q),18);
            multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid251_uid254_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_7_q),18);
            multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid250_uid255_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_6_q),18);
            multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop18Bits_uid252_pT3_uid135_natLogPolyEval_0_to_multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_9_q),18);
            IF (en = "1") THEN
                multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_s(0) <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 37, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval(BITSELECT,256)@17
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_in <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_cma_q;
    multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_b <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_in(36 downto 4);

	--highBBits_uid259_pT3_uid135_natLogPolyEval(BITSELECT,258)@17
    highBBits_uid259_pT3_uid135_natLogPolyEval_in <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_b;
    highBBits_uid259_pT3_uid135_natLogPolyEval_b <= highBBits_uid259_pT3_uid135_natLogPolyEval_in(32 downto 4);

	--yTop27Bits_uid247_pT3_uid135_natLogPolyEval(BITSELECT,246)@13
    yTop27Bits_uid247_pT3_uid135_natLogPolyEval_in <= s2_uid133_natLogPolyEval_b;
    yTop27Bits_uid247_pT3_uid135_natLogPolyEval_b <= yTop27Bits_uid247_pT3_uid135_natLogPolyEval_in(39 downto 13);

	--reg_yTop27Bits_uid247_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_1(REG,377)@13
    reg_yTop27Bits_uid247_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid247_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid247_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_1_q <= yTop27Bits_uid247_pT3_uid135_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--xTop27Bits_uid246_pT3_uid135_natLogPolyEval(BITSELECT,245)@13
    xTop27Bits_uid246_pT3_uid135_natLogPolyEval_in <= yT3_uid134_natLogPolyEval_b;
    xTop27Bits_uid246_pT3_uid135_natLogPolyEval_b <= xTop27Bits_uid246_pT3_uid135_natLogPolyEval_in(37 downto 11);

	--reg_xTop27Bits_uid246_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_0(REG,376)@13
    reg_xTop27Bits_uid246_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid246_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid246_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_0_q <= xTop27Bits_uid246_pT3_uid135_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--topProd_uid248_pT3_uid135_natLogPolyEval(MULT,247)@14
    topProd_uid248_pT3_uid135_natLogPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid248_pT3_uid135_natLogPolyEval_a),28)) * SIGNED(topProd_uid248_pT3_uid135_natLogPolyEval_b);
    topProd_uid248_pT3_uid135_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid248_pT3_uid135_natLogPolyEval_a <= (others => '0');
            topProd_uid248_pT3_uid135_natLogPolyEval_b <= (others => '0');
            topProd_uid248_pT3_uid135_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid248_pT3_uid135_natLogPolyEval_a <= reg_xTop27Bits_uid246_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_0_q;
                topProd_uid248_pT3_uid135_natLogPolyEval_b <= reg_yTop27Bits_uid247_pT3_uid135_natLogPolyEval_0_to_topProd_uid248_pT3_uid135_natLogPolyEval_1_q;
                topProd_uid248_pT3_uid135_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid248_pT3_uid135_natLogPolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid248_pT3_uid135_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid248_pT3_uid135_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid248_pT3_uid135_natLogPolyEval_q <= topProd_uid248_pT3_uid135_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid260_pT3_uid135_natLogPolyEval(ADD,259)@17
    sumAHighB_uid260_pT3_uid135_natLogPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid248_pT3_uid135_natLogPolyEval_q(53)) & topProd_uid248_pT3_uid135_natLogPolyEval_q);
    sumAHighB_uid260_pT3_uid135_natLogPolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid259_pT3_uid135_natLogPolyEval_b(28)) & highBBits_uid259_pT3_uid135_natLogPolyEval_b);
            sumAHighB_uid260_pT3_uid135_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid260_pT3_uid135_natLogPolyEval_a) + SIGNED(sumAHighB_uid260_pT3_uid135_natLogPolyEval_b));
    sumAHighB_uid260_pT3_uid135_natLogPolyEval_q <= sumAHighB_uid260_pT3_uid135_natLogPolyEval_o(54 downto 0);


	--lowRangeB_uid258_pT3_uid135_natLogPolyEval(BITSELECT,257)@17
    lowRangeB_uid258_pT3_uid135_natLogPolyEval_in <= multSumOfTwo18_uid253_pT3_uid135_natLogPolyEval_b(3 downto 0);
    lowRangeB_uid258_pT3_uid135_natLogPolyEval_b <= lowRangeB_uid258_pT3_uid135_natLogPolyEval_in(3 downto 0);

	--add0_uid258_uid261_pT3_uid135_natLogPolyEval(BITJOIN,260)@17
    add0_uid258_uid261_pT3_uid135_natLogPolyEval_q <= sumAHighB_uid260_pT3_uid135_natLogPolyEval_q & lowRangeB_uid258_pT3_uid135_natLogPolyEval_b;

	--R_uid262_pT3_uid135_natLogPolyEval(BITSELECT,261)@17
    R_uid262_pT3_uid135_natLogPolyEval_in <= add0_uid258_uid261_pT3_uid135_natLogPolyEval_q(57 downto 0);
    R_uid262_pT3_uid135_natLogPolyEval_b <= R_uid262_pT3_uid135_natLogPolyEval_in(57 downto 17);

	--reg_R_uid262_pT3_uid135_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_1(REG,379)@17
    reg_R_uid262_pT3_uid135_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid262_pT3_uid135_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_1_q <= "00000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid262_pT3_uid135_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_1_q <= R_uid262_pT3_uid135_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor(LOGICAL,1068)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_b <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_q <= not (ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_a or ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_b);

	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_mem_top(CONSTANT,1064)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_mem_top_q <= "01010";

	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp(LOGICAL,1065)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_a <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_mem_top_q;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_q);
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_q <= "1" when ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_a = ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_b else "0";

	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmpReg(REG,1066)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmpReg_q <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_sticky_ena(REG,1069)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_nor_q = "1") THEN
                ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_sticky_ena_q <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd(LOGICAL,1070)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_a <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_b <= en;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_q <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_a and ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_b;

	--memoryC1_uid108_natLogTabGen_lutmem(DUALMEM,307)@1
    memoryC1_uid108_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid108_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid108_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC1_uid108_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 8,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC1_uid108_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid108_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid108_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid108_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid108_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid108_natLogTabGen_lutmem_ia
    );
    memoryC1_uid108_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid108_natLogTabGen_lutmem_q <= memoryC1_uid108_natLogTabGen_lutmem_iq(7 downto 0);

	--reg_memoryC1_uid108_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_4(REG,343)@3
    reg_memoryC1_uid108_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid108_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_4_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid108_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_4_q <= memoryC1_uid108_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid107_natLogTabGen_lutmem(DUALMEM,306)@1
    memoryC1_uid107_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid107_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid107_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC1_uid107_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC1_uid107_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid107_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid107_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid107_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid107_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid107_natLogTabGen_lutmem_ia
    );
    memoryC1_uid107_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid107_natLogTabGen_lutmem_q <= memoryC1_uid107_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC1_uid107_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_3(REG,342)@3
    reg_memoryC1_uid107_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid107_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_3_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid107_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_3_q <= memoryC1_uid107_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid106_natLogTabGen_lutmem(DUALMEM,305)@1
    memoryC1_uid106_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid106_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid106_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC1_uid106_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC1_uid106_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid106_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid106_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid106_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid106_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid106_natLogTabGen_lutmem_ia
    );
    memoryC1_uid106_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid106_natLogTabGen_lutmem_q <= memoryC1_uid106_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC1_uid106_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_2(REG,341)@3
    reg_memoryC1_uid106_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid106_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_2_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid106_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_2_q <= memoryC1_uid106_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid105_natLogTabGen_lutmem(DUALMEM,304)@1
    memoryC1_uid105_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid105_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid105_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC1_uid105_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC1_uid105_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid105_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid105_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid105_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid105_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid105_natLogTabGen_lutmem_ia
    );
    memoryC1_uid105_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid105_natLogTabGen_lutmem_q <= memoryC1_uid105_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC1_uid105_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_1(REG,340)@3
    reg_memoryC1_uid105_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid105_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_1_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid105_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_1_q <= memoryC1_uid105_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC1_uid104_natLogTabGen_lutmem(DUALMEM,303)@1
    memoryC1_uid104_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC1_uid104_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC1_uid104_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC1_uid104_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC1_uid104_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC1_uid104_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid104_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid104_natLogTabGen_lutmem_iq,
        address_a => memoryC1_uid104_natLogTabGen_lutmem_aa,
        data_a => memoryC1_uid104_natLogTabGen_lutmem_ia
    );
    memoryC1_uid104_natLogTabGen_lutmem_reset0 <= areset;
        memoryC1_uid104_natLogTabGen_lutmem_q <= memoryC1_uid104_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC1_uid104_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_0(REG,339)@3
    reg_memoryC1_uid104_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC1_uid104_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC1_uid104_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_0_q <= memoryC1_uid104_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid109_natLogTabGen(BITJOIN,108)@4
    os_uid109_natLogTabGen_q <= reg_memoryC1_uid108_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_4_q & reg_memoryC1_uid107_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_3_q & reg_memoryC1_uid106_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_2_q & reg_memoryC1_uid105_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_1_q & reg_memoryC1_uid104_natLogTabGen_lutmem_0_to_os_uid109_natLogTabGen_0_q;

	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_inputreg(DELAY,1058)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 48, depth => 1 )
    PORT MAP ( xin => os_uid109_natLogTabGen_q, xout => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt(COUNTER,1060)
    -- every=1, low=0, high=10, step=1, init=1
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_i = 9 THEN
                      ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_i - 10;
                    ELSE
                        ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_i,4));


	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdreg(REG,1061)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdreg_q <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux(MUX,1062)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_s <= en;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux: PROCESS (ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_s, ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdreg_q, ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem(DUALMEM,1059)
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_ia <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_inputreg_q;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_aa <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdreg_q;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_ab <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_rdmux_q;
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 48,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 48,
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
        clocken1 => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_iq,
        address_a => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_aa,
        data_a => ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_ia
    );
    ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_reset0 <= areset;
        ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_q <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_iq(47 downto 0);

	--cIncludingRoundingBit_uid137_natLogPolyEval(BITJOIN,136)@17
    cIncludingRoundingBit_uid137_natLogPolyEval_q <= ld_os_uid109_natLogTabGen_q_to_cIncludingRoundingBit_uid137_natLogPolyEval_b_replace_mem_q & rndBit_uid130_natLogPolyEval_q;

	--reg_cIncludingRoundingBit_uid137_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_0(REG,378)@17
    reg_cIncludingRoundingBit_uid137_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid137_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_0_q <= "00000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid137_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_0_q <= cIncludingRoundingBit_uid137_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts3_uid138_natLogPolyEval(ADD,137)@18
    ts3_uid138_natLogPolyEval_a <= STD_LOGIC_VECTOR((50 downto 50 => reg_cIncludingRoundingBit_uid137_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_0_q(49)) & reg_cIncludingRoundingBit_uid137_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_0_q);
    ts3_uid138_natLogPolyEval_b <= STD_LOGIC_VECTOR((50 downto 41 => reg_R_uid262_pT3_uid135_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_1_q(40)) & reg_R_uid262_pT3_uid135_natLogPolyEval_0_to_ts3_uid138_natLogPolyEval_1_q);
            ts3_uid138_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts3_uid138_natLogPolyEval_a) + SIGNED(ts3_uid138_natLogPolyEval_b));
    ts3_uid138_natLogPolyEval_q <= ts3_uid138_natLogPolyEval_o(50 downto 0);


	--s3_uid139_natLogPolyEval(BITSELECT,138)@18
    s3_uid139_natLogPolyEval_in <= ts3_uid138_natLogPolyEval_q;
    s3_uid139_natLogPolyEval_b <= s3_uid139_natLogPolyEval_in(50 downto 1);

	--yTop27Bits_uid264_pT4_uid141_natLogPolyEval(BITSELECT,263)@18
    yTop27Bits_uid264_pT4_uid141_natLogPolyEval_in <= s3_uid139_natLogPolyEval_b;
    yTop27Bits_uid264_pT4_uid141_natLogPolyEval_b <= yTop27Bits_uid264_pT4_uid141_natLogPolyEval_in(49 downto 23);

	--reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_9(REG,383)@18
    reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_9_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_9_q <= yTop27Bits_uid264_pT4_uid141_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor(LOGICAL,1140)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_b <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_q <= not (ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_a or ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_b);

	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_mem_top(CONSTANT,1136)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_mem_top_q <= "01011";

	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp(LOGICAL,1137)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_a <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_mem_top_q;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_q);
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_q <= "1" when ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_a = ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_b else "0";

	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmpReg(REG,1138)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmpReg_q <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_sticky_ena(REG,1141)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_nor_q = "1") THEN
                ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_sticky_ena_q <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd(LOGICAL,1142)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_a <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_sticky_ena_q;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_b <= en;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_q <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_a and ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_b;

	--xBottomBits_uid267_pT4_uid141_natLogPolyEval(BITSELECT,266)@4
    xBottomBits_uid267_pT4_uid141_natLogPolyEval_in <= zPPolyEval_uid35_fpLogETest_b(14 downto 0);
    xBottomBits_uid267_pT4_uid141_natLogPolyEval_b <= xBottomBits_uid267_pT4_uid141_natLogPolyEval_in(14 downto 0);

	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_inputreg(DELAY,1130)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => xBottomBits_uid267_pT4_uid141_natLogPolyEval_b, xout => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt(COUNTER,1132)
    -- every=1, low=0, high=11, step=1, init=1
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_i = 10 THEN
                      ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_i - 11;
                    ELSE
                        ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_i <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_i,4));


	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdreg(REG,1133)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdreg_q <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux(MUX,1134)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_s <= en;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux: PROCESS (ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_s, ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdreg_q, ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_q <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem(DUALMEM,1131)
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_ia <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_inputreg_q;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_aa <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdreg_q;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_ab <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_rdmux_q;
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 15,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 15,
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
        clocken1 => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_iq,
        address_a => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_aa,
        data_a => ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_ia
    );
    ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_reset0 <= areset;
        ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_q <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_iq(14 downto 0);

	--pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval(BITJOIN,268)@18
    pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_q <= ld_xBottomBits_uid267_pT4_uid141_natLogPolyEval_b_to_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_b_replace_mem_q & STD_LOGIC_VECTOR((10 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_7(REG,382)@18
    reg_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_7_q <= "00000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_7_q <= pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--yBottomBits_uid266_pT4_uid141_natLogPolyEval(BITSELECT,265)@18
    yBottomBits_uid266_pT4_uid141_natLogPolyEval_in <= s3_uid139_natLogPolyEval_b(22 downto 0);
    yBottomBits_uid266_pT4_uid141_natLogPolyEval_b <= yBottomBits_uid266_pT4_uid141_natLogPolyEval_in(22 downto 0);

	--ld_yBottomBits_uid266_pT4_uid141_natLogPolyEval_b_to_spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval_a(DELAY,704)@18
    ld_yBottomBits_uid266_pT4_uid141_natLogPolyEval_b_to_spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => yBottomBits_uid266_pT4_uid141_natLogPolyEval_b, xout => ld_yBottomBits_uid266_pT4_uid141_natLogPolyEval_b_to_spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval_a_q, ena => en(0), clk => clk, aclr => areset );

	--spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval(BITJOIN,267)@19
    spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval_q <= GND_q & ld_yBottomBits_uid266_pT4_uid141_natLogPolyEval_b_to_spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval_a_q;

	--pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval(BITJOIN,269)@19
    pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_q <= spad_yBottomBits_uid266_uid268_pT4_uid141_natLogPolyEval_q & STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q);

	--reg_pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_6(REG,381)@19
    reg_pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_6_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_6_q <= pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor(LOGICAL,1127)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_b <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_q <= not (ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_a or ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_b);

	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_mem_top(CONSTANT,1123)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_mem_top_q <= "01100";

	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp(LOGICAL,1124)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_a <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_mem_top_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_q);
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_q <= "1" when ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_a = ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_b else "0";

	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmpReg(REG,1125)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmpReg_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_sticky_ena(REG,1128)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_nor_q = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_sticky_ena_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd(LOGICAL,1129)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_a <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_sticky_ena_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_b <= en;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_a and ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_b;

	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt(COUNTER,1119)
    -- every=1, low=0, high=12, step=1, init=1
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_i = 11 THEN
                      ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_eq = '1') THEN
                        ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_i - 12;
                    ELSE
                        ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_i <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_i,4));


	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdreg(REG,1120)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdreg_q <= "0000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdreg_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux(MUX,1121)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_s <= en;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux: PROCESS (ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_s, ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdreg_q, ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_q)
    BEGIN
            CASE ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_s IS
                  WHEN "0" => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdreg_q;
                  WHEN "1" => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem(DUALMEM,1118)
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_ia <= ld_zPPolyEval_uid35_fpLogETest_b_to_yT3_uid134_natLogPolyEval_a_inputreg_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_aa <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdreg_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_ab <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_rdmux_q;
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 42,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 42,
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
        clocken1 => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_iq,
        address_a => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_aa,
        data_a => ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_ia
    );
    ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_reset0 <= areset;
        ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_q <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_iq(41 downto 0);

	--xTop27Bits_uid263_pT4_uid141_natLogPolyEval(BITSELECT,262)@19
    xTop27Bits_uid263_pT4_uid141_natLogPolyEval_in <= ld_zPPolyEval_uid35_fpLogETest_b_to_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_a_replace_mem_q;
    xTop27Bits_uid263_pT4_uid141_natLogPolyEval_b <= xTop27Bits_uid263_pT4_uid141_natLogPolyEval_in(41 downto 15);

	--reg_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_4(REG,380)@19
    reg_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_4_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_4_q <= xTop27Bits_uid263_pT4_uid141_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma(CHAINMULTADD,318)@20
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a(0),28));
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a(1),28));
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_p(0) <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_l(0) * multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c(0);
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_p(1) <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_l(1) * multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c(1);
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_w(0) <= RESIZE(multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_p(0),56);
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_w(1) <= RESIZE(multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_p(1),56);
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_x(0) <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_w(0);
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_x(1) <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_w(1);
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_y(0) <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s(1) + multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_x(0);
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_y(1) <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_x(1);
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a <= (others => (others => '0'));
            multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c <= (others => (others => '0'));
            multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a(0) <= RESIZE(UNSIGNED(reg_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_4_q),27);
            multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_a(1) <= RESIZE(UNSIGNED(reg_pad_xBottomBits_uid267_uid269_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_7_q),27);
            multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c(0) <= RESIZE(SIGNED(reg_pad_yBottomBits_uid266_uid270_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_6_q),27);
            multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_c(1) <= RESIZE(SIGNED(reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_9_q),27);
            IF (en = "1") THEN
                multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s(0) <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_y(0);
                multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s(1) <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_delay : dspba_delay
    GENERIC MAP (width => 55, depth => 1)
    PORT MAP (xin => STD_LOGIC_VECTOR(multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_q, clk => clk, aclr => areset);

	--multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval(BITSELECT,271)@23
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_in <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_q;
    multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_b <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_in(54 downto 3);

	--highBBits_uid274_pT4_uid141_natLogPolyEval(BITSELECT,273)@23
    highBBits_uid274_pT4_uid141_natLogPolyEval_in <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_b;
    highBBits_uid274_pT4_uid141_natLogPolyEval_b <= highBBits_uid274_pT4_uid141_natLogPolyEval_in(51 downto 23);

	--ld_reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_topProd_uid265_pT4_uid141_natLogPolyEval_1_q_to_topProd_uid265_pT4_uid141_natLogPolyEval_b(DELAY,701)@19
    ld_reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_topProd_uid265_pT4_uid141_natLogPolyEval_1_q_to_topProd_uid265_pT4_uid141_natLogPolyEval_b : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_9_q, xout => ld_reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_topProd_uid265_pT4_uid141_natLogPolyEval_1_q_to_topProd_uid265_pT4_uid141_natLogPolyEval_b_q, ena => en(0), clk => clk, aclr => areset );

	--topProd_uid265_pT4_uid141_natLogPolyEval(MULT,264)@20
    topProd_uid265_pT4_uid141_natLogPolyEval_pr <= signed(resize(UNSIGNED(topProd_uid265_pT4_uid141_natLogPolyEval_a),28)) * SIGNED(topProd_uid265_pT4_uid141_natLogPolyEval_b);
    topProd_uid265_pT4_uid141_natLogPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid265_pT4_uid141_natLogPolyEval_a <= (others => '0');
            topProd_uid265_pT4_uid141_natLogPolyEval_b <= (others => '0');
            topProd_uid265_pT4_uid141_natLogPolyEval_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid265_pT4_uid141_natLogPolyEval_a <= reg_xTop27Bits_uid263_pT4_uid141_natLogPolyEval_0_to_multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_cma_4_q;
                topProd_uid265_pT4_uid141_natLogPolyEval_b <= ld_reg_yTop27Bits_uid264_pT4_uid141_natLogPolyEval_0_to_topProd_uid265_pT4_uid141_natLogPolyEval_1_q_to_topProd_uid265_pT4_uid141_natLogPolyEval_b_q;
                topProd_uid265_pT4_uid141_natLogPolyEval_s1 <= STD_LOGIC_VECTOR(resize(topProd_uid265_pT4_uid141_natLogPolyEval_pr,54));
            END IF;
        END IF;
    END PROCESS;
    topProd_uid265_pT4_uid141_natLogPolyEval: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid265_pT4_uid141_natLogPolyEval_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                topProd_uid265_pT4_uid141_natLogPolyEval_q <= topProd_uid265_pT4_uid141_natLogPolyEval_s1;
            END IF;
        END IF;
    END PROCESS;

	--sumAHighB_uid275_pT4_uid141_natLogPolyEval(ADD,274)@23
    sumAHighB_uid275_pT4_uid141_natLogPolyEval_a <= STD_LOGIC_VECTOR((54 downto 54 => topProd_uid265_pT4_uid141_natLogPolyEval_q(53)) & topProd_uid265_pT4_uid141_natLogPolyEval_q);
    sumAHighB_uid275_pT4_uid141_natLogPolyEval_b <= STD_LOGIC_VECTOR((54 downto 29 => highBBits_uid274_pT4_uid141_natLogPolyEval_b(28)) & highBBits_uid274_pT4_uid141_natLogPolyEval_b);
            sumAHighB_uid275_pT4_uid141_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid275_pT4_uid141_natLogPolyEval_a) + SIGNED(sumAHighB_uid275_pT4_uid141_natLogPolyEval_b));
    sumAHighB_uid275_pT4_uid141_natLogPolyEval_q <= sumAHighB_uid275_pT4_uid141_natLogPolyEval_o(54 downto 0);


	--lowRangeB_uid273_pT4_uid141_natLogPolyEval(BITSELECT,272)@23
    lowRangeB_uid273_pT4_uid141_natLogPolyEval_in <= multSumOfTwo27_uid268_pT4_uid141_natLogPolyEval_b(22 downto 0);
    lowRangeB_uid273_pT4_uid141_natLogPolyEval_b <= lowRangeB_uid273_pT4_uid141_natLogPolyEval_in(22 downto 0);

	--add0_uid273_uid276_pT4_uid141_natLogPolyEval(BITJOIN,275)@23
    add0_uid273_uid276_pT4_uid141_natLogPolyEval_q <= sumAHighB_uid275_pT4_uid141_natLogPolyEval_q & lowRangeB_uid273_pT4_uid141_natLogPolyEval_b;

	--R_uid277_pT4_uid141_natLogPolyEval(BITSELECT,276)@23
    R_uid277_pT4_uid141_natLogPolyEval_in <= add0_uid273_uid276_pT4_uid141_natLogPolyEval_q(76 downto 0);
    R_uid277_pT4_uid141_natLogPolyEval_b <= R_uid277_pT4_uid141_natLogPolyEval_in(76 downto 25);

	--reg_R_uid277_pT4_uid141_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_1(REG,387)@23
    reg_R_uid277_pT4_uid141_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_R_uid277_pT4_uid141_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_1_q <= "0000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_R_uid277_pT4_uid141_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_1_q <= R_uid277_pT4_uid141_natLogPolyEval_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor(LOGICAL,1081)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_b <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_q <= not (ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_a or ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_b);

	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_mem_top(CONSTANT,1077)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_mem_top_q <= "010000";

	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp(LOGICAL,1078)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_a <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_mem_top_q;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_q);
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_q <= "1" when ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_a = ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_b else "0";

	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmpReg(REG,1079)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmpReg_q <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_sticky_ena(REG,1082)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_nor_q = "1") THEN
                ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_sticky_ena_q <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd(LOGICAL,1083)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_a <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_sticky_ena_q;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_b <= en;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_q <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_a and ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_b;

	--memoryC0_uid102_natLogTabGen_lutmem(DUALMEM,302)@1
    memoryC0_uid102_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid102_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid102_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC0_uid102_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC0_uid102_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid102_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid102_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid102_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid102_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid102_natLogTabGen_lutmem_ia
    );
    memoryC0_uid102_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid102_natLogTabGen_lutmem_q <= memoryC0_uid102_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid102_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_5(REG,333)@3
    reg_memoryC0_uid102_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid102_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_5_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid102_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_5_q <= memoryC0_uid102_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid101_natLogTabGen_lutmem(DUALMEM,301)@1
    memoryC0_uid101_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid101_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid101_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC0_uid101_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC0_uid101_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid101_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid101_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid101_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid101_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid101_natLogTabGen_lutmem_ia
    );
    memoryC0_uid101_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid101_natLogTabGen_lutmem_q <= memoryC0_uid101_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid101_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_4(REG,332)@3
    reg_memoryC0_uid101_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid101_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_4_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid101_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_4_q <= memoryC0_uid101_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid100_natLogTabGen_lutmem(DUALMEM,300)@1
    memoryC0_uid100_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid100_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid100_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC0_uid100_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC0_uid100_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid100_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid100_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid100_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid100_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid100_natLogTabGen_lutmem_ia
    );
    memoryC0_uid100_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid100_natLogTabGen_lutmem_q <= memoryC0_uid100_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid100_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_3(REG,331)@3
    reg_memoryC0_uid100_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid100_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_3_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid100_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_3_q <= memoryC0_uid100_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid99_natLogTabGen_lutmem(DUALMEM,299)@1
    memoryC0_uid99_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid99_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid99_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC0_uid99_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC0_uid99_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid99_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid99_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid99_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid99_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid99_natLogTabGen_lutmem_ia
    );
    memoryC0_uid99_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid99_natLogTabGen_lutmem_q <= memoryC0_uid99_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid99_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_2(REG,330)@3
    reg_memoryC0_uid99_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid99_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_2_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid99_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_2_q <= memoryC0_uid99_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid98_natLogTabGen_lutmem(DUALMEM,298)@1
    memoryC0_uid98_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid98_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid98_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC0_uid98_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC0_uid98_natLogTabGen_lutmem.hex",
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => en(0),
        wren_a => '0',
        aclr0 => memoryC0_uid98_natLogTabGen_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid98_natLogTabGen_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid98_natLogTabGen_lutmem_iq,
        address_a => memoryC0_uid98_natLogTabGen_lutmem_aa,
        data_a => memoryC0_uid98_natLogTabGen_lutmem_ia
    );
    memoryC0_uid98_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid98_natLogTabGen_lutmem_q <= memoryC0_uid98_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid98_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_1(REG,329)@3
    reg_memoryC0_uid98_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid98_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_1_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid98_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_1_q <= memoryC0_uid98_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--memoryC0_uid97_natLogTabGen_lutmem(DUALMEM,297)@1
    memoryC0_uid97_natLogTabGen_lutmem_ia <= (others => '0');
    memoryC0_uid97_natLogTabGen_lutmem_aa <= (others => '0');
    memoryC0_uid97_natLogTabGen_lutmem_ab <= reg_addr_uid34_fpLogETest_0_to_memoryC0_uid97_natLogTabGen_lutmem_0_q;
    memoryC0_uid97_natLogTabGen_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 10,
        widthad_b => 11,
        numwords_b => 2048,
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
        init_file => "fp_ln_double_s5_memoryC0_uid97_natLogTabGen_lutmem.hex",
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
    memoryC0_uid97_natLogTabGen_lutmem_reset0 <= areset;
        memoryC0_uid97_natLogTabGen_lutmem_q <= memoryC0_uid97_natLogTabGen_lutmem_iq(9 downto 0);

	--reg_memoryC0_uid97_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_0(REG,328)@3
    reg_memoryC0_uid97_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_memoryC0_uid97_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_0_q <= "0000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_memoryC0_uid97_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_0_q <= memoryC0_uid97_natLogTabGen_lutmem_q;
            END IF;
        END IF;
    END PROCESS;


	--os_uid103_natLogTabGen(BITJOIN,102)@4
    os_uid103_natLogTabGen_q <= reg_memoryC0_uid102_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_5_q & reg_memoryC0_uid101_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_4_q & reg_memoryC0_uid100_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_3_q & reg_memoryC0_uid99_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_2_q & reg_memoryC0_uid98_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_1_q & reg_memoryC0_uid97_natLogTabGen_lutmem_0_to_os_uid103_natLogTabGen_0_q;

	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_inputreg(DELAY,1071)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_inputreg : dspba_delay
    GENERIC MAP ( width => 60, depth => 1 )
    PORT MAP ( xin => os_uid103_natLogTabGen_q, xout => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt(COUNTER,1073)
    -- every=1, low=0, high=16, step=1, init=1
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_i = 15 THEN
                      ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_eq = '1') THEN
                        ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_i - 16;
                    ELSE
                        ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_i <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_i,5));


	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdreg(REG,1074)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdreg_q <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux(MUX,1075)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_s <= en;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux: PROCESS (ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_s, ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdreg_q, ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_q)
    BEGIN
            CASE ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_s IS
                  WHEN "0" => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdreg_q;
                  WHEN "1" => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_q <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem(DUALMEM,1072)
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_ia <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_inputreg_q;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_aa <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdreg_q;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_ab <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_rdmux_q;
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 60,
        widthad_a => 5,
        numwords_a => 17,
        width_b => 60,
        widthad_b => 5,
        numwords_b => 17,
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
        clocken1 => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_iq,
        address_a => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_aa,
        data_a => ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_ia
    );
    ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_reset0 <= areset;
        ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_q <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_iq(59 downto 0);

	--rndBit_uid142_natLogPolyEval(CONSTANT,141)
    rndBit_uid142_natLogPolyEval_q <= "001";

	--cIncludingRoundingBit_uid143_natLogPolyEval(BITJOIN,142)@23
    cIncludingRoundingBit_uid143_natLogPolyEval_q <= ld_os_uid103_natLogTabGen_q_to_cIncludingRoundingBit_uid143_natLogPolyEval_b_replace_mem_q & rndBit_uid142_natLogPolyEval_q;

	--reg_cIncludingRoundingBit_uid143_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_0(REG,386)@23
    reg_cIncludingRoundingBit_uid143_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_cIncludingRoundingBit_uid143_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_0_q <= "000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_cIncludingRoundingBit_uid143_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_0_q <= cIncludingRoundingBit_uid143_natLogPolyEval_q;
            END IF;
        END IF;
    END PROCESS;


	--ts4_uid144_natLogPolyEval(ADD,143)@24
    ts4_uid144_natLogPolyEval_a <= STD_LOGIC_VECTOR((63 downto 63 => reg_cIncludingRoundingBit_uid143_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_0_q(62)) & reg_cIncludingRoundingBit_uid143_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_0_q);
    ts4_uid144_natLogPolyEval_b <= STD_LOGIC_VECTOR((63 downto 52 => reg_R_uid277_pT4_uid141_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_1_q(51)) & reg_R_uid277_pT4_uid141_natLogPolyEval_0_to_ts4_uid144_natLogPolyEval_1_q);
            ts4_uid144_natLogPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(ts4_uid144_natLogPolyEval_a) + SIGNED(ts4_uid144_natLogPolyEval_b));
    ts4_uid144_natLogPolyEval_q <= ts4_uid144_natLogPolyEval_o(63 downto 0);


	--s4_uid145_natLogPolyEval(BITSELECT,144)@24
    s4_uid145_natLogPolyEval_in <= ts4_uid144_natLogPolyEval_q;
    s4_uid145_natLogPolyEval_b <= s4_uid145_natLogPolyEval_in(63 downto 1);

	--peOR_uid37_fpLogETest(BITSELECT,36)@24
    peOR_uid37_fpLogETest_in <= s4_uid145_natLogPolyEval_b(61 downto 0);
    peOR_uid37_fpLogETest_b <= peOR_uid37_fpLogETest_in(61 downto 7);

	--postPEMul_uid43_fpLogETest_b_2(BITSELECT,281)@24
    postPEMul_uid43_fpLogETest_b_2_in <= STD_LOGIC_VECTOR((80 downto 55 => peOR_uid37_fpLogETest_b(54)) & peOR_uid37_fpLogETest_b);
    postPEMul_uid43_fpLogETest_b_2_b <= postPEMul_uid43_fpLogETest_b_2_in(80 downto 54);

	--reg_postPEMul_uid43_fpLogETest_b_2_0_to_postPEMul_uid43_fpLogETest_a0_b2_1(REG,398)@24
    reg_postPEMul_uid43_fpLogETest_b_2_0_to_postPEMul_uid43_fpLogETest_a0_b2_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid43_fpLogETest_b_2_0_to_postPEMul_uid43_fpLogETest_a0_b2_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid43_fpLogETest_b_2_0_to_postPEMul_uid43_fpLogETest_a0_b2_1_q <= postPEMul_uid43_fpLogETest_b_2_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor(LOGICAL,927)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_b <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_sticky_ena_q;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_q <= not (ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_a or ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_b);

	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_mem_top(CONSTANT,923)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_mem_top_q <= "010100";

	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp(LOGICAL,924)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_a <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_mem_top_q;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_q);
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_q <= "1" when ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_a = ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_b else "0";

	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmpReg(REG,925)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmpReg_q <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_sticky_ena(REG,928)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_nor_q = "1") THEN
                ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd(LOGICAL,929)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_a <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_sticky_ena_q;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_b <= en;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_q <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_a and ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_b;

	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt(COUNTER,919)
    -- every=1, low=0, high=20, step=1, init=1
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_i = 19 THEN
                      ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_eq = '1') THEN
                        ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_i <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_i - 20;
                    ELSE
                        ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_i <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_i,5));


	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg(REG,920)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg_q <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux(MUX,921)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_s <= en;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux: PROCESS (ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_s, ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg_q, ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_s IS
                  WHEN "0" => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_q <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg_q;
                  WHEN "1" => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_q <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem(DUALMEM,918)
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_ia <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_inputreg_q;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg_q;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_q;
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 52,
        widthad_b => 5,
        numwords_b => 21,
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
        clocken1 => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_iq,
        address_a => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_aa,
        data_a => ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_ia
    );
    ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_reset0 <= areset;
        ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_q <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_iq(51 downto 0);

	--pad_o_uid11_uid38_fpLogETest(BITJOIN,37)@23
    pad_o_uid11_uid38_fpLogETest_q <= VCC_q & STD_LOGIC_VECTOR((51 downto 1 => GND_q(0)) & GND_q);

	--oMz_uid38_fpLogETest(SUB,38)@23
    oMz_uid38_fpLogETest_a <= STD_LOGIC_VECTOR("0" & pad_o_uid11_uid38_fpLogETest_q);
    oMz_uid38_fpLogETest_b <= STD_LOGIC_VECTOR("00" & ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_q);
    oMz_uid38_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oMz_uid38_fpLogETest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                oMz_uid38_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(oMz_uid38_fpLogETest_a) - UNSIGNED(oMz_uid38_fpLogETest_b));
            END IF;
        END IF;
    END PROCESS;
    oMz_uid38_fpLogETest_q <= oMz_uid38_fpLogETest_o(53 downto 0);


	--z2_uid40_fpLogETest(CONSTANT,39)
    z2_uid40_fpLogETest_q <= "00";

	--sEz_uid41_fpLogETest(BITJOIN,40)@23
    sEz_uid41_fpLogETest_q <= z2_uid40_fpLogETest_q & ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_mem_q;

	--reg_sEz_uid41_fpLogETest_0_to_multTermOne_uid42_fpLogETest_2(REG,321)@23
    reg_sEz_uid41_fpLogETest_0_to_multTermOne_uid42_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sEz_uid41_fpLogETest_0_to_multTermOne_uid42_fpLogETest_2_q <= "000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sEz_uid41_fpLogETest_0_to_multTermOne_uid42_fpLogETest_2_q <= sEz_uid41_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor(LOGICAL,940)
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_b <= ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_sticky_ena_q;
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_q <= not (ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_a or ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_b);

	--ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_sticky_ena(REG,941)
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_nor_q = "1") THEN
                ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd(LOGICAL,942)
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_a <= ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_sticky_ena_q;
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_b <= en;
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_q <= ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_a and ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_b;

	--reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1(REG,320)@0
    reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q <= c_uid31_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_inputreg(DELAY,930)
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q, xout => ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem(DUALMEM,931)
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_ia <= ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_inputreg_q;
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdreg_q;
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_oMz_uid38_fpLogETest_b_replace_rdmux_q;
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 21,
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
        clocken1 => ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_iq,
        address_a => ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_aa,
        data_a => ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_ia
    );
    ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_reset0 <= areset;
        ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_q <= ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_iq(0 downto 0);

	--multTermOne_uid42_fpLogETest(MUX,41)@24
    multTermOne_uid42_fpLogETest_s <= ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_replace_mem_q;
    multTermOne_uid42_fpLogETest: PROCESS (multTermOne_uid42_fpLogETest_s, en, reg_sEz_uid41_fpLogETest_0_to_multTermOne_uid42_fpLogETest_2_q, oMz_uid38_fpLogETest_q)
    BEGIN
            CASE multTermOne_uid42_fpLogETest_s IS
                  WHEN "0" => multTermOne_uid42_fpLogETest_q <= reg_sEz_uid41_fpLogETest_0_to_multTermOne_uid42_fpLogETest_2_q;
                  WHEN "1" => multTermOne_uid42_fpLogETest_q <= oMz_uid38_fpLogETest_q;
                  WHEN OTHERS => multTermOne_uid42_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--postPEMul_uid43_fpLogETest_a_1(BITSELECT,278)@24
    postPEMul_uid43_fpLogETest_a_1_in <= multTermOne_uid42_fpLogETest_q;
    postPEMul_uid43_fpLogETest_a_1_b <= postPEMul_uid43_fpLogETest_a_1_in(53 downto 27);

	--reg_postPEMul_uid43_fpLogETest_a_1_0_to_postPEMul_uid43_fpLogETest_a1_b0_0(REG,390)@24
    reg_postPEMul_uid43_fpLogETest_a_1_0_to_postPEMul_uid43_fpLogETest_a1_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid43_fpLogETest_a_1_0_to_postPEMul_uid43_fpLogETest_a1_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid43_fpLogETest_a_1_0_to_postPEMul_uid43_fpLogETest_a1_b0_0_q <= postPEMul_uid43_fpLogETest_a_1_b;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid43_fpLogETest_a1_b2(MULT,287)@25
    postPEMul_uid43_fpLogETest_a1_b2_pr <= SIGNED(postPEMul_uid43_fpLogETest_a1_b2_a) * SIGNED(postPEMul_uid43_fpLogETest_a1_b2_b);
    postPEMul_uid43_fpLogETest_a1_b2_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a1_b2_a <= (others => '0');
            postPEMul_uid43_fpLogETest_a1_b2_b <= (others => '0');
            postPEMul_uid43_fpLogETest_a1_b2_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a1_b2_a <= reg_postPEMul_uid43_fpLogETest_a_1_0_to_postPEMul_uid43_fpLogETest_a1_b0_0_q;
                postPEMul_uid43_fpLogETest_a1_b2_b <= reg_postPEMul_uid43_fpLogETest_b_2_0_to_postPEMul_uid43_fpLogETest_a0_b2_1_q;
                postPEMul_uid43_fpLogETest_a1_b2_s1 <= STD_LOGIC_VECTOR(postPEMul_uid43_fpLogETest_a1_b2_pr);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid43_fpLogETest_a1_b2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a1_b2_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a1_b2_q <= postPEMul_uid43_fpLogETest_a1_b2_s1;
            END IF;
        END IF;
    END PROCESS;

	--ld_postPEMul_uid43_fpLogETest_a1_b2_q_to_postPEMul_uid43_fpLogETest_align_3_a(DELAY,739)@28
    ld_postPEMul_uid43_fpLogETest_a1_b2_q_to_postPEMul_uid43_fpLogETest_align_3_a : dspba_delay
    GENERIC MAP ( width => 54, depth => 2 )
    PORT MAP ( xin => postPEMul_uid43_fpLogETest_a1_b2_q, xout => ld_postPEMul_uid43_fpLogETest_a1_b2_q_to_postPEMul_uid43_fpLogETest_align_3_a_q, ena => en(0), clk => clk, aclr => areset );

	--postPEMul_uid43_fpLogETest_align_3(BITSHIFT,293)@30
    postPEMul_uid43_fpLogETest_align_3_q_int <= ld_postPEMul_uid43_fpLogETest_a1_b2_q_to_postPEMul_uid43_fpLogETest_align_3_a_q & "000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    postPEMul_uid43_fpLogETest_align_3_q <= postPEMul_uid43_fpLogETest_align_3_q_int(134 downto 0);

	--postPEMul_uid43_fpLogETest_a_0(BITSELECT,277)@24
    postPEMul_uid43_fpLogETest_a_0_in <= multTermOne_uid42_fpLogETest_q(26 downto 0);
    postPEMul_uid43_fpLogETest_a_0_b <= postPEMul_uid43_fpLogETest_a_0_in(26 downto 0);

	--reg_postPEMul_uid43_fpLogETest_a_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_0(REG,388)@24
    reg_postPEMul_uid43_fpLogETest_a_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid43_fpLogETest_a_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid43_fpLogETest_a_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_0_q <= postPEMul_uid43_fpLogETest_a_0_b;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid43_fpLogETest_a0_b2(MULT,286)@25
    postPEMul_uid43_fpLogETest_a0_b2_pr <= signed(resize(UNSIGNED(postPEMul_uid43_fpLogETest_a0_b2_a),28)) * SIGNED(postPEMul_uid43_fpLogETest_a0_b2_b);
    postPEMul_uid43_fpLogETest_a0_b2_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a0_b2_a <= (others => '0');
            postPEMul_uid43_fpLogETest_a0_b2_b <= (others => '0');
            postPEMul_uid43_fpLogETest_a0_b2_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a0_b2_a <= reg_postPEMul_uid43_fpLogETest_a_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_0_q;
                postPEMul_uid43_fpLogETest_a0_b2_b <= reg_postPEMul_uid43_fpLogETest_b_2_0_to_postPEMul_uid43_fpLogETest_a0_b2_1_q;
                postPEMul_uid43_fpLogETest_a0_b2_s1 <= STD_LOGIC_VECTOR(resize(postPEMul_uid43_fpLogETest_a0_b2_pr,54));
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid43_fpLogETest_a0_b2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a0_b2_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a0_b2_q <= postPEMul_uid43_fpLogETest_a0_b2_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid43_fpLogETest_b_1(BITSELECT,280)@24
    postPEMul_uid43_fpLogETest_b_1_in <= peOR_uid37_fpLogETest_b(53 downto 0);
    postPEMul_uid43_fpLogETest_b_1_b <= postPEMul_uid43_fpLogETest_b_1_in(53 downto 27);

	--reg_postPEMul_uid43_fpLogETest_b_1_0_to_postPEMul_uid43_fpLogETest_a0_b1_1(REG,393)@24
    reg_postPEMul_uid43_fpLogETest_b_1_0_to_postPEMul_uid43_fpLogETest_a0_b1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid43_fpLogETest_b_1_0_to_postPEMul_uid43_fpLogETest_a0_b1_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid43_fpLogETest_b_1_0_to_postPEMul_uid43_fpLogETest_a0_b1_1_q <= postPEMul_uid43_fpLogETest_b_1_b;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid43_fpLogETest_a1_b1(MULT,285)@25
    postPEMul_uid43_fpLogETest_a1_b1_pr <= SIGNED(postPEMul_uid43_fpLogETest_a1_b1_a) * signed(resize(UNSIGNED(postPEMul_uid43_fpLogETest_a1_b1_b),28));
    postPEMul_uid43_fpLogETest_a1_b1_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a1_b1_a <= (others => '0');
            postPEMul_uid43_fpLogETest_a1_b1_b <= (others => '0');
            postPEMul_uid43_fpLogETest_a1_b1_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a1_b1_a <= reg_postPEMul_uid43_fpLogETest_a_1_0_to_postPEMul_uid43_fpLogETest_a1_b0_0_q;
                postPEMul_uid43_fpLogETest_a1_b1_b <= reg_postPEMul_uid43_fpLogETest_b_1_0_to_postPEMul_uid43_fpLogETest_a0_b1_1_q;
                postPEMul_uid43_fpLogETest_a1_b1_s1 <= STD_LOGIC_VECTOR(resize(postPEMul_uid43_fpLogETest_a1_b1_pr,54));
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid43_fpLogETest_a1_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a1_b1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a1_b1_q <= postPEMul_uid43_fpLogETest_a1_b1_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid43_fpLogETest_addcol_2_add_0_0(ADD,289)@28
    postPEMul_uid43_fpLogETest_addcol_2_add_0_0_a <= STD_LOGIC_VECTOR((54 downto 54 => postPEMul_uid43_fpLogETest_a1_b1_q(53)) & postPEMul_uid43_fpLogETest_a1_b1_q);
    postPEMul_uid43_fpLogETest_addcol_2_add_0_0_b <= STD_LOGIC_VECTOR((54 downto 54 => postPEMul_uid43_fpLogETest_a0_b2_q(53)) & postPEMul_uid43_fpLogETest_a0_b2_q);
            postPEMul_uid43_fpLogETest_addcol_2_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid43_fpLogETest_addcol_2_add_0_0_a) + SIGNED(postPEMul_uid43_fpLogETest_addcol_2_add_0_0_b));
    postPEMul_uid43_fpLogETest_addcol_2_add_0_0_q <= postPEMul_uid43_fpLogETest_addcol_2_add_0_0_o(54 downto 0);


	--ld_postPEMul_uid43_fpLogETest_addcol_2_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_2_a(DELAY,738)@28
    ld_postPEMul_uid43_fpLogETest_addcol_2_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_2_a : dspba_delay
    GENERIC MAP ( width => 55, depth => 1 )
    PORT MAP ( xin => postPEMul_uid43_fpLogETest_addcol_2_add_0_0_q, xout => ld_postPEMul_uid43_fpLogETest_addcol_2_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_2_a_q, ena => en(0), clk => clk, aclr => areset );

	--postPEMul_uid43_fpLogETest_align_2(BITSHIFT,292)@29
    postPEMul_uid43_fpLogETest_align_2_q_int <= ld_postPEMul_uid43_fpLogETest_addcol_2_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_2_a_q & "000000000000000000000000000000000000000000000000000000";
    postPEMul_uid43_fpLogETest_align_2_q <= postPEMul_uid43_fpLogETest_align_2_q_int(108 downto 0);

	--reg_postPEMul_uid43_fpLogETest_align_2_0_to_postPEMul_uid43_fpLogETest_result_add_0_1_0(REG,401)@29
    reg_postPEMul_uid43_fpLogETest_align_2_0_to_postPEMul_uid43_fpLogETest_result_add_0_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid43_fpLogETest_align_2_0_to_postPEMul_uid43_fpLogETest_result_add_0_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid43_fpLogETest_align_2_0_to_postPEMul_uid43_fpLogETest_result_add_0_1_0_q <= postPEMul_uid43_fpLogETest_align_2_q;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid43_fpLogETest_result_add_0_1(ADD,295)@30
    postPEMul_uid43_fpLogETest_result_add_0_1_a <= STD_LOGIC_VECTOR((135 downto 109 => reg_postPEMul_uid43_fpLogETest_align_2_0_to_postPEMul_uid43_fpLogETest_result_add_0_1_0_q(108)) & reg_postPEMul_uid43_fpLogETest_align_2_0_to_postPEMul_uid43_fpLogETest_result_add_0_1_0_q);
    postPEMul_uid43_fpLogETest_result_add_0_1_b <= STD_LOGIC_VECTOR((135 downto 135 => postPEMul_uid43_fpLogETest_align_3_q(134)) & postPEMul_uid43_fpLogETest_align_3_q);
            postPEMul_uid43_fpLogETest_result_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid43_fpLogETest_result_add_0_1_a) + SIGNED(postPEMul_uid43_fpLogETest_result_add_0_1_b));
    postPEMul_uid43_fpLogETest_result_add_0_1_q <= postPEMul_uid43_fpLogETest_result_add_0_1_o(135 downto 0);


	--postPEMul_uid43_fpLogETest_a0_b1(MULT,284)@25
    postPEMul_uid43_fpLogETest_a0_b1_pr <= UNSIGNED(postPEMul_uid43_fpLogETest_a0_b1_a) * UNSIGNED(postPEMul_uid43_fpLogETest_a0_b1_b);
    postPEMul_uid43_fpLogETest_a0_b1_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a0_b1_a <= (others => '0');
            postPEMul_uid43_fpLogETest_a0_b1_b <= (others => '0');
            postPEMul_uid43_fpLogETest_a0_b1_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a0_b1_a <= reg_postPEMul_uid43_fpLogETest_a_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_0_q;
                postPEMul_uid43_fpLogETest_a0_b1_b <= reg_postPEMul_uid43_fpLogETest_b_1_0_to_postPEMul_uid43_fpLogETest_a0_b1_1_q;
                postPEMul_uid43_fpLogETest_a0_b1_s1 <= STD_LOGIC_VECTOR(postPEMul_uid43_fpLogETest_a0_b1_pr);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid43_fpLogETest_a0_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a0_b1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a0_b1_q <= postPEMul_uid43_fpLogETest_a0_b1_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid43_fpLogETest_b_0(BITSELECT,279)@24
    postPEMul_uid43_fpLogETest_b_0_in <= peOR_uid37_fpLogETest_b(26 downto 0);
    postPEMul_uid43_fpLogETest_b_0_b <= postPEMul_uid43_fpLogETest_b_0_in(26 downto 0);

	--reg_postPEMul_uid43_fpLogETest_b_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_1(REG,389)@24
    reg_postPEMul_uid43_fpLogETest_b_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid43_fpLogETest_b_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_1_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid43_fpLogETest_b_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_1_q <= postPEMul_uid43_fpLogETest_b_0_b;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid43_fpLogETest_a1_b0(MULT,283)@25
    postPEMul_uid43_fpLogETest_a1_b0_pr <= SIGNED(postPEMul_uid43_fpLogETest_a1_b0_a) * signed(resize(UNSIGNED(postPEMul_uid43_fpLogETest_a1_b0_b),28));
    postPEMul_uid43_fpLogETest_a1_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a1_b0_a <= (others => '0');
            postPEMul_uid43_fpLogETest_a1_b0_b <= (others => '0');
            postPEMul_uid43_fpLogETest_a1_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a1_b0_a <= reg_postPEMul_uid43_fpLogETest_a_1_0_to_postPEMul_uid43_fpLogETest_a1_b0_0_q;
                postPEMul_uid43_fpLogETest_a1_b0_b <= reg_postPEMul_uid43_fpLogETest_b_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_1_q;
                postPEMul_uid43_fpLogETest_a1_b0_s1 <= STD_LOGIC_VECTOR(resize(postPEMul_uid43_fpLogETest_a1_b0_pr,54));
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid43_fpLogETest_a1_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a1_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a1_b0_q <= postPEMul_uid43_fpLogETest_a1_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid43_fpLogETest_addcol_1_add_0_0(ADD,288)@28
    postPEMul_uid43_fpLogETest_addcol_1_add_0_0_a <= STD_LOGIC_VECTOR((56 downto 54 => postPEMul_uid43_fpLogETest_a1_b0_q(53)) & postPEMul_uid43_fpLogETest_a1_b0_q);
    postPEMul_uid43_fpLogETest_addcol_1_add_0_0_b <= STD_LOGIC_VECTOR('0' & "00" & postPEMul_uid43_fpLogETest_a0_b1_q);
            postPEMul_uid43_fpLogETest_addcol_1_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid43_fpLogETest_addcol_1_add_0_0_a) + SIGNED(postPEMul_uid43_fpLogETest_addcol_1_add_0_0_b));
    postPEMul_uid43_fpLogETest_addcol_1_add_0_0_q <= postPEMul_uid43_fpLogETest_addcol_1_add_0_0_o(55 downto 0);


	--ld_postPEMul_uid43_fpLogETest_addcol_1_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_1_a(DELAY,737)@28
    ld_postPEMul_uid43_fpLogETest_addcol_1_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_1_a : dspba_delay
    GENERIC MAP ( width => 56, depth => 1 )
    PORT MAP ( xin => postPEMul_uid43_fpLogETest_addcol_1_add_0_0_q, xout => ld_postPEMul_uid43_fpLogETest_addcol_1_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_1_a_q, ena => en(0), clk => clk, aclr => areset );

	--postPEMul_uid43_fpLogETest_align_1(BITSHIFT,291)@29
    postPEMul_uid43_fpLogETest_align_1_q_int <= ld_postPEMul_uid43_fpLogETest_addcol_1_add_0_0_q_to_postPEMul_uid43_fpLogETest_align_1_a_q & "000000000000000000000000000";
    postPEMul_uid43_fpLogETest_align_1_q <= postPEMul_uid43_fpLogETest_align_1_q_int(82 downto 0);

	--postPEMul_uid43_fpLogETest_a0_b0(MULT,282)@25
    postPEMul_uid43_fpLogETest_a0_b0_pr <= UNSIGNED(postPEMul_uid43_fpLogETest_a0_b0_a) * UNSIGNED(postPEMul_uid43_fpLogETest_a0_b0_b);
    postPEMul_uid43_fpLogETest_a0_b0_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a0_b0_a <= (others => '0');
            postPEMul_uid43_fpLogETest_a0_b0_b <= (others => '0');
            postPEMul_uid43_fpLogETest_a0_b0_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a0_b0_a <= reg_postPEMul_uid43_fpLogETest_a_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_0_q;
                postPEMul_uid43_fpLogETest_a0_b0_b <= reg_postPEMul_uid43_fpLogETest_b_0_0_to_postPEMul_uid43_fpLogETest_a0_b0_1_q;
                postPEMul_uid43_fpLogETest_a0_b0_s1 <= STD_LOGIC_VECTOR(postPEMul_uid43_fpLogETest_a0_b0_pr);
            END IF;
        END IF;
    END PROCESS;
    postPEMul_uid43_fpLogETest_a0_b0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_a0_b0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                postPEMul_uid43_fpLogETest_a0_b0_q <= postPEMul_uid43_fpLogETest_a0_b0_s1;
            END IF;
        END IF;
    END PROCESS;

	--postPEMul_uid43_fpLogETest_align_0(BITSHIFT,290)@28
    postPEMul_uid43_fpLogETest_align_0_q_int <= postPEMul_uid43_fpLogETest_a0_b0_q;
    postPEMul_uid43_fpLogETest_align_0_q <= postPEMul_uid43_fpLogETest_align_0_q_int(53 downto 0);

	--reg_postPEMul_uid43_fpLogETest_align_0_0_to_postPEMul_uid43_fpLogETest_result_add_0_0_0(REG,394)@28
    reg_postPEMul_uid43_fpLogETest_align_0_0_to_postPEMul_uid43_fpLogETest_result_add_0_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_postPEMul_uid43_fpLogETest_align_0_0_to_postPEMul_uid43_fpLogETest_result_add_0_0_0_q <= "000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_postPEMul_uid43_fpLogETest_align_0_0_to_postPEMul_uid43_fpLogETest_result_add_0_0_0_q <= postPEMul_uid43_fpLogETest_align_0_q;
            END IF;
        END IF;
    END PROCESS;


	--postPEMul_uid43_fpLogETest_result_add_0_0(ADD,294)@29
    postPEMul_uid43_fpLogETest_result_add_0_0_a <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000000" & reg_postPEMul_uid43_fpLogETest_align_0_0_to_postPEMul_uid43_fpLogETest_result_add_0_0_0_q);
    postPEMul_uid43_fpLogETest_result_add_0_0_b <= STD_LOGIC_VECTOR((84 downto 83 => postPEMul_uid43_fpLogETest_align_1_q(82)) & postPEMul_uid43_fpLogETest_align_1_q);
    postPEMul_uid43_fpLogETest_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            postPEMul_uid43_fpLogETest_result_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            postPEMul_uid43_fpLogETest_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid43_fpLogETest_result_add_0_0_a) + SIGNED(postPEMul_uid43_fpLogETest_result_add_0_0_b));
        END IF;
    END PROCESS;
    postPEMul_uid43_fpLogETest_result_add_0_0_q <= postPEMul_uid43_fpLogETest_result_add_0_0_o(83 downto 0);


	--postPEMul_uid43_fpLogETest_result_add_1_0(ADD,296)@30
    postPEMul_uid43_fpLogETest_result_add_1_0_a <= STD_LOGIC_VECTOR((136 downto 84 => postPEMul_uid43_fpLogETest_result_add_0_0_q(83)) & postPEMul_uid43_fpLogETest_result_add_0_0_q);
    postPEMul_uid43_fpLogETest_result_add_1_0_b <= STD_LOGIC_VECTOR((136 downto 136 => postPEMul_uid43_fpLogETest_result_add_0_1_q(135)) & postPEMul_uid43_fpLogETest_result_add_0_1_q);
            postPEMul_uid43_fpLogETest_result_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(postPEMul_uid43_fpLogETest_result_add_1_0_a) + SIGNED(postPEMul_uid43_fpLogETest_result_add_1_0_b));
    postPEMul_uid43_fpLogETest_result_add_1_0_q <= postPEMul_uid43_fpLogETest_result_add_1_0_o(136 downto 0);


	--highBBits_uid47_fpLogETest(BITSELECT,46)@30
    highBBits_uid47_fpLogETest_in <= postPEMul_uid43_fpLogETest_result_add_1_0_q(108 downto 0);
    highBBits_uid47_fpLogETest_b <= highBBits_uid47_fpLogETest_in(108 downto 50);

	--reg_highBBits_uid47_fpLogETest_0_to_sumAHighB_uid48_fpLogETest_1(REG,406)@30
    reg_highBBits_uid47_fpLogETest_0_to_sumAHighB_uid48_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_highBBits_uid47_fpLogETest_0_to_sumAHighB_uid48_fpLogETest_1_q <= "00000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_highBBits_uid47_fpLogETest_0_to_sumAHighB_uid48_fpLogETest_1_q <= highBBits_uid47_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--wideZero_uid44_fpLogETest(CONSTANT,43)
    wideZero_uid44_fpLogETest_q <= "0000000000000000000000000000000000000000000000000000000000000000000";

	--cstBias_uid9_fpLogETest(CONSTANT,8)
    cstBias_uid9_fpLogETest_q <= "01111111111";

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor(LOGICAL,903)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_b <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_q <= not (ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_a or ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_nor_b);

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_mem_top(CONSTANT,899)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_mem_top_q <= "011000";

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp(LOGICAL,900)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_mem_top_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q);
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_q <= "1" when ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_a = ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmp_b else "0";

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_cmpReg(REG,901)
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


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena(REG,904)
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


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd(LOGICAL,905)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_sticky_ena_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_b <= en;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_a and ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_enaAnd_b;

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_inputreg(DELAY,893)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => expX_uid6_fpLogETest_b, xout => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt(COUNTER,895)
    -- every=1, low=0, high=24, step=1, init=1
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i = 23 THEN
                      ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_eq = '1') THEN
                        ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i - 24;
                    ELSE
                        ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_i,5));


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg(REG,896)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux(MUX,897)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_s <= en;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux: PROCESS (ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_s, ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q, ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q;
                  WHEN "1" => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem(DUALMEM,894)
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ia <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_inputreg_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_aa <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdreg_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_ab <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_rdmux_q;
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 5,
        numwords_a => 25,
        width_b => 11,
        widthad_b => 5,
        numwords_b => 25,
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
    ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_reset0 <= areset;
        ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_q <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_iq(10 downto 0);

	--e_uid29_fpLogETest(SUB,28)@27
    e_uid29_fpLogETest_a <= STD_LOGIC_VECTOR("0" & ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_replace_mem_q);
    e_uid29_fpLogETest_b <= STD_LOGIC_VECTOR("0" & cstBias_uid9_fpLogETest_q);
            e_uid29_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(e_uid29_fpLogETest_a) - UNSIGNED(e_uid29_fpLogETest_b));
    e_uid29_fpLogETest_q <= e_uid29_fpLogETest_o(11 downto 0);


	--xv0_uid90_constMult(BITSELECT,89)@27
    xv0_uid90_constMult_in <= e_uid29_fpLogETest_q(5 downto 0);
    xv0_uid90_constMult_b <= xv0_uid90_constMult_in(5 downto 0);

	--ld_xv0_uid90_constMult_b_to_reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_a(DELAY,858)@27
    ld_xv0_uid90_constMult_b_to_reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_a : dspba_delay
    GENERIC MAP ( width => 6, depth => 1 )
    PORT MAP ( xin => xv0_uid90_constMult_b, xout => ld_xv0_uid90_constMult_b_to_reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0(REG,403)@28
    reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_q <= ld_xv0_uid90_constMult_b_to_reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_a_q;
            END IF;
        END IF;
    END PROCESS;


	--p0_uid93_constMult(LOOKUP,92)@29
    p0_uid93_constMult: PROCESS (reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_xv0_uid90_constMult_0_to_p0_uid93_constMult_0_q) IS
                WHEN "000000" =>  p0_uid93_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p0_uid93_constMult_q <= "000000101100010111001000010111111101111101000111001111011110000";
                WHEN "000010" =>  p0_uid93_constMult_q <= "000001011000101110010000101111111011111010001110011110111100000";
                WHEN "000011" =>  p0_uid93_constMult_q <= "000010000101000101011001000111111001110111010101101110011010000";
                WHEN "000100" =>  p0_uid93_constMult_q <= "000010110001011100100001011111110111110100011100111101111000000";
                WHEN "000101" =>  p0_uid93_constMult_q <= "000011011101110011101001110111110101110001100100001101010110000";
                WHEN "000110" =>  p0_uid93_constMult_q <= "000100001010001010110010001111110011101110101011011100110100000";
                WHEN "000111" =>  p0_uid93_constMult_q <= "000100110110100001111010100111110001101011110010101100010010000";
                WHEN "001000" =>  p0_uid93_constMult_q <= "000101100010111001000010111111101111101000111001111011110000000";
                WHEN "001001" =>  p0_uid93_constMult_q <= "000110001111010000001011010111101101100110000001001011001110000";
                WHEN "001010" =>  p0_uid93_constMult_q <= "000110111011100111010011101111101011100011001000011010101100000";
                WHEN "001011" =>  p0_uid93_constMult_q <= "000111100111111110011100000111101001100000001111101010001010000";
                WHEN "001100" =>  p0_uid93_constMult_q <= "001000010100010101100100011111100111011101010110111001101000000";
                WHEN "001101" =>  p0_uid93_constMult_q <= "001001000000101100101100110111100101011010011110001001000110000";
                WHEN "001110" =>  p0_uid93_constMult_q <= "001001101101000011110101001111100011010111100101011000100100000";
                WHEN "001111" =>  p0_uid93_constMult_q <= "001010011001011010111101100111100001010100101100101000000010000";
                WHEN "010000" =>  p0_uid93_constMult_q <= "001011000101110010000101111111011111010001110011110111100000000";
                WHEN "010001" =>  p0_uid93_constMult_q <= "001011110010001001001110010111011101001110111011000110111110000";
                WHEN "010010" =>  p0_uid93_constMult_q <= "001100011110100000010110101111011011001100000010010110011100000";
                WHEN "010011" =>  p0_uid93_constMult_q <= "001101001010110111011111000111011001001001001001100101111010000";
                WHEN "010100" =>  p0_uid93_constMult_q <= "001101110111001110100111011111010111000110010000110101011000000";
                WHEN "010101" =>  p0_uid93_constMult_q <= "001110100011100101101111110111010101000011011000000100110110000";
                WHEN "010110" =>  p0_uid93_constMult_q <= "001111001111111100111000001111010011000000011111010100010100000";
                WHEN "010111" =>  p0_uid93_constMult_q <= "001111111100010100000000100111010000111101100110100011110010000";
                WHEN "011000" =>  p0_uid93_constMult_q <= "010000101000101011001000111111001110111010101101110011010000000";
                WHEN "011001" =>  p0_uid93_constMult_q <= "010001010101000010010001010111001100110111110101000010101110000";
                WHEN "011010" =>  p0_uid93_constMult_q <= "010010000001011001011001101111001010110100111100010010001100000";
                WHEN "011011" =>  p0_uid93_constMult_q <= "010010101101110000100010000111001000110010000011100001101010000";
                WHEN "011100" =>  p0_uid93_constMult_q <= "010011011010000111101010011111000110101111001010110001001000000";
                WHEN "011101" =>  p0_uid93_constMult_q <= "010100000110011110110010110111000100101100010010000000100110000";
                WHEN "011110" =>  p0_uid93_constMult_q <= "010100110010110101111011001111000010101001011001010000000100000";
                WHEN "011111" =>  p0_uid93_constMult_q <= "010101011111001101000011100111000000100110100000011111100010000";
                WHEN "100000" =>  p0_uid93_constMult_q <= "010110001011100100001011111110111110100011100111101111000000000";
                WHEN "100001" =>  p0_uid93_constMult_q <= "010110110111111011010100010110111100100000101110111110011110000";
                WHEN "100010" =>  p0_uid93_constMult_q <= "010111100100010010011100101110111010011101110110001101111100000";
                WHEN "100011" =>  p0_uid93_constMult_q <= "011000010000101001100101000110111000011010111101011101011010000";
                WHEN "100100" =>  p0_uid93_constMult_q <= "011000111101000000101101011110110110011000000100101100111000000";
                WHEN "100101" =>  p0_uid93_constMult_q <= "011001101001010111110101110110110100010101001011111100010110000";
                WHEN "100110" =>  p0_uid93_constMult_q <= "011010010101101110111110001110110010010010010011001011110100000";
                WHEN "100111" =>  p0_uid93_constMult_q <= "011011000010000110000110100110110000001111011010011011010010000";
                WHEN "101000" =>  p0_uid93_constMult_q <= "011011101110011101001110111110101110001100100001101010110000000";
                WHEN "101001" =>  p0_uid93_constMult_q <= "011100011010110100010111010110101100001001101000111010001110000";
                WHEN "101010" =>  p0_uid93_constMult_q <= "011101000111001011011111101110101010000110110000001001101100000";
                WHEN "101011" =>  p0_uid93_constMult_q <= "011101110011100010101000000110101000000011110111011001001010000";
                WHEN "101100" =>  p0_uid93_constMult_q <= "011110011111111001110000011110100110000000111110101000101000000";
                WHEN "101101" =>  p0_uid93_constMult_q <= "011111001100010000111000110110100011111110000101111000000110000";
                WHEN "101110" =>  p0_uid93_constMult_q <= "011111111000101000000001001110100001111011001101000111100100000";
                WHEN "101111" =>  p0_uid93_constMult_q <= "100000100100111111001001100110011111111000010100010111000010000";
                WHEN "110000" =>  p0_uid93_constMult_q <= "100001010001010110010001111110011101110101011011100110100000000";
                WHEN "110001" =>  p0_uid93_constMult_q <= "100001111101101101011010010110011011110010100010110101111110000";
                WHEN "110010" =>  p0_uid93_constMult_q <= "100010101010000100100010101110011001101111101010000101011100000";
                WHEN "110011" =>  p0_uid93_constMult_q <= "100011010110011011101011000110010111101100110001010100111010000";
                WHEN "110100" =>  p0_uid93_constMult_q <= "100100000010110010110011011110010101101001111000100100011000000";
                WHEN "110101" =>  p0_uid93_constMult_q <= "100100101111001001111011110110010011100110111111110011110110000";
                WHEN "110110" =>  p0_uid93_constMult_q <= "100101011011100001000100001110010001100100000111000011010100000";
                WHEN "110111" =>  p0_uid93_constMult_q <= "100110000111111000001100100110001111100001001110010010110010000";
                WHEN "111000" =>  p0_uid93_constMult_q <= "100110110100001111010100111110001101011110010101100010010000000";
                WHEN "111001" =>  p0_uid93_constMult_q <= "100111100000100110011101010110001011011011011100110001101110000";
                WHEN "111010" =>  p0_uid93_constMult_q <= "101000001100111101100101101110001001011000100100000001001100000";
                WHEN "111011" =>  p0_uid93_constMult_q <= "101000111001010100101110000110000111010101101011010000101010000";
                WHEN "111100" =>  p0_uid93_constMult_q <= "101001100101101011110110011110000101010010110010100000001000000";
                WHEN "111101" =>  p0_uid93_constMult_q <= "101010010010000010111110110110000011001111111001101111100110000";
                WHEN "111110" =>  p0_uid93_constMult_q <= "101010111110011010000111001110000001001101000000111111000100000";
                WHEN "111111" =>  p0_uid93_constMult_q <= "101011101010110001001111100101111111001010001000001110100010000";
                WHEN OTHERS =>
                    p0_uid93_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000";
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--xv1_uid91_constMult(BITSELECT,90)@27
    xv1_uid91_constMult_in <= e_uid29_fpLogETest_q;
    xv1_uid91_constMult_b <= xv1_uid91_constMult_in(11 downto 6);

	--reg_xv1_uid91_constMult_0_to_p1_uid92_constMult_0(REG,402)@27
    reg_xv1_uid91_constMult_0_to_p1_uid92_constMult_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_xv1_uid91_constMult_0_to_p1_uid92_constMult_0_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_xv1_uid91_constMult_0_to_p1_uid92_constMult_0_q <= xv1_uid91_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--p1_uid92_constMult(LOOKUP,91)@28
    p1_uid92_constMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p1_uid92_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (reg_xv1_uid91_constMult_0_to_p1_uid92_constMult_0_q) IS
                WHEN "000000" =>  p1_uid92_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
                WHEN "000001" =>  p1_uid92_constMult_q <= "000000101100010111001000010111111101111101000111001111011110000000000";
                WHEN "000010" =>  p1_uid92_constMult_q <= "000001011000101110010000101111111011111010001110011110111100000000000";
                WHEN "000011" =>  p1_uid92_constMult_q <= "000010000101000101011001000111111001110111010101101110011010000000000";
                WHEN "000100" =>  p1_uid92_constMult_q <= "000010110001011100100001011111110111110100011100111101111000000000000";
                WHEN "000101" =>  p1_uid92_constMult_q <= "000011011101110011101001110111110101110001100100001101010110000000000";
                WHEN "000110" =>  p1_uid92_constMult_q <= "000100001010001010110010001111110011101110101011011100110100000000000";
                WHEN "000111" =>  p1_uid92_constMult_q <= "000100110110100001111010100111110001101011110010101100010010000000000";
                WHEN "001000" =>  p1_uid92_constMult_q <= "000101100010111001000010111111101111101000111001111011110000000000000";
                WHEN "001001" =>  p1_uid92_constMult_q <= "000110001111010000001011010111101101100110000001001011001110000000000";
                WHEN "001010" =>  p1_uid92_constMult_q <= "000110111011100111010011101111101011100011001000011010101100000000000";
                WHEN "001011" =>  p1_uid92_constMult_q <= "000111100111111110011100000111101001100000001111101010001010000000000";
                WHEN "001100" =>  p1_uid92_constMult_q <= "001000010100010101100100011111100111011101010110111001101000000000000";
                WHEN "001101" =>  p1_uid92_constMult_q <= "001001000000101100101100110111100101011010011110001001000110000000000";
                WHEN "001110" =>  p1_uid92_constMult_q <= "001001101101000011110101001111100011010111100101011000100100000000000";
                WHEN "001111" =>  p1_uid92_constMult_q <= "001010011001011010111101100111100001010100101100101000000010000000000";
                WHEN "010000" =>  p1_uid92_constMult_q <= "001011000101110010000101111111011111010001110011110111100000000000000";
                WHEN "010001" =>  p1_uid92_constMult_q <= "001011110010001001001110010111011101001110111011000110111110000000000";
                WHEN "010010" =>  p1_uid92_constMult_q <= "001100011110100000010110101111011011001100000010010110011100000000000";
                WHEN "010011" =>  p1_uid92_constMult_q <= "001101001010110111011111000111011001001001001001100101111010000000000";
                WHEN "010100" =>  p1_uid92_constMult_q <= "001101110111001110100111011111010111000110010000110101011000000000000";
                WHEN "010101" =>  p1_uid92_constMult_q <= "001110100011100101101111110111010101000011011000000100110110000000000";
                WHEN "010110" =>  p1_uid92_constMult_q <= "001111001111111100111000001111010011000000011111010100010100000000000";
                WHEN "010111" =>  p1_uid92_constMult_q <= "001111111100010100000000100111010000111101100110100011110010000000000";
                WHEN "011000" =>  p1_uid92_constMult_q <= "010000101000101011001000111111001110111010101101110011010000000000000";
                WHEN "011001" =>  p1_uid92_constMult_q <= "010001010101000010010001010111001100110111110101000010101110000000000";
                WHEN "011010" =>  p1_uid92_constMult_q <= "010010000001011001011001101111001010110100111100010010001100000000000";
                WHEN "011011" =>  p1_uid92_constMult_q <= "010010101101110000100010000111001000110010000011100001101010000000000";
                WHEN "011100" =>  p1_uid92_constMult_q <= "010011011010000111101010011111000110101111001010110001001000000000000";
                WHEN "011101" =>  p1_uid92_constMult_q <= "010100000110011110110010110111000100101100010010000000100110000000000";
                WHEN "011110" =>  p1_uid92_constMult_q <= "010100110010110101111011001111000010101001011001010000000100000000000";
                WHEN "011111" =>  p1_uid92_constMult_q <= "010101011111001101000011100111000000100110100000011111100010000000000";
                WHEN "100000" =>  p1_uid92_constMult_q <= "101001110100011011110100000001000001011100011000010001000000000000000";
                WHEN "100001" =>  p1_uid92_constMult_q <= "101010100000110010111100011000111111011001011111100000011110000000000";
                WHEN "100010" =>  p1_uid92_constMult_q <= "101011001101001010000100110000111101010110100110101111111100000000000";
                WHEN "100011" =>  p1_uid92_constMult_q <= "101011111001100001001101001000111011010011101101111111011010000000000";
                WHEN "100100" =>  p1_uid92_constMult_q <= "101100100101111000010101100000111001010000110101001110111000000000000";
                WHEN "100101" =>  p1_uid92_constMult_q <= "101101010010001111011101111000110111001101111100011110010110000000000";
                WHEN "100110" =>  p1_uid92_constMult_q <= "101101111110100110100110010000110101001011000011101101110100000000000";
                WHEN "100111" =>  p1_uid92_constMult_q <= "101110101010111101101110101000110011001000001010111101010010000000000";
                WHEN "101000" =>  p1_uid92_constMult_q <= "101111010111010100110111000000110001000101010010001100110000000000000";
                WHEN "101001" =>  p1_uid92_constMult_q <= "110000000011101011111111011000101111000010011001011100001110000000000";
                WHEN "101010" =>  p1_uid92_constMult_q <= "110000110000000011000111110000101100111111100000101011101100000000000";
                WHEN "101011" =>  p1_uid92_constMult_q <= "110001011100011010010000001000101010111100100111111011001010000000000";
                WHEN "101100" =>  p1_uid92_constMult_q <= "110010001000110001011000100000101000111001101111001010101000000000000";
                WHEN "101101" =>  p1_uid92_constMult_q <= "110010110101001000100000111000100110110110110110011010000110000000000";
                WHEN "101110" =>  p1_uid92_constMult_q <= "110011100001011111101001010000100100110011111101101001100100000000000";
                WHEN "101111" =>  p1_uid92_constMult_q <= "110100001101110110110001101000100010110001000100111001000010000000000";
                WHEN "110000" =>  p1_uid92_constMult_q <= "110100111010001101111010000000100000101110001100001000100000000000000";
                WHEN "110001" =>  p1_uid92_constMult_q <= "110101100110100101000010011000011110101011010011010111111110000000000";
                WHEN "110010" =>  p1_uid92_constMult_q <= "110110010010111100001010110000011100101000011010100111011100000000000";
                WHEN "110011" =>  p1_uid92_constMult_q <= "110110111111010011010011001000011010100101100001110110111010000000000";
                WHEN "110100" =>  p1_uid92_constMult_q <= "110111101011101010011011100000011000100010101001000110011000000000000";
                WHEN "110101" =>  p1_uid92_constMult_q <= "111000011000000001100011111000010110011111110000010101110110000000000";
                WHEN "110110" =>  p1_uid92_constMult_q <= "111001000100011000101100010000010100011100110111100101010100000000000";
                WHEN "110111" =>  p1_uid92_constMult_q <= "111001110000101111110100101000010010011001111110110100110010000000000";
                WHEN "111000" =>  p1_uid92_constMult_q <= "111010011101000110111101000000010000010111000110000100010000000000000";
                WHEN "111001" =>  p1_uid92_constMult_q <= "111011001001011110000101011000001110010100001101010011101110000000000";
                WHEN "111010" =>  p1_uid92_constMult_q <= "111011110101110101001101110000001100010001010100100011001100000000000";
                WHEN "111011" =>  p1_uid92_constMult_q <= "111100100010001100010110001000001010001110011011110010101010000000000";
                WHEN "111100" =>  p1_uid92_constMult_q <= "111101001110100011011110100000001000001011100011000010001000000000000";
                WHEN "111101" =>  p1_uid92_constMult_q <= "111101111010111010100110111000000110001000101010010001100110000000000";
                WHEN "111110" =>  p1_uid92_constMult_q <= "111110100111010001101111010000000100000101110001100001000100000000000";
                WHEN "111111" =>  p1_uid92_constMult_q <= "111111010011101000110111101000000010000010111000110000100010000000000";
                WHEN OTHERS =>
                    p1_uid92_constMult_q <= "000000000000000000000000000000000000000000000000000000000000000000000";
            END CASE;
        END IF;
        END IF;
    END PROCESS;


	--lev1_a0_uid94_constMult(ADD,93)@29
    lev1_a0_uid94_constMult_a <= STD_LOGIC_VECTOR((70 downto 69 => p1_uid92_constMult_q(68)) & p1_uid92_constMult_q);
    lev1_a0_uid94_constMult_b <= STD_LOGIC_VECTOR('0' & "0000000" & p0_uid93_constMult_q);
            lev1_a0_uid94_constMult_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0_uid94_constMult_a) + SIGNED(lev1_a0_uid94_constMult_b));
    lev1_a0_uid94_constMult_q <= lev1_a0_uid94_constMult_o(69 downto 0);


	--sR_uid95_constMult(BITSELECT,94)@29
    sR_uid95_constMult_in <= lev1_a0_uid94_constMult_q(68 downto 0);
    sR_uid95_constMult_b <= sR_uid95_constMult_in(68 downto 2);

	--reg_sR_uid95_constMult_0_to_addTermOne_uid45_fpLogETest_2(REG,405)@29
    reg_sR_uid95_constMult_0_to_addTermOne_uid45_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_sR_uid95_constMult_0_to_addTermOne_uid45_fpLogETest_2_q <= "0000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_sR_uid95_constMult_0_to_addTermOne_uid45_fpLogETest_2_q <= sR_uid95_constMult_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor(LOGICAL,953)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_b <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_sticky_ena_q;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_q <= not (ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_a or ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_b);

	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_mem_top(CONSTANT,949)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_mem_top_q <= "011010";

	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp(LOGICAL,950)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_a <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_mem_top_q;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_q);
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_q <= "1" when ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_a = ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_b else "0";

	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmpReg(REG,951)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmpReg_q <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_sticky_ena(REG,954)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_nor_q = "1") THEN
                ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_sticky_ena_q <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd(LOGICAL,955)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_a <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_sticky_ena_q;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_b <= en;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_q <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_a and ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_b;

	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt(COUNTER,945)
    -- every=1, low=0, high=26, step=1, init=1
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_i = 25 THEN
                      ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_eq = '1') THEN
                        ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_i <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_i - 26;
                    ELSE
                        ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_i <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_i,5));


	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdreg(REG,946)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdreg_q <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux(MUX,947)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_s <= en;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux: PROCESS (ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_s, ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdreg_q, ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_s IS
                  WHEN "0" => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_q <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdreg_q;
                  WHEN "1" => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_q <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem(DUALMEM,944)
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_ia <= ld_reg_c_uid31_fpLogETest_0_to_multTermOne_uid42_fpLogETest_1_q_to_multTermOne_uid42_fpLogETest_b_inputreg_q;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_aa <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdreg_q;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_ab <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_rdmux_q;
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 27,
        width_b => 1,
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
        clocken1 => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_iq,
        address_a => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_aa,
        data_a => ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_ia
    );
    ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_reset0 <= areset;
        ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_q <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_iq(0 downto 0);

	--addTermOne_uid45_fpLogETest(MUX,44)@30
    addTermOne_uid45_fpLogETest_s <= ld_reg_c_uid31_fpLogETest_0_to_addTermOne_uid45_fpLogETest_1_q_to_addTermOne_uid45_fpLogETest_b_replace_mem_q;
    addTermOne_uid45_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            addTermOne_uid45_fpLogETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE addTermOne_uid45_fpLogETest_s IS
                      WHEN "0" => addTermOne_uid45_fpLogETest_q <= reg_sR_uid95_constMult_0_to_addTermOne_uid45_fpLogETest_2_q;
                      WHEN "1" => addTermOne_uid45_fpLogETest_q <= wideZero_uid44_fpLogETest_q;
                      WHEN OTHERS => addTermOne_uid45_fpLogETest_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	--sumAHighB_uid48_fpLogETest(ADD,47)@31
    sumAHighB_uid48_fpLogETest_a <= STD_LOGIC_VECTOR((67 downto 67 => addTermOne_uid45_fpLogETest_q(66)) & addTermOne_uid45_fpLogETest_q);
    sumAHighB_uid48_fpLogETest_b <= STD_LOGIC_VECTOR((67 downto 59 => reg_highBBits_uid47_fpLogETest_0_to_sumAHighB_uid48_fpLogETest_1_q(58)) & reg_highBBits_uid47_fpLogETest_0_to_sumAHighB_uid48_fpLogETest_1_q);
            sumAHighB_uid48_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid48_fpLogETest_a) + SIGNED(sumAHighB_uid48_fpLogETest_b));
    sumAHighB_uid48_fpLogETest_q <= sumAHighB_uid48_fpLogETest_o(67 downto 0);


	--lowRangeB_uid46_fpLogETest(BITSELECT,45)@30
    lowRangeB_uid46_fpLogETest_in <= postPEMul_uid43_fpLogETest_result_add_1_0_q(49 downto 0);
    lowRangeB_uid46_fpLogETest_b <= lowRangeB_uid46_fpLogETest_in(49 downto 0);

	--reg_lowRangeB_uid46_fpLogETest_0_to_finalSum_uid46_uid49_fpLogETest_0(REG,407)@30
    reg_lowRangeB_uid46_fpLogETest_0_to_finalSum_uid46_uid49_fpLogETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_lowRangeB_uid46_fpLogETest_0_to_finalSum_uid46_uid49_fpLogETest_0_q <= "00000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_lowRangeB_uid46_fpLogETest_0_to_finalSum_uid46_uid49_fpLogETest_0_q <= lowRangeB_uid46_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--finalSum_uid46_uid49_fpLogETest(BITJOIN,48)@31
    finalSum_uid46_uid49_fpLogETest_q <= sumAHighB_uid48_fpLogETest_q & reg_lowRangeB_uid46_fpLogETest_0_to_finalSum_uid46_uid49_fpLogETest_0_q;

	--FullSumAB117_uid50_fpLogETest(BITSELECT,49)@31
    FullSumAB117_uid50_fpLogETest_in <= finalSum_uid46_uid49_fpLogETest_q;
    FullSumAB117_uid50_fpLogETest_b <= FullSumAB117_uid50_fpLogETest_in(117 downto 117);

	--notC_uid71_fpLogETest(LOGICAL,70)@31
    notC_uid71_fpLogETest_a <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_q;
    notC_uid71_fpLogETest_q <= not notC_uid71_fpLogETest_a;

	--signTerm2_uid72_fpLogETest(LOGICAL,71)@31
    signTerm2_uid72_fpLogETest_a <= notC_uid71_fpLogETest_q;
    signTerm2_uid72_fpLogETest_b <= FullSumAB117_uid50_fpLogETest_b;
    signTerm2_uid72_fpLogETest_q <= signTerm2_uid72_fpLogETest_a and signTerm2_uid72_fpLogETest_b;

	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor(LOGICAL,966)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_b <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_sticky_ena_q;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_q <= not (ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_a or ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_b);

	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_mem_top(CONSTANT,962)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_mem_top_q <= "011100";

	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp(LOGICAL,963)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_a <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_mem_top_q;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q);
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_q <= "1" when ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_a = ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_b else "0";

	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg(REG,964)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_sticky_ena(REG,967)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_nor_q = "1") THEN
                ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_sticky_ena_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd(LOGICAL,968)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_a <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_sticky_ena_q;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_b <= en;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_a and ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_b;

	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_inputreg(DELAY,956)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => c_uid31_fpLogETest_q, xout => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt(COUNTER,958)
    -- every=1, low=0, high=28, step=1, init=1
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_i = 27 THEN
                      ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_eq = '1') THEN
                        ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_i <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_i - 28;
                    ELSE
                        ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_i <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_i,5));


	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg(REG,959)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q <= "00000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux(MUX,960)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_s <= en;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux: PROCESS (ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_s, ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q, ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q;
                  WHEN "1" => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem(DUALMEM,957)
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_ia <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_inputreg_q;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_aa <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_ab <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q;
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_iq,
        address_a => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_aa,
        data_a => ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_ia
    );
    ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_reset0 <= areset;
        ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_iq(0 downto 0);

	--signRC1_uid73_fpLogETest(LOGICAL,72)@31
    signRC1_uid73_fpLogETest_a <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_mem_q;
    signRC1_uid73_fpLogETest_b <= signTerm2_uid72_fpLogETest_q;
    signRC1_uid73_fpLogETest_q_i <= signRC1_uid73_fpLogETest_a or signRC1_uid73_fpLogETest_b;
    signRC1_uid73_fpLogETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => signRC1_uid73_fpLogETest_q, xin => signRC1_uid73_fpLogETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor(LOGICAL,979)
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_b <= ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_sticky_ena_q;
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_q <= not (ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_a or ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_b);

	--ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_sticky_ena(REG,980)
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_nor_q = "1") THEN
                ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_sticky_ena_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd(LOGICAL,981)
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_a <= ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_sticky_ena_q;
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_b <= en;
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_q <= ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_a and ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_b;

	--cstAllZWF_uid8_fpLogETest(CONSTANT,7)
    cstAllZWF_uid8_fpLogETest_q <= "0000000000000000000000000000000000000000000000000000";

	--fracXIsZero_uid20_fpLogETest(LOGICAL,19)@0
    fracXIsZero_uid20_fpLogETest_a <= frac_uid19_fpLogETest_b;
    fracXIsZero_uid20_fpLogETest_b <= cstAllZWF_uid8_fpLogETest_q;
    fracXIsZero_uid20_fpLogETest_q <= "1" when fracXIsZero_uid20_fpLogETest_a = fracXIsZero_uid20_fpLogETest_b else "0";

	--InvFracXIsZero_uid22_fpLogETest(LOGICAL,21)@0
    InvFracXIsZero_uid22_fpLogETest_a <= fracXIsZero_uid20_fpLogETest_q;
    InvFracXIsZero_uid22_fpLogETest_q <= not InvFracXIsZero_uid22_fpLogETest_a;

	--cstAllOWE_uid12_fpLogETest(CONSTANT,11)
    cstAllOWE_uid12_fpLogETest_q <= "11111111111";

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
    cstAllZWE_uid14_fpLogETest_q <= "00000000000";

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
    exc_R_uid27_fpLogETest_q_i <= exc_R_uid27_fpLogETest_a and exc_R_uid27_fpLogETest_b and exc_R_uid27_fpLogETest_c;
    exc_R_uid27_fpLogETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => exc_R_uid27_fpLogETest_q, xin => exc_R_uid27_fpLogETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_inputreg(DELAY,969)
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_R_uid27_fpLogETest_q, xout => ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem(DUALMEM,970)
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_ia <= ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_inputreg_q;
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_aa <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q;
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_ab <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q;
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_iq,
        address_a => ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_aa,
        data_a => ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_ia
    );
    ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_reset0 <= areset;
        ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_q <= ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_iq(0 downto 0);

	--signRC11_uid74_fpLogETest(LOGICAL,73)@32
    signRC11_uid74_fpLogETest_a <= ld_exc_R_uid27_fpLogETest_q_to_signRC11_uid74_fpLogETest_a_replace_mem_q;
    signRC11_uid74_fpLogETest_b <= signRC1_uid73_fpLogETest_q;
    signRC11_uid74_fpLogETest_q <= signRC11_uid74_fpLogETest_a and signRC11_uid74_fpLogETest_b;

	--ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor(LOGICAL,992)
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_b <= ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_sticky_ena_q;
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_q <= not (ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_a or ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_b);

	--ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_sticky_ena(REG,993)
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_nor_q = "1") THEN
                ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_sticky_ena_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd(LOGICAL,994)
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_a <= ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_sticky_ena_q;
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_b <= en;
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_q <= ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_a and ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_b;

	--reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1(REG,437)@0
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


	--ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_inputreg(DELAY,982)
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q, xout => ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem(DUALMEM,983)
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_ia <= ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_inputreg_q;
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_aa <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q;
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_ab <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q;
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_iq,
        address_a => ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_aa,
        data_a => ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_ia
    );
    ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_reset0 <= areset;
        ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_q <= ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_iq(0 downto 0);

	--signR_uid75_fpLogETest(LOGICAL,74)@32
    signR_uid75_fpLogETest_a <= ld_reg_expXIsZero_uid16_fpLogETest_0_to_signR_uid75_fpLogETest_1_q_to_signR_uid75_fpLogETest_a_replace_mem_q;
    signR_uid75_fpLogETest_b <= signRC11_uid74_fpLogETest_q;
    signR_uid75_fpLogETest_q <= signR_uid75_fpLogETest_a or signR_uid75_fpLogETest_b;

	--ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor(LOGICAL,1005)
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_b <= ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_sticky_ena_q;
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_q <= not (ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_a or ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_b);

	--ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_sticky_ena(REG,1006)
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_nor_q = "1") THEN
                ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_sticky_ena_q <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd(LOGICAL,1007)
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_a <= ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_sticky_ena_q;
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_b <= en;
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_q <= ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_a and ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_b;

	--signX_uid7_fpLogETest(BITSELECT,6)@0
    signX_uid7_fpLogETest_in <= a;
    signX_uid7_fpLogETest_b <= signX_uid7_fpLogETest_in(63 downto 63);

	--negNonZero_uid69_fpLogETest(LOGICAL,68)@0
    negNonZero_uid69_fpLogETest_a <= InvExpXIsZero_uid26_fpLogETest_q;
    negNonZero_uid69_fpLogETest_b <= signX_uid7_fpLogETest_b;
    negNonZero_uid69_fpLogETest_q <= negNonZero_uid69_fpLogETest_a and negNonZero_uid69_fpLogETest_b;

	--excRNaN_uid70_fpLogETest(LOGICAL,69)@0
    excRNaN_uid70_fpLogETest_a <= negNonZero_uid69_fpLogETest_q;
    excRNaN_uid70_fpLogETest_b <= exc_N_uid23_fpLogETest_q;
    excRNaN_uid70_fpLogETest_q <= excRNaN_uid70_fpLogETest_a or excRNaN_uid70_fpLogETest_b;

	--ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_inputreg(DELAY,995)
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRNaN_uid70_fpLogETest_q, xout => ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem(DUALMEM,996)
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_ia <= ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_inputreg_q;
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_aa <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdreg_q;
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_ab <= ld_c_uid31_fpLogETest_q_to_notC_uid71_fpLogETest_a_replace_rdmux_q;
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_dmem : altsyncram
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
        clocken1 => ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_iq,
        address_a => ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_aa,
        data_a => ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_ia
    );
    ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_reset0 <= areset;
        ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_q <= ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_iq(0 downto 0);

	--InvExcRNaN_uid76_fpLogETest(LOGICAL,75)@31
    InvExcRNaN_uid76_fpLogETest_a <= ld_excRNaN_uid70_fpLogETest_q_to_InvExcRNaN_uid76_fpLogETest_a_replace_mem_q;
    InvExcRNaN_uid76_fpLogETest_q_i <= not InvExcRNaN_uid76_fpLogETest_a;
    InvExcRNaN_uid76_fpLogETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => InvExcRNaN_uid76_fpLogETest_q, xin => InvExcRNaN_uid76_fpLogETest_q_i, clk => clk, aclr => areset);

	--signRFull_uid77_fpLogETest(LOGICAL,76)@32
    signRFull_uid77_fpLogETest_a <= InvExcRNaN_uid76_fpLogETest_q;
    signRFull_uid77_fpLogETest_b <= signR_uid75_fpLogETest_q;
    signRFull_uid77_fpLogETest_q_i <= signRFull_uid77_fpLogETest_a and signRFull_uid77_fpLogETest_b;
    signRFull_uid77_fpLogETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => signRFull_uid77_fpLogETest_q, xin => signRFull_uid77_fpLogETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c(DELAY,522)@33
    ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 8 )
    PORT MAP ( xin => signRFull_uid77_fpLogETest_q, xout => ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c_q, ena => en(0), clk => clk, aclr => areset );

	--zs_uid147_countZ_uid54_fpLogETest(CONSTANT,146)
    zs_uid147_countZ_uid54_fpLogETest_q <= "0000000000000000000000000000000000000000000000000000000000000000";

	--ld_FullSumAB117_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b(DELAY,481)@31
    ld_FullSumAB117_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => FullSumAB117_uid50_fpLogETest_b, xout => ld_FullSumAB117_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--finalSumOneComp_uid52_fpLogETest(LOGICAL,51)@31
    finalSumOneComp_uid52_fpLogETest_a <= finalSum_uid46_uid49_fpLogETest_q;
    finalSumOneComp_uid52_fpLogETest_b <= STD_LOGIC_VECTOR((117 downto 1 => FullSumAB117_uid50_fpLogETest_b(0)) & FullSumAB117_uid50_fpLogETest_b);
    finalSumOneComp_uid52_fpLogETest_q_i <= finalSumOneComp_uid52_fpLogETest_a xor finalSumOneComp_uid52_fpLogETest_b;
    finalSumOneComp_uid52_fpLogETest_delay : dspba_delay
    GENERIC MAP (width => 118, depth => 1)
    PORT MAP (xout => finalSumOneComp_uid52_fpLogETest_q, xin => finalSumOneComp_uid52_fpLogETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--finalSumAbs_uid53_fpLogETest(ADD,52)@32
    finalSumAbs_uid53_fpLogETest_a <= STD_LOGIC_VECTOR((118 downto 118 => finalSumOneComp_uid52_fpLogETest_q(117)) & finalSumOneComp_uid52_fpLogETest_q);
    finalSumAbs_uid53_fpLogETest_b <= STD_LOGIC_VECTOR((118 downto 1 => ld_FullSumAB117_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b_q(0)) & ld_FullSumAB117_uid50_fpLogETest_b_to_finalSumAbs_uid53_fpLogETest_b_q);
            finalSumAbs_uid53_fpLogETest_o <= STD_LOGIC_VECTOR(SIGNED(finalSumAbs_uid53_fpLogETest_a) + SIGNED(finalSumAbs_uid53_fpLogETest_b));
    finalSumAbs_uid53_fpLogETest_q <= finalSumAbs_uid53_fpLogETest_o(118 downto 0);


	--rVStage_uid148_countZ_uid54_fpLogETest(BITSELECT,147)@32
    rVStage_uid148_countZ_uid54_fpLogETest_in <= finalSumAbs_uid53_fpLogETest_q;
    rVStage_uid148_countZ_uid54_fpLogETest_b <= rVStage_uid148_countZ_uid54_fpLogETest_in(118 downto 55);

	--reg_rVStage_uid148_countZ_uid54_fpLogETest_0_to_vCount_uid149_countZ_uid54_fpLogETest_1(REG,408)@32
    reg_rVStage_uid148_countZ_uid54_fpLogETest_0_to_vCount_uid149_countZ_uid54_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid148_countZ_uid54_fpLogETest_0_to_vCount_uid149_countZ_uid54_fpLogETest_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid148_countZ_uid54_fpLogETest_0_to_vCount_uid149_countZ_uid54_fpLogETest_1_q <= rVStage_uid148_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid149_countZ_uid54_fpLogETest(LOGICAL,148)@33
    vCount_uid149_countZ_uid54_fpLogETest_a <= reg_rVStage_uid148_countZ_uid54_fpLogETest_0_to_vCount_uid149_countZ_uid54_fpLogETest_1_q;
    vCount_uid149_countZ_uid54_fpLogETest_b <= zs_uid147_countZ_uid54_fpLogETest_q;
    vCount_uid149_countZ_uid54_fpLogETest_q <= "1" when vCount_uid149_countZ_uid54_fpLogETest_a = vCount_uid149_countZ_uid54_fpLogETest_b else "0";

	--reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6(REG,422)@33
    reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q <= vCount_uid149_countZ_uid54_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q_to_r_uid188_countZ_uid54_fpLogETest_g(DELAY,616)@34
    ld_reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q_to_r_uid188_countZ_uid54_fpLogETest_g : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q, xout => ld_reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q_to_r_uid188_countZ_uid54_fpLogETest_g_q, ena => en(0), clk => clk, aclr => areset );

	--zs_uid155_countZ_uid54_fpLogETest(CONSTANT,154)
    zs_uid155_countZ_uid54_fpLogETest_q <= "00000000000000000000000000000000";

	--vStage_uid151_countZ_uid54_fpLogETest(BITSELECT,150)@32
    vStage_uid151_countZ_uid54_fpLogETest_in <= finalSumAbs_uid53_fpLogETest_q(54 downto 0);
    vStage_uid151_countZ_uid54_fpLogETest_b <= vStage_uid151_countZ_uid54_fpLogETest_in(54 downto 0);

	--ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_cStage_uid152_countZ_uid54_fpLogETest_b(DELAY,574)@32
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_cStage_uid152_countZ_uid54_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 55, depth => 1 )
    PORT MAP ( xin => vStage_uid151_countZ_uid54_fpLogETest_b, xout => ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_cStage_uid152_countZ_uid54_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--mO_uid150_countZ_uid54_fpLogETest(CONSTANT,149)
    mO_uid150_countZ_uid54_fpLogETest_q <= "111111111";

	--cStage_uid152_countZ_uid54_fpLogETest(BITJOIN,151)@33
    cStage_uid152_countZ_uid54_fpLogETest_q <= ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_cStage_uid152_countZ_uid54_fpLogETest_b_q & mO_uid150_countZ_uid54_fpLogETest_q;

	--ld_rVStage_uid148_countZ_uid54_fpLogETest_b_to_vStagei_uid154_countZ_uid54_fpLogETest_c(DELAY,576)@32
    ld_rVStage_uid148_countZ_uid54_fpLogETest_b_to_vStagei_uid154_countZ_uid54_fpLogETest_c : dspba_delay
    GENERIC MAP ( width => 64, depth => 1 )
    PORT MAP ( xin => rVStage_uid148_countZ_uid54_fpLogETest_b, xout => ld_rVStage_uid148_countZ_uid54_fpLogETest_b_to_vStagei_uid154_countZ_uid54_fpLogETest_c_q, ena => en(0), clk => clk, aclr => areset );

	--vStagei_uid154_countZ_uid54_fpLogETest(MUX,153)@33
    vStagei_uid154_countZ_uid54_fpLogETest_s <= vCount_uid149_countZ_uid54_fpLogETest_q;
    vStagei_uid154_countZ_uid54_fpLogETest: PROCESS (vStagei_uid154_countZ_uid54_fpLogETest_s, en, ld_rVStage_uid148_countZ_uid54_fpLogETest_b_to_vStagei_uid154_countZ_uid54_fpLogETest_c_q, cStage_uid152_countZ_uid54_fpLogETest_q)
    BEGIN
            CASE vStagei_uid154_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid154_countZ_uid54_fpLogETest_q <= ld_rVStage_uid148_countZ_uid54_fpLogETest_b_to_vStagei_uid154_countZ_uid54_fpLogETest_c_q;
                  WHEN "1" => vStagei_uid154_countZ_uid54_fpLogETest_q <= cStage_uid152_countZ_uid54_fpLogETest_q;
                  WHEN OTHERS => vStagei_uid154_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid156_countZ_uid54_fpLogETest(BITSELECT,155)@33
    rVStage_uid156_countZ_uid54_fpLogETest_in <= vStagei_uid154_countZ_uid54_fpLogETest_q;
    rVStage_uid156_countZ_uid54_fpLogETest_b <= rVStage_uid156_countZ_uid54_fpLogETest_in(63 downto 32);

	--reg_rVStage_uid156_countZ_uid54_fpLogETest_0_to_vCount_uid157_countZ_uid54_fpLogETest_1(REG,409)@33
    reg_rVStage_uid156_countZ_uid54_fpLogETest_0_to_vCount_uid157_countZ_uid54_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid156_countZ_uid54_fpLogETest_0_to_vCount_uid157_countZ_uid54_fpLogETest_1_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid156_countZ_uid54_fpLogETest_0_to_vCount_uid157_countZ_uid54_fpLogETest_1_q <= rVStage_uid156_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid157_countZ_uid54_fpLogETest(LOGICAL,156)@34
    vCount_uid157_countZ_uid54_fpLogETest_a <= reg_rVStage_uid156_countZ_uid54_fpLogETest_0_to_vCount_uid157_countZ_uid54_fpLogETest_1_q;
    vCount_uid157_countZ_uid54_fpLogETest_b <= zs_uid155_countZ_uid54_fpLogETest_q;
    vCount_uid157_countZ_uid54_fpLogETest_q <= "1" when vCount_uid157_countZ_uid54_fpLogETest_a = vCount_uid157_countZ_uid54_fpLogETest_b else "0";

	--ld_vCount_uid157_countZ_uid54_fpLogETest_q_to_reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_a(DELAY,876)@34
    ld_vCount_uid157_countZ_uid54_fpLogETest_q_to_reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid157_countZ_uid54_fpLogETest_q, xout => ld_vCount_uid157_countZ_uid54_fpLogETest_q_to_reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5(REG,421)@36
    reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_q <= ld_vCount_uid157_countZ_uid54_fpLogETest_q_to_reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_a_q;
            END IF;
        END IF;
    END PROCESS;


	--zs_uid161_countZ_uid54_fpLogETest(CONSTANT,160)
    zs_uid161_countZ_uid54_fpLogETest_q <= "0000000000000000";

	--vStage_uid158_countZ_uid54_fpLogETest(BITSELECT,157)@33
    vStage_uid158_countZ_uid54_fpLogETest_in <= vStagei_uid154_countZ_uid54_fpLogETest_q(31 downto 0);
    vStage_uid158_countZ_uid54_fpLogETest_b <= vStage_uid158_countZ_uid54_fpLogETest_in(31 downto 0);

	--reg_vStage_uid158_countZ_uid54_fpLogETest_0_to_vStagei_uid160_countZ_uid54_fpLogETest_3(REG,411)@33
    reg_vStage_uid158_countZ_uid54_fpLogETest_0_to_vStagei_uid160_countZ_uid54_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid158_countZ_uid54_fpLogETest_0_to_vStagei_uid160_countZ_uid54_fpLogETest_3_q <= "00000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid158_countZ_uid54_fpLogETest_0_to_vStagei_uid160_countZ_uid54_fpLogETest_3_q <= vStage_uid158_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid160_countZ_uid54_fpLogETest(MUX,159)@34
    vStagei_uid160_countZ_uid54_fpLogETest_s <= vCount_uid157_countZ_uid54_fpLogETest_q;
    vStagei_uid160_countZ_uid54_fpLogETest: PROCESS (vStagei_uid160_countZ_uid54_fpLogETest_s, en, reg_rVStage_uid156_countZ_uid54_fpLogETest_0_to_vCount_uid157_countZ_uid54_fpLogETest_1_q, reg_vStage_uid158_countZ_uid54_fpLogETest_0_to_vStagei_uid160_countZ_uid54_fpLogETest_3_q)
    BEGIN
            CASE vStagei_uid160_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid160_countZ_uid54_fpLogETest_q <= reg_rVStage_uid156_countZ_uid54_fpLogETest_0_to_vCount_uid157_countZ_uid54_fpLogETest_1_q;
                  WHEN "1" => vStagei_uid160_countZ_uid54_fpLogETest_q <= reg_vStage_uid158_countZ_uid54_fpLogETest_0_to_vStagei_uid160_countZ_uid54_fpLogETest_3_q;
                  WHEN OTHERS => vStagei_uid160_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid162_countZ_uid54_fpLogETest(BITSELECT,161)@34
    rVStage_uid162_countZ_uid54_fpLogETest_in <= vStagei_uid160_countZ_uid54_fpLogETest_q;
    rVStage_uid162_countZ_uid54_fpLogETest_b <= rVStage_uid162_countZ_uid54_fpLogETest_in(31 downto 16);

	--reg_rVStage_uid162_countZ_uid54_fpLogETest_0_to_vCount_uid163_countZ_uid54_fpLogETest_1(REG,412)@34
    reg_rVStage_uid162_countZ_uid54_fpLogETest_0_to_vCount_uid163_countZ_uid54_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid162_countZ_uid54_fpLogETest_0_to_vCount_uid163_countZ_uid54_fpLogETest_1_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid162_countZ_uid54_fpLogETest_0_to_vCount_uid163_countZ_uid54_fpLogETest_1_q <= rVStage_uid162_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vCount_uid163_countZ_uid54_fpLogETest(LOGICAL,162)@35
    vCount_uid163_countZ_uid54_fpLogETest_a <= reg_rVStage_uid162_countZ_uid54_fpLogETest_0_to_vCount_uid163_countZ_uid54_fpLogETest_1_q;
    vCount_uid163_countZ_uid54_fpLogETest_b <= zs_uid161_countZ_uid54_fpLogETest_q;
    vCount_uid163_countZ_uid54_fpLogETest_q <= "1" when vCount_uid163_countZ_uid54_fpLogETest_a = vCount_uid163_countZ_uid54_fpLogETest_b else "0";

	--ld_vCount_uid163_countZ_uid54_fpLogETest_q_to_reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_a(DELAY,875)@35
    ld_vCount_uid163_countZ_uid54_fpLogETest_q_to_reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid163_countZ_uid54_fpLogETest_q, xout => ld_vCount_uid163_countZ_uid54_fpLogETest_q_to_reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_a_q, ena => en(0), clk => clk, aclr => areset );

	--reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4(REG,420)@36
    reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_q <= ld_vCount_uid163_countZ_uid54_fpLogETest_q_to_reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_a_q;
            END IF;
        END IF;
    END PROCESS;


	--zs_uid167_countZ_uid54_fpLogETest(CONSTANT,166)
    zs_uid167_countZ_uid54_fpLogETest_q <= "00000000";

	--vStage_uid164_countZ_uid54_fpLogETest(BITSELECT,163)@34
    vStage_uid164_countZ_uid54_fpLogETest_in <= vStagei_uid160_countZ_uid54_fpLogETest_q(15 downto 0);
    vStage_uid164_countZ_uid54_fpLogETest_b <= vStage_uid164_countZ_uid54_fpLogETest_in(15 downto 0);

	--reg_vStage_uid164_countZ_uid54_fpLogETest_0_to_vStagei_uid166_countZ_uid54_fpLogETest_3(REG,414)@34
    reg_vStage_uid164_countZ_uid54_fpLogETest_0_to_vStagei_uid166_countZ_uid54_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid164_countZ_uid54_fpLogETest_0_to_vStagei_uid166_countZ_uid54_fpLogETest_3_q <= "0000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid164_countZ_uid54_fpLogETest_0_to_vStagei_uid166_countZ_uid54_fpLogETest_3_q <= vStage_uid164_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid166_countZ_uid54_fpLogETest(MUX,165)@35
    vStagei_uid166_countZ_uid54_fpLogETest_s <= vCount_uid163_countZ_uid54_fpLogETest_q;
    vStagei_uid166_countZ_uid54_fpLogETest: PROCESS (vStagei_uid166_countZ_uid54_fpLogETest_s, en, reg_rVStage_uid162_countZ_uid54_fpLogETest_0_to_vCount_uid163_countZ_uid54_fpLogETest_1_q, reg_vStage_uid164_countZ_uid54_fpLogETest_0_to_vStagei_uid166_countZ_uid54_fpLogETest_3_q)
    BEGIN
            CASE vStagei_uid166_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid166_countZ_uid54_fpLogETest_q <= reg_rVStage_uid162_countZ_uid54_fpLogETest_0_to_vCount_uid163_countZ_uid54_fpLogETest_1_q;
                  WHEN "1" => vStagei_uid166_countZ_uid54_fpLogETest_q <= reg_vStage_uid164_countZ_uid54_fpLogETest_0_to_vStagei_uid166_countZ_uid54_fpLogETest_3_q;
                  WHEN OTHERS => vStagei_uid166_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid168_countZ_uid54_fpLogETest(BITSELECT,167)@35
    rVStage_uid168_countZ_uid54_fpLogETest_in <= vStagei_uid166_countZ_uid54_fpLogETest_q;
    rVStage_uid168_countZ_uid54_fpLogETest_b <= rVStage_uid168_countZ_uid54_fpLogETest_in(15 downto 8);

	--vCount_uid169_countZ_uid54_fpLogETest(LOGICAL,168)@35
    vCount_uid169_countZ_uid54_fpLogETest_a <= rVStage_uid168_countZ_uid54_fpLogETest_b;
    vCount_uid169_countZ_uid54_fpLogETest_b <= zs_uid167_countZ_uid54_fpLogETest_q;
    vCount_uid169_countZ_uid54_fpLogETest_q_i <= "1" when vCount_uid169_countZ_uid54_fpLogETest_a = vCount_uid169_countZ_uid54_fpLogETest_b else "0";
    vCount_uid169_countZ_uid54_fpLogETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid169_countZ_uid54_fpLogETest_q, xin => vCount_uid169_countZ_uid54_fpLogETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--ld_vCount_uid169_countZ_uid54_fpLogETest_q_to_r_uid188_countZ_uid54_fpLogETest_d(DELAY,613)@36
    ld_vCount_uid169_countZ_uid54_fpLogETest_q_to_r_uid188_countZ_uid54_fpLogETest_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid169_countZ_uid54_fpLogETest_q, xout => ld_vCount_uid169_countZ_uid54_fpLogETest_q_to_r_uid188_countZ_uid54_fpLogETest_d_q, ena => en(0), clk => clk, aclr => areset );

	--zs_uid173_countZ_uid54_fpLogETest(CONSTANT,172)
    zs_uid173_countZ_uid54_fpLogETest_q <= "0000";

	--vStage_uid170_countZ_uid54_fpLogETest(BITSELECT,169)@35
    vStage_uid170_countZ_uid54_fpLogETest_in <= vStagei_uid166_countZ_uid54_fpLogETest_q(7 downto 0);
    vStage_uid170_countZ_uid54_fpLogETest_b <= vStage_uid170_countZ_uid54_fpLogETest_in(7 downto 0);

	--reg_vStage_uid170_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_3(REG,416)@35
    reg_vStage_uid170_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid170_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_3_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid170_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_3_q <= vStage_uid170_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid168_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_2(REG,415)@35
    reg_rVStage_uid168_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid168_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_2_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid168_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_2_q <= rVStage_uid168_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid172_countZ_uid54_fpLogETest(MUX,171)@36
    vStagei_uid172_countZ_uid54_fpLogETest_s <= vCount_uid169_countZ_uid54_fpLogETest_q;
    vStagei_uid172_countZ_uid54_fpLogETest: PROCESS (vStagei_uid172_countZ_uid54_fpLogETest_s, en, reg_rVStage_uid168_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_2_q, reg_vStage_uid170_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_3_q)
    BEGIN
            CASE vStagei_uid172_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid172_countZ_uid54_fpLogETest_q <= reg_rVStage_uid168_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_2_q;
                  WHEN "1" => vStagei_uid172_countZ_uid54_fpLogETest_q <= reg_vStage_uid170_countZ_uid54_fpLogETest_0_to_vStagei_uid172_countZ_uid54_fpLogETest_3_q;
                  WHEN OTHERS => vStagei_uid172_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid174_countZ_uid54_fpLogETest(BITSELECT,173)@36
    rVStage_uid174_countZ_uid54_fpLogETest_in <= vStagei_uid172_countZ_uid54_fpLogETest_q;
    rVStage_uid174_countZ_uid54_fpLogETest_b <= rVStage_uid174_countZ_uid54_fpLogETest_in(7 downto 4);

	--vCount_uid175_countZ_uid54_fpLogETest(LOGICAL,174)@36
    vCount_uid175_countZ_uid54_fpLogETest_a <= rVStage_uid174_countZ_uid54_fpLogETest_b;
    vCount_uid175_countZ_uid54_fpLogETest_b <= zs_uid173_countZ_uid54_fpLogETest_q;
    vCount_uid175_countZ_uid54_fpLogETest_q <= "1" when vCount_uid175_countZ_uid54_fpLogETest_a = vCount_uid175_countZ_uid54_fpLogETest_b else "0";

	--reg_vCount_uid175_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_2(REG,419)@36
    reg_vCount_uid175_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vCount_uid175_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_2_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vCount_uid175_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_2_q <= vCount_uid175_countZ_uid54_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--vStage_uid176_countZ_uid54_fpLogETest(BITSELECT,175)@36
    vStage_uid176_countZ_uid54_fpLogETest_in <= vStagei_uid172_countZ_uid54_fpLogETest_q(3 downto 0);
    vStage_uid176_countZ_uid54_fpLogETest_b <= vStage_uid176_countZ_uid54_fpLogETest_in(3 downto 0);

	--vStagei_uid178_countZ_uid54_fpLogETest(MUX,177)@36
    vStagei_uid178_countZ_uid54_fpLogETest_s <= vCount_uid175_countZ_uid54_fpLogETest_q;
    vStagei_uid178_countZ_uid54_fpLogETest: PROCESS (vStagei_uid178_countZ_uid54_fpLogETest_s, en, rVStage_uid174_countZ_uid54_fpLogETest_b, vStage_uid176_countZ_uid54_fpLogETest_b)
    BEGIN
            CASE vStagei_uid178_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid178_countZ_uid54_fpLogETest_q <= rVStage_uid174_countZ_uid54_fpLogETest_b;
                  WHEN "1" => vStagei_uid178_countZ_uid54_fpLogETest_q <= vStage_uid176_countZ_uid54_fpLogETest_b;
                  WHEN OTHERS => vStagei_uid178_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid180_countZ_uid54_fpLogETest(BITSELECT,179)@36
    rVStage_uid180_countZ_uid54_fpLogETest_in <= vStagei_uid178_countZ_uid54_fpLogETest_q;
    rVStage_uid180_countZ_uid54_fpLogETest_b <= rVStage_uid180_countZ_uid54_fpLogETest_in(3 downto 2);

	--vCount_uid181_countZ_uid54_fpLogETest(LOGICAL,180)@36
    vCount_uid181_countZ_uid54_fpLogETest_a <= rVStage_uid180_countZ_uid54_fpLogETest_b;
    vCount_uid181_countZ_uid54_fpLogETest_b <= z2_uid40_fpLogETest_q;
    vCount_uid181_countZ_uid54_fpLogETest_q_i <= "1" when vCount_uid181_countZ_uid54_fpLogETest_a = vCount_uid181_countZ_uid54_fpLogETest_b else "0";
    vCount_uid181_countZ_uid54_fpLogETest_delay : dspba_delay
    GENERIC MAP (width => 1, depth => 1)
    PORT MAP (xout => vCount_uid181_countZ_uid54_fpLogETest_q, xin => vCount_uid181_countZ_uid54_fpLogETest_q_i, clk => clk, ena => en(0), aclr => areset);

	--vStage_uid182_countZ_uid54_fpLogETest(BITSELECT,181)@36
    vStage_uid182_countZ_uid54_fpLogETest_in <= vStagei_uid178_countZ_uid54_fpLogETest_q(1 downto 0);
    vStage_uid182_countZ_uid54_fpLogETest_b <= vStage_uid182_countZ_uid54_fpLogETest_in(1 downto 0);

	--reg_vStage_uid182_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_3(REG,418)@36
    reg_vStage_uid182_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_vStage_uid182_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_3_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_vStage_uid182_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_3_q <= vStage_uid182_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--reg_rVStage_uid180_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_2(REG,417)@36
    reg_rVStage_uid180_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid180_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_2_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_rVStage_uid180_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_2_q <= rVStage_uid180_countZ_uid54_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--vStagei_uid184_countZ_uid54_fpLogETest(MUX,183)@37
    vStagei_uid184_countZ_uid54_fpLogETest_s <= vCount_uid181_countZ_uid54_fpLogETest_q;
    vStagei_uid184_countZ_uid54_fpLogETest: PROCESS (vStagei_uid184_countZ_uid54_fpLogETest_s, en, reg_rVStage_uid180_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_2_q, reg_vStage_uid182_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_3_q)
    BEGIN
            CASE vStagei_uid184_countZ_uid54_fpLogETest_s IS
                  WHEN "0" => vStagei_uid184_countZ_uid54_fpLogETest_q <= reg_rVStage_uid180_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_2_q;
                  WHEN "1" => vStagei_uid184_countZ_uid54_fpLogETest_q <= reg_vStage_uid182_countZ_uid54_fpLogETest_0_to_vStagei_uid184_countZ_uid54_fpLogETest_3_q;
                  WHEN OTHERS => vStagei_uid184_countZ_uid54_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid186_countZ_uid54_fpLogETest(BITSELECT,185)@37
    rVStage_uid186_countZ_uid54_fpLogETest_in <= vStagei_uid184_countZ_uid54_fpLogETest_q;
    rVStage_uid186_countZ_uid54_fpLogETest_b <= rVStage_uid186_countZ_uid54_fpLogETest_in(1 downto 1);

	--vCount_uid187_countZ_uid54_fpLogETest(LOGICAL,186)@37
    vCount_uid187_countZ_uid54_fpLogETest_a <= rVStage_uid186_countZ_uid54_fpLogETest_b;
    vCount_uid187_countZ_uid54_fpLogETest_b <= GND_q;
    vCount_uid187_countZ_uid54_fpLogETest_q <= "1" when vCount_uid187_countZ_uid54_fpLogETest_a = vCount_uid187_countZ_uid54_fpLogETest_b else "0";

	--r_uid188_countZ_uid54_fpLogETest(BITJOIN,187)@37
    r_uid188_countZ_uid54_fpLogETest_q <= ld_reg_vCount_uid149_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_6_q_to_r_uid188_countZ_uid54_fpLogETest_g_q & reg_vCount_uid157_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_5_q & reg_vCount_uid163_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_4_q & ld_vCount_uid169_countZ_uid54_fpLogETest_q_to_r_uid188_countZ_uid54_fpLogETest_d_q & reg_vCount_uid175_countZ_uid54_fpLogETest_0_to_r_uid188_countZ_uid54_fpLogETest_2_q & vCount_uid181_countZ_uid54_fpLogETest_q & vCount_uid187_countZ_uid54_fpLogETest_q;

	--ld_r_uid188_countZ_uid54_fpLogETest_q_to_expRExt_uid57_fpLogETest_b(DELAY,482)@37
    ld_r_uid188_countZ_uid54_fpLogETest_q_to_expRExt_uid57_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => r_uid188_countZ_uid54_fpLogETest_q, xout => ld_r_uid188_countZ_uid54_fpLogETest_q_to_expRExt_uid57_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--cstMSBFinalSumPBias_uid56_fpLogETest(CONSTANT,55)
    cstMSBFinalSumPBias_uid56_fpLogETest_q <= "010000001100";

	--expRExt_uid57_fpLogETest(SUB,56)@38
    expRExt_uid57_fpLogETest_a <= STD_LOGIC_VECTOR("0" & cstMSBFinalSumPBias_uid56_fpLogETest_q);
    expRExt_uid57_fpLogETest_b <= STD_LOGIC_VECTOR("000000" & ld_r_uid188_countZ_uid54_fpLogETest_q_to_expRExt_uid57_fpLogETest_b_q);
    expRExt_uid57_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRExt_uid57_fpLogETest_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expRExt_uid57_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt_uid57_fpLogETest_a) - UNSIGNED(expRExt_uid57_fpLogETest_b));
            END IF;
        END IF;
    END PROCESS;
    expRExt_uid57_fpLogETest_q <= expRExt_uid57_fpLogETest_o(12 downto 0);


	--LeftShiftStage2117dto0_uid225_normVal_uid55_fpLogETest(BITSELECT,224)@39
    LeftShiftStage2117dto0_uid225_normVal_uid55_fpLogETest_in <= leftShiftStage2_uid223_normVal_uid55_fpLogETest_q(117 downto 0);
    LeftShiftStage2117dto0_uid225_normVal_uid55_fpLogETest_b <= LeftShiftStage2117dto0_uid225_normVal_uid55_fpLogETest_in(117 downto 0);

	--leftShiftStage3Idx1_uid226_normVal_uid55_fpLogETest(BITJOIN,225)@39
    leftShiftStage3Idx1_uid226_normVal_uid55_fpLogETest_q <= LeftShiftStage2117dto0_uid225_normVal_uid55_fpLogETest_b & GND_q;

	--ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor(LOGICAL,1114)
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_b <= ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_sticky_ena_q;
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_q <= not (ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_a or ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_b);

	--ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_sticky_ena(REG,1115)
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_nor_q = "1") THEN
                ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd(LOGICAL,1116)
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_a <= ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_sticky_ena_q;
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_b <= en;
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_q <= ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_a and ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_b;

	--X22dto0_uid198_normVal_uid55_fpLogETest(BITSELECT,197)@32
    X22dto0_uid198_normVal_uid55_fpLogETest_in <= finalSumAbs_uid53_fpLogETest_q(22 downto 0);
    X22dto0_uid198_normVal_uid55_fpLogETest_b <= X22dto0_uid198_normVal_uid55_fpLogETest_in(22 downto 0);

	--ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_inputreg(DELAY,1106)
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => X22dto0_uid198_normVal_uid55_fpLogETest_b, xout => ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem(DUALMEM,1107)
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_ia <= ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_inputreg_q;
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q;
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q;
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_dmem : altsyncram
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
        clocken1 => ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_iq,
        address_a => ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_aa,
        data_a => ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_ia
    );
    ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_reset0 <= areset;
        ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_q <= ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_iq(22 downto 0);

	--leftShiftStage0Idx3Pad96_uid197_normVal_uid55_fpLogETest(CONSTANT,196)
    leftShiftStage0Idx3Pad96_uid197_normVal_uid55_fpLogETest_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

	--leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest(BITJOIN,198)@36
    leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_q <= ld_X22dto0_uid198_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_b_replace_mem_q & leftShiftStage0Idx3Pad96_uid197_normVal_uid55_fpLogETest_q;

	--reg_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_5(REG,426)@36
    reg_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_5_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_5_q <= leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor(LOGICAL,1103)
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_b <= ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_sticky_ena_q;
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_q <= not (ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_a or ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_b);

	--ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_sticky_ena(REG,1104)
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_nor_q = "1") THEN
                ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd(LOGICAL,1105)
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_a <= ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_sticky_ena_q;
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_b <= en;
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_q <= ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_a and ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_b;

	--ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem(DUALMEM,1096)
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_ia <= ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_cStage_uid152_countZ_uid54_fpLogETest_b_q;
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q;
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q;
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 55,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 55,
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
        clocken1 => ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_iq,
        address_a => ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_aa,
        data_a => ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_ia
    );
    ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_reset0 <= areset;
        ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_q <= ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_iq(54 downto 0);

	--leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest(BITJOIN,195)@36
    leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_q <= ld_vStage_uid151_countZ_uid54_fpLogETest_b_to_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_b_replace_mem_q & zs_uid147_countZ_uid54_fpLogETest_q;

	--reg_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_4(REG,425)@36
    reg_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_4_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_4_q <= leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor(LOGICAL,1092)
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_b <= ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_sticky_ena_q;
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_q <= not (ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_a or ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_b);

	--ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_sticky_ena(REG,1093)
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_nor_q = "1") THEN
                ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd(LOGICAL,1094)
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_a <= ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_sticky_ena_q;
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_b <= en;
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_q <= ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_a and ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_b;

	--X86dto0_uid192_normVal_uid55_fpLogETest(BITSELECT,191)@32
    X86dto0_uid192_normVal_uid55_fpLogETest_in <= finalSumAbs_uid53_fpLogETest_q(86 downto 0);
    X86dto0_uid192_normVal_uid55_fpLogETest_b <= X86dto0_uid192_normVal_uid55_fpLogETest_in(86 downto 0);

	--ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_inputreg(DELAY,1084)
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_inputreg : dspba_delay
    GENERIC MAP ( width => 87, depth => 1 )
    PORT MAP ( xin => X86dto0_uid192_normVal_uid55_fpLogETest_b, xout => ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem(DUALMEM,1085)
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_ia <= ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_inputreg_q;
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q;
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q;
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 87,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 87,
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
        clocken1 => ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_iq,
        address_a => ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_aa,
        data_a => ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_ia
    );
    ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_reset0 <= areset;
        ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_q <= ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_iq(86 downto 0);

	--leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest(BITJOIN,192)@36
    leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_q <= ld_X86dto0_uid192_normVal_uid55_fpLogETest_b_to_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_b_replace_mem_q & zs_uid155_countZ_uid54_fpLogETest_q;

	--reg_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_3(REG,424)@36
    reg_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_3_q <= leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor(LOGICAL,1162)
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_b <= ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_sticky_ena_q;
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_q <= not (ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_a or ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_b);

	--ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_sticky_ena(REG,1163)
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_nor_q = "1") THEN
                ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_sticky_ena_q <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd(LOGICAL,1164)
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_a <= ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_sticky_ena_q;
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_b <= en;
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_q <= ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_a and ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_b;

	--ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_inputreg(DELAY,1154)
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_inputreg : dspba_delay
    GENERIC MAP ( width => 119, depth => 1 )
    PORT MAP ( xin => finalSumAbs_uid53_fpLogETest_q, xout => ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem(DUALMEM,1155)
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_ia <= ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_inputreg_q;
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_aa <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdreg_q;
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_ab <= ld_frac_uid19_fpLogETest_b_to_zPPolyEval_uid35_fpLogETest_a_replace_rdmux_q;
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 119,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 119,
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
        clocken1 => ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_iq,
        address_a => ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_aa,
        data_a => ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_ia
    );
    ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_reset0 <= areset;
        ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_q <= ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_iq(118 downto 0);

	--reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2(REG,423)@36
    reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_q <= ld_finalSumAbs_uid53_fpLogETest_q_to_reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_a_replace_mem_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel6Dto5_uid200_normVal_uid55_fpLogETest(BITSELECT,199)@37
    leftShiftStageSel6Dto5_uid200_normVal_uid55_fpLogETest_in <= r_uid188_countZ_uid54_fpLogETest_q;
    leftShiftStageSel6Dto5_uid200_normVal_uid55_fpLogETest_b <= leftShiftStageSel6Dto5_uid200_normVal_uid55_fpLogETest_in(6 downto 5);

	--leftShiftStage0_uid201_normVal_uid55_fpLogETest(MUX,200)@37
    leftShiftStage0_uid201_normVal_uid55_fpLogETest_s <= leftShiftStageSel6Dto5_uid200_normVal_uid55_fpLogETest_b;
    leftShiftStage0_uid201_normVal_uid55_fpLogETest: PROCESS (leftShiftStage0_uid201_normVal_uid55_fpLogETest_s, en, reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_q, reg_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_3_q, reg_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_4_q, reg_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_5_q)
    BEGIN
            CASE leftShiftStage0_uid201_normVal_uid55_fpLogETest_s IS
                  WHEN "00" => leftShiftStage0_uid201_normVal_uid55_fpLogETest_q <= reg_finalSumAbs_uid53_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_2_q;
                  WHEN "01" => leftShiftStage0_uid201_normVal_uid55_fpLogETest_q <= reg_leftShiftStage0Idx1_uid193_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_3_q;
                  WHEN "10" => leftShiftStage0_uid201_normVal_uid55_fpLogETest_q <= reg_leftShiftStage0Idx2_uid196_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_4_q;
                  WHEN "11" => leftShiftStage0_uid201_normVal_uid55_fpLogETest_q <= reg_leftShiftStage0Idx3_uid199_normVal_uid55_fpLogETest_0_to_leftShiftStage0_uid201_normVal_uid55_fpLogETest_5_q;
                  WHEN OTHERS => leftShiftStage0_uid201_normVal_uid55_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage094dto0_uid209_normVal_uid55_fpLogETest(BITSELECT,208)@37
    LeftShiftStage094dto0_uid209_normVal_uid55_fpLogETest_in <= leftShiftStage0_uid201_normVal_uid55_fpLogETest_q(94 downto 0);
    LeftShiftStage094dto0_uid209_normVal_uid55_fpLogETest_b <= LeftShiftStage094dto0_uid209_normVal_uid55_fpLogETest_in(94 downto 0);

	--leftShiftStage1Idx3Pad24_uid208_normVal_uid55_fpLogETest(CONSTANT,207)
    leftShiftStage1Idx3Pad24_uid208_normVal_uid55_fpLogETest_q <= "000000000000000000000000";

	--leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest(BITJOIN,209)@37
    leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_q <= LeftShiftStage094dto0_uid209_normVal_uid55_fpLogETest_b & leftShiftStage1Idx3Pad24_uid208_normVal_uid55_fpLogETest_q;

	--reg_leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_5(REG,431)@37
    reg_leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_5_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_5_q <= leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage0102dto0_uid206_normVal_uid55_fpLogETest(BITSELECT,205)@37
    LeftShiftStage0102dto0_uid206_normVal_uid55_fpLogETest_in <= leftShiftStage0_uid201_normVal_uid55_fpLogETest_q(102 downto 0);
    LeftShiftStage0102dto0_uid206_normVal_uid55_fpLogETest_b <= LeftShiftStage0102dto0_uid206_normVal_uid55_fpLogETest_in(102 downto 0);

	--leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest(BITJOIN,206)@37
    leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_q <= LeftShiftStage0102dto0_uid206_normVal_uid55_fpLogETest_b & zs_uid161_countZ_uid54_fpLogETest_q;

	--reg_leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_4(REG,430)@37
    reg_leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_4_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_4_q <= leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--LeftShiftStage0110dto0_uid203_normVal_uid55_fpLogETest(BITSELECT,202)@37
    LeftShiftStage0110dto0_uid203_normVal_uid55_fpLogETest_in <= leftShiftStage0_uid201_normVal_uid55_fpLogETest_q(110 downto 0);
    LeftShiftStage0110dto0_uid203_normVal_uid55_fpLogETest_b <= LeftShiftStage0110dto0_uid203_normVal_uid55_fpLogETest_in(110 downto 0);

	--leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest(BITJOIN,203)@37
    leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_q <= LeftShiftStage0110dto0_uid203_normVal_uid55_fpLogETest_b & zs_uid167_countZ_uid54_fpLogETest_q;

	--reg_leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_3(REG,429)@37
    reg_leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_3_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_3_q <= leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--reg_leftShiftStage0_uid201_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_2(REG,428)@37
    reg_leftShiftStage0_uid201_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage0_uid201_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage0_uid201_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_2_q <= leftShiftStage0_uid201_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest(BITSELECT,210)@37
    leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_in <= r_uid188_countZ_uid54_fpLogETest_q(4 downto 0);
    leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_b <= leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_in(4 downto 3);

	--reg_leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_1(REG,427)@37
    reg_leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_1_q <= leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStage1_uid212_normVal_uid55_fpLogETest(MUX,211)@38
    leftShiftStage1_uid212_normVal_uid55_fpLogETest_s <= reg_leftShiftStageSel4Dto3_uid211_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_1_q;
    leftShiftStage1_uid212_normVal_uid55_fpLogETest: PROCESS (leftShiftStage1_uid212_normVal_uid55_fpLogETest_s, en, reg_leftShiftStage0_uid201_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_2_q, reg_leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_3_q, reg_leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_4_q, reg_leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_5_q)
    BEGIN
            CASE leftShiftStage1_uid212_normVal_uid55_fpLogETest_s IS
                  WHEN "00" => leftShiftStage1_uid212_normVal_uid55_fpLogETest_q <= reg_leftShiftStage0_uid201_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_2_q;
                  WHEN "01" => leftShiftStage1_uid212_normVal_uid55_fpLogETest_q <= reg_leftShiftStage1Idx1_uid204_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_3_q;
                  WHEN "10" => leftShiftStage1_uid212_normVal_uid55_fpLogETest_q <= reg_leftShiftStage1Idx2_uid207_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_4_q;
                  WHEN "11" => leftShiftStage1_uid212_normVal_uid55_fpLogETest_q <= reg_leftShiftStage1Idx3_uid210_normVal_uid55_fpLogETest_0_to_leftShiftStage1_uid212_normVal_uid55_fpLogETest_5_q;
                  WHEN OTHERS => leftShiftStage1_uid212_normVal_uid55_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest(BITSELECT,219)@38
    LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_in <= leftShiftStage1_uid212_normVal_uid55_fpLogETest_q(112 downto 0);
    LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_b <= LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_in(112 downto 0);

	--ld_LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_b(DELAY,645)@38
    ld_LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 113, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_b, xout => ld_LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx3Pad6_uid219_normVal_uid55_fpLogETest(CONSTANT,218)
    leftShiftStage2Idx3Pad6_uid219_normVal_uid55_fpLogETest_q <= "000000";

	--leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest(BITJOIN,220)@39
    leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_q <= ld_LeftShiftStage1112dto0_uid220_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_b_q & leftShiftStage2Idx3Pad6_uid219_normVal_uid55_fpLogETest_q;

	--LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest(BITSELECT,216)@38
    LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_in <= leftShiftStage1_uid212_normVal_uid55_fpLogETest_q(114 downto 0);
    LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_b <= LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_in(114 downto 0);

	--ld_LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_b(DELAY,643)@38
    ld_LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 115, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_b, xout => ld_LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest(BITJOIN,217)@39
    leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_q <= ld_LeftShiftStage1114dto0_uid217_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_b_q & zs_uid173_countZ_uid54_fpLogETest_q;

	--LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest(BITSELECT,213)@38
    LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_in <= leftShiftStage1_uid212_normVal_uid55_fpLogETest_q(116 downto 0);
    LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_b <= LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_in(116 downto 0);

	--ld_LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_b(DELAY,641)@38
    ld_LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 117, depth => 1 )
    PORT MAP ( xin => LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_b, xout => ld_LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest(BITJOIN,214)@39
    leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_q <= ld_LeftShiftStage1116dto0_uid214_normVal_uid55_fpLogETest_b_to_leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_b_q & z2_uid40_fpLogETest_q;

	--reg_leftShiftStage1_uid212_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_2(REG,433)@38
    reg_leftShiftStage1_uid212_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStage1_uid212_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_2_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStage1_uid212_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_2_q <= leftShiftStage1_uid212_normVal_uid55_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest(BITSELECT,221)@37
    leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_in <= r_uid188_countZ_uid54_fpLogETest_q(2 downto 0);
    leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_b <= leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_in(2 downto 1);

	--reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1(REG,432)@37
    reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q <= "00";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q <= leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_b(DELAY,647)@38
    ld_reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q, xout => ld_reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage2_uid223_normVal_uid55_fpLogETest(MUX,222)@39
    leftShiftStage2_uid223_normVal_uid55_fpLogETest_s <= ld_reg_leftShiftStageSel2Dto1_uid222_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_1_q_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_b_q;
    leftShiftStage2_uid223_normVal_uid55_fpLogETest: PROCESS (leftShiftStage2_uid223_normVal_uid55_fpLogETest_s, en, reg_leftShiftStage1_uid212_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_2_q, leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_q, leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_q, leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_q)
    BEGIN
            CASE leftShiftStage2_uid223_normVal_uid55_fpLogETest_s IS
                  WHEN "00" => leftShiftStage2_uid223_normVal_uid55_fpLogETest_q <= reg_leftShiftStage1_uid212_normVal_uid55_fpLogETest_0_to_leftShiftStage2_uid223_normVal_uid55_fpLogETest_2_q;
                  WHEN "01" => leftShiftStage2_uid223_normVal_uid55_fpLogETest_q <= leftShiftStage2Idx1_uid215_normVal_uid55_fpLogETest_q;
                  WHEN "10" => leftShiftStage2_uid223_normVal_uid55_fpLogETest_q <= leftShiftStage2Idx2_uid218_normVal_uid55_fpLogETest_q;
                  WHEN "11" => leftShiftStage2_uid223_normVal_uid55_fpLogETest_q <= leftShiftStage2Idx3_uid221_normVal_uid55_fpLogETest_q;
                  WHEN OTHERS => leftShiftStage2_uid223_normVal_uid55_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest(BITSELECT,226)@37
    leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_in <= r_uid188_countZ_uid54_fpLogETest_q(0 downto 0);
    leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_b <= leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_in(0 downto 0);

	--ld_leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_b_to_leftShiftStage3_uid228_normVal_uid55_fpLogETest_b(DELAY,655)@37
    ld_leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_b_to_leftShiftStage3_uid228_normVal_uid55_fpLogETest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_b, xout => ld_leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_b_to_leftShiftStage3_uid228_normVal_uid55_fpLogETest_b_q, ena => en(0), clk => clk, aclr => areset );

	--leftShiftStage3_uid228_normVal_uid55_fpLogETest(MUX,227)@39
    leftShiftStage3_uid228_normVal_uid55_fpLogETest_s <= ld_leftShiftStageSel0Dto0_uid227_normVal_uid55_fpLogETest_b_to_leftShiftStage3_uid228_normVal_uid55_fpLogETest_b_q;
    leftShiftStage3_uid228_normVal_uid55_fpLogETest: PROCESS (leftShiftStage3_uid228_normVal_uid55_fpLogETest_s, en, leftShiftStage2_uid223_normVal_uid55_fpLogETest_q, leftShiftStage3Idx1_uid226_normVal_uid55_fpLogETest_q)
    BEGIN
            CASE leftShiftStage3_uid228_normVal_uid55_fpLogETest_s IS
                  WHEN "0" => leftShiftStage3_uid228_normVal_uid55_fpLogETest_q <= leftShiftStage2_uid223_normVal_uid55_fpLogETest_q;
                  WHEN "1" => leftShiftStage3_uid228_normVal_uid55_fpLogETest_q <= leftShiftStage3Idx1_uid226_normVal_uid55_fpLogETest_q;
                  WHEN OTHERS => leftShiftStage3_uid228_normVal_uid55_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracR_uid58_fpLogETest(BITSELECT,57)@39
    fracR_uid58_fpLogETest_in <= leftShiftStage3_uid228_normVal_uid55_fpLogETest_q(117 downto 0);
    fracR_uid58_fpLogETest_b <= fracR_uid58_fpLogETest_in(117 downto 65);

	--expFracConc_uid59_fpLogETest(BITJOIN,58)@39
    expFracConc_uid59_fpLogETest_q <= expRExt_uid57_fpLogETest_q & fracR_uid58_fpLogETest_b;

	--reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0(REG,434)@39
    reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0_q <= "000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0_q <= expFracConc_uid59_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--expFracPostRnd_uid60_fpLogETest(ADD,59)@40
    expFracPostRnd_uid60_fpLogETest_a <= STD_LOGIC_VECTOR("0" & reg_expFracConc_uid59_fpLogETest_0_to_expFracPostRnd_uid60_fpLogETest_0_q);
    expFracPostRnd_uid60_fpLogETest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & VCC_q);
            expFracPostRnd_uid60_fpLogETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRnd_uid60_fpLogETest_a) + UNSIGNED(expFracPostRnd_uid60_fpLogETest_b));
    expFracPostRnd_uid60_fpLogETest_q <= expFracPostRnd_uid60_fpLogETest_o(66 downto 0);


	--expR_uid62_fpLogETest(BITSELECT,61)@40
    expR_uid62_fpLogETest_in <= expFracPostRnd_uid60_fpLogETest_q(63 downto 0);
    expR_uid62_fpLogETest_b <= expR_uid62_fpLogETest_in(63 downto 53);

	--reg_expR_uid62_fpLogETest_0_to_expRPostExc_uid87_fpLogETest_3(REG,436)@40
    reg_expR_uid62_fpLogETest_0_to_expRPostExc_uid87_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expR_uid62_fpLogETest_0_to_expRPostExc_uid87_fpLogETest_3_q <= "00000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_expR_uid62_fpLogETest_0_to_expRPostExc_uid87_fpLogETest_3_q <= expR_uid62_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor(LOGICAL,1018)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_a <= ld_expX_uid6_fpLogETest_b_to_e_uid29_fpLogETest_a_notEnable_q;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_b <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_sticky_ena_q;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_q <= not (ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_a or ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_b);

	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_mem_top(CONSTANT,1014)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_mem_top_q <= "0100100";

	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp(LOGICAL,1015)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_a <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_mem_top_q;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_q);
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_q <= "1" when ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_a = ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_b else "0";

	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmpReg(REG,1016)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmpReg_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmpReg_q <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_sticky_ena(REG,1019)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_sticky_ena_q <= "0";
        ELSIF rising_edge(clk) THEN
            IF (ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_nor_q = "1") THEN
                ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_sticky_ena_q <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd(LOGICAL,1020)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_a <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_sticky_ena_q;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_b <= en;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_q <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_a and ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_b;

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

	--reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0(REG,319)@0
    reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q <= "000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q <= concExc_uid78_fpLogETest_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_inputreg(DELAY,1008)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_inputreg : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q, xout => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_inputreg_q, ena => en(0), clk => clk, aclr => areset );

	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt(COUNTER,1010)
    -- every=1, low=0, high=36, step=1, init=1
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                    IF ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_i = 35 THEN
                      ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_eq <= '1';
                    ELSE
                      ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_eq = '1') THEN
                        ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_i <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_i - 36;
                    ELSE
                        ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_i <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_i,6));


	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdreg(REG,1011)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdreg_q <= "000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdreg_q <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux(MUX,1012)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_s <= en;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux: PROCESS (ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_s, ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdreg_q, ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_q)
    BEGIN
            CASE ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_s IS
                  WHEN "0" => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_q <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdreg_q;
                  WHEN "1" => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_q <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdcnt_q;
                  WHEN OTHERS => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem(DUALMEM,1009)
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_ia <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_inputreg_q;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_aa <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdreg_q;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_ab <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_rdmux_q;
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 6,
        numwords_a => 37,
        width_b => 3,
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
        clocken1 => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_enaAnd_q(0),
        clocken0 => '1',
        wren_a => en(0),
        clock0 => clk,
        aclr1 => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_iq,
        address_a => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_aa,
        data_a => ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_ia
    );
    ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_reset0 <= areset;
        ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_q <= ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_iq(2 downto 0);

	--excREnc_uid79_fpLogETest(LOOKUP,78)@40
    excREnc_uid79_fpLogETest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid79_fpLogETest_q <= "01";
        ELSIF rising_edge(clk) THEN
        IF (en = "1") THEN
            CASE (ld_reg_concExc_uid78_fpLogETest_0_to_excREnc_uid79_fpLogETest_0_q_to_excREnc_uid79_fpLogETest_a_replace_mem_q) IS
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
        END IF;
        END IF;
    END PROCESS;


	--expRPostExc_uid87_fpLogETest(MUX,86)@41
    expRPostExc_uid87_fpLogETest_s <= excREnc_uid79_fpLogETest_q;
    expRPostExc_uid87_fpLogETest: PROCESS (expRPostExc_uid87_fpLogETest_s, en, cstAllZWE_uid14_fpLogETest_q, reg_expR_uid62_fpLogETest_0_to_expRPostExc_uid87_fpLogETest_3_q, cstAllOWE_uid12_fpLogETest_q, cstAllOWE_uid12_fpLogETest_q)
    BEGIN
            CASE expRPostExc_uid87_fpLogETest_s IS
                  WHEN "00" => expRPostExc_uid87_fpLogETest_q <= cstAllZWE_uid14_fpLogETest_q;
                  WHEN "01" => expRPostExc_uid87_fpLogETest_q <= reg_expR_uid62_fpLogETest_0_to_expRPostExc_uid87_fpLogETest_3_q;
                  WHEN "10" => expRPostExc_uid87_fpLogETest_q <= cstAllOWE_uid12_fpLogETest_q;
                  WHEN "11" => expRPostExc_uid87_fpLogETest_q <= cstAllOWE_uid12_fpLogETest_q;
                  WHEN OTHERS => expRPostExc_uid87_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid80_fpLogETest(CONSTANT,79)
    oneFracRPostExc2_uid80_fpLogETest_q <= "0000000000000000000000000000000000000000000000000001";

	--fracR_uid61_fpLogETest(BITSELECT,60)@40
    fracR_uid61_fpLogETest_in <= expFracPostRnd_uid60_fpLogETest_q(52 downto 0);
    fracR_uid61_fpLogETest_b <= fracR_uid61_fpLogETest_in(52 downto 1);

	--reg_fracR_uid61_fpLogETest_0_to_fracRPostExc_uid83_fpLogETest_3(REG,435)@40
    reg_fracR_uid61_fpLogETest_0_to_fracRPostExc_uid83_fpLogETest_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_fracR_uid61_fpLogETest_0_to_fracRPostExc_uid83_fpLogETest_3_q <= "0000000000000000000000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            IF (en = "1") THEN
                reg_fracR_uid61_fpLogETest_0_to_fracRPostExc_uid83_fpLogETest_3_q <= fracR_uid61_fpLogETest_b;
            END IF;
        END IF;
    END PROCESS;


	--fracRPostExc_uid83_fpLogETest(MUX,82)@41
    fracRPostExc_uid83_fpLogETest_s <= excREnc_uid79_fpLogETest_q;
    fracRPostExc_uid83_fpLogETest: PROCESS (fracRPostExc_uid83_fpLogETest_s, en, cstAllZWF_uid8_fpLogETest_q, reg_fracR_uid61_fpLogETest_0_to_fracRPostExc_uid83_fpLogETest_3_q, cstAllZWF_uid8_fpLogETest_q, oneFracRPostExc2_uid80_fpLogETest_q)
    BEGIN
            CASE fracRPostExc_uid83_fpLogETest_s IS
                  WHEN "00" => fracRPostExc_uid83_fpLogETest_q <= cstAllZWF_uid8_fpLogETest_q;
                  WHEN "01" => fracRPostExc_uid83_fpLogETest_q <= reg_fracR_uid61_fpLogETest_0_to_fracRPostExc_uid83_fpLogETest_3_q;
                  WHEN "10" => fracRPostExc_uid83_fpLogETest_q <= cstAllZWF_uid8_fpLogETest_q;
                  WHEN "11" => fracRPostExc_uid83_fpLogETest_q <= oneFracRPostExc2_uid80_fpLogETest_q;
                  WHEN OTHERS => fracRPostExc_uid83_fpLogETest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RLn_uid88_fpLogETest(BITJOIN,87)@41
    RLn_uid88_fpLogETest_q <= ld_signRFull_uid77_fpLogETest_q_to_RLn_uid88_fpLogETest_c_q & expRPostExc_uid87_fpLogETest_q & fracRPostExc_uid83_fpLogETest_q;

	--xOut(GPOUT,4)@41
    q <= RLn_uid88_fpLogETest_q;


end normal;
