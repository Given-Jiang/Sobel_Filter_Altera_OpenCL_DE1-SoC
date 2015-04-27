
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
--***   FP_LNNORM.VHD                             ***
--***                                             ***
--***   Function: Single Precision Normalization  ***
--***   of LN calculation                         ***
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
--***************************************************

ENTITY fp_lnnorm IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inman : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      inexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      
      outman : OUT STD_LOGIC_VECTOR (24 DOWNTO 1);
      outexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      zero : OUT STD_LOGIC
    );
END fp_lnnorm;

ARCHITECTURE rtl OF fp_lnnorm IS

  -- 3 latency
  
  signal shift, shiftff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal zerochk : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal inmanff, inmandelff, outmanff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal outmanbus : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal inexpff, expaddff, expsubff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal zeroff : STD_LOGIC_VECTOR (2 DOWNTO 1);

  component fp_lnclz
  PORT (
        mantissa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        leading : OUT STD_LOGIC_VECTOR (5 DOWNTO 1)    
       );
  end component;
  
  component fp_lsft32x5
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);
        outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
      );
  end component;
             
BEGIN
  
  ppin: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 32 LOOP
        inmanff(k) <= '0';
        inmandelff(k) <= '0';
        outmanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        inexpff(k) <= '0';
        expaddff(k) <= '0';
        expsubff(k) <= '0';
      END LOOP;
      zeroff <= "00";
      shiftff <= "00000";
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        inmanff <= inman;
        inmandelff <= inmanff;
        outmanff <= outmanbus;
        
        inexpff <= inexp;
        -- add 2 - 1 for right shift to avoid overflow 
        expaddff <= inexpff + 1;
        expsubff <= expaddff - ("000" & shiftff);
        
        zeroff(1) <= zerochk(32);
        zeroff(2) <= zeroff(1);
      
        shiftff <= shift;
        
      END IF;
  
    END IF;
    
  END PROCESS;
  
  zerochk(1) <= inmanff(1);
  gza: FOR k IN 2 TO 32 GENERATE
    zerochk(k) <= zerochk(k-1) OR inmanff(k);
  END GENERATE;

  clz: fp_lnclz
  PORT MAP (mantissa=>inmanff,leading=>shift);
  
  sft: fp_lsft32x5
  PORT MAP (inbus=>inmandelff,shift=>shiftff,
            outbus=>outmanbus);

  --*** OUTPUTS ***
  outman <= outmanff(31 DOWNTO 8);
  outexp <= expsubff;
  zero <= zeroff(2);
      
END rtl;

