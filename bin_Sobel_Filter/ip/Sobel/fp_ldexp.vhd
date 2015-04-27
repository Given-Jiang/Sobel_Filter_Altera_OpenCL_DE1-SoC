
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   FP_LDEXP.VHD                              ***
--***                                             ***
--***   Function: Single Precision Load Exponent  ***
--***                                             ***
--***   ldexp(x,n) - x*2^n - IEEE in and out      ***
--***                                             ***
--***   Created 11/09/09                          ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_ldexp IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
      bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
		  satout, zeroout, nanout : OUT STD_LOGIC
		);
END fp_ldexp;

ARCHITECTURE rtl OF fp_ldexp IS
 
  signal signinff : STD_LOGIC;
  signal exponentinff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal mantissainff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal bbff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal signoutff : STD_LOGIC;
  signal exponentoutff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal mantissaoutff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal satoutff, zerooutff, nanoutff : STD_LOGIC;
  signal satnode, zeronode, nannode : STD_LOGIC;
  signal expnode : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expzeroin, expmaxin : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal expzeronode, expmaxnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal expzeroout, expmaxout : STD_LOGIC;
  signal manzeroin : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal manzero, mannonzero : STD_LOGIC; 

BEGIN
    
  pin: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      signinff <= '0';
      signoutff <= '0';
      FOR k IN 1 TO 8 LOOP
        exponentinff(k) <= '0';
        exponentoutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 23 LOOP
        mantissainff(k) <= '0';
        mantissaoutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 10 LOOP
        bbff(k) <= '0';
      END LOOP;
      satoutff <= '0';
      zerooutff <= '0';
      nanoutff <= '0';
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN

      
        signinff <= signin;
        exponentinff <= exponentin;
        mantissainff <= mantissain;
        
        bbff <= bb(10 DOWNTO 1);
        
        signoutff <= signinff;
        FOR k IN 1 TO 8 LOOP
          exponentoutff(k) <= (expnode(k) AND NOT(zeronode)) OR satnode OR nannode;
        END LOOP;
        FOR k IN 1 TO 23 LOOP
          mantissaoutff(k) <= (mantissainff(k) AND NOT(zeronode) AND NOT(satnode)) OR nannode;
        END LOOP;
        
        satoutff <= satnode;
        zerooutff <= zeronode;
        nanoutff <= nannode;
        
      END IF;
    
    END IF;  
      
  END PROCESS;
  
  expnode <= ("00" & exponentinff) + bbff;
  
  expzeroin(1) <= exponentinff(1);
  expmaxin(1) <= exponentinff(1);
  gxa: FOR k IN 2 TO 8 GENERATE
    expzeroin(k) <= expzeroin(k-1) OR exponentinff(k);
    expmaxin(k) <= expmaxin(k-1) AND exponentinff(k);
  END GENERATE;
  
  expzeronode(1) <= expnode(1);
  expmaxnode(1) <= expnode(1);
  gxb: FOR k IN 2 TO 8 GENERATE
    expzeronode(k) <= expzeronode(k-1) OR expnode(k);
    expmaxnode(k) <= expmaxnode(k-1) AND expnode(k);
  END GENERATE;
  expzeroout <= NOT(expzeroin(8)) OR (NOT(expzeronode(8)) AND NOT(expnode(9))) OR (expnode(10));
  expmaxout <= expmaxin(8) OR (expmaxnode(8) AND NOT(expnode(9))) OR (expnode(9) AND NOT(expnode(10))); 
  
  manzeroin(1) <= mantissainff(1);
  gma: FOR k IN 2 TO 23 GENERATE
    manzeroin(k) <= manzeroin(k-1) OR mantissainff(k);
  END GENERATE;
  manzero <= NOT(manzeroin(23));
  mannonzero <= manzeroin(23);
  
  satnode <= (expmaxin(8) AND NOT(manzeroin(23))) OR expmaxout;
  zeronode <= NOT(expzeroin(8)) OR expzeroout;
  nannode <= expmaxin(8) AND manzeroin(23);
  
	signout <= signoutff;
  exponentout <= exponentoutff;
  mantissaout <= mantissaoutff;
      
  satout <= satoutff;
  zeroout <= zerooutff;
  nanout <= nanoutff;

END rtl;

