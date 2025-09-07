----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2025 05:51:05 PM
-- Design Name: 
-- Module Name: TB_Exercici_2 - Behavioral
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

entity TB_Exercici_3_v2 is
--  Port ( );
end TB_Exercici_3_v2;

architecture Behavioral of TB_Exercici_3_v2 is
    component Exercici_3_v2
        Port (
        A : in std_logic;
        B : in std_logic;
        C : in std_logic;
        Q : out std_logic);
    end component;
    
    signal A_tb : std_logic;
    signal B_tb : std_logic;
    signal C_tb : std_logic;
    signal Q_tb : std_logic;
begin
 Exercici_3_v2_inst: Exercici_3_v2 
      Port map(
        A => A_tb,
        B => B_tb,
        C => C_tb,
        Q => Q_tb
      );
 -- Proceso de estimulación
    stim_proc: process
    begin
        -- Probar todas las combinaciones posibles de A, B y C
        A_tb <= '0'; B_tb <= '0'; C_tb <= '0';
        wait for 1 ms;
        
        A_tb <= '0'; B_tb <= '0'; C_tb <= '1';
        wait for 1 ms;

        A_tb <= '0'; B_tb <= '1'; C_tb <= '0';
        wait for 1 ms;

        A_tb <= '0'; B_tb <= '1'; C_tb <= '1';
        wait for 1 ms;

        A_tb <= '1'; B_tb <= '0'; C_tb <= '0';
        wait for 1 ms;

        A_tb <= '1'; B_tb <= '0'; C_tb <= '1';
        wait for 1 ms;

        A_tb <= '1'; B_tb <= '1'; C_tb <= '0';
        wait for 1 ms;

        A_tb <= '1'; B_tb <= '1'; C_tb <= '1';
        wait for 1 ms;

        -- Fin de la simulación
        wait;
    end process;
end Behavioral;