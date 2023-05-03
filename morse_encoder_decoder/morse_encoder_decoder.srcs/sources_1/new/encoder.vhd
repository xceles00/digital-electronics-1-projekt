
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
           clk : in STD_LOGIC
           );
           
end encoder;

architecture Behavioral of encoder is

-- Local delay counter
  signal sig_cnt : integer;
  signal sig_en : std_logic;
  signal clk_new : STD_LOGIC;

  -- Specific values for local counter
  constant c_DOT_250ms : unsigned(4 downto 0) := b"1_0000"; --! 4-second delay
  constant c_DASH_750ms : unsigned(4 downto 0) := b"0_1000"; --! 2-second delay
  constant c_SPACE_250ms : unsigned(4 downto 0) := b"0_0100"; --! 1-second delay

component digi_clk
  	port (clk_in : in STD_LOGIC;
  		 clk_out: out STD_LOGIC);
  end component;

begin
  
clk_div : dig_clk port map (clk, clk_new);

clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 1
      -- FOR IMPLEMENTATION, CALCULATE VALUE: 250 ms / (1/100 MHz)
      -- 1   @ 10 ns
      -- ??? @ 250 ms
      g_MAX => 25000000
    )
    port map (
      clk => clk,
      ce  => sig_en,
      rst => rst
    );


p_encoder : process (clk) is

begin
    if rising_edge(clk) then
        if rst = '1' then
            LED <= '0';
            sig_cnt <= 0;
        elsif SW = "00001" then -- A .-
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
                    sig_cnt <= 5;
               when 5 =>
                    LED <= '0';
                    sig_cnt <= 6;
               when 6 =>
                    LED <= '0';
                    sig_cnt <= 7;
               when 7 =>
                    LED <= '0';
                    sig_cnt <= 8;
                when others =>
                    LED <= '0';
            end case;
              
        elsif SW = "00010" then -- B -...
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
              
         elsif SW = "01000" then -- H ....
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
                    LED <= '0';
                    sig_cnt <= 0;
                when others =>
                    LED <= '0';
            end case;
              
         elsif SW = "01111" then -- O ---
            case sig_cnt is
                when 0 =>
                    LED <= '1';
                    sig_cnt <= 1; -- comma
                when 1 =>
                    LED <= '1';
                    sig_cnt <= 2;
                when 2 =>
                    LED <= '1';
                    sig_cnt <= 3; --
                when 3 =>
                    LED <= '0';
                    sig_cnt <= 4; -- gap
                when 4 =>
                    LED <= '1';
                    sig_cnt <= 5; -- comma
                when 5 =>
                    LED <= '1';
                    sig_cnt <= 6;
                when 6 =>
                    LED <= '1';   --
                    sig_cnt <= 7;
                when 7 =>
                    LED <= '0';		-- gap
                    sig_cnt <= 8;
                when 8 =>
                    LED <= '1';
                    sig_cnt <= 9;
                when 9 =>
                    LED <= '1';
                    sig_cnt <= 10;
                when 10 =>
                    LED <= '1';
                    sig_cnt <= 11;
                when 11 =>
                    LED <= '0';
                    sig_cnt <= 0;
                when others =>
                    LED <= '0';
            end case;
              
         elsif SW = "01010" then -- J .---
            case sig_cnt is
                when 0 =>
                    LED <= '0';
                    sig_cnt <= 1; 
                when 1 =>
                    LED <= '1';
                    sig_cnt <= 2;
                when 2 =>
                    LED <= '1';
                    sig_cnt <= 3; 
                when 3 =>
                    LED <= '1';
                    sig_cnt <= 4; 
                when 4 =>
                    LED <= '0';
                    sig_cnt <= 5; 
                when 5 =>
                    LED <= '1';
                    sig_cnt <= 6;
                when 6 =>
                    LED <= '1';   
                    sig_cnt <= 7;
                when 7 =>
                    LED <= '1';		
                    sig_cnt <= 8;
                when 8 =>
                    LED <= '0';
                    sig_cnt <= 9;
                when 9 =>
                    LED <= '1';
                    sig_cnt <= 10;
                when 10 =>
                    LED <= '1';
                    sig_cnt <= 11;
                when 11 =>
                    LED <= '1';
                    sig_cnt <= 12;
                when 12 =>
                    LED <= '0';
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

