
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_FXADD.VHD                              ***
--***                                             ***
--***   Function: Generic Fixed Point Adder       ***
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

ENTITY dp_fxadd IS 
GENERIC (
         width : positive := 64;
         pipes : positive := 1;
         synthesize : integer := 0
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      carryin : IN STD_LOGIC;
      
      cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
     );
END dp_fxadd;

ARCHITECTURE rtl OF dp_fxadd IS

  component dp_addb IS
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
  
  component dp_adds IS
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
   
BEGIN
  
  gaa: IF (synthesize = 0) GENERATE
    addone: dp_addb
    GENERIC MAP (width=>width,pipes=>pipes)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,bb=>bb,carryin=>carryin,
              cc=>cc);
  END GENERATE;
  
  gab: IF (synthesize = 1) GENERATE
    addtwo: dp_adds
    GENERIC MAP (width=>width,pipes=>pipes)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,bb=>bb,carryin=>carryin,
              cc=>cc);
  END GENERATE;
       
END rtl;

