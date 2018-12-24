----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/12/24 08:21:22
-- Design Name: 
-- Module Name: bin2hex - decode7seg
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bin2hex is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0);
           AN : out STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end bin2hex;

architecture decode7seg of bin2hex is
    signal counter : STD_LOGIC_VECTOR (15 downto 0);
    signal period : STD_LOGIC;
    signal switch : STD_LOGIC_VECTOR (1 downto 0);
    signal seg1 : STD_LOGIC_VECTOR (6 downto 0);
    signal seg2 : STD_LOGIC_VECTOR (6 downto 0);
    signal seg3 : STD_LOGIC_VECTOR (6 downto 0);
    signal seg4 : STD_LOGIC_VECTOR (6 downto 0);
    component decode7seg is
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            HEX : in STD_LOGIC_VECTOR(3 downto 0);
            SEG : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;
    component turnonLED is
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            SW  : in STD_LOGIC;
            LED : out STD_LOGIC
        );
    end component;
begin
    process ( CLK, RST ) begin
        if ( RST = '1' ) then
            counter <= (others => '0');
        elsif ( CLK'EVENT and CLK ='1' ) then
            counter <= counter + 1;
        end if;
    end process;

    period <= '1' when counter = X"FFFF" else '0';

    process ( CLK, RST ) begin
        if ( RST = '1' ) then
            switch <= (others => '0');
        elsif ( period'EVENT and period ='1' ) then
            switch <= switch + 1;
        end if;
    end process;

    dec1 : decode7seg port map ( CLK => CLK, RST => RST, HEX => SW( 3 downto  0), SEG => seg1 );
    dec2 : decode7seg port map ( CLK => CLK, RST => RST, HEX => SW( 7 downto  4), SEG => seg2 );
    dec3 : decode7seg port map ( CLK => CLK, RST => RST, HEX => SW(11 downto  8), SEG => seg3 );
    dec4 : decode7seg port map ( CLK => CLK, RST => RST, HEX => SW(15 downto 12), SEG => seg4 );

    process ( switch ) begin
        case switch is
            when "00" => SEG(6 downto 0) <= seg1; AN <= "1110";
            when "01" => SEG(6 downto 0) <= seg2; AN <= "1101";
            when "10" => SEG(6 downto 0) <= seg3; AN <= "1011";
            when "11" => SEG(6 downto 0) <= seg4; AN <= "0111";
            when others => SEG <= "1111111"; AN <= "1111";
        end case;
    end process;

    turnon: for i in 0 to 15 generate
        leds : turnonLED port map ( CLK => CLK, RST => RST, SW => SW(i), LED => LED(i) );
    end generate turnon;

end decode7seg;