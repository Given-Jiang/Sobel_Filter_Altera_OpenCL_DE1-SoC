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

-- for 36 bit mantissa for trig library

--***************************************************
--*** Notes: Latency = 17                         ***
--***************************************************

ENTITY fp_invsqr_trig1 IS 
GENERIC (synthesize : integer := 1); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      exponentin: IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		);
END fp_invsqr_trig1;

ARCHITECTURE rtl OF fp_invsqr_trig1 IS
  
  constant manwidth : positive := 36;
  constant expwidth : positive := 8;
  
  constant coredepth : positive := 17;
  
  type expfftype IS ARRAY (coredepth DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth DOWNTO 1);

  signal expff : expfftype;
  signal radicand : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal oddexponent : STD_LOGIC;
  signal invroot : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal zerovec : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal offset : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
   
  component fp_invsqr_core IS 
  GENERIC (synthesize : integer := 1); -- 0/1 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        radicand : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        odd : IN STD_LOGIC;

		  invroot : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
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

      FOR k IN 1 TO coredepth LOOP
        FOR j IN 1 TO expwidth LOOP
          expff(k)(j) <= '0';
        END LOOP;
      END LOOP;
  
    ELSIF (rising_edge(sysclk)) THEN
  
      expff(1)(expwidth DOWNTO 1) <= exponentin;
      expff(2)(expwidth DOWNTO 1) <= expff(1)(expwidth DOWNTO 1) - offset;
      expff(3)(expwidth DOWNTO 1) <= expff(2)(expwidth) & expff(2)(expwidth DOWNTO 2);
      expff(4)(expwidth DOWNTO 1) <= offset - expff(3)(expwidth DOWNTO 1);
      expff(5)(expwidth DOWNTO 1) <= expff(4)(expwidth DOWNTO 1) - 1;
      FOR k IN 6 TO coredepth LOOP
        expff(k)(expwidth DOWNTO 1) <= expff(k-1)(expwidth DOWNTO 1);
      END LOOP;
  
    END IF;
  
  END PROCESS;

--*******************
--*** SQUARE ROOT ***
--*******************

  radicand <= mantissain; -- already with leading '1'
  -- sub 127, so 127 (odd) = 2^0 => even
  oddexponent <= NOT(exponentin(1));

  -- does not require rounding, output of core rounded already, LSB always 0
  isqr: fp_invsqr_core
  GENERIC MAP (synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            radicand=>radicand,odd=>oddexponent,
            invroot=>invroot);
       
--***************
--*** OUTPUTS ***
--***************

  exponentout <= expff(coredepth)(expwidth DOWNTO 1);   
  mantissaout <= invroot;  

END rtl;

