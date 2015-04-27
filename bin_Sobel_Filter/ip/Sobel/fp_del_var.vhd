
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
--***   FP_DEL.VHD                                ***
--***                                             ***
--***   Function: Multiple Clock Bus Delay        ***
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

ENTITY fp_del_var IS 
GENERIC (
         width : positive := 64;
         pipes : positive := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      
      cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
     );
END fp_del_var ;

ARCHITECTURE rtl OF fp_del_var  IS

  type delfftype IS ARRAY (pipes DOWNTO 1) OF STD_LOGIC_VECTOR (width DOWNTO 1);

  signal delff : delfftype;
            
BEGIN

  pda: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO pipes LOOP
        FOR j IN 1 TO width LOOP
          delff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        delff(1)(width DOWNTO 1) <= aa;
        FOR k IN 2 TO pipes LOOP
          delff(k)(width DOWNTO 1) <= delff(k-1)(width DOWNTO 1);
        END LOOP;
      END IF;
    
    END IF;
      
  END PROCESS;
    
  cc <= delff(pipes)(width DOWNTO 1);
    
END rtl;

