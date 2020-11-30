# *Timer* para forno microondas em VHDL

Este repositório guarda os arquivos de código VHDL para um projeto realizado como parte da avaliação do curso MCTA024-13 - Sistemas Digitais, no QS.2020 na turma do prof. Rogério Rossi, na Universidade Federal do ABC.  
O projeto trata-se da implementação de um bloco funcional que representa o *timer* de um forno microondas, cujo sistema digital é implementado utilizando FPGAs. Para mais informações vide o Capítulo 10 do livro Sistemas Digitais de R. Tocci, N. Widmer e G. Moss.


## Arquivos:

### mod\_10d.vhdl

Implementação de um contador decrescente cíclico de 9 a 0. Apesar de aceitar uma entrada de 4 bits, o contador faz com que entradas superiores a 9 sejam interpretadas como 9.

### mod\_6d.vhdl

Implementação de um contador decrescente cíclico de 5 a 0. O contador pode aceitar valores de 0 a 9 mas quando chega em 0 recomeça o ciclo em 5. O contador também aceita valores maiores que 9 e interpreta-os como 9.

### timer.vhdl

Timer de microondas com 3 dígitos, construído utilizando os dois componentes descritos acima. O timer aceita um valor em segundos maior que 59 e conta deste valor até 0 e aceita um valor máximo de 9:99 (9 minutos e 99 segundos).

### testbenches

Dentro do diretório testbenches encontram-se os arquivos de testbench para cada um dos componentes do *timer*. Todos os testes foram escritos usando o layout gerado pelo Quartus II.
