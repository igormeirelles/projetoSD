library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity Timer is
generic(ClockFrequencyHz : integer);
port(
    Clk     : in std_logic;
    nRst    : in std_logic;
    Seconds : inout integer;
    Minutes : inout integer;
	Input : in std_logic);
end entity;
 
architecture rtl of Timer is
    signal Ticks : integer;
 
begin
 
    process(Clk) is
    begin
        if rising_edge(Clk) then
 
            -- If the negative reset signal is active
            if nRst = '0' then
                Ticks   <= 0;
                Seconds <= 0;
                Minutes <= 0;
            else
                
                if Ticks = ClockFrequencyHz + 1 then
                    Ticks <= 0;
 
                    if Seconds = 0 and Minutes > 0 then
                        Seconds <= 59;
                        Minutes <= Minutes - 1;
 
                    else
                        Seconds <= Seconds - 1;
                    end if;
 
                else
                    Ticks <= Ticks + 1;
                end if;
 
            end if;
        end if;
    end process;
 
end architecture;