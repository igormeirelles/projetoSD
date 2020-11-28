-- Contador BCD cíclico decrescente módulo 10 (9->0)
-- Componente do projeto timer - Sistemas Digitais UFABC
-- Autor(es): Pedro T Freidinger;
-- Novembro de 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mod_10d is
    port (
        data_in : in std_logic_vector(3 downto 0); -- Entrada binária do digito a ser inserido 0-9
        load_n : in std_logic; -- Carrega a entrada, ativado em nível baixo
        clr_n : in std_logic; -- Clear, ativado em nível baixo
        clk : in std_logic; -- Onda de clock
        en : in std_logic; -- Enable: faz o contador girar
        data_out : buffer std_logic_vector(3 downto 0); -- Binário que representa o número atual
        tc : out std_logic; -- Indica quando o contador vai reiniciar o ciclo
        zero : out std_logic -- Indica quando o contador está zerado
    );
end entity mod_10d;

-- Arquitetura padrão, começa a decrescer e quando chega em 0
-- aciona tc e zero e então retorna a 9 se enable ainda for 1
architecture padrao of mod_10d is
begin

    tc <= not (data_out(3) or data_out(2) or data_out(1) or data_out(0));
    zero <= not (data_out(3) or data_out(2) or data_out(1) or data_out(0));
    -- zero <= tc; ??? talvez possa ser removido

    -- Detecta uma borda de subida de clock ou clear assíncrono
    process(clr_n, clk, en)
        variable count : std_logic_vector(3 downto 0); -- guarda o valor de saída temporariamente
    begin
        if (clr_n ='0') then
            -- zera a conta
            count := "0000";
        elsif (clk'event and clk ='1') then
            if (load_n ='0') then
                -- Garante que só entra BCD
                if (unsigned(data_in) > 9) then
                    count := "1001"; -- 9
                else 
                    -- carrega data_in
                    count := data_in;
                end if;
            elsif (en ='1') then
                -- decrementa a conta
                case data_out is
                    when "0000" =>
                        count := "1001"; -- 9
                    when "0001" =>
                        count := "0000";
                    when others => 
                        count := std_logic_vector(unsigned(data_out) - 1);
                end case;
            end if;
        end if;
        data_out <= count;
    end process;
    
end architecture padrao;