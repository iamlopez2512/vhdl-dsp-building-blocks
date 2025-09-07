----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025 05:39:46 PM
-- Design Name: 
-- Module Name: Exercici_3_v2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implementación usando una variable dentro de un proceso
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

entity Exercici_3_v2 is
  Port ( 
    A : in std_logic;
    B : in std_logic;
    C : in std_logic;
    Q : out std_logic
    );
end Exercici_3_v2;

architecture Behavioral of Exercici_3_v2 is
begin
    process(A, B, C)
        variable S : std_logic;  -- Declarar S como variable
    begin
        S := A OR B;        -- Operación lógica OR con A y B
        Q <= S AND C;       -- Operación lógica AND con C y la variable S
    end process;
end Behavioral;