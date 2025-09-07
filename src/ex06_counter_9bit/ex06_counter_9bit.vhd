library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Comptador de 9 bits amb reset sincronitzat
entity Exercici_6 is
    Port (
        clk : in  std_logic;
        rst : in  std_logic;
        Q   : out std_logic_vector(8 downto 0)
    );
end Exercici_6;

architecture Behavioral of Exercici_6 is
    signal counter : unsigned(8 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    -- Convertim el valor unsigned a std_logic_vector per la sortida
    Q <= std_logic_vector(counter);
end Behavioral;
