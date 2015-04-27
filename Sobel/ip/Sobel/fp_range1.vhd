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
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_RANGE1.VHD                             ***
--***                                             ***
--***   Function: Single Precision Range Reduction***
--***   Core. Output as a fraction of 2PI.        ***
--***                                             ***
--***   22/12/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_range1 IS
GENERIC (device : integer := 0);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1); 
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1); 

      circle : OUT STD_LOGIC_VECTOR (36 DOWNTO 1);
      negcircle : OUT STD_LOGIC_VECTOR (36 DOWNTO 1) 
     );
END fp_range1;

ARCHITECTURE rtl of fp_range1 IS

  type rangeexponentfftype IS ARRAY (6 DOWNTO 1) OF STD_LOGIC_VECTOR (9 DOWNTO 1);
 
  signal mantissaff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal mantissadelff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal mantissamultipliernode : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal mantissamultiplierff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  
  signal exponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal mantissaexponentnode : STD_LOGIC_VECTOR (9 DOWNTO 1);
 
  signal leadnode, leadff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  
  signal rangeexponentff : rangeexponentfftype;
  signal negrangeexponentff : STD_LOGIC_VECTOR (9 DOWNTO 1);
  
  signal tableaddressff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal basefractionnode, basefractionff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal incmantissanode, incmantissaff : STD_LOGIC_VECTOR (56 DOWNTO 1);
  signal incexponentnode, incexponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal basefractiondelnode, basefractiondelff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal multipliernode : STD_LOGIC_VECTOR (79 DOWNTO 1);
  signal multipliernormnode : STD_LOGIC_VECTOR (78 DOWNTO 1);
  signal multipliernormff : STD_LOGIC_VECTOR (78 DOWNTO 1);
  
  signal leftrotatenode, rightrotatenode : STD_LOGIC_VECTOR (78 DOWNTO 1);
  signal leftrotateff, rightrotateff : STD_LOGIC_VECTOR (78 DOWNTO 1);
  signal rotatenode : STD_LOGIC_VECTOR (78 DOWNTO 1);
  signal rotateff : STD_LOGIC_VECTOR (78 DOWNTO 1);
  signal selectrotateff : STD_LOGIC;
  signal circlenode : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal circleff : STD_LOGIC_VECTOR (37 DOWNTO 1);
  
  signal negbasefractiondelnode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal negbasefractiondelff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal negrotatenode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal negcirclenode : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal negcircleff : STD_LOGIC_VECTOR (37 DOWNTO 1);
 
  component fp_clz23 
  PORT (
        mantissa : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
       
        leading : OUT STD_LOGIC_VECTOR (5 DOWNTO 1)    
      );
  end component;
  
  component fp_lsft23  
  PORT (
        inbus : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	      outbus : OUT STD_LOGIC_VECTOR (23 DOWNTO 1)
	     );
  end component;
  
  component fp_lsft78  
  PORT (
        inbus : IN STD_LOGIC_VECTOR (78 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	      outbus : OUT STD_LOGIC_VECTOR (78 DOWNTO 1)
	     );
  end component;
  
  component fp_rsft78  
  PORT (
        inbus : IN STD_LOGIC_VECTOR (78 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (78 DOWNTO 1)
	    );
  end component;
 
  component fp_range_table1 
  PORT (
        address : IN STD_LOGIC_VECTOR (8 DOWNTO 1); 
 
        basefraction : OUT STD_LOGIC_VECTOR (36 DOWNTO 1);  
        incmantissa : OUT STD_LOGIC_VECTOR (56 DOWNTO 1);
        incexponent : OUT STD_LOGIC_VECTOR (8 DOWNTO 1)
     );
  end component;

  component fp_mul23x56 IS
  GENERIC (device : integer);
  PORT (  
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dataaa : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
        databb : IN STD_LOGIC_VECTOR (56 DOWNTO 1);

        result : OUT STD_LOGIC_VECTOR (79 DOWNTO 1)
  );
  end component;

  component fp_del IS 
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

    pca: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
      
        FOR k IN 1 TO 23 LOOP
          mantissaff(k) <= '0';
          mantissadelff(k) <= '0';
          mantissamultiplierff(k) <= '0';
        END LOOP;
        exponentff <= "00000000";
        FOR k IN 1 TO 6 LOOP
          rangeexponentff(k)(9 DOWNTO 1) <= "000000000";
        END LOOP;
        negrangeexponentff(9 DOWNTO 1) <= "000000000";
        leadff <= "00000";
        tableaddressff <= "00000000";
        FOR k IN 1 TO 36 LOOP
          basefractionff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 56 LOOP
          incmantissaff(k) <= '0';
        END LOOP;
        incexponentff <= "00000000";
        FOR k IN 1 TO 78 LOOP
          multipliernormff(k) <= '0';
          leftrotateff(k) <= '0';
          rightrotateff(k) <= '0';
        END LOOP;
        selectrotateff <= '0';
        FOR k IN 1 TO 37 LOOP
          circleff(k) <= '0';
          negcircleff(k) <= '0';
        END LOOP;

      ELSIF (rising_edge(sysclk)) THEN
      
        IF (enable = '1') THEN
            
          mantissaff <= mantissain; -- level 1
          mantissadelff <= mantissaff; -- level 2
          exponentff <= exponentin;  -- level 1
          
          leadff <= leadnode; -- level 2
          mantissamultiplierff <= mantissamultipliernode; -- level 3
          
          tableaddressff <= exponentff; -- level 2
          basefractionff <= basefractionnode; -- level 3
          incmantissaff <= incmantissanode; -- level 3
          incexponentff <= incexponentnode; -- level 3
          
          rangeexponentff(1)(9 DOWNTO 1) <= mantissaexponentnode; -- levels 3,4,5,6,7, and 8
          rangeexponentff(2)(9 DOWNTO 1) <= rangeexponentff(1)(9 DOWNTO 1) - ('0' & incexponentff);
          rangeexponentff(3)(9 DOWNTO 1) <= rangeexponentff(2)(9 DOWNTO 1);
          rangeexponentff(4)(9 DOWNTO 1) <= rangeexponentff(3)(9 DOWNTO 1);
          rangeexponentff(5)(9 DOWNTO 1) <= rangeexponentff(4)(9 DOWNTO 1);
          rangeexponentff(6)(9 DOWNTO 1) <= rangeexponentff(5)(9 DOWNTO 1) - ("00000000" & NOT(multipliernode(79)));
          
          negrangeexponentff <= "100000000" - 
                                (rangeexponentff(5)(9 DOWNTO 1) - 
                                ("00000000" & NOT(multipliernode(79)))); -- level 8
          
          multipliernormff <= multipliernormnode;
          
          leftrotateff <= leftrotatenode;
          rightrotateff <= rightrotatenode;
          rotateff <= rotatenode;
          selectrotateff <= negrangeexponentff(9);
          
          basefractiondelff <= basefractiondelnode;
          negbasefractiondelff <= negbasefractiondelnode;
            
          circleff <= circlenode;
          negcircleff <= negcirclenode;
                
        END IF;
      
      END IF;    
        
    END PROCESS;

    cbfd: fp_del  
    GENERIC MAP (width=>36,pipes=>6)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>basefractionff,
              cc=>basefractiondelnode);

    --turn mantissa fractional part into floating point number
    -- level 1 in
    cclzin: fp_clz23
    PORT MAP (mantissa=>mantissaff,leading=>leadnode);
    
    -- need to do this shift so that both mult inputs normalized, so we can see
    -- if 1 bit mult output normalization required
    -- level 2 in
    csftin: fp_lsft23
    PORT MAP (inbus=>mantissadelff,shift=>leadff,
              outbus=>mantissamultipliernode);
           
    -- exponents (expin, baseexp, incexp) reversed
    -- exponents show shift from 0.9999 posisition
    -- ex: 0.111e3 = 0.000111, 0.111e5 = 0.00000111
    -- if no shift, expin = 23
    -- ex: mantissain = 123, after shift = 0.1111011 (0.96), same as 7
    -- level 2 in
    mantissaexponentnode <= "000010111" - ("0000" & leadff); -- 23 - shift
    
    -- level 2 in
    clut: fp_range_table1 
    PORT MAP (address=>tableaddressff,
              basefraction=>basefractionnode,
              incmantissa=>incmantissanode,
              incexponent=>incexponentnode);
    
    -- 23 x 56 = 79 bits
    -- mantissamulin, incman both in range 0.5 to 0.9999, so result is range 0.25 to 0.999
    -- if < 0.5, shift left and add 1 to exponent
    -- levels 4,5,6,7 
    cmul: fp_mul23x56
    GENERIC MAP(device=>device) 
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              dataaa=>mantissamultiplierff,databb=>incmantissaff,
              result=>multipliernode);  
    
    -- level 7 in
    gma: FOR k IN 1 TO 78 GENERATE
      multipliernormnode(k) <= (multipliernode(k+1) AND multipliernode(79)) OR 
                               (multipliernode(k) AND NOT(multipliernode(79))); 
    END GENERATE;
    
    lftsft: fp_lsft78
    PORT MAP (inbus=>multipliernormff,shift=>rangeexponentff(6)(6 DOWNTO 1),
              outbus=>leftrotatenode);
              
    rgtsft: fp_rsft78
    PORT MAP (inbus=>multipliernormff,shift=>negrangeexponentff(6 DOWNTO 1),
              outbus=>rightrotatenode);
              
    gra: FOR k IN 1 TO 78 GENERATE
      rotatenode(k) <= (leftrotateff(k) AND NOT(selectrotateff)) OR 
                       (rightrotateff(k) AND selectrotateff);
    END GENERATE;
    
    -- use 3-1 adder to round as well?
    
    -- max will be 1.9999, but only interested in fractional part          
    circlenode <= ('0' & basefractiondelff) + ('0' & rotateff(78 DOWNTO 43));
    
    negbasefractiondelnode <= 0 - (basefractiondelnode(36 DOWNTO 1));
    gnra: FOR k IN 1 TO 36 GENERATE
      negrotatenode(k) <= NOT(rotateff(k+42));
    END GENERATE;
    negcirclenode <= ('1' & negbasefractiondelff) + ('1' & negrotatenode) + 1;
    
    -- fractional part of 2pi will be circle(36 DOWNTO 1)
    circle <= circleff(36 DOWNTO 1);
    negcircle <= negcircleff(36 DOWNTO 1);
 
  END rtl;
  
    
