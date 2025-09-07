----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2025 08:56:58 PM
-- Design Name: 
-- Module Name: serialitzador - Behavioral
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

entity Serializador is
    Port (
        clk      : in  STD_LOGIC;
        rst      : in  STD_LOGIC;
        start    : in  STD_LOGIC;
        data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        serial_out : out STD_LOGIC;
        done     : out STD_LOGIC
    );
end Serializador;

architecture Behavioral of Serializador is
    type state_type is (sIDLE, SEND_bit7, SEND_bit6, SEND_bit5, SEND_bit4, SEND_bit3, SEND_bit2, SEND_bit1, SEND_bit0, sDONE);
    signal state, next_state : state_type;
    signal data_reg : STD_LOGIC_VECTOR(7 downto 0);

begin


    SYNC_PROC : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                state <= sIDLE;
            else
                state <= next_state;
            end if;
        end if;
    end process;
    
    -- Senyals de sortida
    OUTPUT_DECODE : process (state, data_reg)
    begin
            serial_out <= '0';
            done <= '0';
           
            case state is
                when sIDLE =>
                    done <= '0';
                when SEND_bit7 =>
                    serial_out <= data_reg(7);  -- Enviar el bit més significatiu
                when SEND_bit6 =>
                    serial_out <= data_reg(6);
                when SEND_bit5 =>
                    serial_out <= data_reg(5);
                when SEND_bit4 =>
                    serial_out <= data_reg(4);
                when SEND_bit3 =>
                    serial_out <= data_reg(3);
                when SEND_bit2 =>
                    serial_out <= data_reg(2);
                when SEND_bit1 =>
                    serial_out <= data_reg(1);
                when SEND_bit0 =>
                    serial_out <= data_reg(0);
                when sDONE =>
                    done <= '1';
                    serial_out <= '0';
		-- completar per tots els estats. Tenir en compte que en l'estat sDONE cal activar el senyal "done"

            end case;    
    end process;

    -- Lògica de transició d'estats
    process (state, start)
    begin
        case state is
            when sIDLE =>
                if start = '1' then
                    next_state <= SEND_bit7;
                else
                    next_state <= sIDLE;
                end if;
            
            when SEND_bit7 =>
                next_state <= SEND_bit6;
                
            when SEND_bit6 =>
                next_state <= SEND_bit5;
                
            when SEND_bit5 =>
                next_state <= SEND_bit4;
                
            when SEND_bit4 =>
                next_state <= SEND_bit3;
                
            when SEND_bit3 =>
                next_state <= SEND_bit2;
           
           when SEND_bit2 =>
                next_state <= SEND_bit1;
                
           when SEND_bit1 =>
                next_state <= SEND_bit0;
                
           when SEND_bit0 =>
                next_state <= sDONE;
                
           when sDONE =>
                next_state <= sIDLE;
            
            -- completar per tots els estats


            when others =>
                null;
        end case;
    end process;
    
    -- emmaguetzemar data_in a data_reg quan start = '1'
    process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                data_reg <= (others => '0');
            else
                 if start = '1' then
                    data_reg <= data_in;
                 end if;      
            end if;            
        end if;
    end process;


end Behavioral;
