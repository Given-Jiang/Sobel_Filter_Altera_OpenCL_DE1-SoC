
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
--***   FP_DEL_ONE.VHD                            ***
--***                                             ***
--***   Function: Single Block Bus Delay          ***
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

ENTITY fp_del_one IS 
GENERIC (width : positive := 64);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      
      cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
     );
END fp_del_one ;

ARCHITECTURE rtl OF fp_del_one  IS

  signal delff : STD_LOGIC_VECTOR (width DOWNTO 1);
            
BEGIN

  pda: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO width LOOP
        delff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        delff(width DOWNTO 1) <= aa;
      END IF;
    
    END IF;
      
  END PROCESS;
    
  cc <= delff(width DOWNTO 1);
    
END rtl;

