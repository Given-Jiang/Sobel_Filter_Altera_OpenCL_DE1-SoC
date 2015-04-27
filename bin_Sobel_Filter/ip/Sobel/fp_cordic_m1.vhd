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
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_CORDIC_M1.VHD                          ***
--***                                             ***
--***   Function: SIN and COS CORDIC with early   ***
--***   Termination Algorithm (Multiplier)        ***
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

--***************************************************
--*** Notes:                                      ***
--*** 1. estimates lower iterations of cordic     ***
--*** using Z value and multiplier                ***
--*** 2. multiplier at level (depth-4) for best   ***
--*** results try depth = width/2+4               ***
--***************************************************
 
ENTITY fp_cordic_m1 IS
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
      sincosbit : IN STD_LOGIC; -- 0 = cos, 1 = sin

      sincos : OUT STD_LOGIC_VECTOR (width DOWNTO 1)     
     );
END fp_cordic_m1;

ARCHITECTURE rtl of fp_cordic_m1 IS
  
  constant cordic_depth : positive := depth - 4;
  
  type datapathtype IS ARRAY (cordic_depth DOWNTO 1) OF STD_LOGIC_VECTOR (width DOWNTO 1);
  type atantype IS ARRAY (cordic_depth DOWNTO 1) OF STD_LOGIC_VECTOR (width DOWNTO 1);

  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal indexpointnum, startindex : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal indexbitff : STD_LOGIC_VECTOR (cordic_depth+3 DOWNTO 1);
  signal sincosbitff : STD_LOGIC_VECTOR (cordic_depth+3 DOWNTO 1);
  signal x_start_node : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal radians_load_node : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal x_pipeff : datapathtype;
  signal y_pipeff : datapathtype;
  signal z_pipeff : datapathtype;
  signal x_prenode, x_prenodeone, x_prenodetwo : datapathtype;
  signal x_subnode, x_pipenode : datapathtype;
  signal y_prenode, y_prenodeone, y_prenodetwo  : datapathtype;
  signal y_subnode, y_pipenode : datapathtype;
  signal z_subnode, z_pipenode : datapathtype;
  signal atannode : atantype;

  signal multiplier_input : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal multipliernode : STD_LOGIC_VECTOR (2*width DOWNTO 1);
  signal sincosff : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal delay_input : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal delay_pipe : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal pre_estimate : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal estimate : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal post_estimate : STD_LOGIC_VECTOR (width DOWNTO 1);
  
  component fp_cordic_start1
  GENERIC (width : positive := 36);
  PORT (
        index : IN STD_LOGIC_VECTOR (4 DOWNTO 1);    

        value : OUT STD_LOGIC_VECTOR (width DOWNTO 1)     
       );
  end component;
   
  component fp_cordic_atan1
  GENERIC (start : positive := 32;
           width : positive := 32;
           indexpoint : positive := 1);
  PORT (
        indexbit : IN STD_LOGIC;

	      arctan : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
	    );
	end component;
	  
  component fp_sgn_mul3s
  GENERIC (
           widthaa : positive := 18;
           widthbb : positive := 18;
           widthcc : positive := 36
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
    
BEGIN
 
  -- maximum width supported = 36 (width of start table)
  -- depth <= width
  -- maximum indexpoint = 10 (atan_table width - 10 > maximum width)
  gprma: IF (width > 36) GENERATE
    assert false report "maximum width is 36" severity error;
  END GENERATE;
  gprmb: IF (depth > width) GENERATE
    assert false report "depth cannot exceed (width-6)" severity error;
  END GENERATE;
  gprmc: IF (indexpoint > 10) GENERATE
    assert false report "maximum indexpoint is 10" severity error;
  END GENERATE;
     
  -- max radians = 1.57 = 01100100....
  -- max atan(2^-0)= 0.785 = 00110010.....
  -- x start (0.607) = 0010011011....

  indexpointnum <= conv_std_logic_vector (indexpoint,4);

  gipa: FOR k IN 1 TO 4 GENERATE
    startindex(k) <= indexpointnum(k) AND indexbit;
  END GENERATE;
  
  cxs: fp_cordic_start1
  GENERIC MAP (width=>width)
  PORT MAP (index=>startindex,value=>x_start_node);
  
  gra: FOR k IN 1 TO indexpoint GENERATE
    radians_load_node(k) <= (radians(k) AND NOT(indexbit));
  END GENERATE;
  grb: FOR k IN indexpoint+1 TO width GENERATE
    radians_load_node(k) <= (radians(k) AND NOT(indexbit)) OR 
                            (radians(k-indexpoint) AND indexbit);
  END GENERATE;
       
  zerovec <= x"000000000";
  
  ppa: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO cordic_depth+3 LOOP
        indexbitff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO cordic_depth+3 LOOP
        sincosbitff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO cordic_depth LOOP
        FOR j IN 1 TO width LOOP
          x_pipeff(k)(j) <= '0';
          y_pipeff(k)(j) <= '0';
          z_pipeff(k)(j) <= '0';
        END LOOP;
      END LOOP;
    
    ELSIF(rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        indexbitff(1) <= indexbit;
        FOR k IN 2 TO cordic_depth+3 LOOP
          indexbitff(k) <= indexbitff(k-1);
        END LOOP;
        
        sincosbitff(1) <= sincosbit;
        FOR k IN 2 TO cordic_depth+3 LOOP
          sincosbitff(k) <= sincosbitff(k-1);
        END LOOP;
        
        x_pipeff(1)(width DOWNTO 1) <= x_start_node;
        y_pipeff(1)(width DOWNTO 1) <= conv_std_logic_vector(0,width);
        z_pipeff(1)(width DOWNTO 1) <= radians_load_node;   
      
        -- z(1) always positive
        x_pipeff(2)(width DOWNTO 1) <= x_pipeff(1)(width DOWNTO 1); -- subtraction value always 0 here anyway
        y_pipeff(2)(width DOWNTO 1) <= y_pipeff(1)(width DOWNTO 1) + y_subnode(2)(width DOWNTO 1);
        z_pipeff(2)(width DOWNTO 1) <= z_pipeff(1)(width DOWNTO 1) - atannode(1)(width DOWNTO 1);
        
        FOR k IN 3 TO cordic_depth LOOP
          x_pipeff(k)(width DOWNTO 1) <= x_pipenode(k)(width DOWNTO 1);
          y_pipeff(k)(width DOWNTO 1) <= y_pipenode(k)(width DOWNTO 1);
          z_pipeff(k)(width DOWNTO 1) <= z_pipenode(k)(width DOWNTO 1);
        END LOOP;
        
      END IF;
      
    END IF;
  
  END PROCESS;
  
  gya: FOR k IN 1 TO width-indexpoint GENERATE
    y_subnode(2)(k) <= (x_pipeff(1)(k) AND NOT indexbitff(1)) OR (x_pipeff(1)(k+indexpoint) AND indexbitff(1));
  END GENERATE;
  gyb: FOR k IN (width-(indexpoint-1)) TO width GENERATE
    y_subnode(2)(k) <= (x_pipeff(1)(k) AND NOT indexbitff(1));
  END GENERATE;
  
  gpa: FOR k IN 3 TO cordic_depth GENERATE
    gpb: FOR j IN width+3-k TO width GENERATE
      x_prenodeone(k)(j) <= NOT(y_pipeff(k-1)(width));
      y_prenodeone(k)(j) <= x_pipeff(k-1)(width);
    END GENERATE;
    gpc: FOR j IN width+3-indexpoint-k TO width GENERATE
      x_prenodetwo(k)(j) <= NOT(y_pipeff(k-1)(width));
      y_prenodetwo(k)(j) <= x_pipeff(k-1)(width);
    END GENERATE;
    gpd: FOR j IN 1 TO width+2-k GENERATE
      x_prenodeone(k)(j) <= NOT(y_pipeff(k-1)(j+k-2));
      y_prenodeone(k)(j) <= x_pipeff(k-1)(j+k-2);
    END GENERATE;
    gpe: FOR j IN 1 TO width+2-indexpoint-k GENERATE
      x_prenodetwo(k)(j) <= NOT(y_pipeff(k-1)(j+k-2+indexpoint));
      y_prenodetwo(k)(j) <= x_pipeff(k-1)(j+k-2+indexpoint);
    END GENERATE;
    
    gpf: FOR j IN 1 TO width GENERATE
      x_prenode(k)(j) <= (x_prenodeone(k)(j) AND NOT(indexbitff(k-1))) OR 
                         (x_prenodetwo(k)(j) AND indexbitff(k-1));
      y_prenode(k)(j) <= (y_prenodeone(k)(j) AND NOT(indexbitff(k-1))) OR 
                         (y_prenodetwo(k)(j) AND indexbitff(k-1));
    END GENERATE;
    
    gpg: FOR j IN 1 TO width GENERATE
      x_subnode(k)(j) <= x_prenode(k)(j) XOR z_pipeff(k-1)(width);
      y_subnode(k)(j) <= y_prenode(k)(j) XOR z_pipeff(k-1)(width);
      z_subnode(k)(j) <= NOT(atannode(k-1)(j)) XOR z_pipeff(k-1)(width);
    END GENERATE;

    x_pipenode(k)(width DOWNTO 1) <= x_pipeff(k-1)(width DOWNTO 1) + 
                                     x_subnode(k)(width DOWNTO 1) + z_pipeff(k-1)(width);
                                     
    y_pipenode(k)(width DOWNTO 1) <= y_pipeff(k-1)(width DOWNTO 1) + 
                                     y_subnode(k)(width DOWNTO 1) + z_pipeff(k-1)(width);
                                     
    z_pipenode(k)(width DOWNTO 1) <= z_pipeff(k-1)(width DOWNTO 1) + 
                                     z_subnode(k)(width DOWNTO 1) + z_pipeff(k-1)(width);

  END GENERATE;
  
  gata: FOR k IN 1 TO cordic_depth GENERATE
    cata: fp_cordic_atan1
    GENERIC MAP (start=>k,width=>width,indexpoint=>indexpoint)
    PORT MAP (indexbit=>indexbitff(k),arctan=>atannode(k)(width DOWNTO 1));
  END GENERATE;
	
	gma: FOR k IN 1 TO width GENERATE
	  multiplier_input(k) <= (x_pipeff(cordic_depth)(k) AND sincosbitff(cordic_depth)) OR
	                         (y_pipeff(cordic_depth)(k) AND NOT(sincosbitff(cordic_depth)));
	  delay_input(k) <= (x_pipeff(cordic_depth)(k) AND NOT(sincosbitff(cordic_depth))) OR
	                    (y_pipeff(cordic_depth)(k) AND sincosbitff(cordic_depth));
	END GENERATE;
  
  cmx: fp_sgn_mul3s
  GENERIC MAP (widthaa=>width,widthbb=>width,widthcc=>2*width)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>multiplier_input,
            databb=>z_pipeff(cordic_depth)(width DOWNTO 1),
            result=>multipliernode);
	
  pma: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
      FOR k IN 1 TO width LOOP
        sincosff(k) <= '0';
      END LOOP;
    ELSIF(rising_edge(sysclk)) THEN
      IF (enable = '1') THEN     
        sincosff <= delay_pipe + post_estimate + NOT(sincosbitff(cordic_depth+3));
      END IF; 
    END IF;  
  END PROCESS;
  
  pre_estimate <= multipliernode(2*width-2 DOWNTO width-1);
  gea: FOR k IN 1 TO width-indexpoint GENERATE
    estimate(k) <= (pre_estimate(k) AND NOT(indexbitff(cordic_depth+3))) OR
                   (pre_estimate(k+indexpoint) AND indexbitff(cordic_depth+3));
  END GENERATE;
  geb: FOR k IN width-indexpoint+1 TO width GENERATE
    estimate(k) <= (pre_estimate(k) AND NOT(indexbitff(cordic_depth+3))) OR
                   (pre_estimate(width) AND indexbitff(cordic_depth+3));
  END GENERATE;
  -- add estimate for sin, subtract for cos
  gec: FOR k IN 1 TO width GENERATE
    post_estimate(k) <= estimate(k) XOR NOT(sincosbitff(cordic_depth+3));
  END GENERATE;
  
  cda: fp_del
  GENERIC MAP (width=>width,pipes=>3)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>delay_input,
            cc=>delay_pipe);

  sincos <= sincosff;
      
END rtl;
