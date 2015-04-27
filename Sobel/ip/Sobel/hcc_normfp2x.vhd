
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NORMFP2X.VHD                          ***
--***                                             ***
--***   Function: Normalize double precision      ***
--***             number                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   05/03/08 - correct expbotffdepth constant ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--***  NOTES : TODOS                              ***
--***************************************************
--*** NEED OVERFLOW CHECK - if 01.11111XXX11111 rounds up to 10.000..0000

ENTITY hcc_normfp2x IS 
GENERIC (
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         roundnormalize : integer := 1; -- global switch - round all normalizations when '1'
         normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
         doublespeed : integer := 1; -- global switch - '0' unpiped adders, '1' piped adders for doubles
         target : integer := 1; -- 1(internal), 0 (multiplier, divider)
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC; 

      cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
		);
END hcc_normfp2x;

ARCHITECTURE rtl OF hcc_normfp2x IS

  constant latency : positive := 3 + normspeed + 
                                (roundconvert*doublespeed) +
                                (roundnormalize + roundnormalize*doublespeed);
  constant exptopffdepth : positive := 2 + roundconvert*doublespeed;
  constant expbotffdepth : positive := normspeed + roundnormalize*(1+doublespeed); -- 05/03/08
  -- if internal format, need to turn back to signed at this point
  constant invertpoint : positive := 1 + normspeed + (roundconvert*doublespeed);
  
  type exptopfftype IS ARRAY (exptopffdepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type expbotfftype IS ARRAY (expbotffdepth DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  signal aaff : STD_LOGIC_VECTOR (77 DOWNTO 1);   
  signal exptopff : exptopfftype;
  signal expbotff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expbotdelff : expbotfftype;
  signal exponent : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal adjustexp : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal aasatff, aazipff : STD_LOGIC_VECTOR (latency DOWNTO 1); 
  signal mulsignff : STD_LOGIC_VECTOR (latency-1 DOWNTO 1);                              
  signal aainvnode, aaabsnode, aaabsff, aaabs : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal normalaa : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal countnorm : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal normalaaff : STD_LOGIC_VECTOR (55+9*target DOWNTO 1);
  signal mantissa : STD_LOGIC_VECTOR (54+10*target DOWNTO 1);
  signal aamannode : STD_LOGIC_VECTOR (54+10*target DOWNTO 1);
  signal aamanff : STD_LOGIC_VECTOR (54+10*target DOWNTO 1);
  signal sign : STD_LOGIC;

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
  GENERIC (pipes : positive := 1); -- currently 1 or 3
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
    
  --*** INPUT REGISTER ***
  pna: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
          
      FOR k IN 1 TO 77 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO exptopffdepth LOOP
        FOR j IN 1 TO 13 LOOP
          exptopff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO latency LOOP
        aasatff(k) <= '0';
        aazipff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO latency-1 LOOP
        mulsignff(k) <= '0';
      END LOOP;
       
    ELSIF (rising_edge(sysclk)) THEN
         
      IF (enable = '1') THEN
        
        aaff <= aa;
            
        exptopff(1)(13 DOWNTO 1) <= aaff(13 DOWNTO 1) + adjustexp;
        FOR k IN 2 TO exptopffdepth LOOP
          exptopff(k)(13 DOWNTO 1) <= exptopff(k-1)(13 DOWNTO 1);
        END LOOP;

        aasatff(1) <= aasat;
        aazipff(1) <= aazip;
        FOR k IN 2 TO latency LOOP
          aasatff(k) <= aasatff(k-1);
          aazipff(k) <= aazipff(k-1);
        END LOOP;
          
        mulsignff(1) <= aaff(77);
        FOR k IN 2 TO latency-1 LOOP
          mulsignff(k) <= mulsignff(k-1);
        END LOOP;
          
      END IF;
             
    END IF;
      
  END PROCESS;

  -- exponent bottom half
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

  -- add 4, because Y format is SSSSS1XXXX, seem to need this for both targets
  adjustexp <= "0000000000100";
  
  gna: FOR k IN 1 TO 64 GENERATE
    aainvnode(k) <= aaff(k+13) XOR aaff(77);
  END GENERATE;
  
  --*** APPLY ROUNDING TO ABS VALUE (IF REQUIRED) ***
  gnb: IF ((roundconvert = 0) OR
           (roundconvert = 1 AND doublespeed = 0)) GENERATE
  
    gnc: IF (roundconvert = 0) GENERATE
      aaabsnode <= aainvnode;
    END GENERATE;
    gnd: IF (roundconvert = 1) GENERATE
      aaabsnode <= aainvnode + (zerovec(63 DOWNTO 1) & aaff(77));
    END GENERATE;

    pnb: PROCESS (sysclk, reset)
    BEGIN
      IF (reset = '1') THEN    
        FOR k IN 1 TO 64 LOOP
          aaabsff(k) <= '0';
        END LOOP;   
      ELSIF (rising_edge(sysclk)) THEN   
        IF (enable = '1') THEN
          aaabsff <= aaabsnode;  
        END IF;          
      END IF;
    END PROCESS;

    aaabs <= aaabsff;

  END GENERATE;
    
  gnd: IF (roundconvert = 1 AND doublespeed = 1) GENERATE   
    gsa: IF (synthesize = 0) GENERATE
      absone: hcc_addpipeb
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>aainvnode,bb=>zerovec,carryin=>aaff(77),
                cc=>aaabs);
    END GENERATE;
    gsb: IF (synthesize = 1) GENERATE
      abstwo: hcc_addpipes
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>aainvnode,bb=>zerovec,carryin=>aaff(77),
                cc=>aaabs);
    END GENERATE;
  END GENERATE;
      
  --*** NORMALIZE HERE - 1-3 pipes (countnorm output after 1 pipe)
  normcore: hcc_normus64
  GENERIC MAP (pipes=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            fracin=>aaabs,
            countout=>countnorm,fracout=>normalaa);

  gta: IF (target = 0) GENERATE
   
    pnc: PROCESS (sysclk, reset)
    BEGIN
      IF (reset = '1') THEN 
        FOR k IN 1 TO 54 LOOP
          normalaaff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          normalaaff <= normalaa(64 DOWNTO 10);
        END IF;
      END IF;
    END PROCESS; 
               
     --*** ROUND NORMALIZED VALUE (IF REQUIRED)***
     --*** note: normal output is 64 bits
    
     gne: IF (roundnormalize = 0) GENERATE
       mantissa <= normalaaff(55 DOWNTO 2);
     END GENERATE;
    
     gnf: IF (roundnormalize = 1) GENERATE

       gng: IF (doublespeed = 0) GENERATE  
  
         aamannode <= normalaaff(55 DOWNTO 2) + (zerovec(53 DOWNTO 1) & normalaaff(1));

         pnd: PROCESS (sysclk, reset)
         BEGIN
           IF (reset = '1') THEN
             FOR k IN 1 TO 54 LOOP
               aamanff(k) <= '0';
             END LOOP;
           ELSIF (rising_edge(sysclk)) THEN
             IF (enable = '1') THEN              
               aamanff <= aamannode;
             END IF;
           END IF;
         END PROCESS;
      
         mantissa <= aamanff;

       END GENERATE;
  
       gnh: IF (doublespeed = 1) GENERATE

         gra: IF (synthesize = 0) GENERATE
           rndone: hcc_addpipeb
           GENERIC MAP (width=>54,pipes=>2)
           PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                     aa=>normalaaff(55 DOWNTO 2),bb=>zerovec(54 DOWNTO 1),carryin=>normalaaff(1),
                     cc=>mantissa);
         END GENERATE;
         grb: IF (synthesize = 1) GENERATE
           rndtwo: hcc_addpipes
           GENERIC MAP (width=>54,pipes=>2)
           PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                     aa=>normalaaff(55 DOWNTO 2),bb=>zerovec(54 DOWNTO 1),carryin=>normalaaff(1),
                     cc=>mantissa);
         END GENERATE;

       END GENERATE;
   
     END GENERATE;

    sign <= mulsignff(latency-1); 
    cc <= sign & mantissa(53 DOWNTO 1) & exponent;
    ccsat <= aasatff(latency);
    cczip <= aazipff(latency);
     
  END GENERATE;

  gtb: IF (target = 1) GENERATE
  
    pne: PROCESS (sysclk, reset)
    BEGIN
      IF (reset = '1') THEN 
        FOR k IN 1 TO 64 LOOP
          normalaaff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          FOR k IN 1 TO 59 LOOP
            normalaaff(k) <= normalaa(k+4) XOR mulsignff(invertpoint);
          END LOOP;
          normalaaff(60) <= mulsignff(invertpoint);
          normalaaff(61) <= mulsignff(invertpoint);
          normalaaff(62) <= mulsignff(invertpoint);
          normalaaff(63) <= mulsignff(invertpoint);
          normalaaff(64) <= mulsignff(invertpoint);
        END IF;
      END IF;
    END PROCESS; 
    
    gni: IF (roundnormalize = 0) GENERATE
      mantissa <= normalaaff; -- 1's complement
    END GENERATE;
 
     gnj: IF (roundnormalize = 1) GENERATE

       gnk: IF (doublespeed = 0) GENERATE  
        
         aamannode <= normalaaff + (zerovec(63 DOWNTO 1) & mulsignff(invertpoint+1));

         pne: PROCESS (sysclk, reset)
         BEGIN
           IF (reset = '1') THEN
             FOR k IN 1 TO 64 LOOP
               aamanff(k) <= '0';
             END LOOP;
           ELSIF (rising_edge(sysclk)) THEN
             IF (enable = '1') THEN              
               aamanff <= aamannode;
             END IF;
           END IF;
         END PROCESS;
      
         mantissa <= aamanff;

       END GENERATE;
  
       gnl: IF (doublespeed = 1) GENERATE

         grc: IF (synthesize = 0) GENERATE
           rndone: hcc_addpipeb
           GENERIC MAP (width=>64,pipes=>2)
           PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                     aa=>normalaaff,bb=>zerovec(64 DOWNTO 1),carryin=>mulsignff(invertpoint+1),
                     cc=>mantissa);
         END GENERATE;
         grd: IF (synthesize = 1) GENERATE
           rndtwo: hcc_addpipes
           GENERIC MAP (width=>64,pipes=>2)
           PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                     aa=>normalaaff,bb=>zerovec(64 DOWNTO 1),carryin=>mulsignff(invertpoint+1),
                     cc=>mantissa);
         END GENERATE;
       END GENERATE;
   
     END GENERATE;

    cc <= mantissa(64 DOWNTO 1) & exponent;
    ccsat <= aasatff(latency);
    cczip <= aazipff(latency);
        
  END GENERATE;
     
end rtl;

