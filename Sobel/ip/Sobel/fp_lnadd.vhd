
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
--***   FP_LNADD.VHD                              ***
--***                                             ***
--***   Function: Single Precision Addition of    ***
--***   LN elements                               ***
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

--***************************************************
--*** Notes:                                      ***
--*** Latency = 4                                 ***
--***************************************************

ENTITY fp_lnadd IS 
GENERIC (
         speed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aaman : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      aaexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      bbman : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      bbexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);

	   ccman : OUT STD_LOGIC_VECTOR (32 DOWNTO 1);
	   ccexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1)
	 );
END fp_lnadd;

ARCHITECTURE rtl OF fp_lnadd IS
  
  type expbasefftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (8 DOWNTO 1);
  
  signal aamanff, bbmanff : STD_LOGIC_VECTOR (32 DOWNTO 1); 
  signal aaexpff, bbexpff : STD_LOGIC_VECTOR (8 DOWNTO 1);  
  signal manleftff, manrightff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal aluleftff, alurightff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal expbaseff : expbasefftype;
  signal shiftff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal subexpone, subexptwo : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal switch : STD_LOGIC;
  signal shiftleftnode, shiftrightnode : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal aluff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  
  component fp_rsft32x5 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);
        outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
      );
  end component;
     
BEGIN
     
  paa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
       
      FOR k IN 1 TO 32 LOOP 
        aamanff(k) <= '0';
        bbmanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP 
        aaexpff(k) <= '0';
        bbexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 32 LOOP
        manleftff(k) <= '0';
        manrightff(k) <= '0';
        aluleftff(k) <= '0';
        alurightff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        FOR j IN 1 TO 3 LOOP
          expbaseff(j)(k) <= '0';
        END LOOP;
      END LOOP;
      shiftff <= "00000";
        
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        --*** LEVEL 1 ***
        aamanff <= aaman;
        bbmanff <= bbman;
        aaexpff <= aaexp;
        bbexpff <= bbexp;
        
        --*** LEVEL 2 ***
        FOR k IN 1 TO 32 LOOP
          manleftff(k) <= (aamanff(k) AND NOT(switch)) OR (bbmanff(k) AND switch);
          manrightff(k) <= (bbmanff(k) AND NOT(switch)) OR (aamanff(k) AND switch);
        END LOOP;
          
        FOR k IN 1 TO 8 LOOP
          expbaseff(1)(k) <= (aaexpff(k) AND NOT(switch)) OR (bbexpff(k) AND switch); 
        END LOOP;
        FOR k IN 2 TO 3 LOOP
          expbaseff(k)(8 DOWNTO 1) <= expbaseff(k-1)(8 DOWNTO 1);  -- level 3 to 4
        END LOOP;
        
        FOR k IN 1 TO 5 LOOP
          shiftff(k) <= (subexpone(k) AND NOT(switch)) OR (subexptwo(k) AND switch);
        END LOOP;
        
        --*** LEVEL 3 ***
        aluleftff <= shiftleftnode;
        alurightff <= shiftrightnode;
        
        --*** LEVEL 4 ***
        aluff <= aluleftff + alurightff;
      
      END IF;
        
    END IF;
      
  END PROCESS;
  
  subexpone <= ('0' & aaexpff) - ('0' & bbexpff);
  subexptwo <= ('0' & bbexpff) - ('0' & aaexpff);

  switch <= subexpone(9);

  shifter: fp_rsft32x5
  PORT MAP (inbus=>manrightff,shift=>shiftff,
            outbus=>shiftrightnode);
              
  shiftleftnode <= manleftff;

  --*** OUTPUTS ***
  ccman <= aluff;
  ccexp <= expbaseff(3)(8 DOWNTO 1);

END rtl;

