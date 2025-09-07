----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: Exercici_4
-- Module Name: Exercici_4 - Behavioral
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

entity Exercici_4 is
    Port (
        sel : in STD_LOGIC_VECTOR (1 downto 0);  -- Entrada binaria de 2 bits
        out_dec : out STD_LOGIC_VECTOR (3 downto 0)  -- Salida de 4 bits (decodificada)
    );
end Exercici_4;

architecture Behavioral of Exercici_4 is
begin
    process(sel)
    begin
        case sel is
            when "00" => out_dec <= "0001";  -- Activa la salida correspondiente
            when "01" => out_dec <= "0010";
            when "10" => out_dec <= "0100";
            when "11" => out_dec <= "1000";
            when others => out_dec <= "0000"; -- Manejo de caso no definido
        end case;
    end process;
end Behavioral;
