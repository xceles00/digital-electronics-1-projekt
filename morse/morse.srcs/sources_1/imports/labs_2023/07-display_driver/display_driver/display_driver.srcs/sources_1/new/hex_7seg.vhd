----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2023 03:18:45 PM
-- Design Name: 
-- Module Name: hex_7seg - Behavioral
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

entity hex_7seg is
    Port ( blank : in STD_LOGIC;
           hex : in STD_LOGIC_VECTOR (4 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end hex_7seg;

architecture Behavioral of hex_7seg is

begin
 --------------------------------------------------------
  -- p_7seg_decoder:
  -- A combinational process for 7-segment display (Common
  -- Anode) decoder. Any time "hex" or "blank" is changed,
  -- the process is "executed". Output pin seg(6) controls
  -- segment A, seg(5) segment B, etc.
  --     segment A
  --      | segment B
  --      |  | segment C
  --      +-+|  |   ...   segment G
  --        ||+-+          |
  --        |||            |
  -- seg = "0000001"-------+
  --
  -- Display is clear/blank if signal blank = 1.
  --------------------------------------------------------

  p_7seg_decoder : process (blank, hex) is

  begin

    if (blank = '1') then
      seg <= "1111111";     -- Blanking display
    else

      case hex is

        when "00001" =>

          seg <= "0001000"; -- A

        when "00010" =>

          seg <= "1100000"; -- b
          
        when "00011" =>

          seg <= "0110001"; -- C

        when "00000" =>

          seg <= "1000010"; -- d

        when "00100" =>

          seg <= "0110000"; -- E
       
        when "00101" =>

          seg <= "0111000"; -- F
          
        when "00110" =>

          seg <= "0100000"; -- 6          

        when "00111" =>

          seg <= "0001111"; -- 7          

        when "01000" =>

          seg <= "1001000"; -- 8

        when "01001" =>

          seg <= "0000100"; -- 9
        
        when "01010" =>

          seg <= "1000011"; -- J

        when "01011" =>

          seg <= "1100000"; -- b
          
        when "01100" =>

          seg <= "0110001"; -- C
          
        when "01101" =>

          seg <= "1000010"; -- d

        when "01110" =>

          seg <= "0110000"; -- E
          
        when "01111" =>

          seg <= "0000001"; -- O

        when others =>

          seg <= "0111000"; -- F

      end case;

    end if;

  end process p_7seg_decoder;


end Behavioral;
