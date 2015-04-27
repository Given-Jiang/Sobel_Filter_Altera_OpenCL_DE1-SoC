-- (C) 1992-2014 Altera Corporation. All rights reserved.                         
-- Your use of Altera Corporation's design tools, logic functions and other       
-- software and tools, and its AMPP partner logic functions, and any output       
-- files any of the foregoing (including device programming or simulation         
-- files), and any associated documentation or information are expressly subject  
-- to the terms and conditions of the Altera Program License Subscription         
-- Agreement, Altera MegaCore Function License Agreement, or other applicable     
-- license agreement, including, without limitation, that your use is for the     
-- sole purpose of programming logic devices manufactured by Altera and sold by   
-- Altera or its authorized distributors.  Please refer to the applicable         
-- agreement for further details.                                                 
    


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_CORDIC_ATAN1.VHD                       ***
--***                                             ***
--***   Function: ATAN Values Table for SIN and   ***
--***   COS CORDIC Core                           ***
--***                                             ***
--***   22/12/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_cordic_atan1 IS 
GENERIC (start : positive := 32;
         width : positive := 32;
         indexpoint : positive := 1);
PORT (
      indexbit : IN STD_LOGIC;

	    arctan : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
	  );
END fp_cordic_atan1;

ARCHITECTURE sft OF fp_cordic_atan1 IS
  
  type atantype IS ARRAY (48 DOWNTO 1) OF STD_LOGIC_VECTOR (48 DOWNTO 1); 
  
  signal atannum : atantype;
  
BEGIN
   
  -- "00" + 46 bits
  atannum(1)(48 DOWNTO 1) <= x"3243F6A8885A";
  atannum(2)(48 DOWNTO 1) <= x"1DAC670561BB";
  atannum(3)(48 DOWNTO 1) <= x"0FADBAFC9640";
  atannum(4)(48 DOWNTO 1) <= x"07F56EA6AB0C";
  atannum(5)(48 DOWNTO 1) <= x"03FEAB76E5A0";
  atannum(6)(48 DOWNTO 1) <= x"01FFD55BBA97"; 
  atannum(7)(48 DOWNTO 1) <= x"00FFFAAADDDC";
  atannum(8)(48 DOWNTO 1) <= x"007FFF5556EF";
  atannum(9)(48 DOWNTO 1) <= x"003FFFEAAAB7";
  
  atannum(10)(48 DOWNTO 1) <= x"001FFFFD5556";
  atannum(11)(48 DOWNTO 1) <= x"000FFFFFAAAB"; 
  atannum(12)(48 DOWNTO 1) <= x"0007FFFFF555";
  atannum(13)(48 DOWNTO 1) <= x"0003FFFFFEAB";
  atannum(14)(48 DOWNTO 1) <= x"0001FFFFFFD5";
  atannum(15)(48 DOWNTO 1) <= x"0000FFFFFFFB";
  atannum(16)(48 DOWNTO 1) <= x"00007FFFFFFF"; 
  atannum(17)(48 DOWNTO 1) <= x"000040000000";
  atannum(18)(48 DOWNTO 1) <= x"000020000000";
  atannum(19)(48 DOWNTO 1) <= x"000010000000";
  
  atannum(20)(48 DOWNTO 1) <= x"000008000000";
  atannum(21)(48 DOWNTO 1) <= x"000004000000"; 
  atannum(22)(48 DOWNTO 1) <= x"000002000000";
  atannum(23)(48 DOWNTO 1) <= x"000001000000";
  atannum(24)(48 DOWNTO 1) <= x"000000800000";
  atannum(25)(48 DOWNTO 1) <= x"000000400000";
  atannum(26)(48 DOWNTO 1) <= x"000000200000";  
  atannum(27)(48 DOWNTO 1) <= x"000000100000";
  atannum(28)(48 DOWNTO 1) <= x"000000080000";
  atannum(29)(48 DOWNTO 1) <= x"000000040000";
  
  atannum(30)(48 DOWNTO 1) <= x"000000020000";
  atannum(31)(48 DOWNTO 1) <= x"000000010000"; 
  atannum(32)(48 DOWNTO 1) <= x"000000008000";
  atannum(33)(48 DOWNTO 1) <= x"000000004000";
  atannum(34)(48 DOWNTO 1) <= x"000000002000";
  atannum(35)(48 DOWNTO 1) <= x"000000001000";
  atannum(36)(48 DOWNTO 1) <= x"000000000800";  
  atannum(37)(48 DOWNTO 1) <= x"000000000400";
  atannum(38)(48 DOWNTO 1) <= x"000000000200";
  atannum(39)(48 DOWNTO 1) <= x"000000000100";
  
  atannum(40)(48 DOWNTO 1) <= x"000000000080";
  atannum(41)(48 DOWNTO 1) <= x"000000000040"; 
  atannum(42)(48 DOWNTO 1) <= x"000000000020";
  atannum(43)(48 DOWNTO 1) <= x"000000000010";
  atannum(44)(48 DOWNTO 1) <= x"000000000008";
  atannum(45)(48 DOWNTO 1) <= x"000000000004";
  atannum(46)(48 DOWNTO 1) <= x"000000000002";  
  atannum(47)(48 DOWNTO 1) <= x"000000000001";
  atannum(48)(48 DOWNTO 1) <= x"000000000000";
    
  pca: PROCESS (indexbit)
  BEGIN
  
    CASE indexbit IS
      WHEN '0' => arctan <= atannum(start)(48 DOWNTO 49-width);
      WHEN '1' => arctan <= atannum(start+indexpoint)(48-indexpoint DOWNTO 49-indexpoint-width);
      WHEN others => arctan <= atannum(48)(width DOWNTO 1);
    END CASE;
  
  END PROCESS;
  
END sft;

