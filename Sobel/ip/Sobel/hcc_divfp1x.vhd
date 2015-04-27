
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DIVFP1X.VHD                           ***
--***                                             ***
--***   Function: Internal format single divide - ***
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
--***   22/04/09 - added NAN support, IEEE NAN    ***
--***   output, sign bug                          ***
--***   11/08/09 - add divider interface output   ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** Latency = 13 (X)                            ***
--*** Latency = 13 (M)                            ***
--*** Latency = 13 (D)                            ***
--*** Latency = 13 + roundconvert (ieee)          ***
--***************************************************

ENTITY hcc_divfp1x IS 
GENERIC (
         mantissa : positive := 32; -- 32/36 mantissa
         ieeeoutput : integer := 1; -- 1 = ieee754 (1/u23/8)
         xoutput : integer := 0; -- 1 = single x format (s32/13)
         multoutput : integer := 0; -- 1 = to another single muliplier (s/1/34/10) - signed
         divoutput : integer := 0; -- 1 = to a single divider (s/1/34/10) - signed magnitude
         roundconvert : integer := 0;
         synthesize : integer := 0
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (32*ieeeoutput+(mantissa+10)*(xoutput+multoutput+divoutput) DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_divfp1x;

ARCHITECTURE rtl OF hcc_divfp1x IS
    
  -- latency = 13 + ieeeoutput*roundconvert

  type divexpfftype IS ARRAY (11 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (24 DOWNTO 1);
        
  -- multiplier core interface
  signal divinaaman, divinbbman : STD_LOGIC_VECTOR(mantissa DOWNTO 1);
  signal divinaaexp, divinbbexp : STD_LOGIC_VECTOR(10 DOWNTO 1);
  signal divinaaexpff, divinbbexpff : STD_LOGIC_VECTOR(10 DOWNTO 1);
  signal divinaasat, divinaazip, divinaanan : STD_LOGIC;
  signal divinbbsat, divinbbzip, divinbbnan : STD_LOGIC;
  signal divinaasatff, divinaazipff, divinaananff : STD_LOGIC;
  signal divinbbsatff, divinbbzipff, divinbbnanff : STD_LOGIC;
  signal divinaasign, divinbbsign : STD_LOGIC;
  signal divinaasignff, divinbbsignff : STD_LOGIC;
  signal divsignff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal divsatff, divzipff, divnanff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal divexpff : divexpfftype;
  signal dividend, divisor : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal divmannode : STD_LOGIC_VECTOR (36 DOWNTO 1);

  -- output section (x out)
  signal signeddivmannode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal divxmanff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal divxexpff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal divxsatff, divxzipff, divxnanff : STD_LOGIC;

  -- output section (mult out)
  signal normalizemult : STD_LOGIC;
  signal normmultnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal signedmultnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal divmultmanff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal divmultexpff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal divmultsatff, divmultzipff, divmultnanff : STD_LOGIC;
      
  -- output section (div out)
  signal normalizediv : STD_LOGIC;
  signal normdivnode : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal divdivsignff : STD_LOGIC;
  signal divdivmanff : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal divdivexpff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal divdivsatff, divdivzipff, divdivnanff : STD_LOGIC;  

  -- output section (ieeeout)  
  signal normalize : STD_LOGIC;
  signal normmannode : STD_LOGIC_VECTOR (25 DOWNTO 1);
  signal manoverflow : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal ccmanff : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal ccexpff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal divexpminus : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal ccsignff, ccsatff, cczipff, ccnanff, ccoverff : STD_LOGIC;
  signal manoutff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal expoutff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal signoutff : STD_LOGIC;
  signal ccexpplus : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expmax, expzero : STD_LOGIC;
  signal manoutzero, manoutmax, expoutzero, expoutmax : STD_LOGIC;
     
  -- Signals to convert division format to mult format
  signal aaxor : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal bbxor : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  -- 12 latency
  component fp_div_core IS 
  GENERIC (synthesize : integer := 1);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dividend : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        divisor : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		  quotient : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		  );
  end component;
  
BEGIN
 
  gza: IF (ieeeoutput = 1) GENERATE
    gzb: FOR k IN 1 TO 24 GENERATE
      zerovec(k) <= '0';
    END GENERATE;
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

  aaxor <= (others => aa(mantissa+10));
  bbxor <= (others => bb(mantissa+10));

  divinaaman <= (aa(mantissa+9 DOWNTO 11) & '0') XOR aaxor;
  divinaaexp <= aa(10 DOWNTO 1);
  divinbbman <= (bb(mantissa+9 DOWNTO 11) & '0') XOR bbxor;
  divinbbexp <= bb(10 DOWNTO 1);
  divinaasat <= aasat;
  divinbbsat <= bbsat;
  divinaazip <= aazip;
  divinbbzip <= bbzip;
  divinaanan <= aanan;
  divinbbnan <= bbnan;
  -- signbits packed in MSB of mantissas
  divinaasign <= aa(mantissa+10);
  divinbbsign <= bb(mantissa+10);

  --**************************************************
  --***                                            ***
  --*** Divider Section                            *** 
  --***                                            ***
  --**************************************************

  gdda: IF (mantissa = 32) GENERATE
    dividend <= divinaaman & "0000";
    divisor <= divinbbman & "0000";
  END GENERATE;
  gddb: IF (mantissa = 36) GENERATE
    dividend <= divinaaman;
    divisor <= divinbbman;
  END GENERATE;

  -- 12 latency
  div: fp_div_core
  GENERIC MAP (synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dividend=>dividend,divisor=>divisor,
            quotient=>divmannode);

  -- 12 pipes here : 1 input stage, so 11 stages left 
  pda: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 10 LOOP
        divinaaexpff(k) <= '0';
        divinbbexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        FOR j IN 1 TO 10 LOOP
          divexpff(k)(j) <= '0';
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
      FOR k IN 1 TO 11 LOOP
        divsignff(k) <= '0';
        divsatff(k) <= '0';
        divzipff(k) <= '0';
        divnanff(k) <= '0';
      END LOOP;
         
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        divinaaexpff <= divinaaexp;
        divinbbexpff <= divinbbexp;
        divexpff(1)(10 DOWNTO 1) <= divinaaexpff - divinbbexpff;
        divexpff(2)(10 DOWNTO 1) <= divexpff(1)(10 DOWNTO 1) + "0001111111";
        FOR k IN 3 TO 11 LOOP
          divexpff(k)(10 DOWNTO 1) <= divexpff(k-1)(10 DOWNTO 1);
        END LOOP; 
        
        divinaasignff <= divinaasign;
        divinbbsignff <= divinbbsign;
        divsignff(1) <= divinaasignff XOR divinbbsignff;
        FOR k IN 2 TO 11 LOOP
          divsignff(k) <= divsignff(k-1);
        END LOOP;
     
        divinaasatff <= divinaasat;
        divinbbsatff <= divinbbsat;
        divinaazipff <= divinaazip;
        divinbbzipff <= divinbbzip;
        divinaananff <= divinaanan;
        divinbbnanff <= divinbbnan;
        -- special condition: infinity = x/0
        divsatff(1) <= (divinaasatff OR divinbbsatff) OR
                       (NOT(divinaazipff) AND divinbbzipff);
        divzipff(1) <= divinaazipff;
        -- 0/0 or infinity/infinity is invalid OP, NAN out
        divnanff(1) <= divinaananff OR divinbbnanff OR 
                      (divinaazipff AND divinbbzipff) OR
                      (divinaasatff AND divinbbsatff);
        FOR k IN 2 TO 11 LOOP
          divsatff(k) <= divsatff(k-1);
          divzipff(k) <= divzipff(k-1);
          divnanff(k) <= divnanff(k-1);
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
   
  goxa: IF (xoutput = 1) GENERATE 
    
    goxb: FOR k IN 1 TO mantissa-5 GENERATE
      signeddivmannode(k) <= divmannode(36-mantissa+5+k) XOR divsignff(11);
    END GENERATE;
    goxc: FOR k IN mantissa-4 TO mantissa GENERATE
      signeddivmannode(k) <= divsignff(11);
    END GENERATE;

    pox: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        FOR k IN 1 TO mantissa LOOP
          divxmanff(k) <= '0';
        END LOOP;
        divxexpff <= "0000000000";
        divxsatff <= '0';
        divxzipff <= '0';
        divxnanff <= '0';
      
      ELSIF (rising_edge(sysclk)) THEN
      
        IF (enable = '1') THEN
            
          divxmanff <= signeddivmannode;
          
          divxexpff(10 DOWNTO 1) <= divexpff(11)(10 DOWNTO 1);
          
          divxsatff <= divsatff(11);
          divxzipff <= divzipff(11);
          divxnanff <= divnanff(11);

        END IF;        
              
      END IF;
        
    END PROCESS;
       
    cc(mantissa+10 DOWNTO 11) <= divxmanff;
    cc(10 DOWNTO 1) <= divxexpff(10 DOWNTO 1);
    ccsat <= divxsatff;
    cczip <= divxzipff;
    ccnan <= divxnanff;
    
  END GENERATE;

  --*********************************
  --*** multiplier format output  ***
  --*********************************  
   
  gofa: IF (multoutput = 1) GENERATE 
  
    -- output either "01XXX" (0.5 < x < 1) or "1XXX" (1 < x < 2), normalize to "01XXX"
    -- this is opposite direction to divider normalization
    normalizemult <= NOT(divmannode(36));
    goeb: FOR k IN 1 TO mantissa-1 GENERATE -- includes leading '1' and round bit
      normmultnode(k) <= (divmannode(36-mantissa+k) AND     normalizemult) OR
                         (divmannode(37-mantissa+k) AND NOT(normalizemult));
    END GENERATE;
    normmultnode(mantissa) <= '0';
    goec: FOR k IN 1 TO mantissa GENERATE
      signedmultnode(k) <= normmultnode(k) XOR divsignff(11);
    END GENERATE;
    
    pof: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        FOR k IN 1 TO mantissa LOOP
          divmultmanff(k) <= '0';
        END LOOP;
        divmultexpff <= "0000000000";
        divmultsatff <= '0';
        divmultzipff <= '0';
        divmultnanff <= '0';
      
      ELSIF (rising_edge(sysclk)) THEN
      
        IF (enable = '1') THEN

          divmultmanff <= signedmultnode + divsignff(11);
          
          divmultexpff(10 DOWNTO 1) <= divexpff(11)(10 DOWNTO 1) - normalizemult;
          
          divmultsatff <= divsatff(11);
          divmultzipff <= divzipff(11);
          divmultnanff <= divnanff(11);

        END IF;        
              
      END IF;
        
    END PROCESS;

    cc(mantissa+10 DOWNTO 11) <= divmultmanff;
    cc(10 DOWNTO 1) <= divmultexpff(10 DOWNTO 1);
    ccsat <= divmultsatff;
    cczip <= divmultzipff;
    ccnan <= divmultnanff;
    
  END GENERATE; 
   
  --******************************
  --*** divider format output  ***
  --******************************  
   
  goda: IF (divoutput = 1) GENERATE 
  
    -- output either "01XXX" (0.5 < x < 1) or "1XXX" (1 < x < 2), normalize to "1XXX"
    normalizediv <= NOT(divmannode(36));
    godb: FOR k IN 1 TO mantissa-1 GENERATE -- includes leading '1' and round bit
      normdivnode(k) <= (divmannode(36-mantissa+k) AND     normalizediv) OR
                        (divmannode(37-mantissa+k) AND NOT(normalizediv));
    END GENERATE;
    
    pof: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        divdivsignff <= '0';
        FOR k IN 1 TO mantissa-1 LOOP
          divdivmanff(k) <= '0';
        END LOOP;
        divdivexpff <= "0000000000";
        divdivsatff <= '0';
        divdivzipff <= '0';
        divdivnanff <= '0';
      
      ELSIF (rising_edge(sysclk)) THEN
      
        IF (enable = '1') THEN
            
          divdivsignff <= divsignff(11);
           
          divdivmanff <= normdivnode;
          
          divdivexpff(10 DOWNTO 1) <= divexpff(11)(10 DOWNTO 1) - normalizediv;
          
          divdivsatff <= divsatff(11);
          divdivzipff <= divzipff(11);
          divdivnanff <= divnanff(11);

        END IF;        
              
      END IF;
        
    END PROCESS;
    
    cc(mantissa+10) <= divdivsignff;
    cc(mantissa+9 DOWNTO 11) <= divdivmanff;
    cc(10 DOWNTO 1) <= divdivexpff(10 DOWNTO 1);
    ccsat <= divdivsatff;
    cczip <= divdivzipff;
    ccnan <= divdivnanff;
    
  END GENERATE;
  
  --********************************************************
  --*** if output directly out of datapath, convert here ***
  --********************************************************
  goea: IF (ieeeoutput = 1) GENERATE -- ieee754 out of datapath, do conversion
     
    -- output either "01XXX" (0.5 < x < 1) or "1XXX" (1 < x < 2), normalize to "1XXX"
    normalize <= NOT(divmannode(36));
    goeb: FOR k IN 1 TO 25 GENERATE -- includes leading '1' and round bit
      normmannode(k) <= (divmannode(k+11) AND NOT(normalize)) OR
                        (divmannode(k+10) AND normalize);
    END GENERATE;
                  
    -- always round, need 
    goec: IF (roundconvert = 0) GENERATE

      poea: PROCESS (sysclk,reset)
      BEGIN
    
        IF (reset = '1') THEN
        
          FOR k IN 1 TO 23 LOOP
            manoutff(k) <= '0';  
          END LOOP; 
          FOR k IN 1 TO 8 LOOP
            expoutff(k) <= '0';  
          END LOOP; 
          signoutff <= '0';
          
        ELSIF (rising_edge(sysclk)) THEN
           
          IF (enable = '1') THEN  
            FOR k IN 1 TO 23 LOOP
              manoutff(k) <= (normmannode(k+1) AND NOT(manoutzero)) OR manoutmax;
            END LOOP;
            FOR k IN 1 TO 8 LOOP
              expoutff(k) <= (divexpminus(k) AND NOT(expoutzero)) OR expoutmax;
            END LOOP;
            signoutff <= divsignff(11);
          END IF;
                
        END IF;
        
      END PROCESS;

      divexpminus <= divexpff(11)(10 DOWNTO 1) - ("000000000" & normalize);
      
      -- both '1' when true
      expmax <= divexpminus(8) AND divexpminus(7) AND divexpminus(6) AND divexpminus(5) AND 
                divexpminus(4) AND divexpminus(3) AND divexpminus(2) AND divexpminus(1);
      expzero <= NOT(divexpminus(8) OR divexpminus(7) OR divexpminus(6) OR divexpminus(5) OR 
                     divexpminus(4) OR divexpminus(3) OR divexpminus(2) OR divexpminus(1));      
                     
      -- any special condition turns mantissa zero
      manoutzero <= divsatff(11) OR divzipff(11) OR expmax OR expzero OR 
                    divexpminus(10) OR divexpminus(9);
      manoutmax <= divnanff(11);
      expoutzero <= divzipff(11) OR expzero OR divexpminus(10);
      -- 12/05/09 - make sure ccexpminus = -1 doesnt create infinity
      expoutmax <= (expmax AND NOT(divexpminus(9)) AND NOT(divexpminus(10))) OR 
                   (divexpminus(9) AND NOT(divexpminus(10))) OR divnanff(11);  
      
    END GENERATE;
  
    goed: IF (roundconvert = 1) GENERATE
            
      manoverflow(1) <= normmannode(1);
      gva: FOR k IN 2 TO 24 GENERATE
        manoverflow(k) <= manoverflow(k-1) AND normmannode(k);
      END GENERATE;
  
      poeb: PROCESS (sysclk,reset)
      BEGIN
    
        IF (reset = '1') THEN
          
          FOR k IN 1 TO 24 LOOP
            ccmanff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 10 LOOP
            ccexpff(k) <= '0';
          END LOOP;
          ccsignff <= '0';
          ccsatff <= '0';
          cczipff <= '0';
          ccnanff <= '0';
          ccoverff <= '0';
          FOR k IN 1 TO 23 LOOP
            manoutff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 8 LOOP
            expoutff(k) <= '0';
          END LOOP;
          signoutff <= '0';
        
        ELSIF (rising_edge(sysclk)) THEN
        
          IF (enable = '1') THEN   
           
            ccmanff <= normmannode(25 DOWNTO 2) + (zerovec(23 DOWNTO 1) & normmannode(1));
            ccexpff(10 DOWNTO 1) <= divexpff(11)(10 DOWNTO 1) - ("000000000" & normalize);
            ccsignff <= divsignff(11);
            ccsatff <= divsatff(11);
            cczipff <= divzipff(11);
            ccnanff <= divnanff(11);
            ccoverff <= manoverflow(23);
          
            FOR k IN 1 TO 23 LOOP
              manoutff(k) <= (ccmanff(k) AND NOT(manoutzero)) OR manoutmax; 
            END LOOP;
            FOR k IN 1 TO 8 LOOP
              expoutff(k) <= (ccexpplus(k) AND NOT(expoutzero)) OR expoutmax;
            END LOOP;
            signoutff <= ccsignff;
      
          END IF;
          
        END IF;
        
      END PROCESS;

      ccexpplus <= ccexpff + ("000000000" & ccoverff);
      
       -- both '1' when true
      expmax <= ccexpplus(8) AND ccexpplus(7) AND ccexpplus(6) AND ccexpplus(5) AND 
                ccexpplus(4) AND ccexpplus(3) AND ccexpplus(2) AND ccexpplus(1);
      expzero <= NOT(ccexpplus(8) OR ccexpplus(7) OR ccexpplus(6) OR ccexpplus(5) OR 
                     ccexpplus(4) OR ccexpplus(3) OR ccexpplus(2) OR ccexpplus(1));      
                     
      -- any special condition turns mantissa zero
      manoutzero <= ccsatff OR cczipff OR expmax OR expzero OR 
                    ccexpplus(10) OR ccexpplus(9);
      manoutmax <= ccnanff;
      expoutzero <= cczipff OR expzero OR ccexpplus(10);
      -- 12/05/09 - make sure ccexpplus = -1 doesnt create infinity
      expoutmax <= (expmax AND NOT(ccexpplus(9)) AND NOT(ccexpplus(10))) OR 
                   (ccexpplus(9) AND NOT(ccexpplus(10))) OR ccnanff;  
    
    END GENERATE;
    
    cc(32) <= signoutff;
    cc(31 DOWNTO 24) <= expoutff;
    cc(23 DOWNTO 1) <= manoutff;
    -- dummy only
    ccsat <= '0';
    cczip <= '0';   
    ccnan <= '0';
      
  END GENERATE;
    
END rtl;

