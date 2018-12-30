----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/12/30 10:29:36
-- Design Name: 
-- Module Name: decode7seg - RTL
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

entity decode7seg is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           HEX : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end decode7seg;

architecture RTL of decode7seg is

begin
    process ( CLK, RST )
    begin
        if ( RST = '1' ) then
            SEG <= (others => '1');
        elsif ( CLK'event and CLK = '1' ) then
            case HEX is
                when X"0" => SEG <= "1000000";
                when X"1" => SEG <= "1111001";
                when X"2" => SEG <= "0100100";
                when X"3" => SEG <= "0110000";
                when X"4" => SEG <= "0011001";
                when X"5" => SEG <= "0010010";
                when X"6" => SEG <= "0000010";
                when X"7" => SEG <= "1111000";
                when X"8" => SEG <= "0000000";
                when X"9" => SEG <= "0010000";
                when X"A" => SEG <= "0001000";
                when X"B" => SEG <= "0000011";
                when X"C" => SEG <= "0100111";
                when X"D" => SEG <= "0100001";
                when X"E" => SEG <= "0000110";
                when X"F" => SEG <= "0001110";
                when others => SEG <= "11111111";
            end case;
        end if;
    end process;
end RTL;
