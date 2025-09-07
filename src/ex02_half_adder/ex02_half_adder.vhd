----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025 04:48:08 PM
-- Design Name: Half Adder
-- Module Name: Exercici_2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implementación de un Half Adder con proceso if-then-else.
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

entity Exercici_2 is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        SUM : out  STD_LOGIC;
        CARRY : out  STD_LOGIC
    );
end Exercici_2;

architecture Behavioral of Exercici_2 is
begin
    -- Proceso para la implementación del Half Adder
    process(A, B)
    begin
        if (A = '0' and B = '0') then
            SUM <= '0';
            CARRY <= '0';
        elsif (A = '0' and B = '1') then
            SUM <= '1';
            CARRY <= '0';
        elsif (A = '1' and B = '0') then
            SUM <= '1';
            CARRY <= '0';
        else
            SUM <= '0';
            CARRY <= '1';
        end if;
    end process;
end Behavioral;
