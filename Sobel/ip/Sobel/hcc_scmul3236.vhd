
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_SCMUL3236.VHD                        ***
--***                                             ***
--***   Function: Scale (normalized for overflow  ***
--***             only) a 32 or 36 bit mantissa   ***
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

ENTITY hcc_scmul3236 IS 
GENERIC (mantissa : positive := 32);
PORT (
      frac : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

		scaled : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1);
		count : OUT STD_LOGIC_VECTOR (3 DOWNTO 1)
	   );
END hcc_scmul3236;

ARCHITECTURE rtl OF hcc_scmul3236 IS

  signal scale : STD_LOGIC_VECTOR (5 DOWNTO 1);
    
BEGIN
  
  -- for single 32 bit mantissa input
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  
  -- '1' may end up in overflow, i.e. [S1M..] or [SS1M..] or [SSS1M..].....
  
  -- output
  -- [S ][1 ][M...M]
  -- [32][31][30..1], count is shift 
  
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 

  
  -- shift 0 if "01XX" or "10XX"
  scale(5) <= (NOT(frac(mantissa)) AND frac(mantissa-1)) OR (frac(mantissa) AND NOT(frac(mantissa-1)));
  -- shift 1 if "001XX" or "110XX"
  scale(4) <= (NOT(frac(mantissa)) AND NOT(frac(mantissa-1)) AND frac(mantissa-2)) OR 
              (frac(mantissa) AND frac(mantissa-1) AND NOT(frac(mantissa-2)));
  -- shift 2 if "0001XX" or "1110XX"
  scale(3) <= (NOT(frac(mantissa)) AND NOT(frac(mantissa-1)) AND NOT(frac(mantissa-2)) AND frac(mantissa-3)) OR 
              (frac(mantissa) AND frac(mantissa-1) AND frac(mantissa-2) AND NOT(frac(mantissa-3)));
  -- shift 3 if "00001XX" or "11110XX"
  scale(2) <= (NOT(frac(mantissa)) AND NOT(frac(mantissa-1)) AND NOT(frac(mantissa-2)) AND 
               NOT(frac(mantissa-3)) AND frac(mantissa-4)) OR 
              (frac(mantissa) AND frac(mantissa-1) AND frac(mantissa-2) AND 
               frac(mantissa-3) AND NOT(frac(mantissa-4)));
  -- shift 4 if "00000XX" or "11111XX"
  scale(1) <= (NOT(frac(mantissa)) AND NOT(frac(mantissa-1)) AND NOT(frac(mantissa-2)) AND 
               NOT(frac(mantissa-3)) AND NOT(frac(mantissa-4))) OR 
              (frac(mantissa) AND frac(mantissa-1) AND frac(mantissa-2) AND 
               frac(mantissa-3) AND frac(mantissa-4));

  scaled(mantissa) <= frac(mantissa);
  gsa: FOR k IN 1 TO mantissa-5 GENERATE
    scaled(mantissa-k) <= (frac(mantissa-k-4) AND scale(1)) OR 
                       (frac(mantissa-k-3) AND scale(2)) OR 
                       (frac(mantissa-k-2) AND scale(3)) OR 
                       (frac(mantissa-k-1) AND scale(4)) OR
                       (frac(mantissa-k) AND scale(5));
  END GENERATE;
  scaled(4) <= (frac(1) AND scale(2)) OR 
               (frac(2) AND scale(3)) OR 
               (frac(3) AND scale(4)) OR
               (frac(4) AND scale(5));
  scaled(3) <= (frac(1) AND scale(3)) OR 
               (frac(2) AND scale(4)) OR
               (frac(3) AND scale(5));
  scaled(2) <= (frac(1) AND scale(4)) OR
               (frac(2) AND scale(5));
  scaled(1) <= (frac(1) AND scale(5));
  
  -- shifts everything to SSSSS1XXXXX
  -- if '1' is in a position greater than 27,add to exponent
  
  count(3) <= scale(5);
  count(2) <= scale(4) OR scale(3);
  count(1) <= scale(4) OR scale(2);
  
END rtl;

