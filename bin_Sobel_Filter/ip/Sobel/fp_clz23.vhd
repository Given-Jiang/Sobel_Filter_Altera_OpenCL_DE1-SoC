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
--***   FP_CLZ23.VHD                              ***
--***                                             ***
--***   Function: 23 bit Count Leading Zeros      ***
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

ENTITY fp_clz23 IS
PORT (
      mantissa : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
      
      leading : OUT STD_LOGIC_VECTOR (5 DOWNTO 1)    
     );
END fp_clz23;

ARCHITECTURE zzz of fp_clz23 IS

  type positiontype IS ARRAY (4 DOWNTO 1) OF STD_LOGIC_VECTOR (5 DOWNTO 1);
  
  signal position, positionmux : positiontype;
  signal zerogroup, firstzero : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal mannode : STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  component fp_pos51
  GENERIC (start: integer := 0);
  PORT 
       (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1); 
        
        position : OUT STD_LOGIC_VECTOR (5 DOWNTO 1)    
       );
  end component;
  
BEGIN

zerogroup(1) <= mantissa(23) OR mantissa(22) OR mantissa(21) OR mantissa(20) OR mantissa(19) OR mantissa(18);
zerogroup(2) <= mantissa(17) OR mantissa(16) OR mantissa(15) OR mantissa(14) OR mantissa(13) OR mantissa(12);
zerogroup(3) <= mantissa(11) OR mantissa(10) OR mantissa(9) OR mantissa(8) OR mantissa(7) OR mantissa(6);
zerogroup(4) <= mantissa(5) OR mantissa(4) OR mantissa(3) OR mantissa(2) OR mantissa(1);

firstzero(1) <= zerogroup(1);
firstzero(2) <= NOT(zerogroup(1)) AND zerogroup(2);
firstzero(3) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND zerogroup(3);
firstzero(4) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND zerogroup(4);
                
pone: fp_pos51 
GENERIC MAP (start=>0) 
PORT MAP (ingroup=>mantissa(23 DOWNTO 18),position=>position(1)(5 DOWNTO 1));
ptwo: fp_pos51 
GENERIC MAP (start=>6) 
PORT MAP (ingroup=>mantissa(17 DOWNTO 12),position=>position(2)(5 DOWNTO 1));
pthr: fp_pos51 
GENERIC MAP (start=>12) 
PORT MAP (ingroup=>mantissa(11 DOWNTO 6),position=>position(3)(5 DOWNTO 1));    
pfiv: fp_pos51 
GENERIC MAP (start=>18) 
PORT MAP (ingroup=>mannode,position=>position(4)(5 DOWNTO 1));    
    
mannode <= mantissa(5 DOWNTO 1) & '0';
                
gma: FOR k IN 1 TO 5 GENERATE
  positionmux(1)(k) <= position(1)(k) AND firstzero(1);
  gmb: FOR j IN 2 TO 4 GENERATE
    positionmux(j)(k) <= positionmux(j-1)(k) OR (position(j)(k) AND firstzero(j));
  END GENERATE;
END GENERATE;
  
leading <= positionmux(4)(5 DOWNTO 1);
                                               
END zzz;

