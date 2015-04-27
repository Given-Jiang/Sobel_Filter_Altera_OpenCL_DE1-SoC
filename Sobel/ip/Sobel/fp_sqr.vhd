
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
--***   SINGLE PRECISION SQUARE ROOT - TOP LEVEL  ***
--***                                             ***
--***   FP_SQR.VHD                                ***
--***                                             ***
--***   Function: IEEE754 FP Square Root          ***
--***                                             ***
--***   31/01/08 ML                               ***
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
--*** Latency = 28                                ***
--*** Based on FPROOT1.VHD (12/06)                ***
--***************************************************

ENTITY fp_sqr IS 
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
      invalidout : OUT STD_LOGIC
		);
END fp_sqr;

ARCHITECTURE rtl OF fp_sqr IS
  
  constant manwidth : positive := 23;
  constant expwidth : positive := 8;
  
  type expfftype IS ARRAY (manwidth+4 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  
  signal signinff : STD_LOGIC;
  signal maninff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expinff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (manwidth+4 DOWNTO 1);
  signal expnode, expdiv : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal expff : expfftype;
  signal radicand : STD_LOGIC_VECTOR (manwidth+3 DOWNTO 1);
  signal squareroot : STD_LOGIC_VECTOR (manwidth+2 DOWNTO 1);
  signal roundff, manff : STD_LOGIC_VECTOR (manwidth DOWNTO 1); 
  signal roundbit : STD_LOGIC;
  signal preadjust : STD_LOGIC;
  signal zerovec : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal offset : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
    
  -- conditions
  signal nanmanff, nanexpff : STD_LOGIC_VECTOR (manwidth+4 DOWNTO 1);
  signal zeroexpff, zeromanff : STD_LOGIC_VECTOR (manwidth+3 DOWNTO 1); 
  signal expinzero, expinmax : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal maninzero : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expzero, expmax, manzero : STD_LOGIC;
  signal infinitycondition, nancondition : STD_LOGIC;

  component fp_sqrroot IS 
  GENERIC (width : positive := 52);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        rad : IN STD_LOGIC_VECTOR (width+1 DOWNTO 1);

		  root : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
		  );
	end component;
		
BEGIN
    
  gzva: FOR k IN 1 TO manwidth GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  gxoa: FOR k IN 1 TO expwidth-1 GENERATE
    offset(k) <= '1';
  END GENERATE;
  offset(expwidth) <= '0';

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
      FOR k IN 1 TO manwidth+4 LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO manwidth+4 LOOP
        FOR j IN 1 TO expwidth LOOP
          expff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO manwidth LOOP
        roundff(k) <= '0';
        manff(k) <= '0';
      END LOOP;
  
    ELSIF (rising_edge(sysclk)) THEN

      signinff <= signin;
      maninff <= mantissain;
      expinff <= exponentin;
    
      signff(1) <= signinff;
      FOR k IN 2 TO manwidth+4 LOOP
        signff(k) <= signff(k-1);
      END LOOP;
      
      expff(1)(expwidth DOWNTO 1) <= expdiv;
      expff(2)(expwidth DOWNTO 1) <= expff(1)(expwidth DOWNTO 1) + offset;
      FOR k IN 3 TO manwidth+3 LOOP
        expff(k)(expwidth DOWNTO 1) <= expff(k-1)(expwidth DOWNTO 1);
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        expff(manwidth+4)(k) <= (expff(manwidth+3)(k) AND zeroexpff(manwidth+3)) OR nanexpff(manwidth+3);
      END LOOP;
    
      roundff <= squareroot(manwidth+1 DOWNTO 2) + (zerovec(manwidth-1 DOWNTO 1) & roundbit);
    
      FOR k IN 1 TO manwidth LOOP
        manff(k) <= (roundff(k) AND zeromanff(manwidth+3)) OR nanmanff(manwidth+3);
      END LOOP;
  
    END IF;
  
  END PROCESS;

--*******************
--*** CONDITIONS ***
--*******************

  pcc: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
      
      FOR k IN 1 TO manwidth+4 LOOP
        nanmanff(k) <= '0';
        nanexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO manwidth+3 LOOP
        zeroexpff(k) <= '0';
        zeromanff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN
      
      nanmanff(1) <= nancondition; -- level 1
      nanexpff(1) <= nancondition OR infinitycondition; -- also max exp when infinity
      FOR k IN 2 TO manwidth+4 LOOP
        nanmanff(k) <= nanmanff(k-1);
        nanexpff(k) <= nanexpff(k-1);
      END LOOP;

      zeromanff(1) <= expzero AND NOT(infinitycondition); -- level 1
      zeroexpff(1) <= expzero; -- level 1
      FOR k IN 2 TO manwidth+3 LOOP
        zeromanff(k) <= zeromanff(k-1);
        zeroexpff(k) <= zeroexpff(k-1);
      END LOOP;
    
    END IF;
  
  END PROCESS;

--*******************
--*** SQUARE ROOT ***
--*******************

  -- if exponent is odd, double mantissa and adjust exponent
  -- core latency manwidth+2 = 25
  -- top latency = core + 1 (input) + 2 (output) = 28
  sqr: fp_sqrroot
  GENERIC MAP (width=>manwidth+2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            rad=>radicand,
            root=>squareroot);

  radicand(1) <= '0';
  radicand(2) <= maninff(1) AND NOT(preadjust);
  gra: FOR k IN 3 TO manwidth+1 GENERATE
    radicand(k) <= (maninff(k-1) AND NOT(preadjust)) OR (maninff(k-2) AND preadjust);
  END GENERATE; 
  radicand(manwidth+2) <= NOT(preadjust) OR (maninff(manwidth) AND preadjust);
  radicand(manwidth+3) <= preadjust;   

--****************
--*** EXPONENT ***
--****************

  -- subtract 1023, divide result/2, if odd - preadjust
  -- if zero input, zero exponent and mantissa
  expnode <= expinff - offset;

  preadjust <= expnode(1);

  expdiv <= expnode(expwidth) & expnode(expwidth DOWNTO 2);

--*************
--*** ROUND ***
--*************

  -- only need to round up, round to nearest not possible out of root
  roundbit <= squareroot(1);

--*********************
--*** SPECIAL CASES ***
--*********************
-- 1. if negative input, invalid operation, NAN  (unless -0)
-- 2. -0 in -0 out
-- 3. infinity in, invalid operation, infinity out
-- 4. NAN in, invalid operation, NAN

  -- '0' if 0 
  expinzero(1) <= expinff(1);
  gxza: FOR k IN 2 TO expwidth GENERATE
    expinzero(k) <= expinzero(k-1) OR expinff(k);
  END GENERATE;
  expzero <= expinzero(expwidth); -- '0' when zero
                 
  -- '1' if nan or infinity
  expinmax(1) <= expinff(1);
  gxia: FOR k IN 2 TO expwidth GENERATE
    expinmax(k) <= expinmax(k-1) AND expinff(k);
  END GENERATE;
  expmax <= expinmax(expwidth); -- '1' when true
          
  -- '1' if not zero or infinity
  maninzero(1) <= maninff(1);
  gmza: FOR k IN 2 TO manwidth GENERATE
    maninzero(k) <= maninzero(k-1) OR maninff(k);
  END GENERATE;
  manzero <= maninzero(manwidth); 
    
  infinitycondition <= NOT(manzero) AND expmax; 

  nancondition <= (signinff AND expzero) OR (expmax AND manzero);
                
--***************
--*** OUTPUTS ***
--***************

  signout <= signff(manwidth+4);
  exponentout <= expff(manwidth+4)(expwidth DOWNTO 1);   
  mantissaout <= manff;
  -----------------------------------------------
  nanout <= nanmanff(manwidth+4);
  invalidout <= nanmanff(manwidth+4);

END rtl;


