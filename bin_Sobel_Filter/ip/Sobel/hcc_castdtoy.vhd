
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTDTOY.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Double to Internal ***
--***             Double                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   13/07/09 - if zip, then zero '1' in frac  ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

-- double <=> internal double
ENTITY hcc_castdtoy IS 
GENERIC (
         target : integer := 0; -- 1(internal), 0 (multiplier, divider)
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         outputpipe : integer := 0; -- if zero, dont put final pipe for some modes
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

	  cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
	  ccsat, cczip : OUT STD_LOGIC 
	  );
END hcc_castdtoy;

ARCHITECTURE rtl OF hcc_castdtoy IS
    
  type exponentfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (53+11*target DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal satnode, zipnode : STD_LOGIC;
  signal satff, zipff : STD_LOGIC;
  signal expnode : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal fracnode : STD_LOGIC_VECTOR (54+10*target DOWNTO 1);
  signal ccff : STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
  signal mantissanode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentff : exponentfftype;
  signal satdelff, zipdelff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  
  component hcc_addpipeb
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;

  component hcc_addpipes
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
  
BEGIN
  
  -- ieee754: sign (64), 8 exponent (63:53), 52 mantissa (52:1)
  
  -- x format: (signx5,!sign,mantissa XOR sign, sign(xx.xx)), exponent(13:1)
  -- multiplier, divider : (SIGN)('1')(52:1), exponent(13:1)
  -- (multiplier & divider use unsigned numbers, sign packed with input)
  
  gza: IF (roundconvert = 1) GENERATE
    gzb: FOR k IN 1 TO 53+11*target GENERATE
      zerovec(k) <= '0';
    END GENERATE;
  END GENERATE;
  
  pca: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 64 LOOP
        aaff(k) <= '0';
      END LOOP;
        
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        aaff <= aa;
      END IF;      
            
    END IF;
      
  END PROCESS;

  -- if exponent = 1023 => saturate, if 0 => 0
  satnode <= aaff(63) AND aaff(62) AND aaff(61) AND aaff(60) AND 
             aaff(59) AND aaff(58) AND aaff(57) AND aaff(56) AND
             aaff(55) AND aaff(54) AND aaff(53);
  zipnode <= NOT(aaff(63) OR aaff(62) OR aaff(61) OR aaff(60) OR 
                 aaff(59) OR aaff(58) OR aaff(57) OR aaff(56) OR
                 aaff(55) OR aaff(54) OR aaff(53));
         
  gexpa: FOR k IN 1 TO 11 GENERATE
    expnode(k) <= (aaff(k+52) OR satnode) AND NOT(zipnode);
  END GENERATE;
  expnode(12) <= satnode;
  expnode(13) <= '0';

  --**************************************
  --*** direct to multipier or divider ***
  --**************************************
  gmda: IF (target = 0) GENERATE
  -- already in "01"&mantissa format used by multiplier and divider

    --fracnode <= aaff(64) & '1' & aaff(52 DOWNTO 1);
    -- 13/07/09
    fracnode(54) <= aaff(64);
    fracnode(53) <= NOT(zipnode);
    fracnode(52 DOWNTO 1) <= aaff(52 DOWNTO 1);
    
    gmdb: IF (outputpipe = 0) GENERATE
      cc <= fracnode & expnode;
      ccsat <= satnode;
      cczip <= zipnode;
    END GENERATE; 

    gmdc: IF (outputpipe = 1) GENERATE

      pmda: PROCESS (sysclk,reset)
      BEGIN
      
        IF (reset = '1') THEN
        
          FOR k IN 1 TO 67 LOOP
            ccff(k) <= '0';
          END LOOP;
          satff <= '0';
          zipff <= '0';

        ELSIF (rising_edge(sysclk)) THEN
      
          IF (enable = '1') THEN
      
            ccff <= fracnode & expnode;
            satff <= satnode;
            zipff <= zipnode;

          END IF;      
            
        END IF;
     
      END PROCESS; 

      cc <= ccff;
      ccsat <= satff;
      cczip <= zipff;

    END GENERATE; 

  END GENERATE;

  --***********************
  --*** internal format ***
  --***********************
  gxa: IF (target = 1) GENERATE
  
    fracnode(64) <= aaff(64);
    fracnode(63) <= aaff(64);
    fracnode(62) <= aaff(64);
    fracnode(61) <= aaff(64);
    fracnode(60) <= aaff(64);
    --fracnode(59) <= NOT(aaff(64));  -- '1' XOR sign
    -- 13/07/09
    fracnode(59) <= aaff(64) XOR NOT(zipnode);
    gfa: FOR k IN 1 TO 52 GENERATE
      fracnode(k+6)<= (aaff(k) XOR aaff(64));
    END GENERATE;
    gfb: FOR k IN 1 TO 6 GENERATE
      fracnode(k)<= aaff(64);  -- '0' XOR sign
    END GENERATE;
    
    --*** OUTPUT STAGE(S) ***
    gsa: IF (roundconvert = 0 AND outputpipe = 0) GENERATE
      cc <= fracnode & expnode;
      ccsat <= satnode;
      cczip <= zipnode;
    END GENERATE;

    gsb: IF (outputpipe = 1 AND
             ((roundconvert = 0) OR
              (roundconvert = 1 AND doublespeed = 0))) GENERATE
    
      gsc: IF (roundconvert = 0) GENERATE  
        mantissanode <= fracnode;
      END GENERATE;

      gsd: IF (roundconvert = 1) GENERATE  
        mantissanode <= fracnode + (zerovec(63 DOWNTO 1) & aaff(64));
      END GENERATE;

      prca: PROCESS (sysclk,reset)
      BEGIN
      
        IF (reset = '1') THEN
        
          FOR k IN 1 TO 77 LOOP
            ccff(k) <= '0';
          END LOOP;
          satff <= '0';
          zipff <= '0';

        ELSIF (rising_edge(sysclk)) THEN
      
          IF (enable = '1') THEN
      
            ccff <= mantissanode & expnode;
            satff <= satnode;
            zipff <= zipnode;

          END IF;      
            
        END IF;
     
      END PROCESS;    
      
      cc <= ccff;
      ccsat <= satff;
      cczip <= zipff;

    END GENERATE;

    gse: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
    
      gsf: IF (synthesize = 0) GENERATE
        addone: hcc_addpipeb
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>fracnode,bb=>zerovec(64 DOWNTO 1),carryin=>aaff(64),
                  cc=>mantissanode);
      END GENERATE;
      grb: IF (synthesize = 1) GENERATE
        addtwo: hcc_addpipes
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>fracnode,bb=>zerovec(64 DOWNTO 1),carryin=>aaff(64),
                  cc=>mantissanode);
      END GENERATE;

      prcb: PROCESS (sysclk,reset)
      BEGIN
      
        IF (reset = '1') THEN
         
          FOR k IN 1 TO 13 LOOP
            exponentff(1)(k) <= '0';
            exponentff(2)(k) <= '0';
          END LOOP;
          satdelff <= "00";
          zipdelff <= "00";

        ELSIF (rising_edge(sysclk)) THEN
      
          IF (enable = '1') THEN
      
            exponentff(1)(13 DOWNTO 1) <= expnode;
            exponentff(2)(13 DOWNTO 1) <= exponentff(1)(13 DOWNTO 1);
            satdelff(1) <= satnode;
            satdelff(2) <= satdelff(1);
            zipdelff(1) <= zipnode;
            zipdelff(2) <= zipdelff(1);

          END IF;      
            
        END IF;
      
      END PROCESS;    
      
      cc <= mantissanode & exponentff(2)(13 DOWNTO 1);
      ccsat <= satdelff(2);
      cczip <= zipdelff(2);

    END GENERATE;

  END GENERATE;

END rtl;

