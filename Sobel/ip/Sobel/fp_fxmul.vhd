
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
--***   FP_FXMUL.VHD                              ***
--***                                             ***
--***   Function: Parameterized Fixed Point       ***
--***   Multiplier                                ***
--***   (behavioral and synthesizable support)    ***
--***                                             ***
--***   09/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   15/01/08 - change 54x18 to >54 outputs    ***
--***   23/04/09 - change 54x54 to SII & SIII     ***
--***   versions with both 8&9(10) multipliers    ***
--***                                             ***
--***************************************************

--***************************************************
--*** valid supported cores                       ***
--***                                             ***
--*** 1: SII/SIII, 18-36 bit inputs,              ***
--***    any output width, 2 pipes                ***
--*** 2: SII/SIII, 18-36 bit inputs,              ***
--***    any output width, 3 pipes                ***
--*** 3: SII/SIII 54x18 inputs,                   ***
--***    up to 72 bit output, 3 or 4 pipes        ***
--*** 4: SII 54x54 inputs, 72 bit outputs,        ***
--***    8 or 9 multiplier core 5 or 6 pipes      ***
--*** 5: SIII/IV 54x54 inputs, 72 bit outputs,    ***
--***    8 or 9 (10) multiplier core 4 pipes      ***
--***                                             ***
--***************************************************

ENTITY fp_fxmul IS 
GENERIC (
         widthaa : positive := 18;
         widthbb : positive := 18;
         widthcc : positive := 36;
         pipes : positive := 1;
         accuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 0
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      dataaa : IN STD_LOGIC_VECTOR (widthaa DOWNTO 1);
      databb : IN STD_LOGIC_VECTOR (widthbb DOWNTO 1); 
      
      result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
     );
END fp_fxmul;

ARCHITECTURE rtl OF fp_fxmul IS

  component fp_mul2s
  GENERIC (
           widthaa : positive := 18;
           widthbb : positive := 18;
           widthcc : positive := 36
          );
  PORT
	   (
       sysclk : IN STD_LOGIC;
       reset : IN STD_LOGIC;
       enable : IN STD_LOGIC;
       dataaa : IN STD_LOGIC_VECTOR (widthaa DOWNTO 1);
       databb : IN STD_LOGIC_VECTOR (widthbb DOWNTO 1);

	    result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
	  );
  end component;
  
  component fp_mul3s
  GENERIC (
           widthaa : positive := 18;
           widthbb : positive := 18;
           widthcc : positive := 36
          );
  PORT
	   (
       sysclk : IN STD_LOGIC;
       reset : IN STD_LOGIC;
       enable : IN STD_LOGIC;
       dataaa : IN STD_LOGIC_VECTOR (widthaa DOWNTO 1);
       databb : IN STD_LOGIC_VECTOR (widthbb DOWNTO 1);

	    result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
	  );
  end component;
  
  component fp_mul5418s 
  GENERIC (
           widthcc : positive := 36;
           pipes : positive := 3  --3/4
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dataaa : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
        databb : IN STD_LOGIC_VECTOR (18 DOWNTO 1);
      
		  result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
		  );
  end component;
  
  component fp_mul54us_3xs
  PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

      mulcc : OUT STD_LOGIC_VECTOR (72 DOWNTO 1)  
     );
  end component;
  
  component fp_mul54us_28s 
  GENERIC (latency : positive := 5);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (72 DOWNTO 1)  
       );
  end component;
  
  component fp_mul54us_29s 
  GENERIC (latency : positive := 5);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (72 DOWNTO 1)  
       );
  end component;
  
  component fp_mul54us_38s
  PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

      mulcc : OUT STD_LOGIC_VECTOR (72 DOWNTO 1)  
     );
  end component;
  
  component fp_mul54usb 
  GENERIC (
           latency : positive := 5; -- 4/5/6
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           prune : integer := 0 -- 0 = pruned multiplier, 1 = normal multiplier
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (72 DOWNTO 1)
		  );
  end component;		
  
  component fp_mul7218s 
  GENERIC (
           widthcc : positive := 36;
           pipes : positive := 3  --3/4
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dataaa : IN STD_LOGIC_VECTOR (72 DOWNTO 1);
        databb : IN STD_LOGIC_VECTOR (18 DOWNTO 1);
      
		  result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
		  );
  end component;
    		 
BEGIN
  
  gone: IF ((widthaa < 37) AND 
            (widthbb < 37) AND 
            (widthcc <= (widthaa + widthbb)) AND
            (pipes = 2)) GENERATE
            
    mulone: fp_mul2s
    GENERIC MAP (widthaa=>widthaa,widthbb=>widthbb,widthcc=>widthcc)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              dataaa=>dataaa,databb=>databb,
              result=>result);
          
  END GENERATE;

  gtwo: IF ((widthaa < 37) AND 
            (widthbb < 37) AND 
            (widthcc <= (widthaa + widthbb)) AND
            (pipes = 3)) GENERATE
            
    multwo: fp_mul3s
    GENERIC MAP (widthaa=>widthaa,widthbb=>widthbb,widthcc=>widthcc)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              dataaa=>dataaa,databb=>databb,
              result=>result);
          
  END GENERATE;

  gthr: IF ((widthaa = 54) AND 
            (widthbb = 18) AND 
            (widthcc < 73) AND
            ((pipes = 3) OR (pipes = 4))) GENERATE
            
    multhr: fp_mul5418s
    GENERIC MAP (widthcc=>widthcc,pipes=>pipes)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              dataaa=>dataaa,databb=>databb,
              result=>result);
              
  END GENERATE;
  
  gforone: IF ((widthaa = 54) AND 
               (widthbb = 54) AND 
               (widthcc = 72) AND
               (accuracy = 1) AND
               (device = 1) AND
               (synthesize = 1)) GENERATE
            
    mulforone: fp_mul54us_3xs
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>dataaa,mulbb=>databb,
              mulcc=>result);
          
  END GENERATE;
  
  gfortwo: IF ((widthaa = 54) AND 
               (widthbb = 54) AND 
               (widthcc = 72) AND
               (accuracy = 0) AND
               (device = 1) AND
               (synthesize = 1)) GENERATE
            
    mulfortwo: fp_mul54us_38s
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>dataaa,mulbb=>databb,
              mulcc=>result);
          
  END GENERATE;
  
  gforthr: IF ((widthaa = 54) AND 
               (widthbb = 54) AND 
               (widthcc = 72) AND
               (accuracy = 0) AND
               (device = 0) AND
               (synthesize = 1) AND
               ((pipes = 5) OR (pipes = 6))) GENERATE
            
    mulforthr: fp_mul54us_28s
    GENERIC MAP (latency=>pipes)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>dataaa,mulbb=>databb,
              mulcc=>result);
          
  END GENERATE;
  
  gforfor: IF ((widthaa = 54) AND 
               (widthbb = 54) AND 
               (widthcc = 72) AND
               (accuracy = 1) AND
               (device = 0) AND
               (synthesize = 1) AND
               ((pipes = 5) OR (pipes = 6))) GENERATE
            
    mulforfor: fp_mul54us_29s
    GENERIC MAP (latency=>pipes)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>dataaa,mulbb=>databb,
              mulcc=>result);
          
  END GENERATE;

  gforfiv: IF ((widthaa = 54) AND 
               (widthbb = 54) AND 
               (widthcc = 72) AND
               (synthesize = 0)) GENERATE
            
    mulforfiv: fp_mul54usb
    GENERIC MAP (latency=>pipes,device=>device,prune=>accuracy)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>dataaa,bb=>databb,
              cc=>result);
          
  END GENERATE;
		  
  gfiv: IF ((widthaa = 72) AND 
            (widthbb = 18) AND 
            (widthcc < 90) AND
            ((pipes = 3) OR (pipes = 4))) GENERATE
            
    multhr: fp_mul7218s
    GENERIC MAP (widthcc=>widthcc,pipes=>pipes)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              dataaa=>dataaa,databb=>databb,
              result=>result);
              
  END GENERATE;
  		          
END rtl;

