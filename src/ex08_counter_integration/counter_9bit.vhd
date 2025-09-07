----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: Contador de 9 bits
-- Module Name: Comptador - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implementación del contador de 9 bits sin comparador.
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Comptador is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        comptador : out STD_LOGIC_VECTOR(8 downto 0) -- Contador de 9 bits
    );
end Comptador;

architecture Behavioral of Comptador is
    signal comptador_reg : unsigned(8 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                comptador_reg <= (others => '0'); -- Reset
            else
                comptador_reg <= comptador_reg + 1; -- Incremento del contador
            end if;
        end if;
    end process;

    comptador <= std_logic_vector(comptador_reg); -- Conversión a std_logic_vector

end Behavioral;