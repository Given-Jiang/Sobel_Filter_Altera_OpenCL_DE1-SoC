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
--***   FP_ATAN_CORE1.VHD                         ***
--***                                             ***
--***   Function: Single Precision Floating Point ***
--***   ATAN Core for ACOS/ASIN Function          ***
--***                                             ***
--***   23/12/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** 1. Latency = 21                             ***
--*** 2. Valid for inputs < 1                     ***
--***************************************************

ENTITY fp_atan_core1 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

      atan : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		);
END fp_atan_core1;

ARCHITECTURE rtl OF fp_atan_core1 IS
  
  constant b_precision : positive := 10;
  
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);

  signal mantissainff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal exponentinff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal a_fixedpointff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal luttermff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal ab_plusoneff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal atan_sumff : STD_LOGIC_VECTOR (36 DOWNTO 1);

  signal a_shift : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal a_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal b_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal c_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal b_address : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal lutterm : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal dellutterm : STD_LOGIC_VECTOR (36 DOWNTO 1); 
  signal ab_fixedpoint : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal numerator, denominator : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal addterm : STD_LOGIC_VECTOR (36 DOWNTO 1);
         
	component fp_inv_core
  GENERIC (synthesize : integer := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        divisor : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		    quotient : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		    );
  end component;

	component fp_rsft36
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
	 end component;

  component fp_del 
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
   
  component fp_fxmul
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
  
  component fp_atanlut
  PORT (
        add : IN STD_LOGIC_VECTOR (10 DOWNTO 1);
        data : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
       );
  end component;
	    
BEGIN
        
  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pinx: PROCESS (sysclk,reset)
  BEGIN
    
    IF  (reset = '1') THEN

      FOR k IN 1 TO 36 LOOP
        mantissainff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        exponentinff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        a_fixedpointff(k) <= '0';
        luttermff(k) <= '0';
        ab_plusoneff(k) <= '0';
        atan_sumff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        
        mantissainff <= mantissain;  -- level 1
        exponentinff <= exponentin;  -- level 1
        
        a_fixedpointff <= a_fixedpoint; -- level 2
        
        luttermff <= lutterm; -- level 4
        
        ab_plusoneff <= '1' & ab_fixedpoint(35 DOWNTO 1); -- ab_fixedpoint always 1/4 true value, level 6
        
        atan_sumff <= dellutterm + (zerovec(9 DOWNTO 1) & addterm(36 DOWNTO 10));
         
      END IF;
    
    END IF;
  
  END PROCESS;
  
  a_shift <= 127 - exponentinff; -- a_exponent will always be 126 or less
  
  asr: fp_rsft36
  PORT MAP (inbus=>mantissainff,shift=>a_shift(6 DOWNTO 1),
            outbus=>a_fixedpoint);
            
  b_fixedpoint <= a_fixedpoint(36 DOWNTO 37-b_precision) & zerovec(36-b_precision DOWNTO 1);
  c_fixedpoint <= a_fixedpoint(36-b_precision DOWNTO 1) & zerovec(b_precision DOWNTO 1); 
  
  b_address <= a_fixedpointff(36 DOWNTO 37-b_precision);
 
  -- level 3
  clut: fp_atanlut
  PORT MAP (add=>b_address,
            data=>lutterm);
  
  -- level 3 in, level 20 out
  cdlut: fp_del 
  GENERIC MAP (width=>36,pipes=>17) 
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>luttermff,
            cc=>dellutterm);

  -- level 1 in, level 17 out
  cdnum: fp_del 
  GENERIC MAP (width=>36,pipes=>16)  
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>c_fixedpoint,
            cc=>numerator);
            
  -- level 2 in, level 5 out             
  cmab: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>37,
               pipes=>3,synthesize=>0)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>a_fixedpoint,databb=>b_fixedpoint,
            result=>ab_fixedpoint);
                
  -- level 5 in, level 17 out
  cinv: fp_inv_core
  GENERIC MAP (synthesize=>0) 
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>ab_plusoneff,
            quotient=>denominator);
         
  -- level 17 in, level 20 out   
  cmo: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>36,
               pipes=>3,synthesize=>0)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>numerator,databb=>denominator,
            result=>addterm);         
            
  --*** OUTPUTS ***
  atan <= atan_sumff;

end rtl;

		    
