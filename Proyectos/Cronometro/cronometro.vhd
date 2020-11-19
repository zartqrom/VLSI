LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY cronometro IS
PORT(	clk : IN std_logic;
		clkUniMin : out std_logic;
		led1, led2 : OUT std_logic_vector(6 DOWNTO 0);
		reset : in std_logic
		);
END cronometro;

ARCHITECTURE arqcronometro OF cronometro IS
	signal clkUniSeg, clkDecSeg 	: std_logic;

	signal bdcUniSeg	: std_logic_vector(3 downto 0);
	signal bdcDecSeg	: std_logic_vector(3 downto 0);

BEGIN

	u1 : entity work.relojlento(arqrelojlento) port map (clk, clkUniSeg);
	u2 : entity work.uniseg(arquniseg) port map (clkUniSeg, reset, clkDecSeg, bdcUniSeg);
	u3 : entity work.decseg(arqdecseg) port map (clkDecSeg, reset, clkUniMin, bdcDecSeg);
	u4 : entity work.bcd7seg(arqbcd7seg) port map (bdcUniSeg, led1);
	u5 : entity work.bcd7seg(arqbcd7seg) port map (bdcDecSeg, led2);
END arqcronometro;

