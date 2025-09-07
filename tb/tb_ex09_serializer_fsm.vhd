----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025
-- Design Name: TestBench for Exercici_9
-- Module Name: TB_Exercici_9 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: TestBench para el serializador de 8 bits.
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Exercici_9 is
end TB_Exercici_9;

architecture Behavioral of TB_Exercici_9 is

    -- Componente a probar
    component Serializador
        Port (
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            start : in STD_LOGIC;
            data_in : in STD_LOGIC_VECTOR(7 downto 0);
            serial_out : out STD_LOGIC;
            done : out STD_LOGIC
        );
    end component;

    -- Señales para la simulación
    signal clk_tb : STD_LOGIC := '0';
    signal rst_tb : STD_LOGIC := '1';
    signal start_tb : STD_LOGIC := '0';
    signal data_in_tb : STD_LOGIC_VECTOR(7 downto 0) := "10101011";
    signal serial_out_tb : STD_LOGIC;
    signal done_tb : STD_LOGIC;

begin
    -- Instanciación del componente
    Serializador_inst : Serializador
        Port map (
            clk => clk_tb,
            rst => rst_tb,
            start => start_tb,
            data_in => data_in_tb,
            serial_out => serial_out_tb,
            done => done_tb
        );

    -- Generador de reloj (10 ns de período)
    gen_clk: process
    begin
        --while true loop
            clk_tb <= '1';
            wait for 5 ns;
            clk_tb <= '0';
            wait for 5 ns;
        --end loop;
    end process;

    -- Proceso de simulación
    process
    begin
        -- 1) Resetear el circuito
        rst_tb <= '1';
        wait for 20 ns;
        rst_tb <= '0';
        wait for 20 ns;

        -- 2) Iniciar la transmisión con "10101011"
        data_in_tb <= "10101011";
        start_tb <= '1';
        wait for 10 ns;
        start_tb <= '0'; -- Quitar la señal start

        -- Esperar la transmisión completa (8 ciclos + 1 ciclo de done)
        wait for 90 ns;

        -- Finalizar la simulación
        wait for 10 ns;
    end process;

end Behavioral;