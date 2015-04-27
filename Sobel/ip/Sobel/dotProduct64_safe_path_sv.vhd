-- safe_path for dotProduct64 given rtl dir is ./rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE dotProduct64_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END dotProduct64_safe_path;

PACKAGE body dotProduct64_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./rtl/") & path;
	END FUNCTION safe_path;
END dotProduct64_safe_path;
