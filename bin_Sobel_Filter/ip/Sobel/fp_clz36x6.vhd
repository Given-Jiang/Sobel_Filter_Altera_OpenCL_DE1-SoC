
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_CLZ36X6.VHD                            ***
--***                                             ***
--***   Function: 6 bit Count Leading Zeros in a  ***
--***   36 bit number                             ***
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

ENTITY fp_clz36x6 IS
PORT (
      mantissa : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      
      leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
     );
END fp_clz36x6;

ARCHITECTURE rtl of fp_clz36x6 IS

  type positiontype IS ARRAY (6 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal position, positionmux : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal zerogroup : STD_LOGIC;
  
  component fp_pos52
  GENERIC (start: integer := 0);
  PORT 
       (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1); 
        
        position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
  
BEGIN

  zerogroup <= mantissa(36) OR mantissa(35) OR mantissa(34) OR mantissa(33) OR mantissa(32) OR mantissa(31);
                
  pone: fp_pos52 
  GENERIC MAP (start=>0) 
  PORT MAP (ingroup=>mantissa(36 DOWNTO 31),position=>position(6 DOWNTO 1));
                
  gma: FOR k IN 1 TO 6 GENERATE
    positionmux(k) <= position(k) AND zerogroup;
  END GENERATE;
  
  leading <= positionmux;
                                               
END rtl;

