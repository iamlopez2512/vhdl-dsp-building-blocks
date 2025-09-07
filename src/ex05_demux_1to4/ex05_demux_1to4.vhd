----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: Demultiplexor 1 a 4
-- Module Name: Exercici_5 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Exercici_5 is
    Port (
        D : in STD_LOGIC;                        -- Entrada de datos
        sel : in STD_LOGIC_VECTOR (1 downto 0);  -- Selección de salida (2 bits)
        Y : out STD_LOGIC_VECTOR (3 downto 0)    -- Salidas del demux
    );
end Exercici_5;

architecture Behavioral of Exercici_5 is
begin
    -- Implementación con asignaciones concurrentes
    Y(0) <= D when sel = "00" else '0';
    Y(1) <= D when sel = "01" else '0';
    Y(2) <= D when sel = "10" else '0';
    Y(3) <= D when sel = "11" else '0';

end Behavioral;
