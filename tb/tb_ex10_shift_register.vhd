----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 04:17:20 PM
-- Design Name: 
-- Module Name: tb_shift_register - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity tb_shift_register is
end tb_shift_register;

architecture Behavioral of tb_shift_register is

    -- Componente a testear
    component shift_register is
        Port (
            clk     : in  std_logic;
            reset   : in  std_logic;
            enable  : in  std_logic;
            data_in : in  std_logic_vector(15 downto 0);
            data_out: out std_logic_vector(15 downto 0)
        );
    end component;

    -- Señales de prueba
    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';
    signal enable   : std_logic := '0';
    signal data_in  : std_logic_vector(15 downto 0) := (others => '0');
    signal data_out : std_logic_vector(15 downto 0);

begin

    -- Instancia del DUT (Device Under Test)
    uut: shift_register
        port map (
            clk      => clk,
            reset    => reset,
            enable   => enable,
            data_in  => data_in,
            data_out => data_out
        );

    -- Generador de reloj: 10 ns periodo
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        -- Reset
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;

        -- Activar enable e insertar datos secuenciales
        enable <= '1';
        
        for i in 0 to 135 loop
            data_in <= std_logic_vector(to_unsigned(i, 16));
            wait until rising_edge(clk);
        end loop;

        enable <= '0'; -- Parar escritura
        wait;-- Detener simulación
        
    end process;

end Behavioral;