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
--***   FP_COS1.VHD                               ***
--***                                             ***
--***   Function: Single Precision COS Core       ***
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
--*** 1. Input < 0.5 radians, take sin(pi/2-input)***
--*** 2. latency = depth + range_depth (11) + 6   ***
--*** (1 less than sin)                           ***
--***************************************************

ENTITY fp_cos IS
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

      signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1); 
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1) 
     );
END fp_cos;

ARCHITECTURE rtl of fp_cos IS

  constant cordic_width : positive := width;
  constant cordic_depth : positive := depth;
  constant range_depth : positive := 11;

  signal piovertwo : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);

  -- range reduction
  signal circle : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal negcircle : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal quadrantsign, quadrantselect : STD_LOGIC;
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
  signal signcalcff : STD_LOGIC_VECTOR (cordic_depth+6 DOWNTO 1);
  signal quadrant_sumff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal select_sincosff : STD_LOGIC_VECTOR (4 DOWNTO 1);

  signal fixed_sincos : STD_LOGIC_VECTOR (cordic_width DOWNTO 1);
  signal fixed_sincosnode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal fixed_sincosff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal countnode : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal countff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal mantissanormnode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal mantissanormff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentnormnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentnormff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal overflownode : STD_LOGIC_VECTOR (24 DOWNTO 1);
 
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
   
  component fp_cordic_m1
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
        sincosbit : IN STD_LOGIC;

        sincos : OUT STD_LOGIC_VECTOR (width DOWNTO 1)     
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
                  
    --*** RANGE REDUCTION ***
    crr: fp_range1
    GENERIC MAP(device=>device)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signin=>signin,exponentin=>exponentin,mantissain=>mantissain,
              circle=>circle,negcircle=>negcircle); 

    quadrantsign <= (NOT(circle(36)) AND circle(35)) OR
                    (circle(36) AND NOT(circle(35))); -- cos negative in quadrants 2&3
    
    quadrantselect <= circle(35); -- cos (1-x) in quadants 2&4
    
    gra: FOR k IN 1 TO 34 GENERATE
      quadrant(k) <= (circle(k) AND NOT(quadrantselect)) OR
                     (negcircle(k) AND quadrantselect);
    END GENERATE;   
    
    -- if quadrant >0.5 (when quadrant(34) = 1), use quadrant, else use 1-quadrant, and take sin rather than cos
    -- do this to maximize input value, not output value
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
          signcalcff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 36 LOOP
          quadrant_sumff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 4 LOOP
          select_sincosff(k) <= '0';
        END LOOP;
 
      ELSIF (rising_edge(sysclk)) THEN
         
        IF (enable = '1') THEN
        
          signinff(1) <= signin;
          FOR k IN 2 TO range_depth LOOP
            signinff(k) <= signinff(k-1);
          END LOOP;
          -- level range_depth+1 to range_depth+cordic_depth+6
          signcalcff(1) <= quadrantsign; 
          FOR k IN 2 TO cordic_depth+6 LOOP
            signcalcff(k) <= signcalcff(k-1);
          END LOOP;
          
          -- range 0-0.9999
          quadrant_sumff <= one_term + fraction_quadrant + quadrant(34); -- level range_depth+1
          
          -- level range depth+1 to range_depth+4 
          select_sincosff(1) <= NOT(quadrant(34));
          FOR k IN 2 TO 4 LOOP
            select_sincosff(k) <= select_sincosff(k-1);
          END LOOP;
   
        END IF;
         
      END IF;
        
    END PROCESS;

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
   
    ccc: fp_cordic_m1
    GENERIC MAP (width=>cordic_width,depth=>cordic_depth,indexpoint=>indexpoint)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              radians=>radiansnode,
              indexbit=>indexbit,
              sincosbit=>select_sincosff(4),
              sincos=>fixed_sincos);
   
    gfxa: IF (width < 36) GENERATE
      fixed_sincosnode <= fixed_sincos & zerovec(36-width DOWNTO 1);
    END GENERATE;
    gfxb: IF (width = 36) GENERATE
      fixed_sincosnode <= fixed_sincos;
    END GENERATE;
    
    clz: fp_clz36
    PORT MAP (mantissa=>fixed_sincosnode,leading=>countnode);
        
    sft: fp_lsft36  
    PORT MAP (inbus=>fixed_sincosff,shift=>countff,
              outbus=>mantissanormnode);
    
    -- maximum sin or cos = 1.0 = 1.0e127 single precision
    -- 1e128 - 1 (leading one) gives correct number
    exponentnormnode <= "10000000" - ("00" & countff); 
    
    overflownode(1) <= mantissanormnode(12);
    gova: FOR k IN 2 TO 24 GENERATE
      overflownode(k) <= mantissanormnode(k+11) AND overflownode(k-1);
    END GENERATE;
    
    -- OUTPUT
    poa: PROCESS (sysclk,reset)
    BEGIN
        
      IF (reset = '1') THEN
          
        FOR k IN 1 TO 36 LOOP
          fixed_sincosff(k) <= '0';
        END LOOP;
        countff <= "000000";
        FOR k IN 1 TO 23 LOOP
          mantissanormff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 8 LOOP
          exponentnormff(k) <= '0';
        END LOOP;

      ELSIF (rising_edge(sysclk)) THEN
          
        IF (enable = '1') THEN
           
          fixed_sincosff <= fixed_sincosnode; -- level range_depth+cordic_depth+5
          countff <= countnode; -- level range_depth+4+cordic_depth+5

          -- level range_depth+cordic_depth+6
          mantissanormff <= mantissanormnode(35 DOWNTO 13) + mantissanormnode(12);
          exponentnormff <= exponentnormnode(8 DOWNTO 1) + overflownode(24);
          
        END IF;
        
      END IF;
      
    END PROCESS;
    
    mantissaout <= mantissanormff; 
    exponentout <= exponentnormff;
    signout <= signcalcff(cordic_depth+6);    
    
  END rtl;
  
