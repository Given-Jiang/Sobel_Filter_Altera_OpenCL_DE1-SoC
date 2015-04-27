
LIBRARY ieee;
LIBRARY lpm;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP2X.VHD                           ***
--***                                             ***
--***   Function: Double precision multiplier     ***
--***             (unsigned mantissa)             ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   28/01/08 - see below                      ***
--***                                             ***
--***                                             ***
--***************************************************

-- 28/01/08 - correct manoverflow for ieee output, effects of mantissa shift
-- for both ieee and mult output, test output widths, also reversed exp and man
-- order in ieee output
-- 31/08/08 - behavioral and synth mults both now return "001X" (> 2) OR "0001X" (<2)
-- change xoutput to 1 bit less right shift (behavioral mult changed) 

ENTITY hcc_mulfp2x IS 
GENERIC (
         ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
         xoutput : integer := 1; -- 1 = double x format (s64/13)
         multoutput : integer := 0; -- 1 = to another double muliplier (s/1u52/13)
         roundconvert : integer := 0; -- global switch - round all ieee<=>x conversion when '1'
         roundnormalize : integer := 0; -- global switch - round all normalizations when '1'
         doublespeed : integer := 1; -- global switch - '0' unpiped adders, '1' piped adders for doubles
         outputpipe : integer := 0; -- if zero, dont put final pipe for some modes
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
      bbsat, bbzip : IN STD_LOGIC;
      
		cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*multoutput DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
		);
END hcc_mulfp2x;

ARCHITECTURE rtl OF hcc_mulfp2x IS

  type ccxexpdelfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type cceexpdelfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
        
  -- multiplier core interface
  signal mulinaaman, mulinbbman : STD_LOGIC_VECTOR(54 DOWNTO 1);
  signal mulinaaexp, mulinbbexp : STD_LOGIC_VECTOR(13 DOWNTO 1);
  signal mulinaasat, mulinaazip : STD_LOGIC;
  signal mulinbbsat, mulinbbzip : STD_LOGIC;
  signal mulinaasign, mulinbbsign : STD_LOGIC;
  signal mulinaasignff, mulinbbsignff : STD_LOGIC;
  signal mulsignff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal ccmannode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccexpnode : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccsatnode, cczipnode : STD_LOGIC;
  
  -- output section (x out)
  signal ccmanshiftnode, signedccxmannode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccxroundnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccxroundff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal ccxexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccxsatff, ccxzipff : STD_LOGIC;
  signal ccxexpdelff : ccxexpdelfftype;
  signal ccxsatdelff, ccxzipdelff : STD_LOGIC_VECTOR (2 DOWNTO 1);

  -- output section (ieeeout)  
  signal shiftroundbit : STD_LOGIC;
  signal cceroundnode : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal cceroundcarry : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal ccemannode : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal ccemanoutff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal cceexpoutff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal ccesignbitff : STD_LOGIC;
  signal cceroundff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal cceexpff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccesatff, ccezipff : STD_LOGIC;
  signal ccesignff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal cceexpdelff : cceexpdelfftype;
  signal ccesatdelff, ccezipdelff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal ccesigndelff : STD_LOGIC_VECTOR (3 DOWNTO 1); 
  signal cceexpbase, cceexpplus : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccesatbase, ccezipbase : STD_LOGIC;
  signal cceexpmax, cceexpzero : STD_LOGIC;
  signal manoutzero, expoutzero, expoutmax : STD_LOGIC;
  signal manoverflow : STD_LOGIC;
     
  -- output section (multout)
  signal shiftmanbit : STD_LOGIC;
  signal manshiftnode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal manshiftff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal ccexpdelff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccsatdelff, cczipdelff : STD_LOGIC;
  signal muloutsignff : STD_LOGIC;
  
  -- debug
  signal aaexp, bbexp : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal ccexp : STD_LOGIC_VECTOR (11 + 2*multoutput + 2*xoutput DOWNTO 1);
  signal aaman, bbman : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR (54+10*xoutput DOWNTO 1);

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
               
  component hcc_mulufp54 
  GENERIC (synthesize : integer := 0);
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
  end component;
		   
BEGIN
 
  gza: FOR k IN 1 TO 64 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  --**************************************************
  --***                                            ***
  --*** Input Section - Normalization, if required *** 
  --***                                            ***
  --**************************************************

  --********************************************************
  --*** NOTE THAT IN ALL CASES SIGN BIT IS PACKED IN MSB ***
  --*** OF UNSIGNED MULTIPLIER                           ***
  --********************************************************
  --*** ieee754 input when multiplier input is from cast ***
  --*** cast now creates different                       ***
  --*** formats for multiplier, divider, and alu         ***
  --*** multiplier format [S][1][mantissa....]           ***
  --********************************************************    
  --********************************************************
  --*** if input from another double multiplier (special ***
  --*** output mode normalizes to 54 bit mantissa and    ***
  --*** 13 bit exponent                                  ***
  --*** multiplier format [S][1][mantissa....]           ***
  --********************************************************
  --********************************************************
  --*** if input from internal format, must be normed    ***
  --*** by normfp2x first, creates [S][1][mantissa...]   ***
  --********************************************************

  mulinaaman <= '0' & aa(66 DOWNTO 14);
  mulinaaexp <= aa(13 DOWNTO 1);
  mulinbbman <= '0' & bb(66 DOWNTO 14);
  mulinbbexp <= bb(13 DOWNTO 1);
  mulinaasat <= aasat;
  mulinaazip <= aazip;
  mulinbbsat <= bbsat;
  mulinbbzip <= bbzip;
  -- signbits packed in MSB of mantissas
  mulinaasign <= aa(67);
  mulinbbsign <= bb(67);
   
  --**************************************************
  --***                                            ***
  --*** Multiplier Section                         *** 
  --***                                            ***
  --**************************************************
  
  mult: hcc_mulufp54
  GENERIC MAP (synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aaman=>mulinaaman,aaexp=>mulinaaexp,aasat=>mulinaasat,aazip=>mulinaazip,
            bbman=>mulinbbman,bbexp=>mulinbbexp,bbsat=>mulinbbsat,bbzip=>mulinbbzip,
            ccman=>ccmannode,ccexp=>ccexpnode,ccsat=>ccsatnode,cczip=>cczipnode);
   
  psd: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      mulinaasignff <= '0';
      mulinbbsignff <= '0';
      FOR k IN 1 TO 5 LOOP
        mulsignff(k) <= '0';
      END LOOP;
       
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        
        mulinaasignff <= mulinaasign;
        mulinbbsignff <= mulinbbsign;
        
        mulsignff(1) <= mulinaasignff XOR mulinbbsignff;
        FOR k IN 2 TO 5 LOOP
          mulsignff(k) <= mulsignff(k-1);
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
  
    -- result will be "001X" (>2) or "0001X" (<2)
    -- Y is SSSSS1 (<2) - therefore right shift 2 bits
    -- 31/08/08 - behavioral mult changed to be same as synth one
    ccmanshiftnode <= "00" & ccmannode(64 DOWNTO 3);
    goxb: FOR k IN 1 TO 64 GENERATE
      signedccxmannode(k) <= ccmanshiftnode(k) XOR mulsignff(5);
    END GENERATE;
    
    goxc: IF (roundconvert = 0 AND outputpipe = 0) GENERATE
      --*** OUTPUTS ***
      cc(77 DOWNTO 14) <= signedccxmannode;
      cc(13 DOWNTO 1) <= ccexpnode;
      ccsat <= ccsatnode;
      cczip <= cczipnode;
    END GENERATE;

    goxd: IF ((roundconvert = 0 AND outputpipe = 1) OR
              (roundconvert = 1 AND doublespeed = 0)) GENERATE
    
      goxe: IF (roundconvert = 0) GENERATE
        ccxroundnode <= signedccxmannode;
      END GENERATE;
    
      goxf: IF (roundconvert = 1) GENERATE
        ccxroundnode <= signedccxmannode + (zerovec(63 DOWNTO 1) & mulsignff(5));
      END GENERATE;
  
      poxa: PROCESS (sysclk,reset)
      BEGIN
        IF (reset = '1') THEN
            
          FOR k IN 1 TO 64 LOOP
            ccxroundff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 13 LOOP
            ccxexpff(k) <= '0';
          END LOOP;
          ccxsatff <= '0';
          ccxzipff <= '0';
          
        ELSIF (rising_edge(sysclk)) THEN
            
          IF (enable = '1') THEN
            ccxroundff <= ccxroundnode;
            ccxexpff <= ccexpnode;
            ccxsatff <= ccsatnode;
            ccxzipff <= cczipnode;
          END IF;
          
        END IF;
      END PROCESS;
      
      --*** OUTPUTS ***
      cc(77 DOWNTO 14) <= ccxroundff;
      cc(13 DOWNTO 1) <= ccxexpff(13 DOWNTO 1);
      ccsat <= ccxsatff;
      cczip <= ccxzipff;
    
    END GENERATE;

    goxg: IF (roundconvert = 1 AND doublespeed = 1) GENERATE

      poxb: PROCESS (sysclk,reset)
      BEGIN
        IF (reset = '1') THEN
            
          FOR k IN 1 TO 13 LOOP
            ccxexpdelff(1)(k) <= '0';
            ccxexpdelff(2)(k) <= '0';
          END LOOP;
          ccxsatdelff <= "00";
          ccxzipdelff <= "00";
          
        ELSIF (rising_edge(sysclk)) THEN
            
          IF (enable = '1') THEN
            ccxexpdelff(1)(13 DOWNTO 1) <= ccexpnode;
            ccxexpdelff(2)(13 DOWNTO 1) <= ccxexpdelff(1)(13 DOWNTO 1);
            ccxsatdelff(1) <= ccsatnode;
            ccxsatdelff(2) <= ccxsatdelff(1);
            ccxzipdelff(1) <= cczipnode;
            ccxzipdelff(2) <= ccxzipdelff(1);
          END IF;
          
        END IF;
      END PROCESS;
      
      goxh: IF (synthesize = 0) GENERATE
        addone: hcc_addpipeb
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>signedccxmannode,bb=>zerovec(64 DOWNTO 1),carryin=>mulsignff(5),
                  cc=>ccxroundnode);
      END GENERATE;

      goxi: IF (synthesize = 1) GENERATE
        addtwo: hcc_addpipes
        GENERIC MAP (width=>64,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>signedccxmannode,bb=>zerovec(64 DOWNTO 1),carryin=>mulsignff(5),
                  cc=>ccxroundnode);
      END GENERATE;
    
      --*** OUTPUTS ***   
      cc(77 DOWNTO 14) <= ccxroundnode;
      cc(13 DOWNTO 1) <= ccxexpdelff(2)(13 DOWNTO 1);
      ccsat <= ccxsatdelff(2);
      cczip <= ccxzipdelff(2);

    END GENERATE;

  END GENERATE;
  
  --********************************************************
  --*** if output directly out of datapath, convert here ***
  --*** input to multiplier always "01XXX" format, so    ***
  --*** just 1 bit normalization required                ***
  --********************************************************
  goea: IF (ieeeoutput = 1) GENERATE -- ieee754 out of datapath, do conversion
  
    -- output either "0001XXXX.." (<2) or "001XXXX.." (>=2), need to make output
    -- 01XXXX
    shiftroundbit <= NOT(ccmannode(62));
    goeb: FOR k IN 1 TO 55 GENERATE -- format "01"[52..1]R
      cceroundnode(k) <= (ccmannode(k+7) AND shiftroundbit) OR 
                         (ccmannode(k+8) AND NOT(shiftroundbit)); 
    END GENERATE;
     
    goec: IF (roundconvert = 0) GENERATE
    
      ccemannode <= cceroundnode(53 DOWNTO 2);
      
      poia: PROCESS (sysclk,reset)
      BEGIN
    
        IF (reset = '1') THEN
         
          FOR k IN 1 TO 52 LOOP
            ccemanoutff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 11 LOOP
            cceexpoutff(k) <= '0';
          END LOOP;
          ccesignbitff <= '0';
         
        ELSIF (rising_edge(sysclk)) THEN
            
          IF (enable = '1') THEN
            
            FOR k IN 1 TO 52 LOOP
              ccemanoutff(k) <= ccemannode(k) AND NOT(manoutzero); 
            END LOOP;
            FOR k IN 1 TO 11 LOOP
              cceexpoutff(k) <= (cceexpplus(k) OR expoutmax) AND NOT(expoutzero);
            END LOOP;
            ccesignbitff <= mulsignff(5);
        
          END IF;  
          
        END IF;
        
      END PROCESS;
      
      cceexpplus <= ccexpnode + (zerovec(12 DOWNTO 1) & NOT(shiftroundbit)); -- change 28/01/08
      ccesatbase <= ccsatnode;
      ccezipbase <= cczipnode;
      manoverflow <= '0';  -- change 28/01/08
      
      --*** OUTPUTS ***
      cc(64) <= ccesignbitff;
      -- change 28/01/08
      cc(63 DOWNTO 53) <= cceexpoutff;
      cc(52 DOWNTO 1) <= ccemanoutff;
     
    END GENERATE;
  
    goed: IF (roundconvert = 1 AND doublespeed = 0) GENERATE

      cceroundcarry <= zerovec(53 DOWNTO 1) & cceroundnode(1);
              
      poeb: PROCESS (sysclk,reset)
      BEGIN
    
        IF (reset = '1') THEN
          
          FOR k IN 1 TO 54 LOOP
            cceroundff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 13 LOOP
            cceexpff(k) <= '0';
          END LOOP;
          ccesatff <= '0';
          ccezipff <= '0';
          FOR k IN 1 TO 52 LOOP
            ccemanoutff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 11 LOOP
            cceexpoutff(k) <= '0';
          END LOOP;
          ccesignff <= "00";
        
        ELSIF (rising_edge(sysclk)) THEN
        
          IF (enable = '1') THEN   
          
            cceroundff <= cceroundnode(55 DOWNTO 2) + cceroundcarry;
             -- change 28/01/08
            cceexpff(13 DOWNTO 1) <= ccexpnode + (zerovec(12 DOWNTO 1) & NOT(shiftroundbit));
          
            ccesatff <= ccsatnode;
            ccezipff <= cczipnode;

            FOR k IN 1 TO 52 LOOP
              ccemanoutff(k) <= cceroundff(k) AND NOT(manoutzero); 
            END LOOP;
          
            FOR k IN 1 TO 11 LOOP
              cceexpoutff(k) <= (cceexpplus(k) OR expoutmax) AND NOT(expoutzero);
            END LOOP;
          
            ccesignff(1) <= mulsignff(5);
            ccesignff(2) <= ccesignff(1);
      
          END IF;
          
        END IF;
        
      END PROCESS;
      
      manoverflow <= cceroundff(54);
      
      cceexpbase <= cceexpff(13 DOWNTO 1);
      ccesatbase <= ccesatff;
      ccezipbase <= ccezipff;         
      cceexpplus <= cceexpbase + ("000000000000" & cceroundff(54)); 
        
      --*** OUTPUTS ***
      cc(64) <= ccesignff(2);
      -- change 28/01/08
      cc(63 DOWNTO 53) <= cceexpoutff;
      cc(52 DOWNTO 1) <= ccemanoutff;
        
    END GENERATE;
  
    goef: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
      
      cceroundcarry <= zerovec(53 DOWNTO 1) & cceroundnode(1);
      
      goeg: IF (synthesize = 0) GENERATE
        addone: hcc_addpipeb
        GENERIC MAP (width=>54,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>cceroundnode(55 DOWNTO 2),bb=>zerovec(54 DOWNTO 1),
                  carryin=>cceroundnode(1),
                  cc=>cceroundnode);
      END GENERATE;

      goeh: IF (synthesize = 1) GENERATE
        addtwo: hcc_addpipes
        GENERIC MAP (width=>54,pipes=>2)
        PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                  aa=>cceroundnode(55 DOWNTO 2),bb=>zerovec(54 DOWNTO 1),
                  carryin=>cceroundnode(1),
                  cc=>cceroundnode);
      END GENERATE;
           
      poea: PROCESS (sysclk,reset)
      BEGIN
    
        IF (reset = '1') THEN
          
          FOR k IN 1 TO 13 LOOP
            cceexpdelff(1)(k) <= '0';
            cceexpdelff(2)(k) <= '0';
          END LOOP;
          ccesatdelff <= "00";
          ccezipdelff <= "00";
          FOR k IN 1 TO 52 LOOP
            ccemanoutff(k) <= '0';
          END LOOP;
          FOR k IN 1 TO 11 LOOP
            cceexpoutff(k) <= '0';
          END LOOP;
          ccesigndelff <= "000";
        
        ELSIF (rising_edge(sysclk)) THEN
        
          IF (enable = '1') THEN   
             -- change 28/01/08
            cceexpdelff(1)(13 DOWNTO 1) <= ccexpnode + (zerovec(12 DOWNTO 1) & NOT(shiftroundbit));
            cceexpdelff(2)(13 DOWNTO 1) <= cceexpdelff(1)(13 DOWNTO 1);
          
            ccesatdelff(1) <= ccsatnode;
            ccesatdelff(2) <= ccesatdelff(1);
            ccezipdelff(1) <= cczipnode;
            ccezipdelff(2) <= ccezipdelff(1);

            FOR k IN 1 TO 52 LOOP
              ccemanoutff(k) <= cceroundnode(k) AND NOT(manoutzero); 
            END LOOP;
          
            FOR k IN 1 TO 11 LOOP
              cceexpoutff(k) <= (cceexpplus(k) OR expoutmax) AND NOT(expoutzero);
            END LOOP;
          
            ccesigndelff(1) <= mulsignff(5);
            ccesigndelff(2) <= ccesigndelff(1);
            ccesigndelff(3) <= ccesigndelff(2);
      
          END IF;
          
        END IF;
        
      END PROCESS;
    
      manoverflow <= cceroundnode(54);
       
      cceexpbase <= cceexpdelff(2)(13 DOWNTO 1);
      ccesatbase <= ccesatdelff(2);
      ccezipbase <= ccezipdelff(2);      
      cceexpplus <= cceexpbase + ("000000000000" & cceroundnode(54)); 
    
      --*** OUTPUTS ***
      cc(64) <= ccesigndelff(3);
      -- change 28/01/08
      cc(63 DOWNTO 53) <= cceexpoutff;
      cc(52 DOWNTO 1) <= ccemanoutff;
        
    END GENERATE;

    cceexpmax <= cceexpplus(11) AND cceexpplus(10) AND cceexpplus(9) AND cceexpplus(8) AND 
                 cceexpplus(7)  AND cceexpplus(6)  AND cceexpplus(5) AND cceexpplus(4) AND 
                 cceexpplus(3)  AND cceexpplus(2)  AND cceexpplus(1);      
    cceexpzero <= NOT(cceexpplus(11) OR cceexpplus(10) OR cceexpplus(9) OR cceexpplus(8) OR 
                      cceexpplus(7)  OR cceexpplus(6)  OR cceexpplus(5) OR cceexpplus(4) OR 
                      cceexpplus(3)  OR cceexpplus(2)  OR cceexpplus(1));
                     
    -- any special condition turns mantissa zero
    manoutzero <= ccesatbase OR ccezipbase OR 
                  cceexpmax OR cceexpzero OR 
                  cceexpplus(13) OR cceexpplus(12) OR
                  manoverflow;
    expoutzero <= ccezipbase OR cceexpzero OR cceexpplus(13);
    expoutmax <= cceexpmax OR cceexpplus(12);
    
    -- dummy only
    ccsat <= '0';
    cczip <= '0';   
  
  END GENERATE;
  
  --********************************************************
  --*** if output directly into DP mult, convert here    ***
  --*** input to multiplier always "01XXX" format, so    ***
  --*** just 1 bit normalization required, no round      ***
  --********************************************************
  goma: IF (multoutput = 1) GENERATE -- to another multiplier

    -- output either "0001XXXX.." (<2) or "001XXXX.." (>=2), need to make output
    -- 01XXXX
    shiftmanbit <= NOT(ccmannode(62));
    gomb: FOR k IN 1 TO 54 GENERATE -- format "01"[52..1]
      manshiftnode(k) <= (ccmannode(k+8) AND shiftmanbit) OR 
                         (ccmannode(k+9) AND NOT(shiftmanbit)); 
    END GENERATE;
      
    poma: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
          
        FOR k IN 1 TO 54 LOOP
          manshiftff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 13 LOOP
          ccexpdelff(k) <= '0';
        END LOOP;
        ccsatdelff <= '0';
        cczipdelff <= '0';
        muloutsignff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
        
        IF (enable = '1') THEN   
           
          manshiftff <= manshiftnode;
           -- change 28/01/08
          ccexpdelff(13 DOWNTO 1) <= ccexpnode + (zerovec(12 DOWNTO 1) & NOT(shiftmanbit));
          
          ccsatdelff <= ccsatnode;
          cczipdelff <= cczipnode;
          
          muloutsignff <= mulsignff(5);
      
        END IF;
          
      END IF;
        
    END PROCESS;
                     
    cc(67) <= muloutsignff;
    cc(66 DOWNTO 14) <= manshiftff(53 DOWNTO 1);
    cc(13 DOWNTO 1) <= ccexpdelff(13 DOWNTO 1);
    ccsat <= ccsatdelff;
    cczip <= cczipdelff;

  END GENERATE;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(13 DOWNTO 1);
  bbexp <= bb(13 DOWNTO 1);
  aaman <= aa(67 DOWNTO 14);
  bbman <= bb(67 DOWNTO 14);
  
  gdba: IF (xoutput = 1) GENERATE
     gdbb: IF (roundconvert = 0 AND outputpipe = 0) GENERATE
       ccman <= signedccxmannode;
       ccexp <= ccexpnode;
     END GENERATE; 
     gdbc: IF ((roundconvert = 0 AND outputpipe = 1) OR
              (roundconvert = 1 AND doublespeed = 0)) GENERATE
       ccman <= ccxroundff;
       ccexp <= ccxexpff(13 DOWNTO 1);
     END GENERATE;
     gdbd: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
       ccman <= ccxroundnode;
       ccexp <= ccxexpdelff(2)(13 DOWNTO 1);
     END GENERATE;
  END GENERATE;
  
   -- change 28/01/08
  gdbe: IF (ieeeoutput = 1) GENERATE
    ccexp <= cceexpoutff;
    ccman <= "01" & ccemanoutff;
  END GENERATE;
   -- change 28/01/08
  gdbf: IF (multoutput = 1) GENERATE
    ccexp <= ccexpdelff(13 DOWNTO 1);
    ccman <= '0' & manshiftff(53 DOWNTO 1);
  END GENERATE;
       
END rtl;

