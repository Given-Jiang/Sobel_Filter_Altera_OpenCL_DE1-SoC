
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CONVERSION - TOP LEVEL     ***
--***                                             ***
--***   DP_FLOATFIX.VHD                           ***
--***                                             ***
--***   Function: Convert Floating Point to Fixed ***
--***   Point Number                              ***
--***                                             ***
--***   07/12/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** LATENCY :                                   ***
--***           speed = 0 : 3                     ***
--***           speed = 1 : 5                     ***
--***************************************************

--***************************************************
--*** OUTPUT FORMAT - UNSIGNED                    ***
--*** maximum number is (2^decimal)-1, else       ***
--*** saturate. if input negative, zero output    ***
--*** OUTPUT FORMAT - SIGNED                      ***
--*** maximum number is (2^decimal-1)-1, else     ***
--*** saturate                                    ***
--***************************************************

ENTITY dp_floatfix IS
GENERIC (
         unsigned : integer := 1;  -- unsigned = 0, signed = 1
         decimal : integer := 14;
         fractional : integer := 6;
         precision : integer := 0; -- single = 0, double = 1
         speed : integer := 0 -- low speed = 0, high speed = 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      sign : IN STD_LOGIC;
      exponent : IN STD_LOGIC_VECTOR (8+3*precision DOWNTO 1);
      mantissa : IN STD_LOGIC_VECTOR (23+29*precision DOWNTO 1);
      
      fixed_number : OUT STD_LOGIC_VECTOR (decimal+fractional DOWNTO 1)
     );
END dp_floatfix;

ARCHITECTURE rtl of dp_floatfix IS

  constant fixed_width : positive := decimal + fractional;
  constant mantissa_width : positive := 23 + 29*precision;
  constant exponent_width : positive := 8 + 3*precision;
  constant exponent_base_number : positive := 127+896*precision;
  
  -- input stage
  signal zerovec : STD_LOGIC_VECTOR (116 DOWNTO 1);
  signal exponent_base_node : STD_LOGIC_VECTOR (exponent_width+1 DOWNTO 1);
  signal saturate_check : STD_LOGIC_VECTOR (exponent_width+1 DOWNTO 1);
  signal saturate_output, zero_output : STD_LOGIC;
  signal saturate_apply, zero_apply : STD_LOGIC;
  signal sign_apply : STD_LOGIC;
  signal signed_mantissa_node : STD_LOGIC_VECTOR (mantissa_width+2 DOWNTO 1);
  signal signed_mantissa_comp : STD_LOGIC_VECTOR (mantissa_width+2 DOWNTO 1);
  signal signed_mantissa : STD_LOGIC_VECTOR (mantissa_width+2 DOWNTO 1);
  signal input_vector : STD_LOGIC_VECTOR (116 DOWNTO 1);
  signal negexponent : STD_LOGIC_VECTOR (exponent_width DOWNTO 1);
  signal expbase, negexpbase : STD_LOGIC_VECTOR (exponent_width DOWNTO 1);
  signal leftshift, rightshift : STD_LOGIC_VECTOR (exponent_width DOWNTO 1);
  -- shift stage
  signal leftbus, rightbus : STD_LOGIC_VECTOR (116 DOWNTO 1);
  signal shiftbus, shiftbusff : STD_LOGIC_VECTOR (fixed_width DOWNTO 1);
  signal select_bit : STD_LOGIC;
  -- output stage
  signal fixed_numberff : STD_LOGIC_VECTOR (fixed_width DOWNTO 1);
    
  component dp_addpipe IS
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
   
  component dp_lsft64x64 IS
  PORT (
        inbus : IN STD_LOGIC_VECTOR (116 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);      
        
        outbus : OUT STD_LOGIC_VECTOR (116 DOWNTO 1)    
       );
  end component;
  
  component dp_lsftpipe64x64 IS
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (116 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);      
        
        outbus : OUT STD_LOGIC_VECTOR (116 DOWNTO 1)    
       );
  end component;
  
  component dp_rsft64x64 IS
  PORT (
        inbus : IN STD_LOGIC_VECTOR (116 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);      
        
        outbus : OUT STD_LOGIC_VECTOR (116 DOWNTO 1)    
       );
  end component;
  
  component dp_rsftpipe64x64 IS
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (116 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);      
        
        outbus : OUT STD_LOGIC_VECTOR (116 DOWNTO 1)    
       );
  end component;
  
  component fp_delbit IS 
  GENERIC (
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC; 
      
        cc : OUT STD_LOGIC
       );
 end component;
  
BEGIN
  
  gera : IF NOT((unsigned = 0) OR 
	             (unsigned = 1)) GENERATE
	 assert false report "unsigned must be 0 or 1" severity error;
  END GENERATE;
    
  gerb : IF NOT((precision = 0) OR 
	             (precision = 1)) GENERATE
	 assert false report "precision must be 0 (single precision) or 1 (double precision)" severity error;
  END GENERATE;
  
  gerc : IF NOT((speed = 0) OR 
	             (speed = 1)) GENERATE
	 assert false report "speed must be 0 or 1" severity error;
  END GENERATE;
 
  gerd : IF (decimal < 2) GENERATE
	 assert false report "decimal must be greater than 2" severity error;
  END GENERATE;
  
  gere : IF (fixed_width > 64) GENERATE
	 assert false report "maximum fixed point precision must be 64 or less" severity error;
  END GENERATE; 

  gza: FOR k IN 1 TO 116 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  --*** LEVEL 1-2 ***
  -- level 1 if speed = 0
  -- level 2 if speed = 1
  
  -- check for zero and saturate conditions
  exponent_base_node <= conv_std_logic_vector(exponent_base_number,exponent_width+1);
  
  gzsa: IF (unsigned = 0) GENERATE
    saturate_check <= exponent - exponent_base_node - decimal;
    -- '1' when condition true
    saturate_output <= NOT(saturate_check(exponent_width+1));
    zero_output <= sign;
  END GENERATE;
  
  gzsb: IF (unsigned = 1) GENERATE
    saturate_check <= exponent - exponent_base_node - decimal + 1;
    -- '1' when condition true
    saturate_output <= NOT(saturate_check(exponent_width+1));
    zero_output <= '0';
    
    dss: fp_delbit
    GENERIC MAP (pipes=>2+2*speed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>sign,
              cc=>sign_apply);
              
  END GENERATE;
  
  ds: fp_delbit
  GENERIC MAP (pipes=>2+2*speed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>saturate_output,
              cc=>saturate_apply);
              
  dz: fp_delbit
  GENERIC MAP (pipes=>2+2*speed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>zero_output,
              cc=>zero_apply);
               
  signed_mantissa_node <= "01" & mantissa;
  gsma: FOR k IN 1 TO mantissa_width+2 GENERATE
    signed_mantissa_comp(k) <= signed_mantissa_node(k) XOR sign;
  END GENERATE;
  
  addtop: dp_addpipe
  GENERIC MAP (width=>mantissa_width+2,pipes=>speed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>signed_mantissa_comp,bb=>zerovec(mantissa_width+2 DOWNTO 1),
            carryin=>sign,
            cc=>signed_mantissa);
  
  giva: FOR k IN 116-decimal+3 TO 116 GENERATE
    input_vector(k) <= signed_mantissa(mantissa_width+2);
  END GENERATE;
  input_vector(116-decimal+2 DOWNTO 116-decimal-mantissa_width+1) <= signed_mantissa;
  givb: IF (116-decimal-mantissa_width+1 > 1) GENERATE
    input_vector(116-decimal-mantissa_width DOWNTO 1) <= zerovec(116-decimal-mantissa_width DOWNTO 1);
  END GENERATE;
  
  gcxa: FOR k IN 1 TO exponent_width GENERATE
    negexponent(k) <= NOT(exponent(k));
  END GENERATE;
  gcxb: FOR k IN 1 TO exponent_width-1 GENERATE
    expbase(k) <= '1';
    negexpbase(k) <= '0';
  END GENERATE;
  expbase(exponent_width) <= '0';
  negexpbase(exponent_width) <= '1';
  
  sublx: dp_addpipe
  GENERIC MAP (width=>exponent_width,pipes=>speed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>exponent,bb=>negexpbase,
            carryin=>'1',
            cc=>leftshift);
            
  subrx: dp_addpipe
  GENERIC MAP (width=>exponent_width,pipes=>speed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>negexponent,bb=>expbase,
            carryin=>'1',
            cc=>rightshift);

  --*** LEVEL 2-4 (shiftbusff) ***
  -- level 2 if speed = 0
  -- level 4 if speed = 1
  
  gsfa: IF (speed = 0) GENERATE
    clsc: dp_lsft64x64
    PORT MAP (inbus=>input_vector,shift=>leftshift(6 DOWNTO 1),
              outbus=>leftbus);
            
    crsc: dp_rsft64x64
    PORT MAP (inbus=>input_vector,shift=>rightshift(6 DOWNTO 1),
              outbus=>rightbus);
              
    select_bit <= leftshift(exponent_width);
  END GENERATE;
  
  gsfb: IF (speed = 1) GENERATE
    clsp: dp_lsftpipe64x64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>input_vector,shift=>leftshift(6 DOWNTO 1),
              outbus=>leftbus);
            
    crsp: dp_rsftpipe64x64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>input_vector,shift=>rightshift(6 DOWNTO 1),
              outbus=>rightbus);
              
    db: fp_delbit
    GENERIC MAP (pipes=>1)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>leftshift(exponent_width),
              cc=>select_bit);
  END GENERATE;
    
  gsba: FOR k IN 1 TO fixed_width GENERATE
    shiftbus(k) <= (leftbus(116-fixed_width+k) AND NOT(select_bit)) OR
                   (rightbus(116-fixed_width+k) AND select_bit);
  END GENERATE;
  
  psa: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
      FOR k IN 1 TO fixed_width LOOP
        shiftbusff(k) <= '0';
      END LOOP; 
    ELSIF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        shiftbusff <= shiftbus;
      END IF;
    END IF;
  END PROCESS;
  
  --*** LEVEL 3-5 ***
  -- level 3 if speed = 0
  -- level 5 if speed = 1

  gou: IF (unsigned = 0) GENERATE
    poa: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        FOR k IN 1 TO fixed_width LOOP
          fixed_numberff(k) <= '0';
        END LOOP; 
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          FOR k IN 1 TO fixed_width LOOP    
            fixed_numberff(k) <= (shiftbusff(k) AND NOT(zero_apply)) OR saturate_apply;
          END LOOP;
        END IF;
      END IF;
    END PROCESS;
  END GENERATE;

  gos: IF (unsigned = 1) GENERATE
    pos: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        FOR k IN 1 TO fixed_width LOOP
          fixed_numberff(k) <= '0';
        END LOOP; 
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          FOR k IN 1 TO fixed_width-1 LOOP    
            fixed_numberff(k) <= (shiftbusff(k) AND NOT(zero_apply) AND 
                                  NOT(saturate_apply AND sign_apply)) OR
                                 (saturate_apply AND NOT(sign_apply));
          END LOOP;
          fixed_numberff(fixed_width) <= (shiftbusff(fixed_width) AND NOT(zero_apply) AND 
                                          NOT(saturate_apply AND NOT(sign_apply))) OR
                                         (saturate_apply AND sign_apply);
        END IF;
      END IF;
    END PROCESS;
  END GENERATE;
    
  fixed_number <= fixed_numberff;
  
END rtl;

