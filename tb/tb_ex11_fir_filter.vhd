----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 05:01:46 PM
-- Design Name: 
-- Module Name: tb_fir_filter - Behavioral
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

entity tb_fir_filter is
end tb_fir_filter;

architecture Behavioral of tb_fir_filter is

    constant INPUT_NBITS  : integer := 8;
    constant OUTPUT_NBITS : integer := 16;

    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal enable : std_logic := '0';
    signal x      : std_logic_vector(INPUT_NBITS-1 downto 0) := (others => '0');
    signal y      : std_logic_vector(OUTPUT_NBITS-1 downto 0);

begin

    -- Instancia directa del filtro FIR
    uut: entity work.fir_filter
        generic map (
            INPUT_NBITS => INPUT_NBITS,
            OUTPUT_NBITS => OUTPUT_NBITS
        )
        port map (
            clk => clk,
            reset => reset,
            enable => enable,
            x => x,
            y => y
        );

    -- Generador de reloj: periodo 10 ns
    clk_process : process
    begin
        while true loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Proceso de estímulos
    stim_proc : process
        type int_array is array (0 to 15) of integer;
        constant input_values : int_array := (1, 2, 3, 4, 0, 0, 0, 0, 10, 20, 30, 40, 0, 0, 0, 0);
        variable i : integer;
    begin
        -- Reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        enable <= '1';

        -- Enviar las muestras al filtro
        for i in input_values'range loop
            x <= std_logic_vector(to_signed(input_values(i), INPUT_NBITS));
            wait until rising_edge(clk);
        end loop;

        enable <= '0';
        wait for 500 ns;
        wait;
    end process;

end Behavioral;