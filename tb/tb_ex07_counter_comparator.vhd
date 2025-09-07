library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench per Exercici_7
entity TB_Exercici_7 is
end TB_Exercici_7;

architecture Behavioral of TB_Exercici_7 is

    component Exercici_7
        Port (
            clk   : in  std_logic;
            rst   : in  std_logic;
            Q     : out std_logic_vector(8 downto 0);
            actiu : out std_logic
        );
    end component;

    -- Constants
    constant CLK_PERIOD : time := 10 ns;

    -- Senyals de prova
    signal clk_tb   : std_logic := '0';
    signal rst_tb   : std_logic := '1';
    signal Q_tb     : std_logic_vector(8 downto 0);
    signal actiu_tb : std_logic;

begin

    -- Instanciació del mòdul a provar
    UUT: Exercici_7
        port map (
            clk   => clk_tb,
            rst   => rst_tb,
            Q     => Q_tb,
            actiu => actiu_tb
        );

    -- Generador de rellotge
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
        -- Activem el reset inicialment
        rst_tb <= '1';
        wait for 2 * CLK_PERIOD;

        -- Comencem el recompte
        rst_tb <= '0';

        -- Esperem fins que es detecti actiu = '1'
        wait until actiu_tb = '1';
        report "VALOR 256 DETECTAT!" severity note;

        -- Esperem una mica més i reiniciem
        wait for 3 * CLK_PERIOD;
        rst_tb <= '1';
        wait for 2 * CLK_PERIOD;
        rst_tb <= '0';

    end process;

end Behavioral;
