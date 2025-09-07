library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench per Exercici_6
entity TB_Exercici_6 is
end TB_Exercici_6;

architecture Behavioral of TB_Exercici_6 is

    component Exercici_6
        Port (
            clk : in  std_logic;
            rst : in  std_logic;
            Q   : out std_logic_vector(8 downto 0)
        );
    end component;

    -- Senyals de prova
    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal Q_tb   : std_logic_vector(8 downto 0);

    -- Constants
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instanciació del component
    UUT: Exercici_6
        port map (
            clk => clk_tb,
            rst => rst_tb,
            Q   => Q_tb
        );

    -- Generació del rellotge (clock)
    clk_process: process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Procés d’estímuls
    stim_proc: process
    begin
        -- Reset actiu
        rst_tb <= '1';
        wait for 2 * CLK_PERIOD;

        -- Desactivem el reset
        rst_tb <= '0';

        -- Esperem uns quants cicles
        wait for 10 * CLK_PERIOD;

        -- Activem el reset de nou
        rst_tb <= '1';
        wait for 2 * CLK_PERIOD;
        rst_tb <= '0';

        -- Esperem i finalitzem
        wait for 5 * CLK_PERIOD;
        wait;
    end process;

end Behavioral;
