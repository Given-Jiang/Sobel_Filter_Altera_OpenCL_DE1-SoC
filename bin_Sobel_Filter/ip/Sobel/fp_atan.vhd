
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_ATAN.VHD                              ***
--***                                             ***
--***   Function: Single Precision Floating Point ***
--***   ArcTangent                                ***
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
--*** NOTES                                       ***
--***************************************************
-- slight improvement when "roundbit" is used i.e. round up from
-- X.4999 - exact number of bits to be used needs to be tweaked

ENTITY fp_atan IS 
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
END fp_atan;

ARCHITECTURE rtl OF fp_atan IS
  
  constant coredepth : positive := 12;
  
  constant b_precision : positive := 10;
  
  type exponentinfftype IS ARRAY (coredepth-2 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  type exponenttopfftype IS ARRAY (coredepth-3 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  type mantissabpfftype IS ARRAY (2*coredepth+10 DOWNTO 1) OF STD_LOGIC_VECTOR (23 DOWNTO 1); -- SPR: 380600
  type termfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal pi_over_two : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal inputnumber : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal delinputnumber : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal topquotient : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal topquotientnumber : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal exponentoffset : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal exponentinff : exponentinfftype;
  signal idselectff : STD_LOGIC_VECTOR (2*coredepth+10 DOWNTO 1); -- SPR: 380600
  signal pathselectff : STD_LOGIC_VECTOR (2*coredepth+9 DOWNTO 1);
  signal exponenttopff : exponenttopfftype;
  signal forward_shiftff, inverse_shiftff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal a_shiftff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal a_fixedpointff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal a_fixedpointbus : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal a_mantissanode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal pathcheck : STD_LOGIC_VECTOR (9 DOWNTO 1);

  signal a_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal b_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal c_fixedpoint : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal ab_fixedpoint : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal ab_plusone : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal numerator, denominator : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal addterm : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal b_address : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal lutterm : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal dellutterm : STD_LOGIC_VECTOR (36 DOWNTO 1);
  
  signal signff : STD_LOGIC_VECTOR (2*coredepth+11 DOWNTO 1);
  signal mantissabpff : mantissabpfftype; -- SPR: 380600
  signal atantermff : termfftype;
  signal large_atanff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal small_mantissa, small_mantissaff : STD_LOGIC_VECTOR (36 DOWNTO 1); 
  signal large_mantissa, large_mantissaff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal mux_mantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal small_count, small_countff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal small_overflowbus, large_overflowbus : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal small_overflowff, large_overflowff : STD_LOGIC;
  signal mux_overflow : STD_LOGIC;
  signal roundbit : STD_LOGIC;
  signal mantissa_roundff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal mantissa_bypass : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponent_outff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal small_exponent_adjust, large_exponent_adjust : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponent_adjust, exponent_adjustff : STD_LOGIC_VECTOR (8 DOWNTO 1);

  -- SPR: 380600
  signal expinzero : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal expzero : STD_LOGIC;
  
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

  component fp_clz36
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
	       	    
BEGIN
        
  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pi_over_two <= x"C90FDAA22"; -- 1.57...
  
  --*** Invert Input ***
  inputnumber <= '1' & mantissain & "000000000000";

  -- will give output between 0.5 and 0.99999...
  -- will always need to be normalized
  invcore: fp_inv_core
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>inputnumber,
            quotient=>topquotient);
      
  exponentoffset <= conv_std_logic_vector (127,10);
  
  pinx: PROCESS (sysclk,reset)
  BEGIN
    
    IF  (reset = '1') THEN
      
      FOR k IN 1 TO coredepth-2 LOOP
        FOR j IN 1 TO 8 LOOP
          exponentinff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO 2*coredepth+9 LOOP
        pathselectff(k) <= '0';
      END LOOP;
	  -- SPR: 380600
      FOR k IN 1 TO 2*coredepth+10 LOOP
        idselectff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO coredepth-3 LOOP
        FOR j IN 1 TO 10 LOOP
          exponenttopff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO 10 LOOP
        forward_shiftff(k) <= '0';
        inverse_shiftff(k) <= '0';
        a_shiftff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        a_fixedpointff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        exponentinff(1)(8 DOWNTO 1) <= exponentin;
        FOR k IN 2 TO coredepth-2 LOOP
          exponentinff(k)(8 DOWNTO 1) <= exponentinff(k-1)(8 DOWNTO 1);
        END LOOP;
        
        pathselectff(1) <= pathcheck(9);
        FOR k IN 2 TO 2*coredepth+9 LOOP
          pathselectff(k) <= pathselectff(k-1); 
        END LOOP;
		
		-- SPR: 380600
		idselectff(1) <= expzero;
        FOR k IN 2 TO 2*coredepth+10 LOOP
          idselectff(k) <= idselectff(k-1); 
        END LOOP;
        
        -- exponent for inverse, used when exponent > 126
        exponenttopff(1)(10 DOWNTO 1) <= exponentoffset - ("00" & exponentinff(1)(8 DOWNTO 1));
        exponenttopff(2)(10 DOWNTO 1) <= exponenttopff(1)(10 DOWNTO 1) + exponentoffset;
        exponenttopff(3)(10 DOWNTO 1) <= exponenttopff(2)(10 DOWNTO 1) - 1;
        -- inverse always less than 1, decrement exponent
        FOR k IN 4 TO coredepth-3 LOOP
          exponenttopff(k)(10 DOWNTO 1) <= exponenttopff(k-1)(10 DOWNTO 1);
        END LOOP;
        
        forward_shiftff <= "0001111111" - ("00" & exponentinff(coredepth-2)(8 DOWNTO 1));
        inverse_shiftff <= "0001111111" - exponenttopff(coredepth-3)(10 DOWNTO 1);
        
        FOR k IN 1 TO 6 LOOP
          a_shiftff(k) <= (forward_shiftff(k) AND NOT(pathselectff(coredepth-2))) OR 
                          (inverse_shiftff(k) AND     pathselectff(coredepth-2)); 
        END LOOP;
        
        a_fixedpointff <= a_fixedpointbus;
   
      END IF;
      
    END IF;
    
  END PROCESS;    

  -- if <=126 (<= 0.999999), use atan(x) path, else use (pi/2-atan(1/x)) path
  pathcheck <= "001111110" - ('0' & exponentinff(1)(8 DOWNTO 1));
  
  cdma: fp_del 
  GENERIC MAP (width=>36,pipes=>coredepth)  -- 12 for inv_core
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>inputnumber,
            cc=>delinputnumber);
            
  topquotientnumber <= topquotient(35 DOWNTO 1) & '0';
  gma: FOR k IN 1 TO 36 GENERATE
    a_mantissanode(k) <= (delinputnumber(k)    AND NOT(pathselectff(coredepth-1))) OR
                         (topquotientnumber(k) AND     pathselectff(coredepth-1));
  END GENERATE;

  casr: fp_rsft36
  PORT MAP (inbus=>a_mantissanode,shift=>a_shiftff(6 DOWNTO 1),
            outbus=>a_fixedpointbus);
      
  a_fixedpoint <= a_fixedpointff;    
  b_fixedpoint <= a_fixedpointff(36 DOWNTO 37-b_precision) & zerovec(36-b_precision DOWNTO 1);
  c_fixedpoint <= a_fixedpointff(36-b_precision DOWNTO 1) & zerovec(b_precision DOWNTO 1); 
  
  cmone: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>37,
               pipes=>3)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>a_fixedpoint,databb=>b_fixedpoint,
            result=>ab_fixedpoint);
            
  ab_plusone <= '1' & ab_fixedpoint(35 DOWNTO 1); -- ab_fixedpoint always 1/4 true value
            
  invtwo: fp_inv_core
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>ab_plusone,
            quotient=>denominator);
  
  cdc: fp_del 
  GENERIC MAP (width=>36,pipes=>coredepth+3)  -- inv_core and 3 for 36*36 mult
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>c_fixedpoint,
            cc=>numerator);
                      
  cmtwo: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>36,
               pipes=>3)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>numerator,databb=>denominator,
            result=>addterm);         

  b_address <= a_fixedpoint(36 DOWNTO 37-b_precision);
 
  clut: fp_atanlut
  PORT MAP (add=>b_address,
            data=>lutterm);
            
  cdlut: fp_del 
  GENERIC MAP (width=>36,pipes=>18)  -- 12 for inv_core and 3 for 36*36 mult
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>lutterm,
            cc=>dellutterm);
  
  pimo: PROCESS (sysclk,reset)
  BEGIN
    
    IF  (reset = '1') THEN
      
      FOR k IN 1 TO 2*coredepth+11 LOOP
        signff(k) <= '0';
      END LOOP;
	  
	  -- SPR: 380600
      FOR k IN 1 TO 2*coredepth+10 LOOP
		FOR j IN 1 TO 23 LOOP
		  mantissabpff(k)(j) <= '0';
		END LOOP;
      END LOOP;
	  
      FOR k IN 1 TO 36 LOOP
        atantermff(1)(k) <= '0';
        atantermff(2)(k) <= '0';
        large_atanff(k) <= '0';
        small_mantissaff(k) <= '0';
        large_mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 6 LOOP
        small_countff(k) <= '0';
      END LOOP;
      small_overflowff <= '0';
      large_overflowff <= '0';
      FOR k IN 1 TO 23 LOOP
        mantissa_roundff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        exponent_outff(k) <= '0';
      END LOOP;

    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        signff(1) <= signin;
		mantissabpff(1)(23 DOWNTO 1) <= mantissain(23 DOWNTO 1);
        FOR k IN 2 TO 2*coredepth+11 LOOP
          signff(k) <= signff(k-1);
        END LOOP;
		
		-- SPR: 380600
        FOR k IN 2 TO 2*coredepth+10 LOOP
		  mantissabpff(k)(23 DOWNTO 1) <= mantissabpff(k-1)(23 DOWNTO 1);
        END LOOP;
        
        atantermff(1)(36 DOWNTO 1) <= dellutterm + (zerovec(9 DOWNTO 1) & addterm(36 DOWNTO 10));
        atantermff(2)(36 DOWNTO 1) <= atantermff(1)(36 DOWNTO 1);
        
        -- always in the range 0.78 to pi/2
        large_atanff(36 DOWNTO 1) <= pi_over_two - atantermff(1)(36 DOWNTO 1);
            
        small_countff <= small_count;

        large_mantissaff <= large_mantissa;
        small_mantissaff <= small_mantissa;
        
        small_overflowff <= small_overflowbus(24);
        large_overflowff <= large_overflowbus(24);
        
        exponent_adjustff <= exponent_adjust;
        
        --mantissa_roundff <= mux_mantissa(35 DOWNTO 13) + mux_mantissa(12);
        mantissa_roundff <= mux_mantissa(35 DOWNTO 13) + roundbit;
        exponent_outff <= "01111111" - exponent_adjustff + mux_overflow;
        
      END IF;
      
    END IF;
    
  END PROCESS;  
  
  roundbit <= mux_mantissa(12) OR 
             (mux_mantissa(11) AND mux_mantissa(10) AND mux_mantissa(9) AND mux_mantissa(8) AND 
              mux_mantissa(7)  AND mux_mantissa(6)  AND mux_mantissa(5) AND mux_mantissa(4) AND 
              mux_mantissa(3)  AND mux_mantissa(2));

  ccsat: fp_clz36
  PORT MAP (mantissa=>atantermff(1)(36 DOWNTO 1),
            leading=>small_count);
  
  cssat: fp_lsft36
  PORT MAP (inbus=>atantermff(2)(36 DOWNTO 1),shift=>small_countff,
            outbus=>small_mantissa);
            
  small_overflowbus(1) <= small_mantissa(12);
  gova: FOR k IN 2 TO 24 GENERATE
    small_overflowbus(k) <= small_overflowbus(k-1) AND small_mantissa(k+11);
  END GENERATE;
            
  glma: FOR k IN 1 TO 35 GENERATE
    large_mantissa(k+1) <= (large_atanff(k)   AND NOT(large_atanff(36))) OR
                           (large_atanff(k+1) AND     large_atanff(36));
  END GENERATE;
  large_mantissa(1) <= '0';

  large_overflowbus(1) <= large_mantissa(12);
  govb: FOR k IN 2 TO 24 GENERATE
    large_overflowbus(k) <= large_overflowbus(k-1) AND large_mantissa(k+11);
  END GENERATE;
  
  gmma: FOR k IN 1 TO 36 GENERATE
    mux_mantissa(k) <= (small_mantissaff(k) AND NOT(pathselectff(2*coredepth+9))) OR
                       (large_mantissaff(k) AND     pathselectff(2*coredepth+9));
  END GENERATE;
  
  mux_overflow <= (small_overflowff AND NOT(pathselectff(2*coredepth+9))) OR
                  (large_overflowff AND     pathselectff(2*coredepth+9));
  
  large_exponent_adjust <= "0000000" & NOT(large_atanff(36));
  small_exponent_adjust <= "00" & small_countff;
  gxa: FOR k IN 1 TO 8 GENERATE
    exponent_adjust(k) <= (small_exponent_adjust(k) AND NOT(pathselectff(2*coredepth+8))) OR
                          (large_exponent_adjust(k) AND     pathselectff(2*coredepth+8));
  END GENERATE;
  
  -- SPR: 380600
  bypass: FOR k IN 1 TO 23 GENERATE
    mantissa_bypass(k) <= (mantissa_roundff(k) AND NOT(idselectff(2*coredepth+10))) OR
							(mantissabpff(2*coredepth+10)(k) AND idselectff(2*coredepth+10));
  END GENERATE;

  -- SPR: 380600
  expinzero(1) <= exponentinff(1)(1);
  gxza: FOR k IN 2 TO 8 GENERATE
    expinzero(k) <= expinzero(k-1) OR exponentinff(1)(k);
  END GENERATE;
  expzero <= NOT(expinzero(8)); -- '0' when zero

  --*** OUTPUTS ***
  signout <= signff(2*coredepth+11);
  exponentout <= (others => '0') when idselectff(2*coredepth+10) = '1' else exponent_outff; -- SPR: 380600
  mantissaout <= mantissa_bypass;

end rtl;

		    
