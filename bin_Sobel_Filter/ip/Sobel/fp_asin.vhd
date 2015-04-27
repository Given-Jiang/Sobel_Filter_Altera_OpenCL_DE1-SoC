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
--*** Notes: Latency = 53                         ***
--***************************************************
-- input -1 to 1, output -pi/2 to pi/2
ENTITY fp_asin IS 
GENERIC (synthesize : integer := 1); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

      signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1)
		);
END fp_asin;

ARCHITECTURE rtl OF fp_asin  IS

  type term_exponentfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (9 DOWNTO 1);
  type asin_sumfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal piovertwo : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal prep_signout : STD_LOGIC;
  signal numerator_exponent : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal numerator_mantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal denominator_exponent : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal denominator_mantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal signff : STD_LOGIC_VECTOR (45 DOWNTO 1);
  
  signal invsqr_exponent : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal invsqr_mantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal del_numerator_exponent : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal del_numerator_mantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal term_mantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal asin_sum : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal acos_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal term_exponentff : term_exponentfftype;

  signal small_mantissa : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal small_exponent : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentinff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentcheck : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal small_inputff : STD_LOGIC_VECTOR (50 DOWNTO 1);
      
  signal asin_sumff : asin_sumfftype;
  signal asin_shift, asin_shiftff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal asin_mantissabus : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal asin_mantissaff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal mantissaoutff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentadjustff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentadjustnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentoutff : STD_LOGIC_VECTOR (8 DOWNTO 1);

  -- latency = 8
	component fp_acos_prep1
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
	 end component;
	 
	-- latency = 17
	component fp_invsqr_trig1
  GENERIC (synthesize : integer := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        exponentin: IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

        exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		  );
	end component;
		
	-- latency = 22
  component fp_atan_core1 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        mantissain : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

        atan : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
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

  piovertwo <= x"6487ED511";
  
  -- latency 8: input level 0, output level 8
  cprep: fp_acos_prep1
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            signin=>signin,exponentin=>exponentin,mantissain=>mantissain,
            signout=>prep_signout,
            numerator_exponent=>numerator_exponent,
            numerator_mantissa=>numerator_mantissa,
            denominator_exponent=>denominator_exponent,
            denominator_mantissa=>denominator_mantissa);
  
  -- latency 17: input level 8, output level 25 
  cisqr: fp_invsqr_trig1
  GENERIC MAP (synthesize=>0)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            exponentin=>denominator_exponent,
            mantissain=>denominator_mantissa,
            exponentout=>invsqr_exponent,
            mantissaout=>invsqr_mantissa);

  -- input level 8, output level 25
  cdnx: fp_del 
  GENERIC MAP (width=>8,pipes=>17)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>numerator_exponent,
            cc=>del_numerator_exponent);
  -- input level 8, output level 25                       
  cdnm: fp_del 
  GENERIC MAP (width=>36,pipes=>17)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>numerator_mantissa,
            cc=>del_numerator_mantissa);
  
  -- input level 25, output level 28
  cma: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>36,pipes=>3,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>del_numerator_mantissa,
            databb=>invsqr_mantissa,
            result=>term_mantissa);
            
  pxa: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
      FOR k IN 1 TO 3 LOOP
        FOR j IN 1 TO 9 LOOP
          term_exponentff(1)(k) <= '0';
          term_exponentff(2)(k) <= '0';
          term_exponentff(3)(k) <= '0';
        END LOOP;
      END LOOP;
    ELSIF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        term_exponentff(1)(9 DOWNTO 1) <= ('0' & del_numerator_exponent) + ('0' & invsqr_exponent) - 126;
        term_exponentff(2)(9 DOWNTO 1) <= term_exponentff(1)(9 DOWNTO 1);
        term_exponentff(3)(9 DOWNTO 1) <= term_exponentff(2)(9 DOWNTO 1);
      END IF;
    END IF;
    
  END PROCESS;

  -- input level 28, output level 49
  cat: fp_atan_core1
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            exponentin=>term_exponentff(3)(8 DOWNTO 1),
            mantissain=>term_mantissa,
            atan=>acos_fixedpoint);

  asin_sum <= piovertwo - acos_fixedpoint;
  
  --*** handle small inputs ****
  dsma: fp_del
  GENERIC MAP (width=>23,pipes=>51)
  PORT MAP (sysclk=>sysclk,reset=>'0',enable=>enable, -- no resets for memory
            aa=>mantissain,
            cc=>small_mantissa); 
  dsxa: fp_del
  GENERIC MAP (width=>8,pipes=>51)
  PORT MAP (sysclk=>sysclk,reset=>'0',enable=>enable, -- no resets for memory
            aa=>exponentin,
            cc=>small_exponent); 
        
  exponentcheck <= exponentinff - 115;
                
  psa: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN

      exponentinff <= "00000000";
      FOR k IN 1 TO 50 LOOP
        small_inputff(k) <= '0';
      END LOOP;
    
    ELSIF(rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN

        exponentinff <= exponentin;
        small_inputff(1) <= exponentcheck(8);
        FOR k IN 2 TO 50 LOOP
          small_inputff(k) <= small_inputff(k-1);
        END LOOP;
        
      END IF;
    
    END IF;
  
  END PROCESS;
  
  poa: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
      
      FOR k IN 1 TO 45 LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 6 LOOP
        asin_shiftff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        asin_sumff(1)(k) <= '0';
        asin_sumff(2)(k) <= '0';
        asin_mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 23 LOOP
        mantissaoutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        exponentadjustff(k) <= '0';
        exponentoutff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        
        signff(1) <= prep_signout;
        FOR k IN 2 TO 45 LOOP
          signff(k) <= signff(k-1);
        END LOOP;
        
        asin_sumff(1)(36 DOWNTO 1) <= asin_sum;  -- level 50
        asin_sumff(2)(36 DOWNTO 1) <= asin_sumff(1)(36 DOWNTO 1);  -- level 51

        asin_shiftff <= asin_shift;  -- level 51

        FOR k IN 1 TO 12 LOOP
          asin_mantissaff(k) <= asin_mantissabus(k) AND NOT(small_inputff(50));  -- level 52
        END LOOP;
        FOR k IN 1 TO 23 LOOP
          asin_mantissaff(k+12) <= (asin_mantissabus(k+12) AND NOT(small_inputff(50))) OR
                                   (small_mantissa(k) AND small_inputff(50));
        END LOOP;
        asin_mantissaff(36) <= asin_mantissabus (36);
        
        -- check for overflow not needed?
        mantissaoutff <= asin_mantissaff(35 DOWNTO 13) + asin_mantissaff(12);  -- level 52
    
        FOR k IN 1 TO 8 LOOP
          exponentadjustff(k) <= (exponentadjustnode(k) AND NOT(small_inputff(50))) OR
                                 (small_exponent(k) AND small_inputff(50));  -- level 52
        END LOOP;
        FOR k IN 1 TO 8 LOOP
          exponentoutff(k) <= exponentadjustff(k);  -- level 53
        END LOOP;
        
      END IF;
      
    END IF;
    
  END PROCESS; 
   
  exponentadjustnode <= 128 - ("00" & asin_shiftff);
  
  czo: fp_clz36 
  PORT MAP (mantissa=>asin_sumff(1)(36 DOWNTO 1),
            leading=>asin_shift);
            
  clso: fp_lsft36
  PORT MAP (inbus=>asin_sumff(2)(36 DOWNTO 1),
            shift=>asin_shiftff,
            outbus=>asin_mantissabus);
    
  --*** OUTPUTS *** 
  signout <= signff(45);
  exponentout <= exponentoutff;
  mantissaout <= mantissaoutff;
   
END rtl;

