library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_level is
    Port ( 
        clk : in STD_LOGIC; -- Clock input
        sw : in STD_LOGIC_VECTOR (9 downto 0); -- Switches input
        disp_7seg_o : out STD_LOGIC_VECTOR (6 downto 0) -- Display output
    );
end top_level;

architecture Behavioral of top_level is
    signal counter: STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
    -- Instanciando o display_7seg
    display_instance: entity work.display_7seg
    port map (
        data_i => counter,
        disp_7seg_o => disp_7seg_o
    );

    -- Lógica para atualizar o counter com o switch selecionado
    process(sw)
    begin
        case sw is
            when "1000000000" => counter <= "1001"; -- SW9
            when "0100000000" => counter <= "1000"; -- SW8
            when "0010000000" => counter <= "0111"; -- SW7
            when "0001000000" => counter <= "0110"; -- SW6
            when "0000100000" => counter <= "0101"; -- SW5
            when "0000010000" => counter <= "0100"; -- SW4
            when "0000001000" => counter <= "0011"; -- SW3
            when "0000000100" => counter <= "0010"; -- SW2
            when "0000000010" => counter <= "0001"; -- SW1
            when "0000000001" => counter <= "0000"; -- SW0
            -- Adicione as outras condições aqui
            when others => counter <= "0000";
        end case;
    end process;
end Behavioral;
