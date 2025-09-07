----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: TestBench for Exercici_8
-- Module Name: TB_Exercici_8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: TestBench para el contador con comparador.
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Exercici_8 is
end TB_Exercici_8;

architecture Behavioral of TB_Exercici_8 is

    -- Componentes a probar
    component Exercici_8
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            comptador : out STD_LOGIC_VECTOR(8 downto 0);
            flag : out STD_LOGIC
        );
    end component;

    -- Señales de prueba
    signal clk_tb : STD_LOGIC := '0';
    signal reset_tb : STD_LOGIC := '1';
    signal comptador_tb : STD_LOGIC_VECTOR(8 downto 0);
    signal flag_tb : STD_LOGIC;

begin
    -- Instanciación del componente
    Exercici_8_inst : Exercici_8
        Port map (
            clk => clk_tb,
            reset => reset_tb,
            comptador => comptador_tb,
            flag => flag_tb
        );

    -- Generador de reloj (1 MHz, periodo 1 us)
    gen_clk: process
    begin
        while true loop
            clk_tb <= '1';
            wait for 500 ns;
            clk_tb <= '0';
            wait for 500 ns;
        end loop;
    end process;

    -- Proceso de simulación
    process
    begin
        -- Activar reset al inicio
        reset_tb <= '1';
        wait for 1 us;
        reset_tb <= '0';

        -- Simular hasta después de 256 ciclos de reloj
        wait for 300 us;

        -- Finaliza la simulación
        wait;
    end process;

end Behavioral;