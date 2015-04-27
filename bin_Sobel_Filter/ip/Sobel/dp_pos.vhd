
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION MULTIPLIER - CORE LEVEL  ***
--***                                             ***
--***   DP_POS.VHD                                ***
--***                                             ***
--***   Function: Local Count Leading Zeroes      ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY dp_pos IS
GENERIC (start : integer := 10);
PORT (
      ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
      
      position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)   
     );
END dp_pos;

ARCHITECTURE rtl of dp_pos IS
  
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
    
END rtl;

