
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--******************************************************************************
--***                                                                        ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER                              ***
--***                                                                        ***
--***   HCC_CASTYTOD.VHD                                                     ***
--***                                                                        ***
--***   Function: Cast Internal Double to IEEE754                            ***
--***             Double                                                     ***
--***                                                                        ***
--***   14/07/07 ML                                                          ***
--***                                                                        ***
--***   (c) 2007 Altera Corporation                                          ***
--***                                                                        ***
--***   Change History                                                       ***
--***                                                                        ***
--***   27/05/09 - fixed zero/infinity/nan mantissa cases, also output 0 if  ***
--***   mantissa is 0                                                        ***
--***   29/06/09 - look at bits 12&13 of expnode to check zero & max         ***                                             ***
--***                                                                        ***
--***                                                                        ***
--******************************************************************************

--******************************************************************************
--*** Latency:                                                               ***
--*** 4 + swNormSpeed + swDoubleSpeed + swRoundConvert*(1 + swDoubleSpeed);  ***
--******************************************************************************

ENTITY hcc_castytod IS 
GENERIC (
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC;

	   cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_castytod;

ARCHITECTURE rtl OF hcc_castytod IS
  
  constant signdepth : positive := 3 + (roundconvert*doublespeed) + normspeed + roundconvert*(1 + doublespeed);
  constant exptopffdepth : positive := 2 + (roundconvert*doublespeed);
  constant expbotffdepth : positive := normspeed;
  constant satffdepth : positive := 3 + (roundconvert*doublespeed) + normspeed;
  
  type absfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (64 DOWNTO 1);
  type exptopfftype IS ARRAY (exptopffdepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type expbotdelfftype IS ARRAY (expbotffdepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal absinvnode, absnode, absff, absolute : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal countnorm : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal fracout, fracoutff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exptopff : exptopfftype;
  signal expbotff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expbotdelff : expbotdelfftype;
  signal exponent : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal satff, zipff : STD_LOGIC_VECTOR (satffdepth DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (signdepth DOWNTO 1);
  signal zeronumber : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal zeronumberff : STD_LOGIC_VECTOR (1+normspeed DOWNTO 1);
  signal roundoverflow : STD_LOGIC_VECTOR (53 DOWNTO 1);
  signal roundoverflowff : STD_LOGIC;
  signal expnode : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal zeroexpnode, maxexpnode : STD_LOGIC;
  signal zeromantissanode : STD_LOGIC;
  signal zeroexponentnode, maxexponentnode : STD_LOGIC;
  signal roundbit : STD_LOGIC;
  -- common to all output flows
  signal mantissaoutff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal exponentoutff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  -- common to all rounded output flows
  signal mantissaroundff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal exponentoneff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal zeromantissaff : STD_LOGIC;
  signal zeroexponentff, maxexponentff : STD_LOGIC;
  -- only for doublespeed rounded output
  signal mantissaroundnode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal exponenttwoff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal zeromantissadelff : STD_LOGIC;
  signal zeroexponentdelff, maxexponentdelff : STD_LOGIC;
  -- debug
  signal aaexp : STD_LOGIC_VECTOR(13 DOWNTO 1);
  signal aaman : STD_LOGIC_VECTOR(64 DOWNTO 1);
  signal ccsgn : STD_LOGIC;
  signal ccexp : STD_LOGIC_VECTOR(11 DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR(52 DOWNTO 1);

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
     
  component hcc_normus64 IS 
  GENERIC (pipes : positive := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        fracin : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
        countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1);
	    fracout : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
    
BEGIN
  
  gza: FOR k IN 1 TO 64 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
         
  pclk: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 77 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 64 LOOP
        fracoutff(k) <= '0';
      END LOOP;  
      FOR k IN 1 TO exptopffdepth LOOP
        FOR j IN 1 TO 13 LOOP
          exptopff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO satffdepth LOOP
        satff(k) <= '0';
        zipff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO signdepth LOOP
        signff(k) <= '0';
      END LOOP;    
      
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
              
        aaff <= aa;
                        
        fracoutff <= fracout;
        
        exptopff(1)(13 DOWNTO 1) <= aaff(13 DOWNTO 1) + "0000000000100";
        FOR k IN 2 TO exptopffdepth LOOP
          exptopff(k)(13 DOWNTO 1) <= exptopff(k-1)(13 DOWNTO 1);
        END LOOP;
        
        satff(1) <= aasat;
        FOR k IN 2 TO satffdepth LOOP
          satff(k) <= satff(k-1);
        END LOOP;
        zipff(1) <= aazip;
        FOR k IN 2 TO satffdepth LOOP
          zipff(k) <= zipff(k-1);
        END LOOP;
        signff(1) <= aaff(77);
        FOR k IN 2 TO signdepth LOOP
          signff(k) <= signff(k-1);
        END LOOP;
               
      END IF;
            
    END IF;
  
  END PROCESS;

  gna: FOR k IN 1 TO 64 GENERATE
    absinvnode(k) <= aaff(k+13) XOR aaff(77);
  END GENERATE;
  
  --*** APPLY ROUNDING TO ABS VALUE (IF REQUIRED) ***
  gnb: IF ((roundconvert = 0) OR
           (roundconvert = 1 AND doublespeed = 0)) GENERATE
  
    gnc: IF (roundconvert = 0) GENERATE
      absnode <= absinvnode;
    END GENERATE;
    gnd: IF (roundconvert = 1) GENERATE
      absnode <= absinvnode + (zerovec(63 DOWNTO 1) & aaff(77));
    END GENERATE;

    pnb: PROCESS (sysclk, reset)
    BEGIN
      IF (reset = '1') THEN    
        FOR k IN 1 TO 64 LOOP
          absff(k) <= '0';
        END LOOP;   
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          absff <= absnode;  
        END IF;          
      END IF;
    END PROCESS;

    absolute <= absff;

  END GENERATE;
    
  gnd: IF (roundconvert = 1 AND doublespeed = 1) GENERATE   
    gsa: IF (synthesize = 0) GENERATE
      absone: hcc_addpipeb
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>absinvnode,bb=>zerovec,carryin=>aaff(77),
                cc=>absolute);
    END GENERATE;
    gsb: IF (synthesize = 1) GENERATE
      abstwo: hcc_addpipes
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>absinvnode,bb=>zerovec,carryin=>aaff(77),
                cc=>absolute);
    END GENERATE;
  END GENERATE;

  zeronumber(1) <= absolute(1);
  gzma: FOR k IN 2 TO 64 GENERATE
    zeronumber(k) <= zeronumber(k-1) OR absolute(k);
  END GENERATE;
  
  pzm: PROCESS (sysclk, reset)
  BEGIN
    IF (reset = '1') THEN    
      FOR k IN 1 TO normspeed+1 LOOP
        zeronumberff(k) <= '0';
      END LOOP;   
    ELSIF (rising_edge(sysclk)) THEN   
      IF (enable = '1') THEN
        zeronumberff(1) <= NOT(zeronumber(64));
        FOR k IN 2 TO 1+normspeed LOOP
          zeronumberff(k) <= zeronumberff(k-1);
        END LOOP;
      END IF;          
    END IF;
  END PROCESS;
  
  --******************************************************************
  --*** NORMALIZE HERE - 1-3 pipes (countnorm output after 1 pipe) ***
  --******************************************************************

  normcore: hcc_normus64
  GENERIC MAP (pipes=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            fracin=>absolute,
            countout=>countnorm,fracout=>fracout);

  --****************************
  --*** exponent bottom half ***
  --****************************

  gxa: IF (expbotffdepth = 1) GENERATE

    pxa: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        FOR k IN 1 TO 13 LOOP
          expbotff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          expbotff(13 DOWNTO 1) <= exptopff(exptopffdepth)(13 DOWNTO 1) - ("0000000" & countnorm);
        END IF;     
      END IF;
    END PROCESS;
  
    exponent <= expbotff;

  END GENERATE;

  gxb: IF (expbotffdepth > 1) GENERATE

    pxb: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        FOR k IN 1 TO expbotffdepth LOOP
          FOR j IN 1 TO 13 LOOP
            expbotdelff(k)(j) <= '0';
          END LOOP;
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          expbotdelff(1)(13 DOWNTO 1) <= exptopff(exptopffdepth)(13 DOWNTO 1) - ("0000000" & countnorm);
          FOR k IN 2 TO expbotffdepth LOOP
            expbotdelff(k)(13 DOWNTO 1) <= expbotdelff(k-1)(13 DOWNTO 1);
          END LOOP;
        END IF;     
      END IF;
    END PROCESS;
  
    exponent <= expbotdelff(expbotffdepth)(13 DOWNTO 1);

  END GENERATE;

  --**************************************
  --*** CALCULATE OVERFLOW & UNDERFLOW ***
  --**************************************

  groa: IF (roundconvert = 1) GENERATE

    roundoverflow(1) <= fracout(10);
    grob: FOR k IN 2 TO 53 GENERATE
      roundoverflow(k) <= roundoverflow(k-1) AND fracout(k+9);
    END GENERATE;

    prca: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        roundoverflowff <= '0';
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          roundoverflowff <= roundoverflow(53);
        END IF;
      END IF;
    END PROCESS;

  END GENERATE;

  -- fracff, expnode, roundoverflowff (if used) aligned here, depth of satffdepth
  zeroexpnode <= NOT(expnode(13) OR expnode(12) OR 
                     expnode(11) OR expnode(10) OR expnode(9) OR 
                     expnode(8) OR expnode(7) OR expnode(6) OR expnode(5) OR 
                     expnode(4) OR expnode(3) OR expnode(2) OR expnode(1));
                     
  maxexpnode <= NOT(expnode(13)) AND NOT(expnode(12)) AND 
                expnode(11) AND expnode(10) AND expnode(9) AND
                expnode(8) AND expnode(7) AND expnode(6) AND expnode(5) AND
                expnode(4) AND expnode(3) AND expnode(2) AND expnode(1);
                
  -- '1' when true
  -- 27/05/09 make sure all conditions are covered
  groc: IF (roundconvert = 0) GENERATE
    zeromantissanode <= expnode(12) OR expnode(13) OR 
                        zeroexpnode OR maxexpnode OR
                        zipff(satffdepth) OR satff(satffdepth);
  END GENERATE;
  grod: IF (roundconvert = 1) GENERATE
    zeromantissanode <= roundoverflowff OR expnode(12) OR expnode(13) OR 
                        zeroexpnode OR maxexpnode OR
                        zipff(satffdepth) OR satff(satffdepth) OR
                        zeronumberff(1+normspeed);
  END GENERATE;
  zeroexponentnode <= zeroexpnode OR expnode(13) OR 
                      zipff(satffdepth) OR zeronumberff(1+normspeed);
  -- 27/05/09 - make sure than exp = -1 doesn't trigger max nod
  maxexponentnode <= (maxexpnode AND NOT(expnode(12)) AND NOT(expnode(13))) OR 
                     (expnode(12) AND NOT(expnode(13))) OR 
                      satff(satffdepth);

  --**********************
  --*** OUTPUT SECTION ***
  --**********************

  goa: IF (roundconvert = 0) GENERATE
     
    expnode <= exponent;
    
    roundbit <= '0';
   
    poa: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 11 LOOP
          exponentoutff(k) <= '0';
        END LOOP;
        
      ELSIF (rising_edge(sysclk)) THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= fracoutff(k+10) AND NOT(zeromantissanode);
        END LOOP;
        FOR k IN 1 TO 11 LOOP
          exponentoutff(k) <= (expnode(k) AND NOT(zeroexponentnode)) OR maxexponentnode;
        END LOOP;
        
      END IF;    
          
    END PROCESS;
    
  END GENERATE;  

  gob: IF (roundconvert = 1 AND doublespeed = 0) GENERATE
  
    expnode <= exponent + (zerovec(12 DOWNTO 1) & roundoverflowff);
    
    -- round to nearest even
    roundbit <= (fracoutff(11) AND fracoutff(10)) OR
                 (NOT(fracoutff(11)) AND fracoutff(10) AND 
                 (fracoutff(9) OR fracoutff(8) OR fracoutff(7))); 
                   
    pob: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaroundff(k) <= '0';
          mantissaoutff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 11 LOOP
          exponentoneff(k) <= '0';
          exponentoutff(k) <= '0';
        END LOOP;
        zeromantissaff <= '0';
        zeroexponentff <= '0';
        maxexponentff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
      
        mantissaroundff <= fracoutff(62 DOWNTO 11) + (zerovec(51 DOWNTO 1) & roundbit);

        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= mantissaroundff(k) AND NOT(zeromantissaff);
        END LOOP;
        
        exponentoneff <= expnode(11 DOWNTO 1);
        FOR k IN 1 TO 11 LOOP
          exponentoutff(k) <= (exponentoneff(k) AND NOT(zeroexponentff)) OR maxexponentff;
        END LOOP;
        
        -- '1' when true
        zeromantissaff <= zeromantissanode;
        zeroexponentff <= zeroexponentnode;
        maxexponentff <= maxexponentnode;
        
      END IF;    
          
    END PROCESS;
    
  END GENERATE; 
  
  goc: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
    
    expnode <= exponent + (zerovec(12 DOWNTO 1) & roundoverflowff);
    
    -- round to nearest even
    roundbit <= (fracoutff(11) AND fracoutff(10)) OR
                 (NOT(fracoutff(11)) AND fracoutff(10) AND 
                 (fracoutff(9) OR fracoutff(8) OR fracoutff(7)));
                 
    poc: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 11 LOOP
          exponentoneff(k) <= '0';
          exponenttwoff(k) <= '0';
          exponentoutff(k) <= '0';
        END LOOP;
        zeromantissaff <= '0';
        zeroexponentff <= '0';
        maxexponentff <= '0';
        zeromantissadelff <= '0';
        zeroexponentdelff <= '0';
        maxexponentdelff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
      
        FOR k IN 1 TO 52 LOOP
          mantissaoutff(k) <= mantissaroundnode(k) AND NOT(zeromantissadelff);
        END LOOP;
        
        exponentoneff <= expnode(11 DOWNTO 1);
        exponenttwoff <= exponentoneff;
        FOR k IN 1 TO 11 LOOP
          exponentoutff(k) <= (exponenttwoff(k) AND NOT(zeroexponentdelff)) OR maxexponentdelff;
        END LOOP;
        
        -- '1' when true
        zeromantissaff <= zeromantissanode;
        zeroexponentff <= zeroexponentnode;
        maxexponentff <= maxexponentnode;
        zeromantissadelff <= zeromantissaff;
        zeroexponentdelff <= zeroexponentff;
        maxexponentdelff <= maxexponentff;
        
      END IF;    
          
    END PROCESS;
    
    aroa: IF (synthesize = 0) GENERATE
      roone: hcc_addpipeb
      GENERIC MAP (width=>54,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>fracoutff(64 DOWNTO 11),bb=>zerovec(54 DOWNTO 1),carryin=>roundbit,
                cc=>mantissaroundnode);
    END GENERATE;
    arob: IF (synthesize = 1) GENERATE
      rotwo: hcc_addpipes
      GENERIC MAP (width=>54,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>fracoutff(64 DOWNTO 11),bb=>zerovec(54 DOWNTO 1),carryin=>roundbit,
                cc=>mantissaroundnode);
    END GENERATE;

  END GENERATE; 
    
  --*** OUTPUTS ***
  cc(64) <= signff(signdepth);
  cc(63 DOWNTO 53) <= exponentoutff;
  cc(52 DOWNTO 1) <= mantissaoutff;

  --*** DEBUG ***
  aaexp <= aa(13 DOWNTO 1);
  aaman <= aa(77 DOWNTO 14);
  ccsgn <= signff(signdepth);
  ccexp <= exponentoutff;
  ccman <= mantissaoutff;
   
END rtl;

