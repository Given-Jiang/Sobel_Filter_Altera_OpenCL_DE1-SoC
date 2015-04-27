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
--***   FP_ACOS_PREP1.VHD                         ***
--***                                             ***
--***   Function: Single Precision Floating Point ***
--***   ACOS/ASIN Setup - generate 1-x, 1-x*x     ***
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
--*** Notes: Latency = 8                          ***
--***************************************************

ENTITY fp_acos_prep1 IS 
GENERIC (synthesize : integer := 0);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin: IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

      signout : OUT STD_LOGIC;
		  numerator_exponent : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
		  numerator_mantissa : OUT STD_LOGIC_VECTOR (36 DOWNTO 1);
		  denominator_exponent : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
		  denominator_mantissa : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		);
END fp_acos_prep1 ;

ARCHITECTURE rtl OF fp_acos_prep1  IS

  type denominator_shiftfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (8 DOWNTO 1);
  type numerator_fixedpointfftype IS ARRAY (4 DOWNTO 1) OF STD_LOGIC_VECTOR (36 DOWNTO 1);
  type denominator_fixedpointfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal signff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal mantissainff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentinff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal mantissaextendff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal numerator_shiftff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal denominator_shiftff : denominator_shiftfftype;
  signal x_fixedpointff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal x_squared_fixedpointff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal numerator_fixedpointff : numerator_fixedpointfftype;
  signal denominator_fixedpointff : denominator_fixedpointfftype;
  signal numerator_leadingff, denominator_leadingff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal numerator_mantissaff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal denominator_mantissaff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal numerator_exponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal denominator_exponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);

  signal mantissaextend : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal x_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal x_squared : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal numerator_mantissanode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal numerator_exponentnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal x_squared_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal denominator_mantissanode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal denominator_exponentnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal numerator_leading : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal denominator_leading : STD_LOGIC_VECTOR (6 DOWNTO 1);

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
    
	component fp_rsft36
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
	 end component;

  component fp_clz36 
  PORT (
        mantissa : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      
        leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
     );
  end component;

	component fp_lsft36
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
	 end component;
	   	 	
BEGIN
    
  gzva: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  pinx: PROCESS (sysclk,reset)
  BEGIN
    
    IF  (reset = '1') THEN
      
      FOR k IN 1 TO 8 LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 23 LOOP
        mantissainff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        mantissaextendff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        exponentinff(k) <= '0';
        numerator_shiftff(k) <= '0';
        denominator_shiftff(1)(k) <= '0';
        denominator_shiftff(2)(k) <= '0';
        denominator_shiftff(3)(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        x_fixedpointff(k) <= '0';
        x_squared_fixedpointff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 4 LOOP
        FOR j IN 1 TO 36 LOOP
          numerator_fixedpointff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO 2 LOOP
        FOR j IN 1 TO 36 LOOP
          denominator_fixedpointff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO 6 LOOP
        numerator_leadingff(k) <= '0';
        denominator_leadingff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        numerator_mantissaff(k) <= '0';
        denominator_mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        numerator_exponentff(k) <= '0';
        denominator_exponentff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        
        signff(1) <= signin;
        FOR k IN 2 TO 8 LOOP
          signff(k) <= signff(k-1);
        END LOOP;
        
        mantissainff <= mantissain;  -- level 1
        exponentinff <= exponentin;  -- level 1
        
        mantissaextendff <= mantissaextend;  -- level 2
        
        numerator_shiftff <= 127 - exponentinff; -- exponent will always be 127 or less, level 2
        
        denominator_shiftff(1)(8 DOWNTO 1) <= 253 - (exponentinff(7 DOWNTO 1) & '0');  -- level 2
        denominator_shiftff(2)(8 DOWNTO 1) <= denominator_shiftff(1)(8 DOWNTO 1);  -- level 3
        denominator_shiftff(3)(8 DOWNTO 1) <= denominator_shiftff(2)(8 DOWNTO 1);  -- level 4
        
        x_fixedpointff <= x_fixedpoint;  -- level 3
        
        numerator_fixedpointff(1)(36 DOWNTO 1) <= ('1' & zerovec(35 DOWNTO 1)) - x_fixedpointff;  -- level 4
        numerator_fixedpointff(2)(36 DOWNTO 1) <= numerator_fixedpointff(1)(36 DOWNTO 1);  -- level 5
        numerator_fixedpointff(3)(36 DOWNTO 1) <= numerator_fixedpointff(2)(36 DOWNTO 1);  -- level 6
        numerator_fixedpointff(4)(36 DOWNTO 1) <= numerator_fixedpointff(3)(36 DOWNTO 1);  -- level 7
        
        x_squared_fixedpointff <= x_squared_fixedpoint; -- level 5
        
        denominator_fixedpointff(1)(36 DOWNTO 1) <= ('1' & zerovec(35 DOWNTO 1)) - x_squared_fixedpointff;  -- level 6
        denominator_fixedpointff(2)(36 DOWNTO 1) <= denominator_fixedpointff(1)(36 DOWNTO 1);  -- level 7
        
        numerator_leadingff <= numerator_leading;  -- level 7
        denominator_leadingff <= denominator_leading;  -- level 7
        
        numerator_mantissaff <= numerator_mantissanode;
        numerator_exponentff <= numerator_exponentnode;
        denominator_mantissaff <= denominator_mantissanode;
        denominator_exponentff <= denominator_exponentnode;
         
      END IF;
    
    END IF;
  
  END PROCESS;
 
  mantissaextend <= '1' & mantissainff & zerovec(12 DOWNTO 1);
  
  numsr: fp_rsft36
  PORT MAP (inbus=>mantissaextendff,shift=>numerator_shiftff(6 DOWNTO 1),
            outbus=>x_fixedpoint);
             
  mulxx: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>36,pipes=>3,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>mantissaextend,databb=>mantissaextend,
            result=>x_squared);
        
  -- if x^2 <0.5, 1 bit normalization shift, output exp = 126
  densr: fp_rsft36
  PORT MAP (inbus=>x_squared,shift=>denominator_shiftff(3)(6 DOWNTO 1),
            outbus=>x_squared_fixedpoint);            

  ccznum: fp_clz36 
  PORT MAP (mantissa=>numerator_fixedpointff(3)(36 DOWNTO 1),
            leading=>numerator_leading);
            
  csftnum: fp_lsft36
  PORT MAP (inbus=>numerator_fixedpointff(4)(36 DOWNTO 1),shift=>numerator_leadingff,
            outbus=>numerator_mantissanode);
            
  numerator_exponentnode <= 127 - ("00" & numerator_leadingff); 

  cczd: fp_clz36 
  PORT MAP (mantissa=>denominator_fixedpointff(1)(36 DOWNTO 1),
            leading=>denominator_leading); 
            
  cnd: fp_lsft36
  PORT MAP (inbus=>denominator_fixedpointff(2)(36 DOWNTO 1),shift=>denominator_leadingff,
            outbus=>denominator_mantissanode);
            
  denominator_exponentnode <= 127 - ("00" & denominator_leadingff); 
  
  --*** OUTPUTS ***
  signout <= signff(8);
  numerator_mantissa <= numerator_mantissaff;
  numerator_exponent <= numerator_exponentff;
  denominator_mantissa <= denominator_mantissaff;
  denominator_exponent <= denominator_exponentff;        

END rtl;

