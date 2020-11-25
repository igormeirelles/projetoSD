library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity testetimer is
end entity;
 
architecture sim of testetimer is
 
    -- We're slowing down the clock to speed up simulation time
    constant ClockFrequencyHz : integer := 10; -- 10 Hz
    constant ClockPeriod      : time := 1000 ms / ClockFrequencyHz;
 
    signal Clk     : std_logic := '1';
    signal nRst    : std_logic := '0';
    signal Seconds : integer;
    signal Minutes : integer;
    signal Hours   : integer;
	signal Input   : std_logic_vector (15 downto 0);
	signal Input_p1 : std_logic_vector (7 downto 0);
	signal Input_p2 : std_logic_vector (7 downto 0);

 
begin
	
	Input_p1 <= Input (15 downto 8);
	Input_p2 <= Input (7 downto 0);
	Minutes = Input_p1;
	Seconds = Input_p2;
	
    -- The Device Under Test (DUT)
    i_Timer : entity work.Timer(rtl)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        Clk     => Clk,
        nRst    => nRst,
        Seconds => Seconds,
        Minutes => Minutes,
 
    -- Process for generating the clock
    Clk <= not Clk after ClockPeriod / 2;
 
    -- Testbench sequence
    process is
    begin
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
 
        -- Take the DUT out of reset
        nRst <= '1';
 
        wait;
    end process;
 
end architecture;