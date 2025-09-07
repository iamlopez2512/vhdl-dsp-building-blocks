----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: TestBench for Exercici_4
-- Module Name: TB_Exercici_4 - Behavioral
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

entity TB_Exercici_4 is
end TB_Exercici_4;

architecture Behavioral of TB_Exercici_4 is

    -- Definición del componente a probar
    component Exercici_4
        Port (
            sel : in STD_LOGIC_VECTOR (1 downto 0);
            out_dec : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Señales para la simulación
    signal sel_tb : STD_LOGIC_VECTOR (1 downto 0);
    signal out_dec_tb : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Instanciación del componente
    Exercici_4_inst : Exercici_4
        Port map (
            sel => sel_tb,
            out_dec => out_dec_tb
        );

    -- Proceso de simulación
    process
    begin
        -- Caso 00
        sel_tb <= "00";
        wait for 10 ms;

        -- Caso 01
        sel_tb <= "01";
        wait for 10 ms;

        -- Caso 10
        sel_tb <= "10";
        wait for 10 ms;

        -- Caso 11
        sel_tb <= "11";
        wait for 10 ms;

        -- Finaliza la simulación
        wait;
    end process;

end Behavioral;
