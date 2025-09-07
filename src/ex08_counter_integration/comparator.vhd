----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: Comparador de 9 bits
-- Module Name: Comparador - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implementación del comparador que activa flag cuando el contador es 256.
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Comparador is
    Port (
        comptador : in STD_LOGIC_VECTOR(8 downto 0); -- Entrada del contador
        flag : out STD_LOGIC                           -- Se activa en 256
    );
end Comparador;

architecture Behavioral of Comparador is
begin
    flag <= '1' when unsigned(comptador) = 256 else '0'; -- Comparación directa
end Behavioral;
