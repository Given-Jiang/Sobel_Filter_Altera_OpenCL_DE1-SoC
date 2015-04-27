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
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_CORDIC_START1.VHD                      ***
--***                                             ***
--***   Function: Table for Initial Value of X    ***
--***   for SIN and COS CORDIC Core               ***
--***                                             ***
--***   22/12/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_cordic_start1 IS
GENERIC (width : positive := 36);
PORT (
      index : IN STD_LOGIC_VECTOR (4 DOWNTO 1);    

      value : OUT STD_LOGIC_VECTOR (width DOWNTO 1)     
     );
END fp_cordic_start1;

ARCHITECTURE rtl of fp_cordic_start1 IS

  signal valuenode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
BEGIN

  pva: PROCESS (index)
  BEGIN
   
    CASE index IS
      WHEN "0000" => valuenode <= x"26DD3B6A1";
      WHEN "0001" => valuenode <= x"36F656C5A";
      WHEN "0010" => valuenode <= x"3D731DFFB";
      WHEN "0011" => valuenode <= x"3F5743B24";
      WHEN "0100" => valuenode <= x"3FD574860";
      WHEN "0101" => valuenode <= x"3FF557499";
      WHEN "0110" => valuenode <= x"3FFD5574A";
      WHEN "0111" => valuenode <= x"3FFF55575";
      WHEN "1000" => valuenode <= x"3FFFD5557";
      WHEN "1001" => valuenode <= x"3FFFF5555";
      WHEN "1010" => valuenode <= x"3FFFFD555";
      WHEN "1011" => valuenode <= x"3FFFFF555";
      WHEN "1101" => valuenode <= x"3FFFFFD55";
      WHEN "1100" => valuenode <= x"3FFFFFF55";
      WHEN "1111" => valuenode <= x"3FFFFFFD5";
      WHEN "1110" => valuenode <= x"3FFFFFFF5";
      WHEN others => valuenode <= x"000000000";
    END CASE;

  END PROCESS;
  
  value <= valuenode (36 DOWNTO 37-width);
  
END rtl;

