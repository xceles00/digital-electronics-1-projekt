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
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

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
           clk_out : in STD_LOGIC
           );
           
end encoder;

architecture Behavioral of encoder is

-- Local delay counter
  signal sig_cnt : integer;
  signal sig_en : std_logic;

  -- Specific values for local counter
  constant c_DOT_250ms : unsigned(4 downto 0) := b"1_0000"; --! 4-second delay
  constant c_DASH_750ms : unsigned(4 downto 0) := b"0_1000"; --! 2-second delay
  constant c_SPACE_250ms : unsigned(4 downto 0) := b"0_0100"; --! 1-second delay


begin

clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 1
      -- FOR IMPLEMENTATION, CALCULATE VALUE: 250 ms / (1/100 MHz)
      -- 1   @ 10 ns
      -- ??? @ 250 ms
      g_MAX => 25000000
    )
    port map (
      clk => clk_out,
      rst => rst,
      ce  => sig_en
    );


p_encoder : process (clk_out) is

begin
    if rising_edge(clk_out) then
        if rst = '1' then
            LED <= '0';
            sig_cnt <= 0;
        --elsif blank = '1' then
            --LED <= '0';
            --sig_cnt <= 0;
        elsif SW = "00001" then -- A
            case sig_cnt is
                when 0 =>
                    LED <= '1';
                    sig_cnt <= 1;
                when 1 =>
                    LED <= '0';
                    sig_cnt <= 2;
                when 2 =>
                    LED <= '1';
                    sig_cnt <= 3;
                when 3 =>
                    LED <= '1';
                    sig_cnt <= 4;
                when 4 =>
                    LED <= '1';
                    sig_cnt <= 0;
                when others =>
                    LED <= '0';
            end case;
        elsif SW = "00010" then -- B
            case sig_cnt is
                when 0 =>
                    LED <= '1';
                    sig_cnt <= 1;
                when 1 =>
                    LED <= '1';
                    sig_cnt <= 2;
                when 2 =>
                    LED <= '1';
                    sig_cnt <= 3;
                when 3 =>
                    LED <= '0';
                    sig_cnt <= 4;
                when 4 =>
                    LED <= '1';
                    sig_cnt <= 5;
                when 5 =>
                    LED <= '0';
                    sig_cnt <= 6;
                when 6 =>
                    LED <= '1';
                    sig_cnt <= 7;
                when 7 =>
                    LED <= '0';
                    sig_cnt <= 8;
                when 8 =>
                    LED <= '1';
                    sig_cnt <= 0;
                when others =>
                    LED <= '0';
            end case;
        else
            LED <= '1';
            sig_cnt <= 0;
        end if;
    end if;
end process;

end Behavioral;
