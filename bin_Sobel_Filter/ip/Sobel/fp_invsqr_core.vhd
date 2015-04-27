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
--***   SINGLE PRECISION INVERSE SQUARE ROOT      ***
--***                 CORE                        ***
--***                                             ***
--***   FP_INVSQR_CORE.VHD                        ***
--***                                             ***
--***   Function: 36 bit Inverse Square Root      ***
--***   (multiplicative iterative algorithm)      ***
--***                                             ***
--***   09/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes: Latency = 17                         ***
--***************************************************

ENTITY fp_invsqr_core IS 
GENERIC (
         synthesize : integer := 1      -- 0/1      
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      radicand : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      odd : IN STD_LOGIC;

		invroot : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		);
END fp_invsqr_core;

ARCHITECTURE rtl OF fp_invsqr_core IS
  
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal evennum : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal oddnum : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal guessvec : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal oddff : STD_LOGIC_VECTOR (12 DOWNTO 1);
  signal scalenumff : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal guess : STD_LOGIC_VECTOR (18 DOWNTO 1);

  -- 1st iteration
  signal radicanddelone : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal guessdel : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal multoneone : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multonetwo : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal multonetwoff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal suboneff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multonethr : STD_LOGIC_VECTOR (37 DOWNTO 1);

  component fp_invsqr_est IS 
  GENERIC (synthesize : integer := 0); -- 0 = behavioral, 1 = syntheziable
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        radicand : IN STD_LOGIC_VECTOR (19 DOWNTO 1);

		  invroot : OUT STD_LOGIC_VECTOR (18 DOWNTO 1)
		  );
  end component;
  
  component fp_fxmul IS 
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
  end component;
 
  component fp_del
  GENERIC (
           width : positive := 64;
           pipes : positive := 2
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
    
  oddnum <= conv_std_logic_vector(185363,18); -- mult by 2^-.5 (odd exp)
  evennum <= conv_std_logic_vector(262143,18); -- mult by 1 (even exp)
  
  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  -- in level 0, out level 5
  look: fp_invsqr_est
  GENERIC MAP (synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            radicand=>radicand(36 DOWNTO 18),invroot=>guessvec);
              
  pta: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
    
      FOR k IN 1 TO 12 LOOP
        oddff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 18 LOOP
        scalenumff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
        
        oddff(1) <= odd;
        FOR k IN 2 TO 12 LOOP
          oddff(k) <= oddff(k-1);
        END LOOP; 
        
        FOR k IN 1 TO 18 LOOP
          scalenumff(k) <= (oddnum(k) AND oddff(4)) OR (evennum(k) AND NOT(oddff(4)));
        END LOOP;
          
      END IF;
    
    END IF;    
      
  END PROCESS;

  -- in level 5, out level 7
  mulscale: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>18,pipes=>2,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>guessvec,databb=>scalenumff,
            result=>guess);

  --*********************
  --*** ITERATION ONE ***
  --*********************
  --X' = X/2(3-YXX)
  
  deloneone: fp_del
  GENERIC MAP(width=>36,pipes=>9)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>radicand,cc=>radicanddelone);
            
  delonetwo: fp_del
  GENERIC MAP(width=>18,pipes=>7)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>guess,cc=>guessdel);
            
  -- in level 7, out level 9 (18x18=36)
  oneone: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>36,pipes=>2,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>guess,databb=>guess,
            result=>multoneone);
                   
  -- in level 9, out level 12 (36x36=37)
  onetwo: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>37,pipes=>3,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>radicanddelone,databb=>multoneone,
            result=>multonetwo);
                   
  -- multonetwo is about 1 - either 1.000000XXX or 0.9999999
  -- mult by 2 if odd exponent (37 DOWNTO 2), otherwise (38 DOWNTO 3)
  -- round bit in position 1 or 2
  pone: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 36 LOOP
        multonetwoff(k) <= '0';
        suboneff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
        
        --invert here so that borrow can be added in simple expression
        -- level 13
        FOR k IN 1 TO 36 LOOP
          multonetwoff(k) <= NOT((multonetwo(k) AND oddff(12)) OR (multonetwo(k+1) AND NOT(oddff(12))));
        END LOOP;
        -- level 14
        suboneff <= ("11" & zerovec(34 DOWNTO 1)) + 
                    ('1' & multonetwoff(36 DOWNTO 2)) +
                    (zerovec(35 DOWNTO 1) & multonetwoff(1));
          
      END IF;
    
    END IF;    
      
  END PROCESS;    

  -- in level 14, out level 17 (36x18=37)
  onethr: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>18,widthcc=>37,pipes=>3,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>suboneff,databb=>guessdel,
            result=>multonethr); 

  invroot <= multonethr(36 DOWNTO 1);
   
END rtl;
