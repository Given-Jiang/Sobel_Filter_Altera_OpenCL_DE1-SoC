
LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY altera_mf;
USE altera_mf.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL18USUS.VHD                         ***
--***                                             ***
--***   Function: 3 pipeline stage unsigned 18    ***
--***             bit multiplier                  ***
--***                                             ***
--***   14/07/07 ML                               ***
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

ENTITY hcc_mul18usus IS
	PORT
	(
		aclr3		: IN STD_LOGIC  := '0';
		clock0		: IN STD_LOGIC  := '1';
		dataa_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		datab_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		ena0		: IN STD_LOGIC  := '1';
		result		: OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
	);
END hcc_mul18usus;


ARCHITECTURE SYN OF hcc_mul18usus IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (35 DOWNTO 0);



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
			dataa	: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
			clock0	: IN STD_LOGIC ;
			aclr3	: IN STD_LOGIC ;
			ena0	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	result    <= sub_wire0(35 DOWNTO 0);

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
		intended_device_family => "Stratix",
		lpm_type => "altmult_add",
		multiplier1_direction => "ADD",
		multiplier_aclr0 => "ACLR3",
		multiplier_register0 => "CLOCK0",
		number_of_multipliers => 1,
		output_register => "UNREGISTERED",
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
		width_a => 18,
		width_b => 18,
		width_result => 36
	)
	PORT MAP (
		dataa => dataa_0,
		datab => datab_0,
		clock0 => clock0,
		aclr3 => aclr3,
		ena0 => ena0,
		result => sub_wire0
	);



END SYN;
