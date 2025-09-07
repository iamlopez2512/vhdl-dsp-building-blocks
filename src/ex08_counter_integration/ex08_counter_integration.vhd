----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: Contador con Comparador
-- Module Name: Exercici_8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Instancia el contador de 9 bits y el comparador.
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Exercici_8 is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        comptador : out STD_LOGIC_VECTOR(8 downto 0);
        flag : out STD_LOGIC
    );
end Exercici_8;

architecture Behavioral of Exercici_8 is

    -- Componentes instanciados
    component Comptador
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            comptador : out STD_LOGIC_VECTOR(8 downto 0)
        );
    end component;

    component Comparador
        Port (
            comptador : in STD_LOGIC_VECTOR(8 downto 0);
            flag : out STD_LOGIC
        );
    end component;

    -- Señal interna para conectar el contador con el comparador
    signal comptador_signal : STD_LOGIC_VECTOR(8 downto 0);

begin
    -- Instancia del contador
    comptador_inst : Comptador
        Port map (
            clk => clk,
            reset => reset,
            comptador => comptador_signal
        );

    -- Instancia del comparador
    comparador_inst : Comparador
        Port map (
            comptador => comptador_signal,
            flag => flag
        );

    -- Conectar la salida del contador a la salida de la entidad
    comptador <= comptador_signal;

end Behavioral;