library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL; 
use STD.TEXTIO.ALL; 
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_12 is
--  Port ( );
end tb_12;

architecture Behavioral of tb_12 is

component ex_12_wrapper is
    Port ( 
        Dout_cos : out STD_LOGIC_VECTOR ( 15 downto 0 );
        Dout_sin : out STD_LOGIC_VECTOR ( 15 downto 0 );
        aclk : in STD_LOGIC
        );
end component;

signal Dout_cos : STD_LOGIC_VECTOR (15 downto 0);
signal Dout_sin : STD_LOGIC_VECTOR (15 downto 0);
signal clk : STD_LOGIC;

begin

simulation_12 : ex_12_wrapper

port map (Dout_cos => Dout_cos, Dout_sin => Dout_sin, aclk => clk);

time_process: process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

 -- Desar el senyal en fase (I) a un fitxer
process (clk) is 
    -- posar el nom del directori on es trobi el fitxer
    file my_output : TEXT open WRITE_MODE is "file_NCO_I.txt"; 
     variable my_output_line : LINE; 
    begin 
        if clk = '1' then 
            write(my_output_line, to_integer(signed(Dout_cos))); 
            writeline(my_output, my_output_line); 
        end if; 
    end process;

-- Desar el senyal en quadratura (Q) a un fitxer    
process (clk) is 
    -- posar el nom del directori on es trobi el fitxer
    file my_output : TEXT open WRITE_MODE is "file_NCO_Q.txt"; 
     variable my_output_line : LINE; 
    begin 
        if clk = '1' then 
            write(my_output_line, to_integer(signed(Dout_sin))); 
            writeline(my_output, my_output_line); 
        end if; 
    end process;    
    

end Behavioral;