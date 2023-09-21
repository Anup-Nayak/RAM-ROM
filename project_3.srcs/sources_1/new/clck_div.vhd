----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/04/2023 02:22:00 PM
-- Design Name: 
-- Module Name: clck_div - Behavioral
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
use IEEE.numeric_std.ALL;
entity clck_div is
    port(clk, reset: in std_logic;
         clock_out : out std_logic);
end clck_div;

architecture Behavioral of clck_div is
    signal count: integer := 1;
    signal tmp : std_logic := '0';
begin
    process(clk, reset)
    begin if (reset = '1') then
            count <= 1;
            tmp <= '0';
        elsif(clk'event and clk='1') then
            count <= count +1;
            if (count = 25000) then
                tmp <= not tmp;
                count <= 1;
            end if;
        end if;
        clock_out <= tmp;
    end process;

end Behavioral;
