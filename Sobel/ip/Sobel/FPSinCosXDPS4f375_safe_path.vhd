-- safe_path for FPSinCosXDPS4f375 given rtl dir is . (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE FPSinCosXDPS4f375_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END FPSinCosXDPS4f375_safe_path;

PACKAGE body FPSinCosXDPS4f375_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./") & path;
	END FUNCTION safe_path;
END FPSinCosXDPS4f375_safe_path;
