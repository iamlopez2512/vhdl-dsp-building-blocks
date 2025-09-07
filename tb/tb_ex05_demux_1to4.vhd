----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: TestBench for Exercici_5
-- Module Name: TB_Exercici_5 - Behavioral
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

entity TB_Exercici_5 is
end TB_Exercici_5;

architecture Behavioral of TB_Exercici_5 is

    -- Definición del componente a probar
    component Exercici_5
        Port (
            D : in STD_LOGIC;
            sel : in STD_LOGIC_VECTOR (1 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Señales para la simulación
    signal D_tb : STD_LOGIC;
    signal sel_tb : STD_LOGIC_VECTOR (1 downto 0);
    signal Y_tb : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Instanciación del componente
    Exercici_5_inst : Exercici_5
        Port map (
            D => D_tb,
            sel => sel_tb,
            Y => Y_tb
        );

    -- Proceso de simulación
    process
    begin
        -- Prueba con D = '1' en cada salida
        D_tb <= '1';

        sel_tb <= "00"; wait for 10 ms;
        sel_tb <= "01"; wait for 10 ms;
        sel_tb <= "10"; wait for 10 ms;
        sel_tb <= "11"; wait for 10 ms;

        -- Finaliza la simulación
        wait;
    end process;

end Behavioral;
