
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
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_LNRND.VHD                              ***
--***                                             ***
--***   Function: FP LOG Output Block - Rounded   ***
--***                                             ***
--***   22/02/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_lnrnd IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signln : IN STD_LOGIC;
      exponentln : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaln : IN STD_LOGIC_VECTOR (24 DOWNTO 1);
      nanin : IN STD_LOGIC;
      infinityin : IN STD_LOGIC;
      zeroin : IN STD_LOGIC;
        
		signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      overflowout : OUT STD_LOGIC;
      zeroout : OUT STD_LOGIC
		);
END fp_lnrnd;

ARCHITECTURE rtl OF fp_lnrnd IS

  constant expwidth : positive := 8;
  constant manwidth : positive := 23;
  
  type exponentfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (manwidth-1 DOWNTO 1);
  signal nanff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal zeroff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal infinityff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal manoverflowbitff : STD_LOGIC; 
  signal roundmantissaff, mantissaff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal exponentnode : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  signal exponentoneff : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  signal exponenttwoff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
    
  signal manoverflow : STD_LOGIC_VECTOR (manwidth+1 DOWNTO 1);
  signal setmanzero, setmanmax : STD_LOGIC;
  signal setexpzero, setexpmax : STD_LOGIC;

BEGIN
    
  gzv: FOR k IN 1 TO manwidth-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      nanff <= "00";
      signff <= "00";
      FOR k IN 1 TO manwidth LOOP
        roundmantissaff(k) <= '0';
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth+2 LOOP
        exponentoneff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        exponenttwoff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        nanff(1) <= nanin;
        nanff(2) <= nanff(1);
        infinityff(1) <= infinityin;
        infinityff(2) <= infinityff(1);
        zeroff(1) <= zeroin;
        zeroff(2) <= zeroff(1);
        signff(1) <= signln;
        signff(2) <= signff(1);
       
        manoverflowbitff <= manoverflow(manwidth+1);
        
        roundmantissaff <= mantissaln(manwidth+1 DOWNTO 2) + (zerovec & mantissaln(1));
        
        FOR k IN 1 TO manwidth LOOP
          mantissaff(k) <= (roundmantissaff(k) AND NOT(setmanzero)) OR setmanmax;
        END LOOP;
        
        exponentoneff(expwidth+2 DOWNTO 1) <= "00" & exponentln;                 
        FOR k IN 1 TO expwidth LOOP
          exponenttwoff(k) <= (exponentnode(k) AND NOT(setexpzero)) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
  
  exponentnode <= exponentoneff(expwidth+2 DOWNTO 1) + 
                 (zerovec(expwidth+1 DOWNTO 1) & manoverflowbitff);

--*********************************
--*** PREDICT MANTISSA OVERFLOW ***   
--*********************************
     
  manoverflow(1) <= mantissaln(1);
  gmoa: FOR k IN 2 TO manwidth+1 GENERATE
    manoverflow(k) <= manoverflow(k-1) AND mantissaln(k);
  END GENERATE; 
                                                                 
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************

  -- all set to '1' when true
  
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= NOT(zeroff(1)) OR infinityff(1);
  -- setmantissa to "11..11" when nan
  setmanmax <= nanff(1);
  -- set exponent to 0 when zero condition 
  setexpzero <= NOT(zeroff(1));
  -- set exponent to "11..11" when nan or infinity
  setexpmax <= nanff(1) OR infinityff(1);
                             
--***************
--*** OUTPUTS ***
--***************
  
  signout <= signff(2);
  mantissaout <= mantissaff;
  exponentout <= exponenttwoff; 
  -----------------------------------------------
  nanout <= nanff(2);
  overflowout <= infinityff(2);
  zeroout <= zeroff(2);

END rtl;

