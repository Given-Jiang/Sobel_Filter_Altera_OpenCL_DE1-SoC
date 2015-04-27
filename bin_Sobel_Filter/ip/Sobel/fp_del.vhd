
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
--***   Function: Generic Bus Delay               ***
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

ENTITY fp_del IS 
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
END fp_del;

ARCHITECTURE rtl OF fp_del IS

  component fp_del_one IS 
  GENERIC (width : positive := 64);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
   end component;
   
  component fp_del_var IS 
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
   end component;
 
            
BEGIN

  genone: IF (pipes = 1) GENERATE
  
    delone: fp_del_one
    GENERIC MAP (width=>width)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,cc=>cc);
              
  END GENERATE;
            
  genvar: IF (pipes > 1) GENERATE
  
    delvar: fp_del_var
    GENERIC MAP (width=>width,pipes=>pipes)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,cc=>cc);
              
  END GENERATE;            
            
END rtl;

