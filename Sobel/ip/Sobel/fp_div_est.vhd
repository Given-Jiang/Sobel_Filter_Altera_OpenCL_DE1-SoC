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
--***   FP_DIV_EST.VHD                            ***
--***                                             ***
--***   Function: Estimates 18 Bit Inverse        ***
--***                                             ***
--***   Used by both single and double dividers   ***
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
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** 1. Inverse of 18 bit header                 ***
--*** (not including leading '1')                 ***
--*** 2. Uses 20 bit precision tables - 18 bits   ***
--*** drops a bit occasionally                    ***
--***************************************************

ENTITY fp_div_est IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      divisor : IN STD_LOGIC_VECTOR (19 DOWNTO 1);

		invdivisor : OUT STD_LOGIC_VECTOR (18 DOWNTO 1)
		);
END fp_div_est;

ARCHITECTURE rtl OF fp_div_est IS

  type twodelfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (9 DOWNTO 1);
  type ziplutdelfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (20 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (17 DOWNTO 1);
  signal one, two : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal oneaddff, zipaddff : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal onelut, onelutff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal ziplut, ziplutff : STD_LOGIC_VECTOR (20 DOWNTO 1);
  signal onetwo : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal twodelff : twodelfftype;
  signal ziplutdelff : ziplutdelfftype;
  signal invdivisorff : STD_LOGIC_VECTOR (20 DOWNTO 1);
         
  component fp_div_lut1 IS
  PORT (
        add : IN STD_LOGIC_VECTOR (9 DOWNTO 1);
		  data : OUT STD_LOGIC_VECTOR (11 DOWNTO 1)
       );
  end component;
    
  component fp_div_lut0 IS
  PORT (
        add : IN STD_LOGIC_VECTOR (9 DOWNTO 1);
		  data : OUT STD_LOGIC_VECTOR (20 DOWNTO 1)
       );
  end component;
  
  component fp_fxmul  
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
    
BEGIN
  
  gza: FOR k IN 1 TO 17 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  one <= divisor(18 DOWNTO 10);
  two <= divisor(9 DOWNTO 1);
  
  -- these register seperate to make the LUTs into memories
  pma: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 9 LOOP
        oneaddff(k) <= '0';
        zipaddff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        onelutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 20 LOOP
        ziplutff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        oneaddff <= one;
        zipaddff <= one;
        onelutff <= onelut;
        ziplutff <= ziplut;
      END IF;
    
    END IF;
      
  END PROCESS;
    
  upper: fp_div_lut1 PORT MAP (add=>oneaddff,data=>onelut);
  
  lower: fp_div_lut0 PORT MAP (add=>zipaddff,data=>ziplut);
  
  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 2 LOOP
        FOR j IN 1 TO 9 LOOP
          twodelff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO 2 LOOP
        FOR j IN 1 TO 9 LOOP
          ziplutdelff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO 20 LOOP
        invdivisorff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
          
        twodelff(1)(9 DOWNTO 1) <= two;
        twodelff(2)(9 DOWNTO 1) <= twodelff(1)(9 DOWNTO 1);
        
        ziplutdelff(1)(20 DOWNTO 1) <= ziplutff;
        ziplutdelff(2)(20 DOWNTO 1) <= ziplutdelff(1)(20 DOWNTO 1);
        
        invdivisorff <= ziplutdelff(2)(20 DOWNTO 1) - 
                       (zerovec(9 DOWNTO 1) & onetwo);
        
      END IF;
    
    END IF;
      
  END PROCESS;
 
  mulcore: fp_fxmul
  GENERIC MAP (widthaa=>11,widthbb=>9,widthcc=>11,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>onelutff,databb=>twodelff(2)(9 DOWNTO 1),
            result=>onetwo);
  
  invdivisor <= invdivisorff(20 DOWNTO 3);
    
END rtl;

