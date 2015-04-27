
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_TAN1.VHD                               ***
--***                                             ***
--***   Function: Single Precision Floating Point ***
--***   Tangent                                   ***
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

--*** 1. for very top of range (last 256 mantissa lsbs before pi/2), use seperate ROM, not  
--*** calculation
--*** 2. if round up starting when X.49999, errors reduce about 25%, need to tweak this, still getting
--*** all -1 errors with bX.111111111. less errors with less tail bits for smaller exponents (like 122)
--*** more for exponent = 126

ENTITY fp_tan IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1); 
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);

      signout : OUT STD_LOGIC;
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1); 
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1)  
     );
END fp_tan;

ARCHITECTURE rtl of fp_tan IS

  -- input section
  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal mantissainff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentinff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal argumentff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal topargumentff : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal middleargumentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal tanhighmantissaff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal tanmiddleff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal tanhighexponentff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal tanlowsumff : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal shiftin : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal shiftinbus : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal argumentbus : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal tanhighmantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal tanhighexponent : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal tanmiddle : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal deltwo_tailnode : STD_LOGIC_VECTOR (19 DOWNTO 1);
  signal tantailnode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal tanlowsumnode : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal tanlowmantissabus : STD_LOGIC_VECTOR (56 DOWNTO 1);
  
  -- numerator section
  signal tanlowff : STD_LOGIC_VECTOR (56 DOWNTO 1);
  signal numeratorsumff : STD_LOGIC_VECTOR (57 DOWNTO 1);
  signal tanlowshift : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal numeratormantissaff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal numeratorexponentff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal delone_tanhighexponent : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal delthr_tanhighexponent : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal deltwo_tanhighmantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal tanlowbus : STD_LOGIC_VECTOR (56 DOWNTO 1);
  signal numeratorsum : STD_LOGIC_VECTOR (57 DOWNTO 1);
  signal numeratorlead, numeratorleadnode : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal numeratormantissa : STD_LOGIC_VECTOR (36 DOWNTO 1); 
  signal numeratorexponent : STD_LOGIC_VECTOR (5 DOWNTO 1);
  
  -- denominator section
  signal lowleadff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal denominatorleadff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal multshiftff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal denominatorproductff : STD_LOGIC_VECTOR (36 DOWNTO 1); 
  signal denominatorff : STD_LOGIC_VECTOR (36 DOWNTO 1); 
  signal denominatormantissaff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal inverseexponentff : STD_LOGIC_VECTOR (6 DOWNTO 1); 
  signal lowleadnode : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal multshiftnode : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal denominatorproductbus : STD_LOGIC_VECTOR (36 DOWNTO 1); 
  signal denominator : STD_LOGIC_VECTOR (36 DOWNTO 1); 
  signal delone_denominator : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal denominatorlead : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal denominatormantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal delone_tanlowsum : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal lowmantissabus : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal delthr_tanhighmantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multipliernode : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal delfor_tanhighexponent : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal deltwo_lowlead : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal multexponent : STD_LOGIC_VECTOR (6 DOWNTO 1);         
  signal denominatorexponent : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal inverseexponent : STD_LOGIC_VECTOR (6 DOWNTO 1);

  -- divider section
  signal tanexponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal tanexponentnormff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal tanexponentoutff : STD_LOGIC_VECTOR (8 DOWNTO 1); 
  signal tanmantissanormff : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal roundbitff : STD_LOGIC;
  signal mantissaoutff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exponentoutff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal overff : STD_LOGIC;
  signal denominatorinverse : STD_LOGIC_VECTOR (36 DOWNTO 1); 
  signal del_numeratormantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multiplier_tan : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal tanmantissa : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal tanmantissanorm : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal tanmantissatail : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal overcheck : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal del_inverseexponent : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal del_numeratorexponent : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal tanexponent, tanexponentnorm : STD_LOGIC_VECTOR (8 DOWNTO 1); 
  signal exponentoutnode : STD_LOGIC_VECTOR (8 DOWNTO 1); 
  signal mantissaoutnode : STD_LOGIC_VECTOR (23 DOWNTO 1);

  -- small inputs
  signal signff : STD_LOGIC_VECTOR (30 DOWNTO 1);
  signal small_mantissa : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal small_exponent : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentcheck : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal small_inputff : STD_LOGIC_VECTOR (28 DOWNTO 1);
  signal mantissabase : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal exponentbase : STD_LOGIC_VECTOR (8 DOWNTO 1);
   
  component fp_tanlut1 
  PORT (
        add : IN STD_LOGIC_VECTOR (9 DOWNTO 1);
        mantissa : OUT STD_LOGIC_VECTOR (36 DOWNTO 1);
        exponent : OUT STD_LOGIC_VECTOR (5 DOWNTO 1)
       );
   end component;
 
   component fp_tanlut2 
   PORT (
         add : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
         tanfraction : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
        );
   end component;
  
  component fp_clz36
  PORT (
        mantissa : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      
        leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
     );
  end component;

  component fp_clz36x6
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

  component fp_rsft36 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
	end component;

  component fp_rsft56x20  
  PORT (
        inbus : IN STD_LOGIC_VECTOR (56 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (56 DOWNTO 1)
	    );	 
	end component;

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
   	       
BEGIN
    
  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  -- convert to fixed point
  pin: PROCESS (sysclk,reset)
  BEGIN
    
    IF  (reset = '1') THEN
      
      FOR k IN 1 TO 23 LOOP
        mantissainff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        exponentinff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        argumentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 9 LOOP
        topargumentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        middleargumentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        tanhighmantissaff(k) <= '0';
        tanmiddleff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 5 LOOP
        tanhighexponentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 5 LOOP
        tanlowsumff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        mantissainff <= mantissain;
        exponentinff <= exponentin;
        
        argumentff <= argumentbus;
        topargumentff <= argumentff(36 DOWNTO 28);
        middleargumentff <= argumentff(27 DOWNTO 20);
  
        tanhighmantissaff <= tanhighmantissa;
        tanhighexponentff <= tanhighexponent;
        tanmiddleff <= tanmiddle;  
        
        tanlowsumff <= tanlowsumnode;  
           
      END IF;
      
    END IF;
    
  END PROCESS;
  
  shiftin <= 127 - exponentinff;
  shiftinbus <= '1' & mantissainff & zerovec(12 DOWNTO 1);
  
  csftin: fp_rsft36 
  PORT MAP (inbus=>shiftinbus,shift=>shiftin(6 DOWNTO 1),
            outbus=>argumentbus);

  chtt: fp_tanlut1
  PORT MAP (add=>topargumentff,
            mantissa=>tanhighmantissa,
            exponent=>tanhighexponent);
            
  cltt: fp_tanlut2
  PORT MAP (add=>middleargumentff,
           tanfraction=>tanmiddle);
   
  -- in level 2, out level 4        
  dtail: fp_del 
  GENERIC MAP (width=>19,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable, -- use reset to force to ffs here
            aa=>argumentff(19 DOWNTO 1),
            cc=>deltwo_tailnode); 
                   
  tantailnode <= zerovec(8 DOWNTO 1) & deltwo_tailnode & zerovec(9 DOWNTO 1);
  
  tanlowsumnode <= ('0' & tanmiddleff(36 DOWNTO 1)) + ('0' & tantailnode);
  
  tanlowmantissabus <= tanlowsumff & zerovec(19 DOWNTO 1);
  
  --*********************************************
  --*** Align two tangent values for addition ***
  --*********************************************
 
  padd: PROCESS (sysclk,reset)
  BEGIN
    
    IF  (reset = '1') THEN
      
      FOR k IN 1 TO 56 LOOP
        tanlowff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 57 LOOP
        numeratorsumff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        numeratormantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 5 LOOP
        numeratorexponentff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        tanlowff <= tanlowbus;
        numeratorsumff <= numeratorsum;
        numeratormantissaff <= numeratormantissa;
        numeratorexponentff <= numeratorexponent;
          
      END IF;
      
    END IF;
    
  END PROCESS;
  
  -- in level 4, out level 5        
  dhxa: fp_del 
  GENERIC MAP (width=>5,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable, -- use reset to force to ffs here
            aa=>tanhighexponentff,
            cc=>delone_tanhighexponent); 

  -- in level 5, out level 7        
  dhxb: fp_del 
  GENERIC MAP (width=>5,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable, -- use reset to force to ffs here
            aa=>delone_tanhighexponent,
            cc=>delthr_tanhighexponent); 
              
  -- in level 4, out level 6        
  dhm: fp_del 
  GENERIC MAP (width=>36,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable, -- use reset to force to ffs here
            aa=>tanhighmantissaff,
            cc=>deltwo_tanhighmantissa); 
              
  -- tan high mantissa format 1.XXX, tan low mantissa format 0.XXXXX 
  -- tan high exponent base is 119 (top of middle range)
  tanlowshift <= delone_tanhighexponent;
  
  crsadd: fp_rsft56x20
  PORT MAP (inbus=>tanlowmantissabus,
            shift=>tanlowshift,
            outbus=>tanlowbus);
  
  numeratorsum <= ('0' & deltwo_tanhighmantissa & zerovec(20 DOWNTO 1)) + ('0' & tanlowff);
  
  -- level 8
  -- no pipe between clz and shift as only 6 bit shift 
  -- middle exponent is 119, and 2 overflow bits in numerator sum, so this will
  -- cover downto (119+2-6) = 115 exponent
  -- below 115 exponent, output mantissa = input mantissa
  clznuma: fp_clz36x6
  PORT MAP (mantissa=>numeratorsumff(57 DOWNTO 22),
            leading=>numeratorlead);
 
  numeratorleadnode <= "000" & numeratorlead(3 DOWNTO 1); -- force [6:4] to 0 to optimize away logic in LSFT
  clsnuma: fp_lsft36 
  PORT MAP (inbus=>numeratorsumff(57 DOWNTO 22),shift=>numeratorleadnode,
            outbus=>numeratormantissa);
   
  numeratorexponent <= delthr_tanhighexponent - numeratorlead(5 DOWNTO 1) + 1;
            
  --gnnadd: FOR k IN 1 TO 36 GENERATE
  --  numeratormantissa(k) <= (numeratorsumff(k+20) AND NOT(numeratorsumff(57))) OR 
  --                          (numeratorsumff(k+21) AND numeratorsumff(57));
  --END GENERATE;
  --numeratorexponent <= delthr_tanhighexponent + ("0000" & numeratorsumff(57));
  
  --***************************************************
  --*** Align two tangent values for multiplication ***
  --***************************************************  

  pmul: PROCESS (sysclk,reset)
  BEGIN
    
    IF  (reset = '1') THEN

      FOR k IN 1 TO 6 LOOP
        lowleadff(k) <= '0';
        denominatorleadff(k) <= '0';
        inverseexponentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 6 LOOP
        multshiftff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 36 LOOP
        denominatorproductff(k) <= '0';
        denominatorff(k) <= '0';
        denominatormantissaff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        lowleadff <= lowleadnode;
        multshiftff <= multshiftnode;
        denominatorproductff <= denominatorproductbus;
        denominatorff <= denominator;
        denominatorleadff <= denominatorlead;
        denominatormantissaff <= denominatormantissa;
        inverseexponentff <= inverseexponent;
        
      END IF;
      
    END IF;
    
  END PROCESS;
  
  clzmula: fp_clz36
  PORT MAP (mantissa=>tanlowsumff(37 DOWNTO 2),
            leading=>lowleadnode);
  
  -- in level 5, out level 6       
  dlm: fp_del 
  GENERIC MAP (width=>36,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable, -- use reset to force to ffs here
            aa=>tanlowsumff(37 DOWNTO 2),
            cc=>delone_tanlowsum); 
                      
  clsmula: fp_lsft36 
  PORT MAP (inbus=>delone_tanlowsum,shift=>lowleadff,
            outbus=>lowmantissabus);
            
  cma: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>72,
               pipes=>3,synthesize=>0)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,  
            dataaa=>deltwo_tanhighmantissa,
            databb=>lowmantissabus,
            result=>multipliernode);

  -- in level 5, out level 8        
  dhxc: fp_del 
  GENERIC MAP (width=>5,pipes=>3)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable, -- use reset to force to ffs here
            aa=>delone_tanhighexponent,
            cc=>delfor_tanhighexponent); 
  
  -- in level 6, out level 8        
  dlla: fp_del 
  GENERIC MAP (width=>6,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable, -- use reset to force to ffs here
            aa=>lowleadff,
            cc=>deltwo_lowlead); 
                      
  -- msb of lowmantissa(37) is at exponent 0 for highmantissa
  multexponent <= ('0' & delfor_tanhighexponent);
  
  --multshiftnode <= "001000" - multexponent + 8 - 1 + lowlead;
  multshiftnode <= "001111" - multexponent + deltwo_lowlead;
  
  -- '1.0' is at exponent 8 compared to highmantissa 
  crsmul: fp_rsft36 
  PORT MAP (inbus=>multipliernode(72 DOWNTO 37),shift=>multshiftff,
            outbus=>denominatorproductbus);
                
  denominator <= ('1' & zerovec(35 DOWNTO 1)) - denominatorproductff;
  
  -- in level 11, out level 12        
  dda: fp_del 
  GENERIC MAP (width=>36,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable, -- use reset to force to ffs here
            aa=>denominatorff,
            cc=>delone_denominator); 
            
  clzmulb: fp_clz36
  PORT MAP (mantissa=>denominatorff,
            leading=>denominatorlead);
            
  -- denominatormantissa level 12, (denominatormantissaff level 13)
  clsmulb: fp_lsft36 
  PORT MAP (inbus=>delone_denominator,shift=>denominatorleadff,
            outbus=>denominatormantissa); 
            
  denominatorexponent <= denominatorleadff; -- actually inverse of exponent i.e. 4 => -4, so sign does not have to change after inverting
  -- inverseexponentff level 13
  inverseexponent <= denominatorexponent - 1;
 
  --****************************   
  --*** main divider section ***
  --****************************
  
  pdiv: PROCESS (sysclk,reset)
  BEGIN
    
    IF  (reset = '1') THEN

      FOR k IN 1 TO 8 LOOP
        tanexponentff(k) <= '0';
        tanexponentnormff(k) <= '0';
        exponentoutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 24 LOOP
        tanmantissanormff(k) <= '0';
      END LOOP;
      roundbitff <= '0';
      FOR k IN 1 TO 23 LOOP
        mantissaoutff(k) <= '0';
      END LOOP;
      overff <= '0';
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        tanexponentff <= tanexponent; 
        tanmantissanormff <= tanmantissanorm; -- level 29
        tanexponentnormff <= tanexponentnorm;  -- level 29
        overff <= overcheck(24);
        -- round up if 0.4999
        roundbitff <= tanmantissanorm(1) OR 
                     (tanmantissatail(9) AND
                      tanmantissatail(8) AND tanmantissatail(7) AND 
                      tanmantissatail(6) AND tanmantissatail(5) AND
                      tanmantissatail(4) AND tanmantissatail(3) AND 
                      tanmantissatail(2) AND tanmantissatail(1));
         
        mantissaoutff <= mantissaoutnode; -- level 30
        exponentoutff <= exponentoutnode; -- level 30
        
      END IF;
      
    END IF;
    
  END PROCESS;
  
  -- latency 12
  -- will give output between 0.5 and 0.99999...
  -- will always need to be normalized
  -- level 13 in, level 25 out
  cinv: fp_inv_core 
  GENERIC MAP (synthesize=>0) 
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>denominatormantissaff,
            quotient=>denominatorinverse);
   
  -- level 8 in, level 25 out         
	dnuma: fp_del 
  GENERIC MAP (width=>36,pipes=>17)
  PORT MAP (sysclk=>sysclk,reset=>'0',enable=>enable, -- no resets for memory
            aa=>numeratormantissaff,
            cc=>del_numeratormantissa);
   
  -- level 25 in, level 28 out
  cmt: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>72,
               pipes=>3,synthesize=>0)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,  
            dataaa=>del_numeratormantissa,
            databb=>denominatorinverse,
            result=>multiplier_tan);
 
  tanmantissa <= multiplier_tan(72 DOWNTO 37);
  
  gmna: FOR k IN 1 TO 24 GENERATE
    tanmantissanorm(k) <= (tanmantissa(k+9) AND NOT(tanmantissa(35))) OR
                          (tanmantissa(k+10) AND tanmantissa(35));
  END GENERATE;
  gmnb: FOR k IN 1 TO 9 GENERATE
    tanmantissatail(k) <= (tanmantissa(k) AND NOT(tanmantissa(35))) OR
                          (tanmantissa(k+1) AND tanmantissa(35));
  END GENERATE;
  
  overcheck(1) <= tanmantissanorm(1);
  gova: FOR k IN 2 TO 24 GENERATE
    overcheck(k) <= overcheck(k-1) AND tanmantissanorm(k); 
  END GENERATE;
    
  -- level 13 in, level 27 out
  ddena: fp_del 
  GENERIC MAP (width=>6,pipes=>14)
  PORT MAP (sysclk=>sysclk,reset=>'0',enable=>enable, -- no resets for memory
            aa=>inverseexponentff,
            cc=>del_inverseexponent); 
  
  -- level 8 in, level 27 out         
	dnumb: fp_del 
  GENERIC MAP (width=>5,pipes=>19)
  PORT MAP (sysclk=>sysclk,reset=>'0',enable=>enable, -- no resets for memory
            aa=>numeratorexponentff,
            cc=>del_numeratorexponent); 
                      
  tanexponent <= "01110111" + 
                (del_numeratorexponent(5) & del_numeratorexponent(5) & del_numeratorexponent(5) & del_numeratorexponent) + 
                (del_inverseexponent(6) & del_inverseexponent(6) & del_inverseexponent); -- 119 + exponent
  
  tanexponentnorm <= tanexponentff + tanmantissa(35);
  
  --*** handle small inputs ****
  dsma: fp_del
  GENERIC MAP (width=>23,pipes=>29)
  PORT MAP (sysclk=>sysclk,reset=>'0',enable=>enable, -- no resets for memory
            aa=>mantissain,
            cc=>small_mantissa); 
  dsxa: fp_del
  GENERIC MAP (width=>8,pipes=>29)
  PORT MAP (sysclk=>sysclk,reset=>'0',enable=>enable, -- no resets for memory
            aa=>exponentin,
            cc=>small_exponent); 
        
  exponentcheck <= exponentinff - 115;
                
  psa: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
      
      FOR k IN 1 TO 30 LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 28 LOOP
        small_inputff(k) <= '0';
      END LOOP;
    
    ELSIF(rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
         
        signff(1) <= signin;
        FOR k IN 2 TO 30 LOOP
          signff(k) <= signff(k-1);
        END LOOP;
           
        small_inputff(1) <= exponentcheck(8);
        FOR k IN 2 TO 28 LOOP
          small_inputff(k) <= small_inputff(k-1);
        END LOOP;
        
      END IF;
    
    END IF;
  
  END PROCESS;
  
  --mantissabase(1) <= (tanmantissanormff(1) AND NOT(small_inputff(28)));
  mantissabase(1) <= (roundbitff AND NOT(small_inputff(28)));
  gmba: FOR k IN 2 TO 24 GENERATE
    mantissabase(k) <= (small_mantissa(k-1) AND small_inputff(28)) OR
                       (tanmantissanormff(k) AND NOT(small_inputff(28)));
  END GENERATE;
  gxba: FOR k IN 1 TO 8 GENERATE
    exponentbase(k) <= (small_exponent(k) AND small_inputff(28)) OR
                       (tanexponentnormff(k) AND NOT(small_inputff(28)));
  END GENERATE;

  mantissaoutnode <= mantissabase(24 DOWNTO 2) + mantissabase(1);  

  exponentoutnode <= exponentbase + (overff AND NOT(small_inputff(28)));
  
  --***************
  --*** OUTPUTS ***
  --***************
  
  signout <= signff(30);
  mantissaout <= mantissaoutff;
  exponentout <= exponentoutff;
  
END rtl;

