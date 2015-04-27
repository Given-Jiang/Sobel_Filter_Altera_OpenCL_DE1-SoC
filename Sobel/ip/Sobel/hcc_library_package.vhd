
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LIBRARY_PACKAGE.VHD                   ***
--***                                             ***
--***   Function: Component Declarations of       ***
--***   compiler instantiated library functions   ***
--***                                             ***
--***   06/02/08 ML                               ***
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

PACKAGE hcc_library_package IS

  --***********************************
  --*** SINGLE PRECISION COMPONENTS ***
  --***********************************
  
  component hcc_divfp1x 
  GENERIC (
           mantissa : positive := 32; -- 32/36 mantissa
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u23/8)
           xoutput : integer := 1; -- 1 = single x format (s32/13)
           funcoutput : integer := 0; -- 1 = function (S'1'mantissa-2/10)
           roundconvert : integer := 0;
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        bbsat, bbzip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (32+(mantissa-22)*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;	
  
  component hcc_inv1x  
  GENERIC (
           mantissa : positive := 32; -- 32/36 mantissa
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u23/8)
           xoutput : integer := 1; -- 1 = single x format (s32/13)
           funcoutput : integer := 0; -- 1 = function (S'1'mantissa-2/10)
           roundconvert : integer := 0;
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        bbsat, bbzip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (32+(mantissa-22)*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;	
  
  component hcc_invsqr1x 
  GENERIC (
           mantissa : positive := 32; -- 32/36 mantissa
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u23/8)
           xoutput : integer := 1; -- 1 = single x format (s32/13)
           funcoutput : integer := 0; -- 1 = function (S'1'mantissa-2/10)
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (32+(mantissa-22)*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
	   	);
  end component;
  
  component hcc_sqr1x 
  GENERIC (
           mantissa : positive := 32; -- 32/36 mantissa
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u23/8)
           xoutput : integer := 1; -- 1 = single x format (s32/13)
           funcoutput : integer := 0; -- 1 = function (S'1'mantissa-2/10)
           roundconvert : integer := 1 -- global switch - round all ieee<=>x conversion when '1'
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (32+(mantissa-22)*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
	   	);
  end component;

  component hcc_exp1x
  GENERIC (
           mantissa : positive := 32; -- 32/36 mantissa
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u23/8)
           xoutput : integer := 1; -- 1 = single x format (s32/13)
           funcoutput : integer := 0; -- 1 = function (S'1'mantissa-2/10)
           roundconvert : integer := 0;
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (32+(mantissa-22)*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		);
  end component;

  component hcc_ln1x
  GENERIC (
           mantissa : positive := 32; -- 32/36 mantissa
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u23/8)
           xoutput : integer := 1; -- 1 = single x format (s32/13)
           funcoutput : integer := 0; -- 1 = function (S'1'mantissa-2/10)
           roundconvert : integer := 0;
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (32+(mantissa-22)*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		);
  end component; 

  component hcc_ldexp1x
  GENERIC (
           mantissa : positive := 32; -- 32/36
           ieeeoutput : integer := 0; -- 1 = ieee754 (S/u23/8)
           xoutput : integer := 1; -- 1 = single x format (mantissa/10)
           funcoutput : integer := 1 -- function output (S'1'mantissa-2/10)
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (32*ieeeoutput+(mantissa+10)*(xoutput+funcoutput) DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;
  
  component hcc_abs1x 
  GENERIC (
           mantissa : positive := 32; -- 32/36
           ieeeoutput : integer := 0; -- 1 = ieee754 (S/u23/8)
           xoutput : integer := 1; -- 1 = single x format (mantissa/10)
           funcoutput : integer := 1 -- function output (S'1'mantissa-2/10)
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
      
      		cc : OUT STD_LOGIC_VECTOR (32*ieeeoutput+(mantissa+10)*(xoutput+funcoutput) DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;
  
  --***********************************
  --*** DOUBLE PRECISION COMPONENTS ***
  --***********************************
  
  component hcc_divfp2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1; -- function output (S'1'u54/13)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           doublespeed : integer := 0; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           doublemult : integer := 0; -- global switch - '0' 54x54 = 8x18x18, '1' 54x54 = 9/10x18x18
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        bbsat, bbzip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;	
  
  component hcc_inv2x  
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1; -- function output (S'1'u54/13)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           doublespeed : integer := 0; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           doublemult : integer := 0; -- global switch - '0' 54x54 = 8x18x18, '1' 54x54 = 9/10x18x18
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        bb : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        bbsat, bbzip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		 );
  end component;
 
  component hcc_invsqr2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1; -- function output (S'1'u54/13)
           doublespeed : integer := 0; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           doublemult : integer := 0; -- global switch - '0' 54x54 = 8x18x18, '1' 54x54 = 9/10x18x18
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  ); 
  end component;
  
  component hcc_sqr2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1; -- function output (S'1'u54/13)
           roundconvert : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  ); 
  end component;

  component hcc_exp2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1; -- function output (S'1'u54/13)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           doublespeed : integer := 0; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           doublemult : integer := 0; -- global switch - '0' 54x54 = 8x18x18, '1' 54x54 = 9/10x18x18
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		 );
  end component;

  component hcc_ln2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1; -- function output (S'1'u54/13)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           doublespeed : integer := 0; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           doublemult : integer := 0; -- global switch - '0' 54x54 = 8x18x18, '1' 54x54 = 9/10x18x18
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		 );
  end component;

  component hcc_ldexp2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1 -- function output (S'1'u54/13)
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*funcoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;
  
  component hcc_abs2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 1 -- function output (S'1'u54/13)
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*funcoutput DOWNTO 1);
	    	ccsat, cczip : OUT STD_LOGIC
		  );
	end component;
	
END hcc_library_package;

