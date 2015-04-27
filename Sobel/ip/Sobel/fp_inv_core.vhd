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
--***   SINGLE PRECISION INVERSE - CORE           ***
--***                                             ***
--***   FP_INV_CORE.VHD                           ***
--***                                             ***
--***   Function: 36 bit Inverse                  ***
--***   (multiplicative iterative algorithm)      ***
--***                                             ***
--***   09/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes: Latency = 12                         ***
--***************************************************

ENTITY fp_inv_core IS 
GENERIC (synthesize : integer := 1); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      divisor : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		quotient : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		);
END fp_inv_core;

ARCHITECTURE rtl OF fp_inv_core IS

  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal divisordel : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal invdivisor : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal delinvdivisor : STD_LOGIC_VECTOR (18 DOWNTO 1);
  
  signal scaleden : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal twonode : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal nextguessff : STD_LOGIC_VECTOR (37 DOWNTO 1);
          
  signal quotientnode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  component fp_div_est IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        divisor : IN STD_LOGIC_VECTOR (19 DOWNTO 1);

		  invdivisor : OUT STD_LOGIC_VECTOR (18 DOWNTO 1)
		  );
  end component;
  
  component fp_fxmul IS 
  GENERIC (
           widthaa : positive := 18;
           widthbb : positive := 18;
           widthcc : positive := 36;
           pipes : positive := 1;
           accuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dataaa : IN STD_LOGIC_VECTOR (widthaa DOWNTO 1);
        databb : IN STD_LOGIC_VECTOR (widthbb DOWNTO 1); 
      
        result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
       );
  end component;

  component fp_del
  GENERIC (
           width : positive := 64;
           pipes : positive := 2
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
       
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
   end component;  
       
BEGIN
  
  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  invcore: fp_div_est
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>divisor(36 DOWNTO 18),invdivisor=>invdivisor);
  
  delinone: fp_del
  GENERIC MAP (width=>36,pipes=>5)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>divisor,cc=>divisordel);

  --**********************************
  --*** ITERATION 0 - SCALE INPUTS ***
  --**********************************
  
  -- in level 5, out level 8
  mulscaleone: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>18,widthcc=>36,
               pipes=>3,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>divisordel,databb=>invdivisor,
            result=>scaleden);
              
  --********************
  --*** ITERATION 1  ***
  --********************

  twonode <= '1' & zerovec(36 DOWNTO 1);
  
  pita: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 37 LOOP
        nextguessff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        nextguessff <= twonode - ('0' & scaleden); -- level 9
      END IF;
    
    END IF;
    
  END PROCESS;
  
  deloneone: fp_del
  GENERIC MAP (width=>18,pipes=>4)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>invdivisor,
            cc=>delinvdivisor);
 
  -- in level 9, out level 12
  muloneone: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>18,widthcc=>36,
               pipes=>3,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>nextguessff(36 DOWNTO 1),databb=>delinvdivisor,
            result=>quotientnode);
 
  quotient <= quotientnode(36 DOWNTO 1);
                  
END rtl;

