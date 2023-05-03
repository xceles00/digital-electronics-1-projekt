
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;



entity digi_clk is
port (clk : in std_logic;
       clk_out : out std_logic
     );
end digi_clk;

architecture Behavioral of digi_clk is

signal count : integer :=0;
signal b : std_logic :='0';
begin

 --clk generation.For 100 MHz clock this generates 1 Hz clock.
process(clk) 
begin
if(rising_edge(clk)) then
count <=count+1;
if(count = 50000000) then
b <= not b;
count <=0;

end if;
end if;
clk_out<=b;
end process;
end;
