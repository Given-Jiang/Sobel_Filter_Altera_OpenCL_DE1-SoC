
-- (C) 1992-2014 Altera Corporation. All rights reserved.                         
-- Your use of Altera Corporation's design tools, logic functions and other       
-- software and tools, and its AMPP partner logic functions, and any output       
-- files any of the foregoing (including device programming or simulation         
-- files), and any associated documentation or information are expressly subject  
-- to the terms and conditions of the Altera Program License Subscription         
-- Agreement, Altera MegaCore Function License Agreement, or other applicable     
-- license agreement, including, without limitation, that your use is for the     
-- sole purpose of programming logic devices manufactured by Altera and sold by   
-- Altera or its authorized distributors.  Please refer to the applicable         
-- agreement for further details.                                                 
    



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   SINGLE PRECISION EXPONENT(e) - TOP LEVEL  ***
--***                                             ***
--***   FP_EXP.VHD                                ***
--***                                             ***
--***   Function: IEEE754 SP EXP()                ***
--***                                             ***
--***   05/02/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** Latency = 16                                ***
--***************************************************

ENTITY fp_exp IS 
GENERIC (synthesize : integer := 1);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

		signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      overflowout : OUT STD_LOGIC;
      underflowout : OUT STD_LOGIC
		);
END fp_exp;

ARCHITECTURE rtl OF fp_exp IS
  
  constant expwidth : positive := 8;
  constant manwidth : positive := 23;
  
  constant coredepth : positive := 14;

  signal signinff : STD_LOGIC;
  signal maninff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expinff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (coredepth-1 DOWNTO 1);    
  signal mantissanode : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal exponentnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal rangeerror : STD_LOGIC;
      
  -- conditions
  signal zeroman : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal zeroexp : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal maxexp : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal zeromaninff : STD_LOGIC;
  signal maxexpinff : STD_LOGIC;
  signal naninff : STD_LOGIC;
  signal nanff : STD_LOGIC_VECTOR (coredepth-3 DOWNTO 1);
      
  component fp_exp_core
  GENERIC (synthesize : integer := 1);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aasgn : IN STD_LOGIC;
        aaman : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
        aaexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);

        ccman : OUT STD_LOGIC_VECTOR (24 DOWNTO 1);
        ccexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        rangeerror : OUT STD_LOGIC
       );
  end component;
       	
  component fp_exprnd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaexp : IN STD_LOGIC_VECTOR (24 DOWNTO 1);
        nanin : IN STD_LOGIC;
        rangeerror : IN STD_LOGIC;

        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
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

  expcore: fp_exp_core
  GENERIC MAP (synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aasgn=>signin,aaman=>mantissain,aaexp=>exponentin,
            ccman=>mantissanode,ccexp=>exponentnode,
            rangeerror=>rangeerror);
  
--************************
--*** ROUND AND OUTPUT ***
--************************

  rndout: fp_exprnd
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            signin=>signff(coredepth-1),
            exponentexp=>exponentnode,
            mantissaexp=>mantissanode,
            nanin=>nanff(coredepth-3),
            rangeerror=>rangeerror,

            exponentout=>exponentout,mantissaout=>mantissaout,
            nanout=>nanout,overflowout=>overflowout,underflowout=>underflowout);
              
  signout <= '0';
  
END rtl;

