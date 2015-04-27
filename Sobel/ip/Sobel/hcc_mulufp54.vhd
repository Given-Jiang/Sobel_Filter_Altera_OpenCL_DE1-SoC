
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULUFP54.VHD                          ***
--***                                             ***
--***   Function: Double precision multiplier     ***
--***             core (unsigned mantissa)        ***
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

ENTITY hcc_mulufp54 IS 
GENERIC (synthesize : integer := 1); -- 0 = behavioral, 1 = instantiated
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aaman : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      aaexp : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC; 
      bbman : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      bbexp : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
      bbsat, bbzip : IN STD_LOGIC;
      
		ccman : OUT STD_LOGIC_VECTOR (64 DOWNTO 1);
      ccexp : OUT STD_LOGIC_VECTOR (13 DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
		);
END hcc_mulufp54;

ARCHITECTURE rtl OF hcc_mulufp54 IS
  
  constant normtype : integer := 0;
  
  type expfftype IS ARRAY (5 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  
  signal mulout : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal aaexpff, bbexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expff : expfftype;
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;
  signal ccsatff, cczipff : STD_LOGIC_VECTOR (5 DOWNTO 1);

  component hcc_mul54usb
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
		  );
  end component;
  
  component hcc_mul54uss
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)  
       );
  end component;   
	    
BEGIN
  -- 54 bit mantissa, signed normalized input
  -- [S ][1 ][M...M]
  -- [54][53][52..1]
  
  -- multiplier outputs (result < 2)
  -- [S....S][1 ][M*M...][X...X]
  -- [72..70][69][68..17][16..1]
  -- multiplier outputs (result >= 2)
  -- [S....S][1 ][M*M...][X...X]
  -- [72..71][70][69..18][17..1]
  
  -- assume that result > 2
  -- output [71..8] for 64 bit mantissa out
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      aaexpff <= "0000000000000";
      bbexpff <= "0000000000000";
      FOR k IN 1 TO 5 LOOP
        expff(k)(13 DOWNTO 1) <= "0000000000000";
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      ccsatff <= "00000";
      cczipff <= "00000";
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
        
        aasatff <= aasat;
        aazipff <= aazip;
        bbsatff <= bbsat;
        bbzipff <= bbzip;
        ccsatff(1) <= aasatff OR bbsatff;
        FOR k IN 2 TO 5 LOOP
          ccsatff(k) <= ccsatff(k-1);
        END LOOP;
        cczipff(1) <= aazipff OR bbzipff;
        FOR k IN 2 TO 5 LOOP
          cczipff(k) <= cczipff(k-1);
        END LOOP;
        
        aaexpff <= aaexp;
        bbexpff <= bbexp;     
        expff(1)(13 DOWNTO 1) <= aaexpff + bbexpff - "0001111111111";
        FOR k IN 1 TO 13 LOOP
          expff(2)(k) <= (expff(1)(k) OR ccsatff(1)) AND NOT(cczipff(1));
        END LOOP; 
        FOR k IN 3 TO 5 LOOP
          expff(k)(13 DOWNTO 1) <= expff(k-1)(13 DOWNTO 1);
        END LOOP;   
        
      END IF;
    
    END IF;
  
  END PROCESS;
  
  gsa: IF (synthesize = 0) GENERATE
    bmult: hcc_mul54usb
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aaman,bb=>bbman,
              cc=>mulout);
  END GENERATE;
  
  gsb: IF (synthesize = 1) GENERATE
    smult: hcc_mul54uss
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aaman,mulbb=>bbman,
              mulcc=>mulout);
  END GENERATE;
  
  --***************
  --*** OUTPUTS ***          
  --***************          
                         
  ccman <= mulout; 
  ccexp <= expff(5)(13 DOWNTO 1);
  ccsat <= ccsatff(5);
  cczip <= cczipff(5);
  
END rtl;

