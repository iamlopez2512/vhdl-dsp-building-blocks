library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Exercici 7: activa una sortida quan el comptador val 256
entity Exercici_7 is
    Port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        Q     : out std_logic_vector(8 downto 0);
        actiu : out std_logic
    );
end Exercici_7;

architecture Behavioral of Exercici_7 is

    -- Component del comptador reutilitzable
    component Comptador_9bits is
        Port (
            clk : in  std_logic;
            rst : in  std_logic;
            Q   : out std_logic_vector(8 downto 0)
        );
    end component;

    signal comptador_senyal : std_logic_vector(8 downto 0);
    signal comptador_valor  : unsigned(8 downto 0);

begin

    -- Instanciació del component comptador
    UUT_comptador: Comptador_9bits
        port map (
            clk => clk,
            rst => rst,
            Q   => comptador_senyal
        );

    -- Assignació de la sortida del comptador
    Q <= comptador_senyal;

    -- Comparació amb 256
    comptador_valor <= unsigned(comptador_senyal);
    actiu <= '1' when comptador_valor = 256 else '0';

end Behavioral;
