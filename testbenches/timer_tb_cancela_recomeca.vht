-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "11/29/2020 16:14:46"
                                                            
-- Vhdl Test Bench template for design  :  timer
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY timer_vhd_tst IS
END timer_vhd_tst;
ARCHITECTURE timer_arch OF timer_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL clr_n : STD_LOGIC;
SIGNAL data_in : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL en : STD_LOGIC;
SIGNAL load_n : STD_LOGIC;
SIGNAL mins : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sec_ones : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sec_tens : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL zero : STD_LOGIC;
COMPONENT timer
	PORT (
	clk : IN STD_LOGIC;
	clr_n : IN STD_LOGIC;
	data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	en : IN STD_LOGIC;
	load_n : IN STD_LOGIC;
	mins : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	sec_ones : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	sec_tens : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	zero : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : timer
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	clr_n => clr_n,
	data_in => data_in,
	en => en,
	load_n => load_n,
	mins => mins,
	sec_ones => sec_ones,
	sec_tens => sec_tens,
	zero => zero
	);

-- Insere recomca:
--  Insere 1:25
--  Conta até 1:00
--  Cancela e zera (simulando unidade de controle)
--  Insere 0:25 e conta até 0
insere_segundos : PROCESS                                               
	-- 25 segundos => 25 ciclos de 1 Hz
	constant n_ciclos_contagem : integer := 25;
	-- Clock de standby (espera entrada de dados) 100Hz
	constant meio_clock_standby : time := 5 ms;
	-- Clock de contagem 1 Hz
	constant meio_clock_contagem : time := 500 ms;
BEGIN
	-- Valores iniciais para as entradas
	data_in <= "0000";
	load_n <= '1';
	clr_n <= '1';
	clk <= '0';
	en <= '0';
	-- Zera o contador
	clr_n <= '0';
	wait for meio_clock_standby;
	clk <= '1';
	clr_n <= '1';
	wait for meio_clock_standby;
	-- Insere 125 (para formar 1:25)
	data_in <= "0001"; -- 1
    load_n <= '0';
    clk <= '0';
    wait for meio_clock_standby;
    clk <= '1';
    wait for meio_clock_standby;
    clk <= '0';
    data_in <= "0010"; -- 2
    wait for meio_clock_standby;
    clk <= '1';
    wait for meio_clock_standby;
    clk <= '0';
    data_in <= "0101"; -- 5
    wait for meio_clock_standby;
    clk <= '1';
    wait for meio_clock_standby;
	load_n <= '1';
	-- Conta até 1:00
	en <= '1';
	loop_conta_1_00: for i in 1 to n_ciclos_contagem loop
		-- Garante que se zerar para de contar
		-- simulando a unidade de controle
		en <= not zero; 
		clk <= not clk;
		wait for meio_clock_contagem;
		-- Garante que se zerar para de contar
		-- simulando a unidade de controle
		en <= not zero;
		clk <= not clk;
		wait for meio_clock_contagem;
    end loop loop_conta_1_00;
    -- Simula um cancelamento pela unidade de controle
    en <= '0';
    clr_n <= '0';
    clk <= '0';
    wait for meio_clock_standby;
    clk <= '1';
    wait for meio_clock_standby;
    clr_n <= '1';
    -- Insere 25 (para formar 0:25)
    data_in <= "0010"; -- 2
    load_n <= '0';
    clk <= '0';
    wait for meio_clock_standby;
    clk <= '1';
    wait for meio_clock_standby;
    clk <= '0';
    data_in <= "0101"; -- 5
    wait for meio_clock_standby;
    clk <= '1';
    wait for meio_clock_standby;
    load_n <= '1';
    clk <= '0';
    wait for meio_clock_standby;
    clk <= '1';
    wait for meio_clock_standby;
    clk <= '0';
    wait for meio_clock_standby;
    clk <= '1';
    wait for meio_clock_standby;
	-- Conta até zerar
	en <= '1';
	loop_conta_zero: for i in 1 to n_ciclos_contagem loop
		-- Garante que se zerar para de contar
		-- simulando a unidade de controle
		en <= not zero; 
		clk <= not clk;
		wait for meio_clock_contagem;
		-- Garante que se zerar para de contar
		-- simulando a unidade de controle
		en <= not zero;
		clk <= not clk;
		wait for meio_clock_contagem;
    end loop loop_conta_zero;

WAIT;                                                       
END PROCESS insere_segundos;                                                                                    
END timer_arch;
