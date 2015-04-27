
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTLTOY.VHD                          ***
--***                                             ***
--***   Function: Cast Long to Internal Double    ***
--***   Format                                    ***
--***                                             ***
--***   13/12/07 ML                               ***
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

ENTITY hcc_castltoy IS 
GENERIC (
         unsigned : integer := 0 -- 0 = signed, 1 = unsigned
        ); 
PORT (
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (77 DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
	  );
END hcc_castltoy;

ARCHITECTURE rtl OF hcc_castltoy IS

  signal fit : STD_LOGIC;
  signal exponentfit, exponentnofit : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
BEGIN
        
  gxa: IF (unsigned = 0) GENERATE
    cc(77 DOWNTO 73) <= aa(32) & aa(32) & aa(32) & aa(32) & aa(32);
  END GENERATE;

  gxb: IF (unsigned = 1) GENERATE
    cc(77 DOWNTO 73) <= "00000";
  END GENERATE;
  
  cc(72 DOWNTO 41) <= aa;
  
  gza: FOR k IN 14 TO 40 GENERATE
    cc(k) <= '0';
  END GENERATE;

  cc(13 DOWNTO 1) <= conv_std_logic_vector (1054,13); -- account for 31bit right shift

  ccsat <= '0';
  cczip <= '0';

END rtl;

