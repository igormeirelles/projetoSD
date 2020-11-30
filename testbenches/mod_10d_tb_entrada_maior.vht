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
-- Generated on "11/25/2020 22:55:08"
                                                            
-- Vhdl Test Bench template for design  :  mod_10d
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mod_10d_vhd_tst IS
END mod_10d_vhd_tst;
ARCHITECTURE mod_10d_arch OF mod_10d_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL clr_n : STD_LOGIC;
SIGNAL data_in : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL data_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL en : STD_LOGIC;
SIGNAL load_n : STD_LOGIC;
SIGNAL tc : STD_LOGIC;
SIGNAL zero : STD_LOGIC;
COMPONENT mod_10d
	PORT (
	clk : IN STD_LOGIC;
	clr_n : IN STD_LOGIC;
	data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	data_out : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	en : IN STD_LOGIC;
	load_n : IN STD_LOGIC;
	tc : BUFFER STD_LOGIC;
	zero : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mod_10d
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	clr_n => clr_n,
	data_in => data_in,
	data_out => data_out,
	en => en,
	load_n => load_n,
	tc => tc,
	zero => zero
	);

-- Entrada maior: 
--	Zera o contador
--	Insere 15 depois zera;
--  Insere 12 depois zera;
--  Insere 10 e começa a contar;
--  Resultado esperado: em todos os casos
--  o valor será 9
ciclo_completo : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        

	en <= '0';
	load_n <= '1';
	data_in <= "0000";
	clr_n <= '1';
	-- Clock de quando espera-se entradas,
	-- Obs: frequencia aumentada aqui comparado
	-- ao projeto para facilitar visualizacao
	clk <= '0';
	wait for 15 ns;
	-- Zera o contador
	clr_n <= '0';
	clk <= '1';
	wait for 15 ns;
	clr_n <= '1';
	clk <= '0';
	wait for 15 ns;
	clk <= '1';
	-- Insere 15
	load_n <= '0';
	data_in <= "1111";	
	wait for 15 ns;
	clk <= '0';
	wait for 15 ns;
	clk <= '1';
	load_n <= '1';
	wait for 15 ns;
	clk <= '0';
	wait for 15 ns;
	clk <= '1';
	wait for 15 ns;
	-- Zera
	clr_n <= '0';
	clk <= '0';
	wait for 15 ns;
	clr_n <= '1';
	clk <= '1';
	wait for 15 ns;
	clk <= '0';
	wait for 15 ns;
	clk <= '1';
	-- Insere 12
	load_n <= '0';
	data_in <= "1100";	
	wait for 15 ns;
	clk <= '0';
	wait for 15 ns;
	clk <= '1';
	load_n <= '1';
	wait for 15 ns;
	clk <= '0';
	wait for 15 ns;
	clk <= '1';
	wait for 15 ns;
	-- Zera
	clr_n <= '0';
	clk <= '0';
	wait for 15 ns;
	clr_n <= '1';
	clk <= '1';
	wait for 15 ns;
	-- Insere 10
	load_n <= '0';
	data_in <= "1010";	
	wait for 15 ns;
	clk <= '0';
	wait for 15 ns;
	clk <= '1';
	-- Começa a contar
	load_n <= '1';
	en <= '1';
	-- Clock de contagem
	clk <= '0';
	wait for 20 ns;
	clk <= '1'; 
	wait for 20 ns;
	clk <= '0';
	wait for 20 ns;
	clk <= '1'; 
	wait for 20 ns;
	clk <= '0';
	wait for 20 ns;
	clk <= '1'; 
	wait for 20 ns;
	clk <= '0';
	wait for 20 ns;
	clk <= '1'; 
	wait for 20 ns;			 
		 
WAIT;                                                       
END PROCESS ciclo_completo;                                         
END mod_10d_arch;
