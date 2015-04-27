
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION LOG(LN) - TOP LEVEL      ***
--***                                             ***
--***   DP_LOG.VHD                                ***
--***                                             ***
--***   Function: IEEE754 DP LN()                 ***
--***                                             ***
--***   11/08/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** Latency = 27 + 7*DoubleSpeed +              ***
--***           RoundConvert*(1+DoubleSpeed)      ***
--*** DoubleSpeed = 0, RoundConvert = 0 : 27      ***
--*** DoubleSpeed = 1, RoundConvert = 0 : 34      ***
--*** DoubleSpeed = 0, RoundConvert = 1 : 28      ***
--*** DoubleSpeed = 1, RoundConvert = 1 : 36      ***
--***                                             ***
--***************************************************

ENTITY dp_log IS 
GENERIC (
         roundconvert : integer := 0; -- 0 = no round, 1 = round
         doublespeed : integer := 0; -- 0/1
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1      -- 0/1    
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

		  signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      overflowout : OUT STD_LOGIC;
      zeroout : OUT STD_LOGIC
		);
END dp_log;

ARCHITECTURE rtl OF dp_log IS
  
  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  constant coredepth : positive := 26 + 7*doublespeed;

  signal signinff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal maninff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expinff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);   
  signal signnode : STD_LOGIC;
  signal mantissanode : STD_LOGIC_VECTOR (53 DOWNTO 1);
  signal exponentnode : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal zeronode : STD_LOGIC;
              
  -- conditions
  signal zeroman : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal zeroexp : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal maxexp : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal zeromaninff : STD_LOGIC;
  signal zeroexpinff : STD_LOGIC;
  signal maxexpinff : STD_LOGIC;
  signal naninff : STD_LOGIC;
  signal nanff : STD_LOGIC_VECTOR (coredepth-3 DOWNTO 1);
  signal infinityinff : STD_LOGIC;
  signal infinityff : STD_LOGIC_VECTOR (coredepth-3 DOWNTO 1);
      
  component dp_ln_core 
  GENERIC (
           doublespeed : integer := 0; -- 0/1
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 1 -- 0/1       
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aaman : IN STD_LOGIC_VECTOR (52 DOWNTO 1); 
        aaexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      
        ccman : OUT STD_LOGIC_VECTOR (53 DOWNTO 1);
        ccexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        ccsgn : OUT STD_LOGIC;
        zeroout : OUT STD_LOGIC
       );
  end component;
  
  component dp_lnnornd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signln : IN STD_LOGIC;
        exponentln : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaln : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        infinityin : IN STD_LOGIC;
        zeroin : IN STD_LOGIC;

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        zeroout : OUT STD_LOGIC
		  );
  end component;
                        
  component dp_lnrnd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signln : IN STD_LOGIC;
        exponentln : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaln : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        infinityin : IN STD_LOGIC;
        zeroin : IN STD_LOGIC;

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        zeroout : OUT STD_LOGIC
		  );
  end component;

  component dp_lnrndpipe
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signln : IN STD_LOGIC;
        exponentln : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaln : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        infinityin : IN STD_LOGIC;
        zeroin : IN STD_LOGIC;

        signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        zeroout : OUT STD_LOGIC
		  );
  end component;
  
BEGIN

  pma: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN

      FOR k IN 1 TO manwidth LOOP
        maninff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        expinff(k) <= '0';
      END LOOP;
      signinff <= "00";
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN

        maninff <= mantissain;
        expinff <= exponentin;
        signinff(1) <= signin;
        signinff(2) <= signinff(1);
                                                  
      END IF;
  
    END IF;
  
  END PROCESS;

--********************
--*** CHECK INPUTS ***
--********************

  zeroman(1) <= maninff(1);
  gca: FOR k IN 2 TO manwidth GENERATE
    zeroman(k) <= zeroman(k-1) OR maninff(k);
  END GENERATE; 
  zeroexp(1) <= expinff(1);
  gcb: FOR k IN 2 TO expwidth GENERATE
    zeroexp(k) <= zeroexp(k-1) OR expinff(k);
  END GENERATE;
  maxexp(1) <= expinff(1);
  gcc: FOR k IN 2 TO expwidth GENERATE
    maxexp(k) <= maxexp(k-1) AND expinff(k);
  END GENERATE;

  pcc: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
      
      zeromaninff <= '0';
      zeroexpinff <= '0';
      maxexpinff <= '0';  
      naninff <= '0';
      FOR k IN 1 TO coredepth-3 LOOP
        nanff(k) <= '0';
      END LOOP;
     
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN

        zeromaninff <= NOT(zeroman(manwidth));
        zeroexpinff <= NOT(zeroexp(expwidth));
        maxexpinff <= maxexp(expwidth);
    
        -- infinity when exp = zero
        -- nan when man != 0, exp = max
    
        -- all ffs '1' when condition true
        naninff <= (zeromaninff AND maxexpinff) OR signinff(2);
        infinityinff <= zeroexpinff OR maxexpinff;

        -- nan output when nan input
        nanff(1) <= naninff;
        FOR k IN 2 TO coredepth-3 LOOP
          nanff(k) <= nanff(k-1);
        END LOOP;
        
        infinityff(1) <= infinityinff;
        FOR k IN 2 TO coredepth-3 LOOP
          infinityff(k) <= infinityff(k-1);
        END LOOP;
      
      END IF;
   
    END IF;

  END PROCESS;


--***************
--*** LN CORE ***
--***************

  lncore: dp_ln_core
  GENERIC MAP (doublespeed=>doublespeed,device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aaman=>mantissain,aaexp=>exponentin,
            ccman=>mantissanode,ccexp=>exponentnode,ccsgn=>signnode,
            zeroout=>zeronode);
  
--************************
--*** ROUND AND OUTPUT ***
--************************

  gra: IF (roundconvert = 0) GENERATE

    norndout: dp_lnnornd
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signln=>signnode,
              exponentln=>exponentnode,
              mantissaln=>mantissanode,
              nanin=>nanff(coredepth-3),
              infinityin=>infinityff(coredepth-3),
              zeroin=>zeronode,

              signout=>signout,
              exponentout=>exponentout,
              mantissaout=>mantissaout,
              nanout=>nanout,overflowout=>overflowout,zeroout=>zeroout);
            
  END GENERATE;
  
  grb: IF (roundconvert = 1 AND doublespeed = 0) GENERATE

    rndout: dp_lnrnd
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signln=>signnode,
              exponentln=>exponentnode,
              mantissaln=>mantissanode,
              nanin=>nanff(coredepth-3),
              infinityin=>infinityff(coredepth-3),
              zeroin=>zeronode,

              signout=>signout,
              exponentout=>exponentout,
              mantissaout=>mantissaout,
              nanout=>nanout,overflowout=>overflowout,zeroout=>zeroout);
            
  END GENERATE;

  grc: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
    
    rndoutpipe: dp_lnrndpipe
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signln=>signnode,
              exponentln=>exponentnode,
              mantissaln=>mantissanode,
              nanin=>nanff(coredepth-3),
              infinityin=>infinityff(coredepth-3),
              zeroin=>zeronode,

              signout=>signout,
              exponentout=>exponentout,
              mantissaout=>mantissaout,
              nanout=>nanout,overflowout=>overflowout,zeroout=>zeroout);
            
  END GENERATE;
  
END rtl;

