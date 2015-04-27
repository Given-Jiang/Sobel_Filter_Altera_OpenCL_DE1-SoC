
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_DELBIT.VHD                             ***
--***                                             ***
--***   Function: Generic Bit Delay               ***
--***                                             ***
--***   01/12/08 ML                               ***
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

ENTITY fp_delbit IS 
GENERIC (
         pipes : positive := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC; 
      
      cc : OUT STD_LOGIC
     );
END fp_delbit;

ARCHITECTURE rtl OF fp_delbit IS

  component fp_delbit_one IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC; 
      
        cc : OUT STD_LOGIC
       );
   end component;
   
  component fp_delbit_var IS 
  GENERIC (
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC; 
      
        cc : OUT STD_LOGIC
       );
   end component;
 
            
BEGIN

  genone: IF (pipes = 1) GENERATE
  
    delone: fp_delbit_one
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,cc=>cc);
              
  END GENERATE;
            
  genvar: IF (pipes > 1) GENERATE
  
    delvar: fp_delbit_var
    GENERIC MAP (pipes=>pipes)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,cc=>cc);
              
  END GENERATE;            
            
END rtl;

