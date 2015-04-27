
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CONVERSION - TOP LEVEL     ***
--***                                             ***
--***   DP_FIXFLOAT.VHD                           ***
--***                                             ***
--***   Function: Convert Fixed Point to Floating ***
--***   Point Number                              ***
--***                                             ***
--***   01/12/08 ML                               ***
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
--*** LATENCY : unsigned = 3 + 3*speed            ***
--*** LATENCY : signed = 4 + 4*speed              ***
--***************************************************

ENTITY dp_fixfloat IS
GENERIC (
         unsigned : integer := 0; -- unsigned = 0, signed = 1
         decimal : integer := 18;
         fractional : integer := 14;
         precision : integer := 0; -- single = 0, double = 1
         speed : integer := 0 -- low speed = 0, high speed = 1 
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      fixed_number : IN STD_LOGIC_VECTOR (decimal+fractional DOWNTO 1);
      
      sign : OUT STD_LOGIC;
      exponent : OUT STD_LOGIC_VECTOR (8+3*precision DOWNTO 1);
      mantissa : OUT STD_LOGIC_VECTOR (23+29*precision DOWNTO 1)    
     );
END dp_fixfloat;

ARCHITECTURE rtl of dp_fixfloat IS

  constant fixed_width : positive := decimal + fractional;
  -- unsigned has 1 bit less (due to leading 1), signed has 2 less (leading 1 and sign)
  constant fixed_precision : positive := fixed_width - unsigned - 1;
  constant mantissa_width : positive := 23 + 29*precision;
  constant exponent_width : positive := 8 + 3*precision;
  constant exponent_base_number : positive := 126+896*precision+decimal;
   
  -- input stage
  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentbase : STD_LOGIC_VECTOR (exponent_width DOWNTO 1);
  signal invfixed : STD_LOGIC_VECTOR (fixed_width DOWNTO 1);
  signal absnode, delabsnode : STD_LOGIC_VECTOR (fixed_width DOWNTO 1);
  -- detect range stage
  signal clzinbus : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal count, delcount : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal zerochk, delzerochk : STD_LOGIC;
  signal exponentnode, delexponentnode : STD_LOGIC_VECTOR (exponent_width DOWNTO 1);
  -- normalize stage
  signal shiftinbus : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal shiftnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal delshift : STD_LOGIC_VECTOR (fixed_width DOWNTO 1);
  signal shiftvalue : STD_LOGIC_VECTOR (64 DOWNTO 1);
  -- output stage
  signal mantissaroundbit : STD_LOGIC;
  signal exponentoutnode : STD_LOGIC_VECTOR (exponent_width DOWNTO 1);
  signal exponentroundnode : STD_LOGIC_VECTOR (exponent_width DOWNTO 1);
    
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
  
  component dp_clz64 IS
  PORT (
        mantissa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        
        leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
  
  component dp_clzpipe64 IS
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mantissa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        
        leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
 
  component dp_lsft64 IS
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);      
        
        outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)    
       );
  end component;
  
  component dp_lsftpipe64 IS
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);      
        
        outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)    
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
    
  gera : IF NOT((precision = 0) OR 
	             (precision = 1)) GENERATE
	 assert false report "precision must be 0 (single precision) or 1 (double precision)" severity error;
  END GENERATE;
  
  gerb : IF NOT((speed = 0) OR 
	             (speed = 1)) GENERATE
	 assert false report "speed must be 0 or 1" severity error;
  END GENERATE;
  
  gerc : IF NOT((unsigned = 0) OR 
	             (unsigned = 1)) GENERATE
	 assert false report "unsigned must be 0 or 1" severity error;
  END GENERATE;

  gerd : IF (decimal < 1) GENERATE
	 assert false report "decimal must be greater than 1" severity error;
  END GENERATE;
  
  gere : IF (fixed_width > 64) GENERATE
	 assert false report "maximum fixed point precision must be 64 or less" severity error;
  END GENERATE; 
  
  gza: FOR k IN 1 TO 64 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  exponentbase <= conv_std_logic_vector (exponent_base_number,exponent_width);
  
  --*** LEVEL 0 - 2 (ABSNODE) ***
  -- level 0 if unsigned = 0, 
  -- level 1 if signed = 1 & speed = 0, 
  -- level 2 if signed = 1 & speed = 1 
  gabsa: IF (unsigned = 1) GENERATE  
    giva: FOR k IN 1 TO fixed_width GENERATE
      invfixed(k) <= fixed_number(k) XOR fixed_number(fixed_width);
    END GENERATE;
    aabs: dp_addpipe
    GENERIC MAP (width=>fixed_width,pipes=>speed+1)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>invfixed,bb=>zerovec(fixed_width DOWNTO 1),carryin=>fixed_number(fixed_width),
              cc=>absnode);
  END GENERATE;
   
  gabsb: IF (unsigned = 0) GENERATE  
    invfixed <= fixed_number;
    absnode <= invfixed;
  END GENERATE;   
  
  gczc: IF (fixed_width < 64) GENERATE
    clzinbus <= absnode & zerovec(64-fixed_width DOWNTO 1);
  END GENERATE;
  gczd: IF (fixed_width = 64) GENERATE
    clzinbus <= absnode;
  END GENERATE;
  
  --*** LEVEL 1-4 (ABSDELNODE, COUNTFF) ***
  -- level 1 if unsigned = 0 & speed = 0,
  -- level 2 if unsigned = 0 & speed = 1, 
  -- level 2 if signed = 1 & speed = 0, 
  -- level 4 if signed = 1 & speed = 1 
  
  gcca: IF (speed = 0) GENERATE
    cntzip: dp_clz64
    PORT MAP (mantissa=>clzinbus,leading=>count);
  END GENERATE;
  gccb: IF (speed = 1) GENERATE
    cntone: dp_clzpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mantissa=>clzinbus,leading=>count);
  END GENERATE;
  
  delabsbus: fp_del
  GENERIC MAP (width=>fixed_width,pipes=>speed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>absnode,cc=>delabsnode);
  
  ddc: fp_del
  GENERIC MAP (width=>6,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>count,cc=>delcount);
  
  -- check for 0 input - when countff = 0 and absdelnode(64) (unsigned) or 
  -- absdelnode(63) (signed) not '1'
  zerochk <= NOT(delcount(6) OR delcount(5) OR delcount(4) OR delcount(3) OR
                 delcount(2) OR delcount(1) OR delabsnode(fixed_width) OR delabsnode(fixed_width-1));
                 
  delzc: fp_delbit
  GENERIC MAP (pipes=>speed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>zerochk,cc=>delzerochk);
            
  exponentnode <= exponentbase - (zerovec(2+3*precision DOWNTO 1) & delcount);  
  
  delx: fp_del
  GENERIC MAP (width=>exponent_width,pipes=>speed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>exponentnode,cc=>delexponentnode);
            
  --*** LEVEL 2-6 (SHIFTFF) ***
  -- level 2 if unsigned = 0 & speed = 0,
  -- level 3 if unsigned = 0 & speed = 1, 
  -- level 3 if signed = 1 & speed = 0, 
  -- level 6 if signed = 1 & speed = 1 

  gfsc: IF (fixed_width < 64) GENERATE
    shiftinbus <= delabsnode & zerovec(64-fixed_width DOWNTO 1);
  END GENERATE;
  gfsd: IF (fixed_width = 64) GENERATE
    shiftinbus <= delabsnode;
  END GENERATE;

  gssa: IF (speed = 0) GENERATE
    sftzip: dp_lsft64
    PORT MAP (inbus=>shiftinbus,shift=>delcount,
              outbus=>shiftnode);
  END GENERATE;
  gssb: IF (speed = 1) GENERATE
    sftone: dp_lsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>shiftinbus,shift=>delcount,
              outbus=>shiftnode);
  END GENERATE;
  
  dels: fp_del
  GENERIC MAP (width=>fixed_width,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>shiftnode(64 DOWNTO 65-fixed_width),cc=>delshift);

  gsoa: IF (fixed_width = 64) GENERATE
    shiftvalue <= delshift;
  END GENERATE;
  gsob: IF (fixed_width < 64) GENERATE
    shiftvalue <= delshift & zerovec(64-fixed_width DOWNTO 1);
  END GENERATE;
   
  --*** LEVEL 3-8 (OUTPUT) ***
  -- level 3 if unsigned = 0 & speed = 0,
  -- level 5 if unsigned = 0 & speed = 1, 
  -- level 4 if signed = 1 & speed = 0, 
  -- level 8 if signed = 1 & speed = 1 

  -- single precision
  goa: IF (fixed_precision <= 23 AND mantissa_width = 23) GENERATE
    mantissaroundbit <= '0';
    exponentroundnode <= delexponentnode;
    goax: FOR k IN 1 TO 8 GENERATE
      exponentoutnode(k) <= exponentroundnode(k) AND NOT(delzerochk);
    END GENERATE;
  END GENERATE;
  
  gob: IF (fixed_precision > 23 AND mantissa_width = 23) GENERATE
    mantissaroundbit <= ( shiftvalue(41) AND shiftvalue(40) ) OR
                        (NOT(shiftvalue(41)) AND shiftvalue(40) AND
                         (shiftvalue(39) OR shiftvalue(38) OR shiftvalue(37) OR shiftvalue(36) OR 
                          shiftvalue(35) OR shiftvalue(34) OR shiftvalue(33) OR shiftvalue(32) OR 
                          shiftvalue(31) OR shiftvalue(30) OR shiftvalue(29) OR shiftvalue(28)));
    -- check for mantissa overflow here
    exponentroundnode <= delexponentnode;
    gobx: FOR k IN 1 TO 8 GENERATE
      exponentoutnode(k) <= exponentroundnode(k) AND NOT(delzerochk);
    END GENERATE;
  END GENERATE;
  
  -- double precision
  goc: IF (fixed_precision <= 52 AND mantissa_width = 52) GENERATE
    mantissaroundbit <= '0';
    exponentroundnode <= delexponentnode;
    gocx: FOR k IN 1 TO 11 GENERATE
      exponentoutnode(k) <= exponentroundnode(k) AND NOT(delzerochk);
    END GENERATE;
  END GENERATE;
  
  god: IF (fixed_width > 52 AND mantissa_width = 52) GENERATE
    mantissaroundbit <= (shiftvalue(12) AND shiftvalue(11)) OR
                        (NOT(shiftvalue(12)) AND shiftvalue(11) AND
                         (shiftvalue(10) OR shiftvalue(9) OR shiftvalue(8) OR shiftvalue(7) OR 
                          shiftvalue(6) OR shiftvalue(5) OR shiftvalue(4) OR shiftvalue(3) OR 
                          shiftvalue(2) OR shiftvalue(1)));
    -- check for mantissa overflow here
    exponentroundnode <= delexponentnode;
    godx: FOR k IN 1 TO 11 GENERATE
      exponentoutnode(k) <= exponentroundnode(k) AND NOT(delzerochk);
    END GENERATE;
  END GENERATE;
  
  gsgna: IF (unsigned = 0) GENERATE
    sign <= '0';
  END GENERATE;
  gsgnb: IF (unsigned = 1) GENERATE
    delss: fp_delbit
    GENERIC MAP (pipes=>4+4*speed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>fixed_number(decimal+fractional),cc=>sign);  
  END GENERATE;
  
  mno: dp_addpipe
  GENERIC MAP (width=>mantissa_width,pipes=>speed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>shiftvalue(63 DOWNTO 64-mantissa_width),
            bb=>zerovec(mantissa_width DOWNTO 1),
            carryin=>mantissaroundbit,
            cc=>mantissa);
            
  exo: dp_addpipe
  GENERIC MAP (width=>exponent_width,pipes=>speed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>exponentoutnode,
            bb=>zerovec(exponent_width DOWNTO 1),
            --carryin=>mantissaoverflowbit,
            carryin=>'0',
            cc=>exponent);
                
END rtl;

