
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTYTOX.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Double to         ***
--***             Internal Single                 ***
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

--***************************************************
--*** NOTES : TO DOS                              ***
--***************************************************

--*** CHECK FOR OVERFLOW IN ROUND IF USED ***
-- problem will occur from max positive x, which may round to max negative x
-- trap this condition and zero carryin (tbd)

--***************************************************
--*** NOTES : OPERATIONS                          ***
--***************************************************
-- input always signed y format (mult, divide, have output option

ENTITY hcc_castytox IS 
GENERIC (
         roundconvert : integer := 1; -- global switch - round all conversions when '1'
         mantissa : positive := 32
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC 
		);
END hcc_castytox;

ARCHITECTURE rtl OF hcc_castytox IS
    
  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal ccff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal fracnode, fractional : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal roundnode : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal expmax, expmin : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal chkexpsat, chkexpzip : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expsatbit, expzipbit : STD_LOGIC;
  signal exponent : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal satinff, zipinff : STD_LOGIC;
  signal satoutff, zipoutff : STD_LOGIC;

BEGIN
  
  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 
  -- for double 64 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [64][63..60][59][58..7][6..4][321] - NB underflow less than overflow
  
  expmax <= conv_std_logic_vector (1151,13); -- 1151 = 1023+128 = 255
  expmin <= conv_std_logic_vector (897,13); -- 897 = 1023-126 = 1
  
  gza: IF (roundconvert = 1) GENERATE
    gza: FOR k IN 1 TO mantissa-1 GENERATE
      zerovec(k) <= '0';
    END GENERATE;
  END GENERATE;
  
  pca: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 77 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO mantissa+10 LOOP
        ccff(k) <= '0';
      END LOOP;
      satinff <= '0';
      zipinff <= '0';
      satoutff <= '0';
      zipoutff <= '0';
        
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        aaff <= aa;
        
        ccff <= fractional & exponent;
        satinff <= aasat;
        zipinff <= aazip;
        
        satoutff <= satinff OR expsatbit;
        zipoutff <= zipinff OR expzipbit;
      
      END IF;      
            
    END IF;
      
  END PROCESS;

  chkexpsat <= aaff(13 DOWNTO 1) - expmax; -- ok when -ve
  chkexpzip <= aaff(13 DOWNTO 1) - expmin; -- ok when +ve
  
  expsatbit <= NOT(chkexpsat(13)) OR (NOT(aaff(13)) AND aaff(12));
  expzipbit <= chkexpzip(13) OR aaff(13);
  
  gxa: FOR k IN 1 TO 8 GENERATE
    exponent(k) <= (aaff(k) OR expsatbit) AND NOT(expzipbit);
  END GENERATE;

  fracnode <= aa(77 DOWNTO 77-mantissa);
  
  gma: IF (roundconvert = 0) GENERATE
    fractional <= fracnode;
  END GENERATE;

  gmb: IF (roundconvert = 1) GENERATE
    fractional <= fracnode + (zerovec(mantissa-1 DOWNTO 1) & aaff(77-mantissa));
  END GENERATE;
  
  cc <= ccff;    
  ccsat <= satoutff;
  cczip <= zipoutff;    

END rtl;

