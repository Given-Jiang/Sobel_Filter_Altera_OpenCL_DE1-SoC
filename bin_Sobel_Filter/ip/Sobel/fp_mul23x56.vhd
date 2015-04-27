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

LIBRARY altera_mf;
USE altera_mf.all;

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_MUL23X56.VHD                           ***
--***                                             ***
--***   Function: Fixed Point Multiplier          ***
--***                                             ***
--***   23 and 56 bit inputs, 4 pipes             ***
--***                                             ***
--***   07/01/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_mul23x56 IS
GENERIC (device : integer := 0);
PORT
	(
    sysclk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    enable : IN STD_LOGIC;
    dataaa : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
    databb : IN STD_LOGIC_VECTOR (56 DOWNTO 1);

	 result : OUT STD_LOGIC_VECTOR (79 DOWNTO 1)
	);
END fp_mul23x56;

ARCHITECTURE SYN OF fp_mul23x56 IS
  constant AW : integer := 23;
  constant BW : integer := 56;
  constant RW : integer := AW+BW;
  
  -- use 27-bit multipliers on SV/AV/CV,
  -- use 36-bit multipliers on SIII/SIV
  -- split multiplication into two equal parts on other architectures
  function chooseMaxMulWidth(device : integer) return integer is
  begin
    if (device = 2) then
      return 27;
    elsif (device = 1) then
      return 36;
    else
      return 28;
    end if;
  end function;

  constant MAXMULWIDTH : integer := chooseMaxMulWidth(device);
  constant use_2_multipliers : boolean := BW <= 2 * MAXMULWIDTH;
  constant use_3_multipliers : boolean := not use_2_multipliers;
  
  component fp_mul2s
  GENERIC (
    widthaa : positive;
    widthbb : positive;
    widthcc : positive
  );
  PORT (
    sysclk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    enable : IN STD_LOGIC;
    dataaa : IN STD_LOGIC_VECTOR(widthaa DOWNTO 1);
    databb : IN STD_LOGIC_VECTOR(widthbb DOWNTO 1);

    result : OUT STD_LOGIC_VECTOR(widthcc DOWNTO 1)
  );
  end component;

  component fp_mul3s
  GENERIC (
    widthaa : positive;
    widthbb : positive;
    widthcc : positive
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

  signal zerovec : STD_LOGIC_VECTOR(MAXMULWIDTH DOWNTO 1);
BEGIN
  zerovec <= (others => '0');

gen2mul: IF use_2_multipliers GENERATE
  constant BLW : integer := MAXMULWIDTH;
  constant BHW : integer := BW - BLW;
  signal multiplier_low  : STD_LOGIC_VECTOR(BLW+AW DOWNTO 1);
  signal multiplier_high : STD_LOGIC_VECTOR(BHW+AW DOWNTO 1);
  signal adderff  : STD_LOGIC_VECTOR(RW DOWNTO 1);
BEGIN
  ml: fp_mul3s
  GENERIC MAP (widthaa=>AW,widthbb=>BLW,widthcc=>BLW+AW)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dataaa,databb=>databb(BLW DOWNTO 1),
            result=>multiplier_low);

  mh: fp_mul3s
  GENERIC MAP (widthaa=>AW,widthbb=>BHW,widthcc=>BHW+AW)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dataaa,databb=>databb(BHW+BLW DOWNTO BLW+1),
            result=>multiplier_high);

  pad: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
        adderff <= (others => '0');
    ELSIF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        adderff <= (zerovec(RW-(BLW+AW) DOWNTO 1) & multiplier_low) +
                   (multiplier_high & zerovec(RW-(BHW+AW) DOWNTO 1));
      END IF;
    END IF;
  END PROCESS;

  result <= adderff;
END GENERATE;

gen3mul: IF use_3_multipliers GENERATE
  constant BLW : integer := MAXMULWIDTH;
  constant BHW : integer := MAXMULWIDTH;
  constant BTW : integer := BW - BLW - BHW;
  signal multiplier_low :  STD_LOGIC_VECTOR(BLW+AW DOWNTO 1);
  signal multiplier_high : STD_LOGIC_VECTOR(BHW+AW DOWNTO 1);
  signal multiplier_top :  STD_LOGIC_VECTOR(BTW+AW DOWNTO 1);
  signal adderff0 : STD_LOGIC_VECTOR (RW DOWNTO 1);
  signal adderff1 : STD_LOGIC_VECTOR (RW DOWNTO 1);
BEGIN
  ml: fp_mul2s
  GENERIC MAP (widthaa=>AW,widthbb=>BLW,widthcc=>BLW+AW)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dataaa,databb=>databb(BLW DOWNTO 1),
            result=>multiplier_low);

  mh: fp_mul2s
  GENERIC MAP (widthaa=>AW,widthbb=>BHW,widthcc=>BHW+AW)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dataaa,databb=>databb(BHW+BLW DOWNTO BLW+1),
            result=>multiplier_high);

  mt: fp_mul2s
  GENERIC MAP (widthaa=>AW,widthbb=>BTW,widthcc=>BTW+AW)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dataaa,databb=>databb(BTW+BHW+BLW DOWNTO BHW+BLW+1),
            result=>multiplier_top);

  pad: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
        adderff0 <= (others => '0');
        adderff1 <= (others => '0');
    ELSIF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        adderff0 <= (multiplier_top & zerovec(RW-(BTW+AW)-(BLW+AW) DOWNTO 1) & multiplier_low) +
                    (zerovec(RW-(BHW+AW)-BLW DOWNTO 1) & multiplier_high & zerovec(BLW DOWNTO 1));
        adderff1 <= adderff0;
      END IF;
    END IF;
  END PROCESS;

  result <= adderff1;
END GENERATE;

END SYN;

