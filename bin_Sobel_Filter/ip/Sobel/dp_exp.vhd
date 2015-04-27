
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION EXPONENT(e) - TOP LEVEL  ***
--***                                             ***
--***   DP_EXP.VHD                                ***
--***                                             ***
--***   Function: IEEE754 DP EXP()                ***
--***                                             ***
--***   12/08/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** Stratix II                                  ***
--*** Latency = 20 + 2*DoubleSpeed +              ***
--***           Roundconvert*(1+DoubleSpeed)      ***
--*** DoubleSpeed = 0, Roundconvert = 0 : 20      ***
--*** DoubleSpeed = 1, Roundconvert = 0 : 22      ***
--*** DoubleSpeed = 0, Roundconvert = 1 : 21      ***
--*** DoubleSpeed = 1, Roundconvert = 1 : 24      ***
--***                                             ***
--*** Stratix III                                 ***
--*** Latency = 18 +                              ***
--***           Roundconvert*(1+DoubleSpeed)      ***
--*** DoubleSpeed = 0, Roundconvert = 0 : 18      ***
--*** DoubleSpeed = 1, Roundconvert = 0 : 18      ***
--*** DoubleSpeed = 0, Roundconvert = 1 : 19      ***
--*** DoubleSpeed = 1, Roundconvert = 1 : 20      ***
--***                                             ***
--***************************************************

ENTITY dp_exp IS 
GENERIC (
         roundconvert : integer := 0; -- 0 = no round, 1 = round
         doubleaccuracy : integer := 0;  -- 0 = pruned multiplier, 1 = normal multiplier
         doublespeed : integer := 0;   -- 0/1
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
      underflowout : OUT STD_LOGIC
		);
END dp_exp;

ARCHITECTURE rtl OF dp_exp IS
  
  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  constant coredepth : positive := 19 + 2*doublespeed - device*(4 + 2*doublespeed);

  signal signinff : STD_LOGIC;
  signal maninff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expinff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (coredepth-1 DOWNTO 1);    
  signal mantissanode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal exponentnode : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal rangeerror : STD_LOGIC;
      
  -- conditions
  signal zeroman : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal zeroexp : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal maxexp : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal zeromaninff : STD_LOGIC;
  signal maxexpinff : STD_LOGIC;
  signal naninff : STD_LOGIC;
  signal nanff : STD_LOGIC_VECTOR (coredepth-3 DOWNTO 1);
  
  --*** SII Latency = 19 + 2*doublespeed            ***
  --*** SIII/IV Latency = 14                        ***    
  component dp_exp_core
  GENERIC (
           doublespeed : integer := 0;   -- 0/1
           doubleaccuracy : integer := 0;  -- 0 = pruned multiplier, 1 = normal multiplier
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 1      -- 0/1       
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aasgn : IN STD_LOGIC;
        aaman : IN STD_LOGIC_VECTOR (52 DOWNTO 1);
        aaexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);

        ccman : OUT STD_LOGIC_VECTOR (54 DOWNTO 1);
        ccexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        rangeerror : OUT STD_LOGIC
      );
  end component;

  component dp_expnornd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaexp : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        rangeerror : IN STD_LOGIC;

        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        underflowout : OUT STD_LOGIC
		  );
  end component;
       	
  component dp_exprnd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaexp : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        rangeerror : IN STD_LOGIC;

        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        underflowout : OUT STD_LOGIC
		  );
  end component;

  component dp_exprndpipe
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaexp : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        rangeerror : IN STD_LOGIC;

        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        overflowout : OUT STD_LOGIC;
        underflowout : OUT STD_LOGIC
		  );
  end component;
  
BEGIN

  pma: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
  
      signinff <= '0';
      FOR k IN 1 TO manwidth LOOP
        maninff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        expinff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO coredepth-1 LOOP
        signff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
        
        signinff <= signin;
        maninff <= mantissain;
        expinff <= exponentin;

        signff(1) <= signinff;
        FOR k IN 2 TO coredepth-1 LOOP
          signff(k) <= signff(k-1);
        END LOOP;
                                                  
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
      maxexpinff <= '0';  
      naninff <= '0';
      FOR k IN 1 TO coredepth-3 LOOP
        nanff(k) <= '0';
      END LOOP;
     
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
     
        zeromaninff <= zeroman(manwidth);
        maxexpinff <= maxexp(expwidth);
    
        -- zero when man = 0, exp = 0
        -- infinity when man = 0, exp = max
        -- nan when man != 0, exp = max
    
        -- all ffs '1' when condition true
        naninff <= zeromaninff AND maxexpinff;

        -- nan output when nan input
        nanff(1) <= naninff;
        FOR k IN 2 TO coredepth-3 LOOP
          nanff(k) <= nanff(k-1);
        END LOOP;
      
      END IF;
   
    END IF;

  END PROCESS;


--****************
--*** EXP CORE ***
--****************

  expcore: dp_exp_core
  GENERIC MAP (doublespeed=>doublespeed,doubleaccuracy=>doubleaccuracy,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aasgn=>signin,aaman=>mantissain,aaexp=>exponentin,
            ccman=>mantissanode,ccexp=>exponentnode,
            rangeerror=>rangeerror);
           
--************************
--*** ROUND AND OUTPUT ***
--************************

  gra: IF (roundconvert = 0) GENERATE

    norndout: dp_expnornd
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signin=>signff(coredepth-1),
              exponentexp=>exponentnode,
              mantissaexp=>mantissanode(53 DOWNTO 1),
              nanin=>nanff(coredepth-3),
              rangeerror=>rangeerror,

              exponentout=>exponentout,mantissaout=>mantissaout,
              nanout=>nanout,overflowout=>overflowout,underflowout=>underflowout);
            
  END GENERATE;
  
  grb: IF (roundconvert = 1 AND doublespeed = 0) GENERATE

    rndout: dp_exprnd
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signin=>signff(coredepth-1),
              exponentexp=>exponentnode,
              mantissaexp=>mantissanode(53 DOWNTO 1),
              nanin=>nanff(coredepth-3),
              rangeerror=>rangeerror,

              exponentout=>exponentout,mantissaout=>mantissaout,
              nanout=>nanout,overflowout=>overflowout,underflowout=>underflowout);
            
  END GENERATE;

  grc: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
    
    rndoutpipe: dp_exprndpipe
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signin=>signff(coredepth-1),
              exponentexp=>exponentnode,
              mantissaexp=>mantissanode(53 DOWNTO 1),
              nanin=>nanff(coredepth-3),
              rangeerror=>rangeerror,

              exponentout=>exponentout,mantissaout=>mantissaout,
              nanout=>nanout,overflowout=>overflowout,underflowout=>underflowout);
            
  END GENERATE;
  
  signout <= '0';
  
END rtl;

