library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Component reutilitzable: comptador de 9 bits amb clk i rst
entity Comptador_9bits is
    Port (
        clk : in  std_logic;
        rst : in  std_logic;
        Q   : out std_logic_vector(8 downto 0)
    );
end Comptador_9bits;

architecture Behavioral of Comptador_9bits is
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

    Q <= std_logic_vector(counter);
end Behavioral;
