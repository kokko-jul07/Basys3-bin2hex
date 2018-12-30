----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/12/30 10:52:00
-- Design Name: 
-- Module Name: turnonLED - RTL
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

entity turnonLED is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SW : in STD_LOGIC;
           LED : out STD_LOGIC);
end turnonLED;

architecture RTL of turnonLED is

begin
    process ( CLK, RST )
    begin
        if ( RST = '1' ) then
        elsif ( CLK'event and CLK = '1' ) then
            if ( SW = '1' ) then
                LED <= '1';
            else
                LED <= '0';
            end if;
        end if;
    end process;
end RTL;
