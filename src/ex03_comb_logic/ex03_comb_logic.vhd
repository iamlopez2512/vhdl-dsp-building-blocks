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

entity Exercici_3 is
  Port ( 
  A : in std_logic;
  B : in std_logic;
  C : in std_logic;
  Q : out std_logic);
end Exercici_3;

architecture Behavioral of Exercici_3 is
    signal S : std_logic;
begin
    S <= A OR B;
    Q <= S AND C;
end Behavioral;