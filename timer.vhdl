-- Timer completo utilizando os contadores BCD ciclicos
-- Componente do projeto timer - Sistemas Digitais UFABC
-- Autor(es): Pedro T Freidinger, Igor Meirelles e Heberton Miranda;
-- Novembro de 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
    port (
        data_in : in std_logic_vector(3 downto 0); -- Entrada binária do digito a ser inserido 0-9
        load_n : in std_logic; -- Carrega a entrada, ativado em nível baixo
        clr_n : in std_logic; -- Clear, ativado em nível baixo
        clk : in std_logic; -- Onda de clock
        en : in std_logic; -- Enable: faz o contador girar
        sec_ones : buffer std_logic_vector(3 downto 0); -- Saída binária do digito menos significativo dos segundos entre 0-9
        sec_tens : buffer std_logic_vector(3 downto 0); -- Saída binária do digito da dezena dos segundos entre 0-5
        mins : out std_logic_vector(3 downto 0); -- Saída binária do digito dos minutos (mais significativo) entre 0-9
        zero : out std_logic -- Indica quando o contador está zerado
        );
end entity timer;

architecture padrao of timer is

	--Declaração dos componentes dos contadores
	component mod_6d is
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
	end component mod_6d;

	component mod_10d is
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
	end component mod_10d;

	--Sinais internos do timer completo
	signal tc_secs, tc_mins : std_logic; -- Sinais tc que ligam ao en do próximo digito
	signal zero_ones, zero_tens, zero_mins : std_logic; -- Sinais dos zeros de cada digito

begin

	zero <= zero_ones and zero_tens and zero_mins; -- Saida E dos zeros dos contadores

	-- Utilizacao do componente contador mod 10 para o digito menos significativo dos segundos
	ent_secs: mod_10d
		port map(
			data_in => data_in,
			load_n => load_n,
			clr_n => clr_n,
			clk => clk,
			en => en,
			data_out => sec_ones,
			tc => tc_secs,
			zero => zero_ones
		);
	-- Utilizacao do componente contador mod 6 para o digito das dezenas de segundos
	ent_tens: mod_6d
		port map(
			data_in => sec_ones,-- => data_in,
			en => tc_secs,-- => en,
			load_n => load_n,
			clr_n => clr_n,
			clk => clk,
			data_out => sec_tens,
			tc => tc_mins,
			zero => zero_tens	
	);

	-- Utilizacao do componente contador mod 10 para o digito mais significativo (minutos)
	ent_mins: mod_10d
		port map(
			data_in => sec_tens,-- => data_in
			en => tc_mins,-- => en,
			load_n => load_n,
			clr_n => clr_n,
			clk => clk,
			data_out => mins,
			zero => zero_mins
	);
end architecture padrao;