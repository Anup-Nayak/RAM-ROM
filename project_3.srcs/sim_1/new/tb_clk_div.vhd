----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/04/2023 02:32:45 PM
-- Design Name: 
-- Module Name: tb_clk_div - Behavioral
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

entity tb_clk_div is
end tb_clk_div;

architecture Behavioral of tb_clk_div is
    component clck_div
        port(
            clk: in std_logic;
            reset: in std_logic;
            clock_out: out std_logic
        );
    end component;
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal clock_out : std_logic;
    constant clk_period : time := 20 ns;
begin
    uut : clck_div port map(
            clk => clk,
            reset => reset,
            clock_out => clock_out
        );
    clk_process : process
    begin
        wait for 5ps;
        reset <= '1';
        wait for 5 ps;
        reset <= '0';
        
    end process;
end Behavioral;
