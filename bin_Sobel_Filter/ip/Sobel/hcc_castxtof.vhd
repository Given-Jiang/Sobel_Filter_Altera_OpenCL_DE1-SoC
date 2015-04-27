
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--******************************************************************************
--***                                                                        ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER                              ***
--***                                                                        ***
--***   HCC_CASTXTOF.VHD                                                     ***
--***                                                                        ***
--***   Function: Cast Internal Single to IEEE754                            ***
--***             Single                                                     ***
--***                                                                        ***
--***   14/07/07 ML                                                          ***
--***                                                                        ***
--***   (c) 2007 Altera Corporation                                          ***
--***                                                                        ***
--***   Change History                                                       ***
--***                                                                        ***
--***   27/05/09 - fixed zero/infinity/nan mantissa cases, also output 0 if  ***
--***   mantissa is 0                                                        ***
--***   29/06/09 - look at bits 9&10 of expnode to check zero & max          ***
--***                                                                        ***
--***                                                                        ***
--******************************************************************************

--******************************************************************************
--*** Latency: 5 + 2*(swSingleNormSpeed-1)                                   ***
--******************************************************************************

ENTITY hcc_castxtof IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         normspeed : positive := 2 -- 1 or 2 
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC;

	   cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castxtof;

ARCHITECTURE rtl OF hcc_castxtof IS
  
  -- latency = 5 if normspeed = 1
  -- latency = 7 if normspeed = 2 (extra pipe in normusgn3236 and output stage)
  
  type exptopfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  type expbotfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal count : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal absnode, absroundnode, absff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal fracout, fracoutff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal exptopff : exptopfftype;
  signal expbotff : expbotfftype;
  signal roundoverflow : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal roundoverflowff : STD_LOGIC;
  signal satff, zipff : STD_LOGIC_VECTOR (3+normspeed DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (2+2*normspeed DOWNTO 1);
  signal zeronumber : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal zeronumberff : STD_LOGIC_VECTOR (1+normspeed DOWNTO 1);
  signal preexpnode, expnode : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal exponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal mantissanode : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal roundbit : STD_LOGIC;
  signal mantissaroundff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal zeroexpnode, maxexpnode : STD_LOGIC;
  signal zeromantissanode : STD_LOGIC;
  signal zeroexponentnode, maxexponentnode : STD_LOGIC;
  signal zeromantissaff : STD_LOGIC;
  signal zeroexponentff, maxexponentff : STD_LOGIC;
  
  signal ccsgn : STD_LOGIC;
  signal aaexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal ccexp : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal aaman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR (23 DOWNTO 1);

  component hcc_normusgn3236 IS 
  GENERIC (
           mantissa : positive := 32;
           normspeed : positive := 1 -- 1 or 2
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        fracin : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

	     countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1); -- 1 clock earlier than fracout
	     fracout : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1)
	    );
  end component;
    
BEGIN
  
  gza: FOR k IN 1 TO mantissa-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
         
  pclk: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO mantissa+10 LOOP
        aaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO mantissa LOOP
        absff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO mantissa LOOP
        fracoutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3 LOOP
        FOR j IN 1 TO 10 LOOP
          exptopff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      roundoverflowff <= '0';
      FOR k IN 1 TO 3+normspeed LOOP --27/05/09
        satff(k) <= '0';
        zipff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 2+2*normspeed LOOP
        signff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
              
        aaff <= aa;

        absff <= absnode + absroundnode;
    
        fracoutff <= fracout;
        
        exptopff(1)(10 DOWNTO 1) <= aaff(10 DOWNTO 1);
        -- add 4 because of maximum 4 bits wordgrowth in X mantissa
        exptopff(2)(10 DOWNTO 1) <= exptopff(1)(10 DOWNTO 1) + "0000000100";
        exptopff(3)(10 DOWNTO 1) <= exptopff(2)(10 DOWNTO 1) - ("0000" & count);

        roundoverflowff <= roundoverflow(24);
        
        satff(1) <= aasat;
        FOR k IN 2 TO 3+normspeed LOOP
          satff(k) <= satff(k-1);
        END LOOP;
        zipff(1) <= aazip;
        FOR k IN 2 TO 3+normspeed LOOP
          zipff(k) <= zipff(k-1);
        END LOOP;
        
        signff(1) <= aaff(mantissa+10);
        FOR k IN 2 TO 2+2*normspeed LOOP
          signff(k) <= signff(k-1);
        END LOOP;
        
        zeronumberff(1) <= NOT(zeronumber(mantissa));
        FOR k IN 2 TO 1+normspeed LOOP
          zeronumberff(k) <= zeronumberff(k-1);
        END LOOP;
                
      END IF;
            
    END IF;
  
  END PROCESS;
  
  -- if normspeed = 1, latency = 5. if normspeed > 1, latency = 7
  gsa: IF (normspeed = 1) GENERATE
  
    pna: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        exponentff <= "00000000";
        FOR k IN 1 TO 23 LOOP
          mantissaff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN 
          FOR k IN 1 TO 8 LOOP
            exponentff(k) <= (expnode(k) AND NOT(zeroexponentnode)) OR maxexponentnode; -- 27/05/09
          END LOOP;
          FOR k IN 1 TO 23 LOOP
            mantissaff(k) <= mantissanode(k) AND NOT(zeromantissanode);
          END LOOP;
        END IF;
      END IF;
    END PROCESS;
  
    preexpnode <= exptopff(3)(10 DOWNTO 1);
  
  END GENERATE;
         
  -- if normspeed = 1, latency = 5. if normspeed > 1, latency = 7
  gsb: IF (normspeed = 2) GENERATE
  
    pnb: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        expbotff(1)(10 DOWNTO 1) <= "0000000000";
        expbotff(2)(10 DOWNTO 1) <= "0000000000";
        exponentff <= "00000000";
        FOR k IN 1 TO 23 LOOP
          mantissaroundff(k) <= '0';
          mantissaff(k) <= '0';
        END LOOP;
        zeromantissaff <= '0';
        zeroexponentff <= '0';
        maxexponentff <= '0';
          
      ELSIF (rising_edge(sysclk)) THEN
          
        IF (enable = '1') THEN
            
          expbotff(1)(10 DOWNTO 1) <= exptopff(3)(10 DOWNTO 1);
          expbotff(2)(10 DOWNTO 1) <= expnode;
          FOR k IN 1 TO 8 LOOP
            exponentff(k) <= (expbotff(2)(k) AND NOT(zeroexponentff)) OR maxexponentff; 
          END LOOP;
          
          mantissaroundff <= mantissanode;
          FOR k IN 1 TO 23 LOOP
            mantissaff(k) <= mantissaroundff(k) AND NOT(zeromantissaff);
          END LOOP;
          
          zeromantissaff <= zeromantissanode;
          zeroexponentff <= zeroexponentnode;
          maxexponentff <= maxexponentnode;
  
        END IF;
        
      END IF;
      
    END PROCESS;
  
    preexpnode <= expbotff(1)(10 DOWNTO 1);
  
  END GENERATE;        
     
  -- round absolute value any way - need register on input of cntusgn
  gaa: FOR k IN 1 TO mantissa GENERATE
    absnode(k) <= aaff(k+10) XOR aaff(mantissa+10);
  END GENERATE;
  absroundnode <= zerovec(mantissa-1 DOWNTO 1) & aaff(mantissa+10);
  
  zeronumber(1) <= absff(1);
  gzma: FOR k IN 2 TO mantissa GENERATE
    zeronumber(k) <= zeronumber(k-1) OR absff(k);
  END GENERATE;
   
  core: hcc_normusgn3236 
  GENERIC MAP (mantissa=>mantissa,normspeed=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            fracin=>absff(mantissa DOWNTO 1),countout=>count,
            fracout=>fracout);
                
  roundoverflow(1) <= fracout(7);
  gna: FOR k IN 2 TO 24 GENERATE
    roundoverflow(k) <= roundoverflow(k-1) AND fracout(k+6);
  END GENERATE;
   
  expnode <= preexpnode(10 DOWNTO 1) + ("000000000" & roundoverflowff);
  
  -- always round single output (round to nearest even - 27/05/09)
  roundbit <= (fracoutff(mantissa-24) AND fracoutff(mantissa-25)) OR
               (NOT(fracoutff(mantissa-24)) AND fracoutff(mantissa-25) AND 
               (fracoutff(mantissa-26) OR fracoutff(mantissa-27) OR fracoutff(mantissa-28))); 

  -- always round single output  
  mantissanode <= fracoutff(mantissa-2 DOWNTO mantissa-24) + 
                 (zerovec(22 DOWNTO 1) & roundbit);

  -- 29/06/09 - look at all of expnode, not just lower 8 bits to get zero or max
  zeroexpnode <= NOT(expnode(10) OR expnode(9) OR 
                     expnode(8) OR expnode(7) OR 
                     expnode(6) OR expnode(5) OR expnode(4) OR 
                     expnode(3) OR expnode(2) OR expnode(1));
                     
  maxexpnode <= NOT(expnode(10)) AND NOT(expnode(9)) AND 
                expnode(8) AND expnode(7) AND expnode(6) AND expnode(5) AND
                expnode(4) AND expnode(3) AND expnode(2) AND expnode(1);
  
  -- '1' when true
  -- 24/03/09 - zeroexpnode, maxexpnode also zeros mantissa (SRC bug)
  zeromantissanode <= roundoverflowff OR zeroexpnode OR maxexpnode OR
                      expnode(9) OR expnode(10) OR 
                      zipff(3+normspeed) OR satff(3+normspeed) OR
                      zeronumberff(1+normspeed);
  zeroexponentnode <= zeroexpnode OR expnode(10) OR 
                      zipff(3+normspeed) OR zeronumberff(1+normspeed);
  maxexponentnode <= maxexpnode OR (expnode(9) AND NOT(expnode(10))) OR satff(3+normspeed);
  
  --*** OUTPUTS ***
  cc(32) <= signff(2+2*normspeed);
  cc(31 DOWNTO 24) <= exponentff;
  cc(23 DOWNTO 1) <= mantissaff(23 DOWNTO 1);
  
  --*** DEBUG ***
  aaexp <= aa(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  ccsgn <= signff(2+2*normspeed);
  ccexp <= exponentff;
  ccman <= mantissaff(23 DOWNTO 1);
     
END rtl;

