----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025 05:08:19 PM
-- Design Name: TestBench for Exercici_2
-- Module Name: TB_Exercici_2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: TestBench para la simulación del sumador half adder (Exercici_2).
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

entity TB_Exercici_2 is
end TB_Exercici_2;

architecture Behavioral of TB_Exercici_2 is

    -- Definición del componente a probar
    component Exercici_2
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            SUM : out  STD_LOGIC;
            CARRY : out  STD_LOGIC
        );
    end component;

    -- Señales para la simulación
    signal A_tb : STD_LOGIC;
    signal B_tb : STD_LOGIC;
    signal SUM_tb : STD_LOGIC;
    signal CARRY_tb : STD_LOGIC;

begin
    -- Instanciación del componente
    Exercici_2_inst : Exercici_2
        Port map (
            A => A_tb,
            B => B_tb,
            SUM => SUM_tb,
            CARRY => CARRY_tb
        );

    -- Proceso de simulación
    process
    begin
        -- Caso 00
        A_tb <= '0'; B_tb <= '0';
        wait for 1 ms;
        
        -- Caso 01
        A_tb <= '0'; B_tb <= '1';
        wait for 1 ms;
        
        -- Caso 10
        A_tb <= '1'; B_tb <= '0';
        wait for 1 ms;
        
        -- Caso 11
        A_tb <= '1'; B_tb <= '1';
        wait for 1 ms;

        -- Finaliza la simulación
        wait;
    end process;

end Behavioral;
