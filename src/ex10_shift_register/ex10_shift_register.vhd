----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 04:06:31 PM
-- Design Name: 
-- Module Name: exercici_10 - Behavioral
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

entity shift_register is
    Port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        enable  : in  std_logic;
        data_in : in  std_logic_vector(15 downto 0);
        data_out: out std_logic_vector(15 downto 0)
    );
end shift_register;

architecture Behavioral of shift_register is

    type reg_array is array (127 downto 0) of std_logic_vector(15 downto 0);
    signal shift_reg : reg_array := (others => (others => '0'));

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                shift_reg <= (others => (others => '0'));
            elsif enable = '1' then
                -- Desplazamos los datos
                for i in 127 downto 1 loop
                    shift_reg(i) <= shift_reg(i-1);
                end loop;
                shift_reg(0) <= data_in; -- entrada en la primera posición
            end if;
        end if;
    end process;

    data_out <= shift_reg(127); -- salida desde la última posición

end Behavioral; 
