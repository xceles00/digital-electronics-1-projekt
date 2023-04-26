----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/19/2023 03:53:37 PM
-- Design Name: 
-- Module Name: tb_encoder - Behavioral
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

entity tb_encoder is
--  Port ( );
end tb_encoder;

architecture Behavioral of tb_encoder is
constant c_CLK_100MHZ_PERIOD : time := 10 ns;
signal sig_rst : std_logic;
signal sig_SW : std_logic_vector(4 downto 0);
signal sig_LED : std_logic;
signal sig_blank : std_logic;
signal sig_clk_100mhz : std_logic;

begin

uut_encoder : entity work.encoder
    port map (
      SW => sig_SW,
      rst => sig_rst,
      LED => sig_LED,
      blank => sig_blank,
      clk => sig_clk_100mhz
    );

p_reset_gen : process is
  
  begin

    sig_rst <= '0';
    wait for 14 ns;
    sig_rst <= '1';
    wait for 28 ns;
    sig_rst <= '0';

    wait;

  end process p_reset_gen;

p_stimulus : process is

  begin
    report "Stimulus process started";

    -- WRITE YOUR CODE HERE AND TEST INPUT VALUE
   
    sig_SW <= "00001";

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end Behavioral;
