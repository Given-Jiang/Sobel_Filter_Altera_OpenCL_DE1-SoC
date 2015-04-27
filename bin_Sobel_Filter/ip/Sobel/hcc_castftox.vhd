
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTFTOX.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Single to Internal ***
--***             Single                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   06/02/08 - divider mantissa aa to aaff    ***
--***   13/07/09 - if zip, then zero '1' in frac  ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castftox IS 
GENERIC (
         target : integer := 1; -- 0 (internal), 1 (multiplier), 2 (divider)
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         mantissa : positive := 32;
         outputpipe : integer := 1 -- 0 no pipe, 1 output always registered
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC 
		);
END hcc_castftox;

ARCHITECTURE rtl OF hcc_castftox IS
    
  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal aaff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal ccff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal fracnode, fractional : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal expnode, exponent : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal satnode, zipnode : STD_LOGIC;
  signal satff, zipff : STD_LOGIC;
    
BEGIN

  -- ieee754: sign (32), 8 exponent (31:24), 23 mantissa (23:1)
  
  -- x format: (signx5,!sign,mantissa XOR sign, sign(xx.xx)), exponent(10:1)
  -- multiplier : (SIGN)('1')(23:1)sign(xx.xx), exponent(10:1)
  -- divider : "01"(23:1) (00..00),exponent(10:1) (lower mantissa bits ignored by fpdiv1x)
  
  gza: IF (roundconvert = 1) GENERATE
    gza: FOR k IN 1 TO mantissa-1 GENERATE
      zerovec(k) <= '0';
    END GENERATE;
  END GENERATE;
  
  pca: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 32 LOOP
        aaff(k) <= '0';
      END LOOP;
        
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
      
        aaff <= aa;
      
      END IF;      
            
    END IF;
      
  END PROCESS;
  
  gro: IF ((target = 0 AND outputpipe = 1) OR
           (target = 1 AND outputpipe = 1)) GENERATE
    pca: PROCESS (sysclk,reset)
    BEGIN
      
      IF (reset = '1') THEN

        FOR k IN 1 TO mantissa+10 LOOP
          ccff(k) <= '0';
        END LOOP;
        satff <= '0';
        zipff <= '0';
        
      ELSIF (rising_edge(sysclk)) THEN
      
        IF (enable = '1') THEN

          ccff <= fractional & exponent;
          satff <= satnode;
          zipff <= zipnode;
      
        END IF;      
            
      END IF;
      
    END PROCESS;  
  END GENERATE;
  
  -- if exponent = 255 => saturate, if 0 => 0
  satnode <= aaff(31) AND aaff(30) AND aaff(29) AND aaff(28) AND 
             aaff(27) AND aaff(26) AND aaff(25) AND aaff(24);
  zipnode <= NOT(aaff(31) OR aaff(30) OR aaff(29) OR aaff(28) OR 
                 aaff(27) OR aaff(26) OR aaff(25) OR aaff(24));
         
  gexpa: FOR k IN 1 TO 8 GENERATE
    expnode(k) <= (aaff(k+23) OR satnode) AND NOT(zipnode);
  END GENERATE;
  expnode(9) <= satnode;
  expnode(10) <= '0';

  --*** internal format ***
  gxa: IF (target = 0) GENERATE
  
    fracnode(mantissa) <= aaff(32);
    fracnode(mantissa-1) <= aaff(32);
    fracnode(mantissa-2) <= aaff(32);
    fracnode(mantissa-3) <= aaff(32);
    fracnode(mantissa-4) <= aaff(32);
    --fracnode(mantissa-5) <= NOT(aaff(32));  -- '1' XOR sign
    -- 13/07/09
    fracnode(mantissa-5) <= aaff(32) XOR NOT(zipnode);  -- '1' XOR sign
    gxb: FOR k IN 1 TO 23 GENERATE
      fracnode(mantissa-29+k)<= (aaff(k) XOR aaff(32));
    END GENERATE;
    gxc: FOR k IN 1 TO mantissa-29 GENERATE
      fracnode(k)<= aaff(32);  -- '0' XOR sign
    END GENERATE;
    
    gxd: IF (roundconvert = 0) GENERATE
      fractional <= fracnode;
    END GENERATE;
    gxe: IF (roundconvert = 1) GENERATE
      fractional <= fracnode + (zerovec(mantissa-1) & aaff(32));
    END GENERATE;
    
    exponent <= expnode;
    
  END GENERATE;
  
  --*** direct to multiplier ***
  gma: IF (target = 1) GENERATE
  
    fracnode(mantissa) <= aaff(32);
    --fracnode(mantissa-1) <= NOT(aaff(32));  -- '1' XOR sign
    -- 13/07/09
    fracnode(mantissa-1) <= aaff(32) XOR NOT(zipnode);
    gmb: FOR k IN 1 TO 23 GENERATE
      fracnode(mantissa-25+k)<= (aaff(k) XOR aaff(32));
    END GENERATE;
    gmc: FOR k IN 1 TO mantissa-25 GENERATE
      fracnode(k)<= aaff(32);  -- '0' XOR sign
    END GENERATE;
    
    gmd: IF (roundconvert = 0) GENERATE
      fractional <= fracnode;
    END GENERATE;
    gme: IF (roundconvert = 1) GENERATE
      fractional <= fracnode + (zerovec(mantissa-1) & aaff(32));
    END GENERATE;
    
    --***??? adjust ???
    exponent <= expnode;
    
  END GENERATE;

  -- never register output
  --*** direct to divider ***
  gda: IF (target = 2) GENERATE
  
    fracnode(mantissa) <= aaff(32);
    -- 13/07/09
    fracnode(mantissa-1) <= '1' AND NOT(zipnode); 
    fracnode(mantissa-2 DOWNTO mantissa-24)<= aaff(23 DOWNTO 1);
    gfb: FOR k IN 1 TO mantissa-25 GENERATE
      fracnode(k)<= '0';  
    END GENERATE;
    
    fractional <= fracnode;
    
    --***??? adjust ???
    exponent <= expnode;
    
  END GENERATE;
  
  --*** OUTPUTS ***
  goa: IF ((target = 0 AND outputpipe = 1) OR
           (target = 1 AND outputpipe = 1)) GENERATE      
    cc <= ccff;    
    ccsat <= satff;
    cczip <= zipff;    
  END GENERATE;
  gob: IF ((target = 0 AND outputpipe = 0) OR
         (target = 1 AND outputpipe = 0) OR
         (target = 2)) GENERATE      
    cc <= fractional & exponent;    
    ccsat <= satnode;
    cczip <= zipnode;    
  END GENERATE;
    
END rtl;

