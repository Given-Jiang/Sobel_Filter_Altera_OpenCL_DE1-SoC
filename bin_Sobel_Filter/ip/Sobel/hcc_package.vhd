
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_PACKAGE.VHD                           ***
--***                                             ***
--***   Function: Component Declarations of       ***
--***             compiler instantiated functions ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   06/02/08 - removed divides (now a library ***
--***              function                       ***
--***                                             ***
--***                                             ***
--***************************************************

PACKAGE hcc_package IS

  --***********************************
  --*** SINGLE PRECISION COMPONENTS ***
  --***********************************
  
  component hcc_alufp1x
  GENERIC (
           mantissa : positive := 36;
           shiftspeed : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        addsub : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        bbsat, bbzip : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
       );
  end component;
  
  component hcc_mulfp1x 
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           outputscale : integer := 0; -- 0 = none, 1 = scale 
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
      
  		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;
  
  component hcc_normfp1x 
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           inputnormalize : integer := 1; -- 0 = scale, 1 = normalize
           roundnormalize : integer := 1;
           normspeed : positive := 2; -- 1 or 2
           target : integer := 0 -- 0 = mult target (signed), 1 = divider target (unsigned), 2 adder tree
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
      
    		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component; 

  component hcc_neg1x
  GENERIC (
           mantissa : positive := 32; -- 32/36
           ieeeoutput : integer := 0; -- 1 = ieee754 (S/u23/8)
           xoutput : integer := 1; -- 1 = single x format (smantissa/10)
           funcoutput : integer := 0 -- function output (S'1'umantissa-2/10)
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
  
  component hcc_alufp2x 
  GENERIC (
           shiftspeed : integer := 1; -- '0' for comb. shift, '1' for piped shift
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          ); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        addsub : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        bbsat, bbzip : IN STD_LOGIC;

	    cc : OUT STD_LOGIC_VECTOR (77 DOWNTO 1);
	    ccsat, cczip : OUT STD_LOGIC
	   );
  end component;	
  
  component hcc_mulfp2x 
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           multoutput : integer := 0; -- 1 = to another double muliplier (s/1u52/13)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           roundnormalize : integer := 1; -- global switch - round all normalizations when '1'
           doublespeed : integer := 1; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           outputpipe : integer := 1; -- if zero, dont put final pipe for some modes
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
      
		  cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*multoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;
	
  component hcc_normfp2x  
  GENERIC (
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           roundnormalize : integer := 1; -- global switch - round all normalizations when '1'
           normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
           doublespeed : integer := 1; -- global switch - '0' unpiped adders, '1' piped adders for doubles
           target : integer := 1; -- 1(internal), 0 (multiplier, divider)
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 

        cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
	   );
  end component;
  
  component hcc_neg2x
  GENERIC (
           ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
           xoutput : integer := 1; -- 1 = double x format (s64/13)
           funcoutput : integer := 0 -- 1 = to another double muliplier (s/1u52/13)
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (64+13*xoutput+3*funcoutput DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 

        cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*funcoutput DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
	    );
  end component;
  
  --***********************
  --*** CAST COMPONENTS ***
  --***********************
   
  component hcc_castftox
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
  end component; 

  component hcc_castxtof IS 
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           normspeed : positive := 2 -- 1 or 2 
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

	     cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component; 
  
  component castftoy 
  GENERIC (
           target : integer := 0; -- 1 (internal), 0 (multiplier,divider)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           mantissa : positive := 32
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

      		cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		  );
  end component; 
  
  
  component hcc_castdtoy 
  GENERIC (
           target : integer := 1; -- 1(internal), 0 (multiplier, divider)
           roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
           outputpipe : integer := 1; -- if zero, dont put final pipe for some modes
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

	    cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
	    ccsat, cczip : OUT STD_LOGIC 
	    );
  end component;
  
  component castdtox  
  GENERIC (
           target : integer := 0; -- 0 (internal), 1 (multiplier), 2 (divider)
           mantissa : positive := 32;
           roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
           doublespeed : integer := 0 -- '0' for unpiped adder, '1' for piped adder
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
  
		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		  );
  end component;
  
  component castxtod 
  GENERIC (
           mantissa : positive := 32;
           roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
           doublespeed : integer := 0 -- '0' for unpiped adder, '1' for piped adder
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
		 );
  end component;
  
  component castxtoy  
  GENERIC (
           target : integer := 1; -- 1(internal), 0 (multiplier, divider)
           mantissa : positive := 32
          );
  PORT (
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : STD_LOGIC;
 
	  	  cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		 );
  end component;
  
  component hcc_castytod 
  GENERIC (
           roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
           normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

	    cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
  
  component castytof 
  GENERIC (
           roundconvert : integer := 1 -- global switch - round all conversions when '1'
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		 );
  end component;
  
  component castytox IS 
  GENERIC (
           roundconvert : integer := 1; -- global switch - round all conversions when '1'
           mantissa : positive := 32
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		 );
  end component;
   
  --************************
  --*** OTHER COMPONENTS ***
  --************************
  
  component hcc_delay 
  GENERIC (
           width : positive := 32;
           delay : positive := 10;
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (width DOWNTO 1);

	     cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
	    );
  end component;

END hcc_package;

