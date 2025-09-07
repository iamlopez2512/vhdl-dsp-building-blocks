----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 04:54:52 PM
-- Design Name: 
-- Module Name: exercici_11 - Behavioral
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

entity fir_filter is
    generic (
        INPUT_NBITS  : integer := 8;
        OUTPUT_NBITS : integer := 16
    );
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        enable  : in  std_logic;
        x       : in  std_logic_vector(INPUT_NBITS-1 downto 0);
        y       : out std_logic_vector(OUTPUT_NBITS-1 downto 0)
    );
end fir_filter;

architecture Behavioral of fir_filter is

    type reg_array is array (3 downto 0) of std_logic_vector(INPUT_NBITS-1 downto 0);
    signal shift_reg : reg_array := (others => (others => '0'));

    -- Coeficientes: [-8, 5, 3, -4]
    type coef_array is array (3 downto 0) of integer;
    constant b : coef_array := (-8, 5, 3, -4);

begin

    process(clk)
    variable acc    : signed(OUTPUT_NBITS-1 downto 0);
    variable tmp_x  : signed(OUTPUT_NBITS-1 downto 0);
begin
    if rising_edge(clk) then
        if reset = '1' then
            shift_reg <= (others => (others => '0'));
            y <= (others => '0');
        elsif enable = '1' then
            -- Desplazar el registro
            for i in 3 downto 1 loop
                shift_reg(i) <= shift_reg(i-1);
            end loop;
            shift_reg(0) <= x;

            -- Acumulador: convolución con coeficientes
            acc := (others => '0');
            for i in 0 to 3 loop
                tmp_x := resize(signed(shift_reg(i)), OUTPUT_NBITS);
                -- acc := acc + resize(to_signed(b(i), OUTPUT_NBITS), OUTPUT_NBITS) * tmp_x;
                acc := acc + resize(to_signed(b(i), 2 * OUTPUT_NBITS) * tmp_x, OUTPUT_NBITS);
            end loop;

            y <= std_logic_vector(acc);
        end if;
    end if;
end process;

end Behavioral;