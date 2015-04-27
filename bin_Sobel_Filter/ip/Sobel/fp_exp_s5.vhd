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

-- VHDL created from fp_exp_s5
-- VHDL created on Tue Mar 12 11:36:13 2013


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.hcc_package_cmd.all;
use work.math_package_cmd.all;
use work.fpc_library_package_cmd.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fp_exp_s5 is
    port (
        a : in std_logic_vector(31 downto 0);
        en : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of fp_exp_s5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal fpExpTest_reset : std_logic;
    signal fpExpTest_q : std_logic_vector (31 downto 0);
    -- synopsys translate off
    signal fpExpTest_q_real : REAL;
    -- synopsys translate on
begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)

	--xIn(GPIN,3)@0

	--fpExpTest(FLOATEXP,2)@0
    fpExpTest_reset <= areset;
    fpExpTest_inst : fp_exp_sIEEE_2_sIEEE
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => fpExpTest_reset,
    		dataa	 => a,
    		result	 => fpExpTest_q
    	);
    -- synopsys translate off
    fpExpTest_q_real <= sIEEE_2_real(fpExpTest_q);
    -- synopsys translate on

	--xOut(GPOUT,4)@16
    q <= fpExpTest_q;


end normal;
