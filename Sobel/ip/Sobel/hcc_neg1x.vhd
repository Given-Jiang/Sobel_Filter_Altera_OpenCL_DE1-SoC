
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NEG1X.VHD                             ***
--***                                             ***
--***   Function: Negate Variable                 ***
--***                                             ***
--***   Input is normalized S,'1',mantissa,exp    ***
--***                                             ***
--***   14/03/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_neg1x IS 
GENERIC (
         mantissa : positive := 32; -- 32/36
         ieeeoutput : integer := 0; -- 1 = ieee754 (S/u23/8)
         xoutput : integer := 1; -- 1 = single x format (smantissa/10)
         funcoutput : integer := 0 -- function output (S'1'umantissa-2/10)
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC; 
      
		cc : OUT STD_LOGIC_VECTOR (32*ieeeoutput+(mantissa+10)*(xoutput+funcoutput) DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
		);
END hcc_neg1x;

ARCHITECTURE rtl OF hcc_neg1x IS
 
  signal aaff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal aasatff, aazipff : STD_LOGIC;

  -- x output
  signal ccxman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal ccxexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  -- function output
  signal ccfuncman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal ccfuncexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  -- ieee output
  signal expnode : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal manoutff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal expoutff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal expmax, expzero : STD_LOGIC;
  signal manoutzero, expoutzero, expoutmax : STD_LOGIC;

BEGIN
    
  pin: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO mantissa+10 LOOP
        aaff(k) <= '0';
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
          
        aaff <= aa;
        aasatff <= aasat;
        aazipff <= aazip;
        
      END IF;
    
    END IF;  
      
  END PROCESS;

  --******************************
  --*** internal format output ***
  --******************************
  
  goxa: IF (xoutput = 1) GENERATE

    goxb: FOR k IN 1 TO mantissa GENERATE
      ccxman(k) <= NOT(aaff(k+10));
    END GENERATE;
    ccxexp(10 DOWNTO 1) <= aaff(10 DOWNTO 1);
    
    cc <= ccxman & ccxexp;
    ccsat <= aasatff;
    cczip <= aazipff;

  END GENERATE;

  --***************************************
  --*** internal function format output ***
  --***************************************
    
  gofa: IF (funcoutput = 1) GENERATE
  
    ccfuncman(mantissa) <= NOT(aaff(mantissa+10));
    ccfuncman(mantissa-1 DOWNTO 1) <=  aaff(mantissa+9 DOWNTO 11);
    ccfuncexp(10 DOWNTO 1) <= aaff(10 DOWNTO 1);
    
    cc <= ccfuncman & ccfuncexp;
    ccsat <= aasatff;
    cczip <= aazipff;
    
  END GENERATE;
  
  --**************************
  --*** IEEE format output ***
  --**************************
  
  goia: IF (ieeeoutput = 1) GENERATE
  
    expnode <= aaff(10 DOWNTO 1);
    
    pio: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        FOR k IN 1 TO 23 LOOP
          manoutff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 8 LOOP
          expoutff(k) <= '0';
        END LOOP;
         
      ELSIF (rising_edge(sysclk)) THEN
          
        FOR k IN 1 TO 23 LOOP
          manoutff(k) <= aaff(k+mantissa-15) AND NOT(manoutzero);
        END LOOP;
        FOR k IN 1 TO 8 LOOP
          expoutff(k) <= (expnode(k) AND NOT(expoutzero)) OR expoutmax;
        END LOOP;
              
      END IF;
        
    END PROCESS;
    
    expmax <= expnode(8) AND expnode(7) AND expnode(6) AND expnode(5) AND
              expnode(4) AND expnode(3) AND expnode(2) AND expnode(1);
    expzero <= NOT(expnode(8) OR expnode(7) OR expnode(6) OR expnode(5) OR
                   expnode(4) OR expnode(3) OR expnode(2) OR expnode(1));          
              
    manoutzero <= aasatff OR aazipff OR expmax OR expzero OR expnode(10) OR expnode(9);
    expoutzero <= aazipff OR expzero OR expnode(10);
    expoutmax <= aasatff OR expmax OR (NOT(expnode(10)) AND expnode(9));
         
    -- OUTPUTS
    cc <= NOT(aaff(mantissa+10)) & expoutff & manoutff;
    ccsat <= '0';
    cczip <= '0';
        
  END GENERATE;

END rtl;

