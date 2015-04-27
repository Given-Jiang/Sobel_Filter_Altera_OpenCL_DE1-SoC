
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DIVFP2X.VHD                           ***
--***                                             ***
--***   Function: Internal format double divide - ***
--***              unsigned mantissa              ***
--***                                             ***
--***   Uses new multiplier based divider core    ***
--***   from floating point library               ***
--***                                             ***
--***   24/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   23/04/09 - added NAN support              ***
--***   27/04/09 - added SIII/SIV support         ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--***                                             ***
--*** Stratix II                                  ***
--*** Latency = 20 + 4*doublespeed +              ***
--*** doublespeed*roundconvert (Y)                ***
--*** Latency = 20 + 4*doublespeed (F)            ***
--*** Latency = 20 + 4*doublespeed +              ***
--*** roundconvert*(1+doublespeed) (ieee)         ***
--***                                             ***
--*** Stratix III/IV                              ***
--*** Latency = 19 + 2*doublespeed +              ***
--*** doublespeed*roundconvert (Y)                ***
--*** Latency = 19 + 2*doublespeed (F)            ***
--*** Latency = 19 + 2*doublespeed +              ***
--*** roundconvert*(1+doublespeed) (ieee)         ***
--***************************************************

ENTITY hcc_divfp2x IS 
GENERIC (
         ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
         xoutput : integer := 1; -- 1 = double x format (s64/13)
         divoutput : integer := 1; -- output to another multiplier or divider (S'1'u54/13)
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         doublespeed : integer := 0; -- global switch - '0' unpiped adders, '1' piped adders for doubles
         doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;
      
		cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*divoutput DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_divfp2x;

ARCHITECTURE rtl OF hcc_divfp2x IS

  -- SII: div_core latency 19+4*doublespeed 
  -- SIII/IV: div_core latency 18+2*doublespeed 
  constant midlatency : positive := 18+4*doublespeed - device - 2*device*doublespeed;
  
  type divinexpfftype IS ARRAY (midlatency DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type divexpdelfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
        
  -- divider core interface
  signal divinaaman, divinbbman : STD_LOGIC_VECTOR(53 DOWNTO 1);
  signal divinaaexp, divinbbexp : STD_LOGIC_VECTOR(13 DOWNTO 1);
  signal divinaaexpff, divinbbexpff : STD_LOGIC_VECTOR(13 DOWNTO 1);
  signal divinaasat, divinaazip, divinaanan : STD_LOGIC;
  signal divinbbsat, divinbbzip, divinbbnan : STD_LOGIC;
  signal divinaasatff, divinaazipff, divinaananff : STD_LOGIC;
  signal divinbbsatff, divinbbzipff, divinbbnanff : STD_LOGIC;
  signal divinaasign, divinbbsign : STD_LOGIC;
  signal divinaasignff, divinbbsignff : STD_LOGIC;
  signal divinexpff : divinexpfftype;
  signal divinsignff : STD_LOGIC_VECTOR (midlatency DOWNTO 1);
  signal divinsatff, divinzipff, divinnanff : STD_LOGIC_VECTOR (midlatency DOWNTO 1);
  signal dividend, divisor : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal divmannode : STD_LOGIC_VECTOR (55 DOWNTO 1);

  -- output section (x out)
  signal signeddivmannode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal divroundnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal divmanout : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal divymanff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal divyexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal divysatbitff, divyzipbitff, divynanbitff : STD_LOGIC;
  signal divexpplus : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal divyexpdelff : divexpdelfftype;
  signal divysatdelff, divyzipdelff, divynandelff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal divsatbase, divzipbase : STD_LOGIC;
  
  -- output section (divout)
  signal normmannode : STD_LOGIC_VECTOR (53 DOWNTO 1);
  signal divdivmanff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal divdivexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal divdivsatff, divdivzipff, divdivnanff : STD_LOGIC;
        
  -- output section (ieeeout)  
  signal normsignff, normsatff, normzipff, normnanff : STD_LOGIC;
  signal normalize : STD_LOGIC;
  signal normalnode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal normalff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal normalexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
                                
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

  -- SII: latency 19+4*doublespeed 
  -- SIII/IV: latency 18+2*doublespeed 
  component dp_div_core IS 
  GENERIC (
         doublespeed : integer := 0; -- 0/1
         doubleaccuracy : integer := 0;  -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1      -- 0/1      
        ); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dividend : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
        divisor : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

		  quotient : OUT STD_LOGIC_VECTOR (55 DOWNTO 1)
		  );
  end component;

  -- latency 1
  component hcc_divnornd 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (53 DOWNTO 1); -- includes roundbit
        satin, zipin, nanin : IN STD_LOGIC;

		  signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1)
		 );
  end component;
  
  -- latency 2
  component hcc_divrnd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (53 DOWNTO 1); -- includes roundbit
        satin, zipin, nanin : IN STD_LOGIC;

		  signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1)
		 );
  end component; 
  
  -- latency 3
  component hcc_divrndpipe 
  GENERIC (synthesize : integer := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (53 DOWNTO 1); -- includes roundbit
        satin, zipin, nanin : IN STD_LOGIC;

		  signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1)
		 );
  end component;
    
BEGIN
 
  gza: FOR k IN 1 TO 64 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  --**************************************************
  --***                                            ***
  --*** Input Section                              *** 
  --***                                            ***
  --**************************************************

  --********************************************************
  --*** NOTE THAT THE SIGN BIT IS PACKED IN THE MSB OF   ***
  --*** THE MANTISSA                                     ***
  --********************************************************

  divinaaman <= aa(66 DOWNTO 14);
  divinaaexp <= aa(13 DOWNTO 1);
  divinbbman <= bb(66 DOWNTO 14);
  divinbbexp <= bb(13 DOWNTO 1);
  divinaasat <= aasat;
  divinbbsat <= bbsat;
  divinaazip <= aazip;
  divinbbzip <= bbzip;
  divinaanan <= aanan;
  divinbbnan <= bbnan;
  -- signbits packed in MSB of mantissas
  divinaasign <= aa(67);
  divinbbsign <= bb(67);

  --**************************************************
  --***                                            ***
  --*** Divider Section                            *** 
  --***                                            ***
  --**************************************************
  
  dividend <= divinaaman & '0';
  divisor <= divinbbman & '0';
  
  -- SII: latency 19+4*doublespeed 
  -- SIII/IV: latency 18+2*doublespeed 
  div: dp_div_core
  GENERIC MAP (doublespeed=>doublespeed,doubleaccuracy=>doubleaccuracy,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dividend=>dividend,divisor=>divisor,
            quotient=>divmannode);
        
  pda: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 13 LOOP
        divinaaexpff(k) <= '0';
        divinbbexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO midlatency LOOP
        FOR j IN 1 TO 13 LOOP
          divinexpff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      divinaasignff <= '0';
      divinbbsignff <= '0';
      divinaasatff <= '0';
      divinbbsatff <= '0';
      divinaazipff <= '0';
      divinbbzipff <= '0';
      divinaananff <= '0';
      divinbbnanff <= '0';
      FOR k IN 1 TO midlatency LOOP
        divinsignff(k) <= '0';
        divinsatff(k) <= '0';
        divinzipff(k) <= '0';
        divinnanff(k) <= '0';
      END LOOP;
         
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        divinaaexpff <= divinaaexp;
        divinbbexpff <= divinbbexp;
        divinexpff(1)(13 DOWNTO 1) <= divinaaexpff - divinbbexpff;
        divinexpff(2)(13 DOWNTO 1) <= divinexpff(1)(13 DOWNTO 1) + "0001111111111";
        FOR k IN 3 TO midlatency LOOP
          divinexpff(k)(13 DOWNTO 1) <= divinexpff(k-1)(13 DOWNTO 1);
        END LOOP; 
        
        divinaasignff <= divinaasign;
        divinbbsignff <= divinbbsign;
        divinsignff(1) <= divinaasignff XOR divinbbsignff;
        FOR k IN 2 TO midlatency LOOP
          divinsignff(k) <= divinsignff(k-1);
        END LOOP;
     
        divinaasatff <= divinaasat;
        divinbbsatff <= divinbbsat;
        divinaazipff <= divinaazip;
        divinbbzipff <= divinbbzip;
        divinaananff <= divinaanan;
        divinbbnanff <= divinbbnan;
        -- special condition: infinity = x/0
        divinsatff(1) <= (divinaasatff OR divinbbsatff) OR
                         (NOT(divinaazipff) AND divinbbzipff);
        divinzipff(1) <= divinaazipff;
        -- 0/0 or infinity/infinity is invalid OP, NAN out
        divinnanff(1) <= divinaananff OR divinbbnanff OR 
                        (divinaazipff AND divinbbzipff) OR
                        (divinaasatff AND divinbbsatff);      
        FOR k IN 2 TO midlatency LOOP
          divinsatff(k) <= divinsatff(k-1);
          divinzipff(k) <= divinzipff(k-1);
          divinnanff(k) <= divinnanff(k-1);
        END LOOP;
         
      END IF;
        
    END IF;
      
  END PROCESS;
       
  --**************************************************
  --***                                            ***
  --*** Output Section                             *** 
  --***                                            ***
  --**************************************************

  --********************************************************
  --*** internal format output, convert back to signed   ***
  --*** no need for fine normalization                   ***
  --********************************************************     
  goya: IF (xoutput = 1) GENERATE 
  
    -- output either "01XXXX..RR" (<1) or "1XXXX..RR" (>=1)
    -- if <1, SSSSSS1'manSSSSS
    -- if >1, SSSSS1'manSSSS
    goyb: FOR k IN 1 TO 4 GENERATE
      signeddivmannode(k) <= divinsignff(midlatency);
    END GENERATE;
    goyc: FOR k IN 1 TO 55 GENERATE
      signeddivmannode(k+4) <= divmannode(k) XOR divinsignff(midlatency);
    END GENERATE;
    goyd: FOR k IN 60 TO 64 GENERATE
      signeddivmannode(k) <= divinsignff(midlatency);
    END GENERATE;

    goye: IF ((roundconvert = 0) OR
              (roundconvert = 1 AND doublespeed = 0)) GENERATE

      goyf: IF (roundconvert = 0) GENERATE
        divroundnode <= signeddivmannode;
      END GENERATE;

      goyg: IF (roundconvert = 1) GENERATE
        divroundnode <= signeddivmannode + (zerovec(63 DOWNTO 1) & divinsignff(midlatency));
      END GENERATE;

      poxa: PROCESS (sysclk,reset)
      BEGIN
        
        IF (reset = '1') THEN
          
          FOR k IN 1 TO 64 LOOP
            divymanff(k) <= '0';
          END LOOP;
          FOR j IN 1 TO 13 LOOP
            divyexpff(j) <= '0';
          END LOOP;
          divysatbitff <= '0';
          divyzipbitff <= '0';
          divynanbitff <= '0';
      
        ELSIF (rising_edge(sysclk)) THEN
      
          IF (enable = '1') THEN
            
            divymanff <= divroundnode;
            divyexpff <= divinexpff(midlatency)(13 DOWNTO 1);
            divysatbitff <= divinsatff(midlatency);
            divyzipbitff <= divinzipff(midlatency);
            divynanbitff <= divinnanff(midlatency);
          
          END IF;        
              
        END IF;
        
      END PROCESS;

      cc(77 DOWNTO 14) <= divymanff;
      cc(13 DOWNTO 1) <= divyexpff;
      ccsat <= divysatbitff;
      cczip <= divyzipbitff;
      ccnan <= divynanbitff;

    END GENERATE;

    goyh: IF (roundconvert = 1 AND doublespeed = 1) GENERATE

      goyi: IF (synthesize = 0) GENERATE
        rndaddone: hcc_addpipeb 
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>signeddivmannode,bb=>zerovec(64 DOWNTO 1),carryin=>divinsignff(midlatency),
                  cc=>divmanout);
      END GENERATE;

      goyj: IF (synthesize = 1) GENERATE
        rndaddtwo: hcc_addpipes 
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>signeddivmannode,bb=>zerovec(64 DOWNTO 1),carryin=>divinsignff(midlatency),
                  cc=>divmanout);
      END GENERATE;

      poxb: PROCESS (sysclk,reset)
      BEGIN
        
        IF (reset = '1') THEN
          
          FOR j IN 1 TO 13 LOOP
            divyexpdelff(1)(j) <= '0';
            divyexpdelff(2)(j) <= '0';
          END LOOP;
          divysatdelff <= "00";
          divyzipdelff <= "00";
          divynandelff <= "00";
      
        ELSIF (rising_edge(sysclk)) THEN
      
          IF (enable = '1') THEN

            divyexpdelff(1)(13 DOWNTO 1) <= divinexpff(midlatency)(13 DOWNTO 1);
            divyexpdelff(2)(13 DOWNTO 1) <= divyexpdelff(1)(13 DOWNTO 1);
            divysatdelff(1) <= divinsatff(midlatency);
            divysatdelff(2) <= divysatdelff(1);
            divyzipdelff(1) <= divinzipff(midlatency);
            divyzipdelff(2) <= divyzipdelff(1);
            divynandelff(1) <= divinnanff(midlatency);
            divynandelff(2) <= divynandelff(1);

          END IF;        
              
        END IF;
        
      END PROCESS;

      cc(77 DOWNTO 14) <= divmanout;
      cc(13 DOWNTO 1) <= divyexpdelff(2)(13 DOWNTO 1);
      ccsat <= divysatdelff(2);
      cczip <= divyzipdelff(2);
      ccnan <= divynandelff(2);

    END GENERATE;
           
  END GENERATE;
  
  --**************************************************
  --*** if output to another multiplier or divider *** 
  --*** use output directly                        ***
  --**************************************************
  
  --*** NOTE: roundconvert options must still be added
  
  gofa: IF (divoutput = 1) GENERATE
  
    -- [55:1] output either "01XXXX..RR" (<1) or "1XXXX..RR" (>=1)
    normalize <= NOT(divmannode(55));
    gofb: FOR k IN 1 TO 53 GENERATE
      normmannode(k) <= (divmannode(k+1) AND normalize) OR
                        (divmannode(k+2) AND NOT(normalize));
    END GENERATE;    
        
    -- exp[54:1] always '1'manR
    poda: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        FOR k IN 1 TO 54 LOOP
          divdivmanff(k) <= '0';
        END LOOP;
        FOR j IN 1 TO 13 LOOP
          divdivexpff(j) <= '0';
        END LOOP;
        divdivsatff <= '0';
        divdivzipff <= '0';
        divdivnanff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
          
        divdivmanff <= divinsignff(midlatency) & normmannode;
         -- 20/05/09 add normalize adjustement
        divdivexpff <= divinexpff(midlatency)(13 DOWNTO 1) - (zerovec(12 DOWNTO 1) & normalize); 
        divdivsatff <= divinsatff(midlatency);
        divdivzipff <= divinzipff(midlatency);
        divdivnanff <= divinnanff(midlatency);
        
      END IF;
           
    END PROCESS;

    cc(67 DOWNTO 14) <= divdivmanff;
    cc(13 DOWNTO 1) <= divdivexpff;
    ccsat <= divdivsatff;
    cczip <= divdivzipff;
    ccnan <= divdivnanff;
  
  END GENERATE;
  
  --********************************************************
  --*** if output directly out of datapath, convert here ***
  --*** input to multiplier always "01XXX" format, so    ***
  --*** just 1 bit normalization required                ***
  --********************************************************
  goea: IF (ieeeoutput = 1) GENERATE -- ieee754 out of datapath, do conversion
  
    -- output either "01XXXX..RR" (<2) or "1XXXX..RR" (>=2), need to make output
    -- 01XXXX
    normalize <= NOT(divmannode(55));
    goeb: FOR k IN 1 TO 54 GENERATE -- format "01"[52..1]R
      normalnode(k) <= (divmannode(k+1) AND NOT(normalize)) OR 
                       (divmannode(k) AND normalize); 
    END GENERATE;
    
    poea: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
          
        normsignff <= '0';
        normsatff <= '0';
        normzipff <= '0';
        normnanff <= '0';
        FOR k IN 1 TO 54 LOOP
          normalff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 13 LOOP
          normalexpff(k) <= '0';
        END LOOP;
        
      ELSIF (rising_edge(sysclk)) THEN
        
        IF (enable = '1') THEN
            
          normsignff <= divinsignff(midlatency);
          normsatff <= divinsatff(midlatency);
          normzipff <= divinzipff(midlatency);
          normnanff <= divinnanff(midlatency);
          
          normalff <= normalnode;
          
          normalexpff <= divinexpff(midlatency)(13 DOWNTO 1) -
                         (zerovec(12 DOWNTO 1) & normalize);
                         
        END IF;      
              
      END IF;
      
    END PROCESS;

    goec: IF (roundconvert = 0) GENERATE

      norndout: hcc_divnornd
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                signin=>normsignff,
                exponentin=>normalexpff,
                mantissain=>normalff(53 DOWNTO 1),
                satin=>normsatff,
                zipin=>normzipff,
                nanin=>normnanff,

                signout=>cc(64),exponentout=>cc(63 DOWNTO 53),mantissaout=>cc(52 DOWNTO 1));
                
      -- dummy only
      ccsat <= '0';
      cczip <= '0';
      ccnan <= '0';    
            
    END GENERATE;
    
    goed: IF ((roundconvert = 1) AND (doublespeed = 0)) GENERATE

      rndout: hcc_divrnd
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                signin=>normsignff,
                exponentin=>normalexpff,
                mantissain=>normalff(53 DOWNTO 1),
                satin=>normsatff,
                zipin=>normzipff,
                nanin=>normnanff,

                signout=>cc(64),exponentout=>cc(63 DOWNTO 53),mantissaout=>cc(52 DOWNTO 1));
                
      -- dummy only
      ccsat <= '0';
      cczip <= '0';
      ccnan <= '0';    
            
    END GENERATE;
    
    goee: IF ((roundconvert = 1) AND (doublespeed = 1)) GENERATE

      rndpipout: hcc_divrndpipe
      GENERIC MAP (synthesize=>synthesize)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                signin=>normsignff,
                exponentin=>normalexpff,
                mantissain=>normalff(53 DOWNTO 1),
                satin=>normsatff,
                zipin=>normzipff,
                nanin=>normnanff,

                signout=>cc(64),exponentout=>cc(63 DOWNTO 53),mantissaout=>cc(52 DOWNTO 1));
                
      -- dummy only
      ccsat <= '0';
      cczip <= '0';    
      ccnan <= '0';
            
    END GENERATE;
    
  END GENERATE;

END rtl;

