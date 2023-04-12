----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2023 03:46:42 PM
-- Design Name: 
-- Module Name: encoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encoder is
    Port ( SW : in STD_LOGIC_VECTOR (4 downto 0);
           LED : out STD_LOGIC;
           rst : in STD_LOGIC;
           blank : in STD_LOGIC);
           
end encoder;

architecture Behavioral of encoder is

begin

p_encoder : process (SW, blank) is



    if (blank = '1') then
      LED <= '0';
      
    else

      case SW is

        when "00000" =>

          LED <= '1';

end Behavioral;
