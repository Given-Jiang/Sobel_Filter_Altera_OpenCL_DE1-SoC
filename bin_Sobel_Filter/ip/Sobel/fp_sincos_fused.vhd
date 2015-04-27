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
--***   FP_SIN.VHD                               ***
--***                                             ***
--***   Function: Single Precision SIN Core       ***
--***                                             ***
--***   10/01/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** 1. Input < 0.5 radians, take cos(pi/2-input)***
--*** 2. latency = depth + range_depth (11) + 7   ***
--*** (1 more than cos)                           ***
--***************************************************

ENTITY fp_sincos_fused IS
GENERIC (
          device : integer := 0;
          width : positive := 36;
          depth : positive := 20;
          indexpoint : positive := 2
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1); 
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1); 

      signout_sin : OUT STD_LOGIC;
      exponentout_sin : OUT STD_LOGIC_VECTOR (8 DOWNTO 1); 
      mantissaout_sin : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
      signout_cos : OUT STD_LOGIC;
      exponentout_cos : OUT STD_LOGIC_VECTOR (8 DOWNTO 1); 
      mantissaout_cos : OUT STD_LOGIC_VECTOR (23 DOWNTO 1) 
     );
END fp_sincos_fused;

ARCHITECTURE rtl of fp_sincos_fused IS

  constant cordic_width : positive := width;
  constant cordic_depth : positive := depth;
  constant range_depth : positive := 11;

  signal piovertwo : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);

  signal input_number : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal input_number_delay : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal exponentinff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentcheck : STD_LOGIC_VECTOR (9 DOWNTO 1);
  
  -- range reduction
  signal circle : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal negcircle : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal quadrantsign_sin, quadrantsign_cos, quadrantselect : STD_LOGIC;
  signal positive_quadrant, negative_quadrant : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal fraction_quadrant : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal one_term : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal quadrant : STD_LOGIC_VECTOR (34 DOWNTO 1);
  
  -- circle to radians mult
  signal radiansnode : STD_LOGIC_VECTOR (cordic_width DOWNTO 1);
  signal indexcheck : STD_LOGIC_VECTOR (16 DOWNTO 1);
  signal indexbit : STD_LOGIC;
  
  signal signinff : STD_LOGIC_VECTOR (range_depth DOWNTO 1);
  signal selectoutputff : STD_LOGIC_VECTOR (range_depth+cordic_depth+5 DOWNTO 1);
  signal signcalcff_sin,signcalcff_cos : STD_LOGIC_VECTOR (cordic_depth+6 DOWNTO 1);
  signal quadrant_sumff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal select_sincosff : STD_LOGIC_VECTOR (4+cordic_depth DOWNTO 1);

  signal fixed_sin : STD_LOGIC_VECTOR (cordic_width DOWNTO 1);
  signal fixed_sinnode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal fixed_sinff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal fixed_cos : STD_LOGIC_VECTOR (cordic_width DOWNTO 1);
  signal fixed_cosnode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal fixed_cosff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal countnode_sin : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal countff_sin : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal mantissanormnode_sin : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal mantissanormff_sin : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentnormnode_sin : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentnormff_sin : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal overflownode_sin : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal mantissaoutff_sin : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentoutff_sin : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal signoutff_sin : STD_LOGIC;

  signal countnode_cos : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal countff_cos : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal mantissanormnode_cos : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal mantissanormff_cos : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentnormnode_cos : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentnormff_cos : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal overflownode_cos : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal mantissaoutff_cos : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentoutff_cos : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal signoutff_cos : STD_LOGIC;
  
  component fp_range1
  GENERIC (device : integer);
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
  end component;
   
  component fp_cordic_m1_fused
  GENERIC (
         width : positive := 36;
         depth : positive := 20;
         indexpoint : positive := 2
        );  
  PORT (
			sysclk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			enable : IN STD_LOGIC;
			radians : IN STD_LOGIC_VECTOR (width DOWNTO 1); --'0'&[width-1:1]   
			indexbit : IN STD_LOGIC;   

			sin_out : OUT STD_LOGIC_VECTOR (width DOWNTO 1);     
			cos_out : OUT STD_LOGIC_VECTOR (width DOWNTO 1)      
       );
  end component;

  component fp_clz36 IS
  PORT (
        mantissa : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      
        leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;

  component fp_lsft36 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

        outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
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
    
    -- pi/2 = 1.57
    piovertwo <= x"c90fdaa22";
  
    zerovec <= x"000000000";
    
    --*** SIN(X) = X when exponent < 115 ***
    input_number <= signin & exponentin & mantissain; 
    
    -- level 1 in, level range_depth+cordic_depth+7 out
    cdin: fp_del 
    GENERIC MAP (width=>32,pipes=>range_depth+cordic_depth+6)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>input_number,
              cc=>input_number_delay);
              
    --*** RANGE REDUCTION ***
    crr: fp_range1
    GENERIC MAP(device=>device)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signin=>signin,exponentin=>exponentin,mantissain=>mantissain,
              circle=>circle,negcircle=>negcircle); 

    quadrantsign_sin <= circle(36); -- sin negative in quadrants 3&4
    quadrantsign_cos <= (NOT(circle(36)) AND circle(35)) OR
                    (circle(36) AND NOT(circle(35))); -- cos negative in quadrants 2&3
    quadrantselect <= circle(35); -- sin (1-x) in quadants 2&4

    gra: FOR k IN 1 TO 34 GENERATE
      quadrant(k) <= (circle(k) AND NOT(quadrantselect)) OR
                     (negcircle(k) AND quadrantselect);
    END GENERATE;   
    
    -- if quadrant >0.5 (when quadrant(34) = 1), use quadrant, else use 1-quadrant, and take cos rather than sin
    positive_quadrant <= '0' & quadrant & '0';
    gnqa: FOR k IN 1 TO 36 GENERATE
      negative_quadrant(k) <= NOT(positive_quadrant(k));
      fraction_quadrant(k) <= (positive_quadrant(k) AND quadrant(34)) OR
                              (negative_quadrant(k) AND NOT(quadrant(34)));
    END GENERATE;

    one_term <= NOT(quadrant(34)) & zerovec(35 DOWNTO 1); -- 0 if positive quadrant
      
    pfa: PROCESS (sysclk,reset)
    BEGIN        
      IF (reset = '1') THEN
          
        FOR k IN 1 TO range_depth LOOP
          signinff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO cordic_depth+6 LOOP
          signcalcff_sin(k) <= '0';
          signcalcff_cos(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 8 LOOP
          exponentinff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO range_depth+cordic_depth+5 LOOP
          selectoutputff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 36 LOOP
          quadrant_sumff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 4+cordic_depth LOOP
          select_sincosff(k) <= '0';
        END LOOP;
 
      ELSIF (rising_edge(sysclk)) THEN
         
        IF (enable = '1') THEN
        
          signinff(1) <= signin;
          FOR k IN 2 TO range_depth LOOP
            signinff(k) <= signinff(k-1);
          END LOOP;
          -- level range_depth+1 to range_depth+cordic_depth+6
          signcalcff_sin(1) <= quadrantsign_sin XOR signinff(range_depth); 
          FOR k IN 2 TO cordic_depth+6 LOOP
            signcalcff_sin(k) <= signcalcff_sin(k-1);
          END LOOP;
         signcalcff_cos(1) <= quadrantsign_cos; 
          FOR k IN 2 TO cordic_depth+6 LOOP
            signcalcff_cos(k) <= signcalcff_cos(k-1);
          END LOOP;			 
          
          exponentinff <= exponentin; -- level 1
          selectoutputff(1) <= exponentcheck(9); -- level 2 to range_depth+cordic_depth+6
          FOR k IN 2 TO range_depth+cordic_depth+5 LOOP
            selectoutputff(k) <= selectoutputff(k-1);
          END LOOP;
          
          -- range 0-0.9999
          quadrant_sumff <= one_term + fraction_quadrant + NOT(quadrant(34)); -- level range_depth+1
          
          -- level range depth+1 to range_depth+4
			 -- Here is an interesting thing - depending on the quadrant the input is in, computation
			 -- or a sin or cosine can use sin or cosine result. What this means is that we may have to swap
			 -- results when they come out of the cordic block.
          select_sincosff(1) <= quadrant(34);
          FOR k IN 2 TO 4+cordic_depth LOOP
            select_sincosff(k) <= select_sincosff(k-1);
          END LOOP;
   
        END IF;
         
      END IF;
        
    END PROCESS;
    
    -- if exponent < 115, sin = input
    exponentcheck <= ('0' & exponentinff) - ('0' & x"73");

    -- levels range_depth+2,3,4
    cmul: fp_fxmul  
    GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>cordic_width,
                 pipes=>3,synthesize=>1)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              dataaa=>quadrant_sumff,databb=>piovertwo,
              result=>radiansnode);
                    
    indexcheck(1) <= radiansnode(cordic_width-1);
    gica: FOR k IN 2 TO 16 GENERATE
      indexcheck(k) <= indexcheck(k-1) OR radiansnode(cordic_width-k);
    END GENERATE;
    -- for safety, give an extra bit of space
    indexbit <= NOT(indexcheck(indexpoint+1));
   
    ccc: fp_cordic_m1_fused
    GENERIC MAP (width=>cordic_width,depth=>cordic_depth,indexpoint=>indexpoint)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              radians=>radiansnode,
              indexbit=>indexbit,
              sin_out=>fixed_sin,
				  cos_out=>fixed_cos);
   
    gfxa: IF (width < 36) GENERATE
      fixed_sinnode <= (fixed_sin & zerovec(36-width DOWNTO 1)) when (select_sincosff(4+cordic_depth) = '1') else (fixed_cos & zerovec(36-width DOWNTO 1));
      fixed_cosnode <= (fixed_cos & zerovec(36-width DOWNTO 1)) when (select_sincosff(4+cordic_depth) = '1') else (fixed_sin & zerovec(36-width DOWNTO 1));
    END GENERATE;
    gfxb: IF (width = 36) GENERATE
      fixed_sinnode <= fixed_sin when (select_sincosff(4+cordic_depth) = '1') else fixed_cos;
      fixed_cosnode <= fixed_cos when (select_sincosff(4+cordic_depth) = '1') else fixed_sin;
    END GENERATE;
    
    clz1: fp_clz36
    PORT MAP (mantissa=>fixed_sinnode,leading=>countnode_sin);
    clz2: fp_clz36
    PORT MAP (mantissa=>fixed_cosnode,leading=>countnode_cos);
        
    sft1: fp_lsft36  
    PORT MAP (inbus=>fixed_sinff,shift=>countff_sin,
              outbus=>mantissanormnode_sin);
    sft2: fp_lsft36  
    PORT MAP (inbus=>fixed_cosff,shift=>countff_cos,
              outbus=>mantissanormnode_cos);
    
    -- maximum sin or cos = 1.0 = 1.0e127 single precision
    -- 1e128 - 1 (leading one) gives correct number
    exponentnormnode_sin <= "10000000" - ("00" & countff_sin); 
    exponentnormnode_cos <= "10000000" - ("00" & countff_cos); 
    
    overflownode_sin(1) <= mantissanormnode_sin(12);
    gova1: FOR k IN 2 TO 24 GENERATE
      overflownode_sin(k) <= mantissanormnode_sin(k+11) AND overflownode_sin(k-1);
    END GENERATE;
    overflownode_cos(1) <= mantissanormnode_cos(12);
    gova2: FOR k IN 2 TO 24 GENERATE
      overflownode_cos(k) <= mantissanormnode_cos(k+11) AND overflownode_cos(k-1);
    END GENERATE;
    
    -- OUTPUT
    poa: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        FOR k IN 1 TO 36 LOOP
          fixed_sinff(k) <= '0';
          fixed_cosff(k) <= '0';
        END LOOP;
        countff_sin <= "000000";
        countff_cos <= "000000";
        FOR k IN 1 TO 23 LOOP
          mantissanormff_sin(k) <= '0';
          mantissaoutff_sin(k) <= '0';
          mantissanormff_cos(k) <= '0';
          mantissaoutff_cos(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 8 LOOP
          exponentnormff_sin(k) <= '0';
          exponentoutff_sin(k) <= '0';
          exponentnormff_cos(k) <= '0';
          exponentoutff_cos(k) <= '0';
        END LOOP;
        signoutff_sin <= '0';
        signoutff_cos <= '0';

      ELSIF (rising_edge(sysclk)) THEN
          
        IF (enable = '1') THEN
           
          fixed_sinff <= fixed_sinnode; -- level range_depth+cordic_depth+5
          fixed_cosff <= fixed_cosnode; -- level range_depth+cordic_depth+5
          countff_sin <= countnode_sin; -- level range_depth+4+cordic_depth+5
          countff_cos <= countnode_cos; -- level range_depth+4+cordic_depth+5

          -- level range_depth+cordic_depth+6
          mantissanormff_cos <= mantissanormnode_cos(35 DOWNTO 13) + mantissanormnode_cos(12);
          exponentnormff_cos <= exponentnormnode_cos(8 DOWNTO 1) + overflownode_cos(24);
          mantissanormff_sin <= mantissanormnode_sin(35 DOWNTO 13) + mantissanormnode_sin(12);
          exponentnormff_sin <= exponentnormnode_sin(8 DOWNTO 1) + overflownode_sin(24);
          
          -- level range_depth+cordic_depth+7         
          FOR k IN 1 TO 23 LOOP
            mantissaoutff_sin(k) <= (mantissanormff_sin(k) AND NOT(selectoutputff(range_depth+cordic_depth+5))) OR
                                (input_number_delay(k) AND selectoutputff(range_depth+cordic_depth+5));
          END LOOP;
          FOR k IN 1 TO 8 LOOP
            exponentoutff_sin(k) <= (exponentnormff_sin(k) AND NOT(selectoutputff(range_depth+cordic_depth+5))) OR
                                (input_number_delay(k+23) AND selectoutputff(range_depth+cordic_depth+5));
          END LOOP;
          signoutff_sin <= (signcalcff_sin(cordic_depth+6) AND NOT(selectoutputff(range_depth+cordic_depth+5))) OR
                       (input_number_delay(32) AND selectoutputff(range_depth+cordic_depth+5));
          mantissaoutff_cos <= mantissanormff_cos;
          exponentoutff_cos <= exponentnormff_cos;
          signoutff_cos <= signcalcff_cos(cordic_depth+6);
        END IF;
        
      END IF;
      
    END PROCESS;
    
    mantissaout_sin <= mantissaoutff_sin; 
    exponentout_sin <= exponentoutff_sin;
    signout_sin <= signoutff_sin;    
    mantissaout_cos <= mantissaoutff_cos; 
    exponentout_cos <= exponentoutff_cos;
    signout_cos <= signoutff_cos;    
    
  END rtl;
  
