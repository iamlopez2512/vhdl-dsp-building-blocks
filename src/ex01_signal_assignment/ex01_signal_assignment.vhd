----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 05:03:42 PM
-- Design Name: 
-- Module Name: Exercici_1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Component d'entrada 1 bit i sortida 1 bit

entity Exercici_1 is
    Port (
        x: in std_logic;
        y: out std_logic);
end Exercici_1;

-- Connectar la sortida amb l'entrada

architecture Behavioral of Exercici_1 is
    
begin
    y <= x;
end Behavioral;
