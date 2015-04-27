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
--***   FP_POS52.VHD                              ***
--***                                             ***
--***   Function: 6 Bit Count Leading Zeros       ***
--***   Component                                 ***
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

ENTITY fp_pos52 IS
GENERIC (start : integer := 10);
PORT (
      ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
      
      position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)   
     );
END fp_pos52;

ARCHITECTURE sss of fp_pos52 IS
  
BEGIN

ptab: PROCESS (ingroup)
BEGIN

  CASE ingroup IS
      
      WHEN "000000" => position <= conv_std_logic_vector(0,6);
          
      WHEN "000001" => position <= conv_std_logic_vector(start+5,6);
          
      WHEN "000010" => position <= conv_std_logic_vector(start+4,6);
      WHEN "000011" => position <= conv_std_logic_vector(start+4,6); 
          
      WHEN "000100" => position <= conv_std_logic_vector(start+3,6);
      WHEN "000101" => position <= conv_std_logic_vector(start+3,6);
      WHEN "000110" => position <= conv_std_logic_vector(start+3,6);
      WHEN "000111" => position <= conv_std_logic_vector(start+3,6);
       
      WHEN "001000" => position <= conv_std_logic_vector(start+2,6); 
      WHEN "001001" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001010" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001011" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001100" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001101" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001110" => position <= conv_std_logic_vector(start+2,6);
      WHEN "001111" => position <= conv_std_logic_vector(start+2,6); 
              
      WHEN "010000" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010001" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010010" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010011" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010100" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010101" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010110" => position <= conv_std_logic_vector(start+1,6);
      WHEN "010111" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011000" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011001" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011010" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011011" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011100" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011101" => position <= conv_std_logic_vector(start+1,6);
      WHEN "011110" => position <= conv_std_logic_vector(start+1,6); 
      WHEN "011111" => position <= conv_std_logic_vector(start+1,6);  

      WHEN "100000" => position <= conv_std_logic_vector(start,6);
      WHEN "100001" => position <= conv_std_logic_vector(start,6);
      WHEN "100010" => position <= conv_std_logic_vector(start,6);
      WHEN "100011" => position <= conv_std_logic_vector(start,6);
      WHEN "100100" => position <= conv_std_logic_vector(start,6);
      WHEN "100101" => position <= conv_std_logic_vector(start,6);
      WHEN "100110" => position <= conv_std_logic_vector(start,6);
      WHEN "100111" => position <= conv_std_logic_vector(start,6);
      WHEN "101000" => position <= conv_std_logic_vector(start,6);
      WHEN "101001" => position <= conv_std_logic_vector(start,6);
      WHEN "101010" => position <= conv_std_logic_vector(start,6);
      WHEN "101011" => position <= conv_std_logic_vector(start,6);
      WHEN "101100" => position <= conv_std_logic_vector(start,6);
      WHEN "101101" => position <= conv_std_logic_vector(start,6);
      WHEN "101110" => position <= conv_std_logic_vector(start,6); 
      WHEN "101111" => position <= conv_std_logic_vector(start,6);      
      WHEN "110000" => position <= conv_std_logic_vector(start,6);
      WHEN "110001" => position <= conv_std_logic_vector(start,6);
      WHEN "110010" => position <= conv_std_logic_vector(start,6);
      WHEN "110011" => position <= conv_std_logic_vector(start,6);
      WHEN "110100" => position <= conv_std_logic_vector(start,6);
      WHEN "110101" => position <= conv_std_logic_vector(start,6);
      WHEN "110110" => position <= conv_std_logic_vector(start,6);
      WHEN "110111" => position <= conv_std_logic_vector(start,6);
      WHEN "111000" => position <= conv_std_logic_vector(start,6);
      WHEN "111001" => position <= conv_std_logic_vector(start,6);
      WHEN "111010" => position <= conv_std_logic_vector(start,6);
      WHEN "111011" => position <= conv_std_logic_vector(start,6);
      WHEN "111100" => position <= conv_std_logic_vector(start,6);
      WHEN "111101" => position <= conv_std_logic_vector(start,6);
      WHEN "111110" => position <= conv_std_logic_vector(start,6); 
      WHEN "111111" => position <= conv_std_logic_vector(start,6);
          
      WHEN others => position <= conv_std_logic_vector(0,6);
          
  END CASE;
               
END PROCESS;    
    
END sss;

