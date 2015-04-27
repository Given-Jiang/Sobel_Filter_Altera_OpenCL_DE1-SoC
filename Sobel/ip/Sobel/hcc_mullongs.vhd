
LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULLONGS.VHD                          ***
--***                                             ***
--***   Function: 3 pipeline stage fixed point    ***
--***             (long, signed & unsigned)       ***
--***             synthesizable                   ***
--***                                             ***
--***   14/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mullongs IS
GENERIC (unsigned : integer := 0);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa, mulbb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);      

      mulcc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)  
      );
END hcc_mullongs;

ARCHITECTURE syn OF hcc_mullongs IS

   signal mulnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
   
	COMPONENT altmult_add
	GENERIC (
		addnsub_multiplier_aclr1		: STRING;
		addnsub_multiplier_pipeline_aclr1		: STRING;
		addnsub_multiplier_pipeline_register1		: STRING;
		addnsub_multiplier_register1		: STRING;
		dedicated_multiplier_circuitry		: STRING;
		input_aclr_a0		: STRING;
		input_aclr_b0		: STRING;
		input_register_a0		: STRING;
		input_register_b0		: STRING;
		input_source_a0		: STRING;
		input_source_b0		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		multiplier1_direction		: STRING;
		multiplier_aclr0		: STRING;
		multiplier_register0		: STRING;
		number_of_multipliers		: NATURAL;
		output_aclr		: STRING;
		output_register		: STRING;
		port_addnsub1		: STRING;
		port_signa		: STRING;
		port_signb		: STRING;
		representation_a		: STRING;
		representation_b		: STRING;
		signed_aclr_a		: STRING;
		signed_aclr_b		: STRING;
		signed_pipeline_aclr_a		: STRING;
		signed_pipeline_aclr_b		: STRING;
		signed_pipeline_register_a		: STRING;
		signed_pipeline_register_b		: STRING;
		signed_register_a		: STRING;
		signed_register_b		: STRING;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_result		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			clock0	: IN STD_LOGIC ;
			aclr3	: IN STD_LOGIC ;
			ena0	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

  gsa: IF (unsigned = 0) GENERATE
  
	ALTMULT_ADD_component : altmult_add
	GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix II",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_aclr => "ACLR3",
		output_register => "CLOCK0",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "SIGNED",
		representation_b => "SIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => 32,
		width_b => 32,
		width_result => 64
	)
	PORT MAP (
		dataa => mulaa,
		datab => mulbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulnode
	);

  END GENERATE;
  
  gua: IF (unsigned = 1) GENERATE
  
	ALTMULT_ADD_component : altmult_add
	GENERIC MAP (
		addnsub_multiplier_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_aclr1 => "ACLR3",
		addnsub_multiplier_pipeline_register1 => "CLOCK0",
		addnsub_multiplier_register1 => "CLOCK0",
		dedicated_multiplier_circuitry => "AUTO",
		input_aclr_a0 => "ACLR3",
		input_aclr_b0 => "ACLR3",
		input_register_a0 => "CLOCK0",
		input_register_b0 => "CLOCK0",
		input_source_a0 => "DATAA",
		input_source_b0 => "DATAB",
		intended_device_family => "Stratix II",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_aclr => "ACLR3",
		output_register => "CLOCK0",
		port_addnsub1 => "PORT_UNUSED",
		port_signa => "PORT_UNUSED",
		port_signb => "PORT_UNUSED",
		representation_a => "UNSIGNED",
		representation_b => "UNSIGNED",
		signed_aclr_a => "ACLR3",
		signed_aclr_b => "ACLR3",
		signed_pipeline_aclr_a => "ACLR3",
		signed_pipeline_aclr_b => "ACLR3",
		signed_pipeline_register_a => "CLOCK0",
		signed_pipeline_register_b => "CLOCK0",
		signed_register_a => "CLOCK0",
		signed_register_b => "CLOCK0",
		width_a => 32,
		width_b => 32,
		width_result => 64
	)
	PORT MAP (
		dataa => mulaa,
		datab => mulbb,
		clock0 => sysclk,
		aclr3 => reset,
		ena0 => enable,
		result => mulnode
	);

  END GENERATE;
  
  mulcc <= mulnode(32 DOWNTO 1);
  
END syn;
