
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP3236.VHD                         ***
--***                                             ***
--***   Function: Single precision multiplier     ***
--***             core function                   ***
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

ENTITY hcc_mulfp3236 IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         synthesize : integer := 0
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip : IN STD_LOGIC;
      
		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
		);
END hcc_mulfp3236;

ARCHITECTURE rtl OF hcc_mulfp3236 IS
  
  constant normtype : integer := 0;
  
  type expfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaman, bbman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexp, bbexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal mulout : STD_LOGIC_VECTOR (2*mantissa DOWNTO 1);

  signal aaexpff, bbexpff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expff : expfftype;
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;
  signal ccsatff, cczipff : STD_LOGIC_VECTOR (2 DOWNTO 1);

  component hcc_mul3236b 
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		  );
  end component;
  
  component hcc_mul3236s
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)  
       );
  end component; 
      
BEGIN

  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  
  -- normalization or scale turns it into
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]
  
  -- multiplier outputs (result < 2)
  -- [S....S][1 ][M*M...][U*U]
  -- [64..62][61][60..15][14....1]
  -- multiplier outputs (result >= 2)
  -- [S....S][1 ][M*M...][U*U.....]
  -- [64..63][62][61..16][15.....1]
  
  -- output (if destination not a multiplier)
  -- right shift 2
  -- [S ][S ][SSS1..XX]
  -- [64][64][64....35]
  -- result "SSSSS1XXX" if result <2, "SSSS1XXXX" if result >= 2
  
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      aaexpff <= "0000000000";
      bbexpff <= "0000000000";
      FOR k IN 1 TO 2 LOOP
        expff(k)(10 DOWNTO 1) <= "0000000000";
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      ccsatff <= "00";
      cczipff <= "00";
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
        
        aasatff <= aasat;
        aazipff <= aazip;
        bbsatff <= bbsat;
        bbzipff <= bbzip;
        ccsatff(1) <= aasatff OR bbsatff;
        ccsatff(2) <= ccsatff(1);
        cczipff(1) <= aazipff OR bbzipff;
        cczipff(2) <= cczipff(1);
        
        aaexpff <= aaexp;
        bbexpff <= bbexp;     
        expff(1)(10 DOWNTO 1) <= aaexpff + bbexpff - "0001111111";
        FOR k IN 1 TO 10 LOOP
          expff(2)(k) <= (expff(1)(k) OR ccsatff(1)) AND NOT(cczipff(1));
        END LOOP;    
        
      END IF;
    
    END IF;
  
  END PROCESS;
  
  gsa: IF (synthesize = 0) GENERATE
    bmult: hcc_mul3236b
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aaman,bb=>bbman,
              cc=>mulout);
  END GENERATE;
  
  gsb: IF (synthesize = 1) GENERATE
    smult: hcc_mul3236s
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aaman,mulbb=>bbman,
              mulcc=>mulout);
  END GENERATE;
  
  --***************
  --*** OUTPUTS ***          
  --***************          
  cc<= mulout(2*mantissa) & mulout(2*mantissa) & mulout(2*mantissa DOWNTO mantissa+3) & expff(2)(10 DOWNTO 1);
  ccsat <= ccsatff(2);
  cczip <= cczipff(2);
  
END rtl;

