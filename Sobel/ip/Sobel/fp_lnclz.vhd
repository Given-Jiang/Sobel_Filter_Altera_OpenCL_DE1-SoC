
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
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_LNCLZ.VHD                              ***
--***                                             ***
--***   Function: Single Precision CLZ            ***
--***                                             ***
--***   22/02/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_lnclz IS
PORT (
      mantissa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
      leading : OUT STD_LOGIC_VECTOR (5 DOWNTO 1)    
     );
END fp_lnclz;

ARCHITECTURE rtl of fp_lnclz IS

  type positiontype IS ARRAY (6 DOWNTO 1) OF STD_LOGIC_VECTOR (5 DOWNTO 1);
  
  signal position, positionmux : positiontype;
  signal zerogroup, firstzero : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal lastman : STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  component fp_pos
  GENERIC (start: integer := 0);
  PORT 
       (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1); 
        
        position : OUT STD_LOGIC_VECTOR (5 DOWNTO 1)    
       );
  end component;
  
BEGIN
     
  zerogroup(1) <= mantissa(32) OR mantissa(31) OR mantissa(30) OR mantissa(29) OR mantissa(28) OR mantissa(27);
  zerogroup(2) <= mantissa(26) OR mantissa(25) OR mantissa(24) OR mantissa(23) OR mantissa(22) OR mantissa(21);
  zerogroup(3) <= mantissa(20) OR mantissa(19) OR mantissa(18) OR mantissa(17) OR mantissa(16) OR mantissa(15);
  zerogroup(4) <= mantissa(14) OR mantissa(13) OR mantissa(12) OR mantissa(11) OR mantissa(10) OR mantissa(9);
  zerogroup(5) <= mantissa(8) OR mantissa(7) OR mantissa(6) OR mantissa(5) OR mantissa(4) OR mantissa(3);
  zerogroup(6) <= mantissa(2) OR mantissa(1);

  pa: fp_pos 
  GENERIC MAP (start=>0) 
  PORT MAP (ingroup=>mantissa(32 DOWNTO 27),position=>position(1)(5 DOWNTO 1));
  pb: fp_pos 
  GENERIC MAP (start=>6) 
  PORT MAP (ingroup=>mantissa(26 DOWNTO 21),position=>position(2)(5 DOWNTO 1));
  pc: fp_pos 
  GENERIC MAP (start=>12) 
  PORT MAP (ingroup=>mantissa(20 DOWNTO 15),position=>position(3)(5 DOWNTO 1));
  pd: fp_pos 
  GENERIC MAP (start=>18) 
  PORT MAP (ingroup=>mantissa(14 DOWNTO 9),position=>position(4)(5 DOWNTO 1));
  pe: fp_pos 
  GENERIC MAP (start=>24) 
  PORT MAP (ingroup=>mantissa(8 DOWNTO 3),position=>position(5)(5 DOWNTO 1));
  pf: fp_pos 
  GENERIC MAP (start=>30) 
  PORT MAP (ingroup=>lastman,position=>position(6)(5 DOWNTO 1));
      
  lastman <= mantissa(2 DOWNTO 1) & "0000";

  firstzero(1) <= zerogroup(1);
  firstzero(2) <= NOT(zerogroup(1)) AND zerogroup(2);
  firstzero(3) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND zerogroup(3);
  firstzero(4) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND zerogroup(4);
  firstzero(5) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                  AND zerogroup(5);
  firstzero(6) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                  AND NOT(zerogroup(5)) AND zerogroup(6);                
                
  gma: FOR k IN 1 TO 5 GENERATE
    positionmux(1)(k) <= position(1)(k) AND firstzero(1);
    gmb: FOR j IN 2 TO 6 GENERATE
      positionmux(j)(k) <= positionmux(j-1)(k) OR (position(j)(k) AND firstzero(j));
    END GENERATE;
  END GENERATE;
  
leading <= positionmux(6)(5 DOWNTO 1);
                                               
END rtl;

