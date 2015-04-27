
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_SGNPSTN.VHD                           ***
--***                                             ***
--***   Function: Leading 0/1s for a small signed ***
--***             number                          ***
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

ENTITY hcc_sgnpstn IS 
GENERIC (offset : integer := 0;
         width : positive := 5);
PORT (
      signbit : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (4 DOWNTO 1);

		position : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
		);
END hcc_sgnpstn;

ARCHITECTURE rtl OF hcc_sgnpstn IS

  signal pluspos, minuspos : STD_LOGIC_VECTOR (width DOWNTO 1);

BEGIN
   
  paa: PROCESS (inbus)
  BEGIN
    
    CASE inbus IS
      WHEN "0000" => pluspos <= conv_std_logic_vector (0,width);
      WHEN "0001" => pluspos <= conv_std_logic_vector (offset+3,width);
      WHEN "0010" => pluspos <= conv_std_logic_vector (offset+2,width);
      WHEN "0011" => pluspos <= conv_std_logic_vector (offset+2,width);
      WHEN "0100" => pluspos <= conv_std_logic_vector (offset+1,width);
      WHEN "0101" => pluspos <= conv_std_logic_vector (offset+1,width);
      WHEN "0110" => pluspos <= conv_std_logic_vector (offset+1,width);
      WHEN "0111" => pluspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1000" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1001" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1010" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1011" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1100" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1101" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1110" => pluspos <= conv_std_logic_vector (offset,width);
      WHEN "1111" => pluspos <= conv_std_logic_vector (offset,width); 
      WHEN others => pluspos <= conv_std_logic_vector (0,width); 
    END CASE;
 
    CASE inbus IS
      WHEN "0000" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0001" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0010" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0011" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0100" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0101" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0110" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "0111" => minuspos <= conv_std_logic_vector (offset,width);
      WHEN "1000" => minuspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1001" => minuspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1010" => minuspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1011" => minuspos <= conv_std_logic_vector (offset+1,width);
      WHEN "1100" => minuspos <= conv_std_logic_vector (offset+2,width);
      WHEN "1101" => minuspos <= conv_std_logic_vector (offset+2,width);
      WHEN "1110" => minuspos <= conv_std_logic_vector (offset+3,width);
      WHEN "1111" => minuspos <= conv_std_logic_vector (0,width); 
      WHEN others => minuspos <= conv_std_logic_vector (0,width); 
    END CASE;
            
  END PROCESS;
  
  gaa: FOR k IN 1 TO width GENERATE
    position(k) <= (pluspos(k) AND NOT(signbit)) OR (minuspos(k) AND signbit);
  END GENERATE;
  
END rtl;

