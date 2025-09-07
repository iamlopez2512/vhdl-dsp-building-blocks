----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 05:10:37 PM
-- Design Name: 
-- Module Name: TB_Exercici_1 - Behavioral
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

entity TB_Exercici_1 is
--  Port ( );
end TB_Exercici_1;

architecture Behavioral of TB_Exercici_1 is

    -- creo el component que vull simular
        component Exercici_1 is
            Port (
            x: in std_logic;
            y: out std_logic);
        end component;
    
        -- creo un senyal al TB per entrada i sortida a la simulació
        signal x_tb : std_logic;
        signal y_tb : std_logic;
    begin
           
    Exercici_1_inst : Exercici_1
        Port map(
            x => x_tb,
            y => y_tb);
            
    -- creo un proces, aquest s'executa de forma sequencial, a diferencia de tot lo anterior que s'executa de forma concurrent        
     process
     begin
        x_tb <= '0';
        wait for 1 ms;
        x_tb <= '1';
        wait for 1 ms;
    end process;
end Behavioral;
