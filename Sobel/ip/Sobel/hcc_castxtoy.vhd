
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTXTOY.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Single to         ***
--***             Internal Double                 ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castxtoy IS 
GENERIC (
         target : integer := 1; -- 1(internal), 0 (multiplier, divider)
         mantissa : positive := 32
        );
PORT (
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip : STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC 
		);
END hcc_castxtoy;

ARCHITECTURE rtl OF hcc_castxtoy IS
    
  signal exponentadjust : STD_LOGIC_VECTOR (13 DOWNTO 1);
    
BEGIN

  -- x : 32/36 signed mantissa, 10 bit exponent
  -- y : (internal) 64 signed mantissa, 13 bit exponent 

  exponentadjust <= conv_std_logic_vector (896,13);
  
  cc(67+10*target DOWNTO 68+10*target-mantissa) <= aa(mantissa+10 DOWNTO 11);
  gxa: FOR k IN 14 TO 67+10*target-mantissa GENERATE
    cc(k) <= aa(11);
  END GENERATE;
  
  cc(13 DOWNTO 1) <= ("000" & aa(10 DOWNTO 1)) + exponentadjust;
          
  ccsat <= aasat;
  cczip <= aazip;    

END rtl;

