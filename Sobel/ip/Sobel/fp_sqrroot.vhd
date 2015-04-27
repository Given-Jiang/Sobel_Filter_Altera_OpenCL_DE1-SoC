
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

--********************************************************************
--***                                                              ***
--***  FP_SQRROOT.VHD                                              ***
--***                                                              ***
--***  Fixed Point Square Root Core - Restoring                    ***
--***                                                              ***
--***  21/12/06  ML                                                ***
--***                                                              ***
--***  Copyright Altera 2006                                       ***
--***                                                              ***
--***                                                              ***
--********************************************************************

ENTITY fp_sqrroot IS 
GENERIC (width : positive := 52);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      rad : IN STD_LOGIC_VECTOR (width+1 DOWNTO 1);

		root : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
		);
END fp_sqrroot;

ARCHITECTURE rtl OF fp_sqrroot IS
  
  type nodetype IS ARRAY (width DOWNTO 1) OF STD_LOGIC_VECTOR (width+2 DOWNTO 1);
  type qfftype IS ARRAY (width-1 DOWNTO 1) OF STD_LOGIC_VECTOR (width-1 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal onevec : STD_LOGIC_VECTOR (width+1 DOWNTO 1);
  signal subnode, slevel, qlevel, radff : nodetype;
  signal qff : qfftype;
    
BEGIN

gza: FOR k IN 1 TO width GENERATE
  zerovec(k) <= '0';
END GENERATE;
  
onevec <= "01" & zerovec(width-1 DOWNTO 1);

-- 1 <= input range < 4, therefore 1 <= root < 2
-- input may be shifted left by 1, therefore first subtract "001" not "01" 
slevel(1)(width+2 DOWNTO 1) <= '0' & rad;
qlevel(1)(width+2 DOWNTO 1) <= "001" & zerovec(width-1  DOWNTO 1);
subnode(1)(width+2 DOWNTO width) <= slevel(1)(width+2 DOWNTO width) - qlevel(1)(width+2 DOWNTO width);
subnode(1)(width-1 DOWNTO 1) <= slevel(1)(width-1  DOWNTO 1);

slevel(2)(width+2 DOWNTO 1) <= radff(1)(width+1 DOWNTO 1) & '0';
qlevel(2)(width+2 DOWNTO 1) <= "0101" & zerovec(width-2 DOWNTO 1); 
subnode(2)(width+2 DOWNTO width-1) <= slevel(2)(width+2 DOWNTO width-1) - qlevel(2)(width+2 DOWNTO width-1);
subnode(2)(width-2 DOWNTO 1) <= slevel(2)(width-2 DOWNTO 1);

gla: FOR k IN 3 TO width GENERATE
  glb: FOR j IN 1 TO k-2 GENERATE
    qlevel(k)(width+1-j) <= qff(width-j)(k-1-j);
  END GENERATE;
END GENERATE;

gsa: FOR k IN 3 TO width-1 GENERATE
  slevel(k)(width+2 DOWNTO 1) <= radff(k-1)(width+1 DOWNTO 1) & '0';
  qlevel(k)(width+2 DOWNTO width+1) <= "01";
  qlevel(k)(width+2-k DOWNTO 1) <= "01" & zerovec(width-k DOWNTO 1);
  subnode(k)(width+2 DOWNTO width+1-k) <= slevel(k)(width+2 DOWNTO width+1-k) - 
                                          qlevel(k)(width+2 DOWNTO width+1-k);
  subnode(k)(width-k DOWNTO 1) <= slevel(k)(width-k DOWNTO 1);
END GENERATE;

slevel(width)(width+2 DOWNTO 1) <= radff(width-1)(width+1 DOWNTO 1) & '0';
qlevel(width)(width+2 DOWNTO width+1) <= "01";
qlevel(width)(2 DOWNTO 1) <= "01";
subnode(width)(width+2 DOWNTO 1) <= slevel(width)(width+2 DOWNTO 1) - qlevel(width)(width+2 DOWNTO 1);
  
pma: PROCESS (sysclk,reset)
BEGIN

  IF (reset = '1') THEN
      
    FOR k IN 1 TO width LOOP
      FOR j IN 1 TO width+2 LOOP
        radff(k)(j) <= '0';
      END LOOP;
    END LOOP;
    FOR k IN 1 TO width-1 LOOP
      FOR j IN 1 TO width-1 LOOP
        qff(k)(j) <= '0';
      END LOOP;
    END LOOP;
      
  ELSIF (rising_edge(sysclk)) THEN
     
    IF (enable = '1') THEN
        
      radff(1)(width+2 DOWNTO 1) <= subnode(1)(width+2 DOWNTO 1); 
      FOR k IN 2 TO width LOOP
        FOR j IN 1 TO width+2 LOOP
          radff(k)(j) <= (slevel(k)(j) AND subnode(k)(width+2)) OR 
                         (subnode(k)(j) AND NOT(subnode(k)(width+2))); 
        END LOOP;
      END LOOP;
    
      FOR k IN 1 TO width-1 LOOP
        qff(width-k)(1) <= NOT(subnode(k+1)(width+2));
        FOR j IN 2 TO width-1 LOOP
          qff(k)(j) <= qff(k)(j-1);
        END LOOP;
      END LOOP;
    
    END IF;
 
  END IF;

END PROCESS;

fro: FOR k IN 1 TO width-1 GENERATE
  root(k) <= qff(k)(k);
END GENERATE;
root(width) <= '1';

END rtl;

