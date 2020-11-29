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

ENTITY mod_6d_vhd_tst IS
END mod_6d_vhd_tst;
ARCHITECTURE mod_6d_arch OF mod_6d_vhd_tst IS
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
COMPONENT mod_6d
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
	i1 : mod_6d
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

-- Ciclo completo: 
--	Zera o contador
--	Insere 0
--	Conta atÃ© chega em 0 novamente
ciclo_completo : PROCESS                                               
-- variable declarations                                     
BEGIN                                                                                                        

	-- Zera o contador
	clr_n <= '0';
	wait for 10 ns;
	clr_n <= '1';
	
	-- Clock de quando espera-se entradas,
	-- Obs: frequencia aumentada aqui comparado
	-- ao projeto para facilitar visualizacao
	clk <= '0';
	wait for 15 ns;
	-- Insere 9
	data_in <= "1001";
	load_n <= '0';
	en <= '0';
	clk <= '1';
	wait for 15 ns;
	load_n <= '1';
	-- Comeca a contar
	en <= '1';
	-- Clock de contagem
	-- Obs: frequencia tambem aumentada 
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
END mod_6d_arch;