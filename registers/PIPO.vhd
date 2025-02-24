library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PIPO is
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           load  : in  STD_LOGIC;
           pin   : in  STD_LOGIC_VECTOR(3 downto 0);
           dout  : out STD_LOGIC_VECTOR(3 downto 0));
end PIPO;

architecture Behavioral of PIPO is
    signal shift_reg : STD_LOGIC_VECTOR(3 downto 0) := (others => 'U');
begin
    process (clk, reset)
    begin
        if reset = '1' then
            shift_reg <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                shift_reg <= pin;
            end if;
        end if;
    end process;

    dout <= shift_reg;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PIPO_tb is
end PIPO_tb;

architecture test of PIPO_tb is
    component PIPO
        Port ( clk   : in  STD_LOGIC;
               reset : in  STD_LOGIC;
               load  : in  STD_LOGIC;
               pin   : in  STD_LOGIC_VECTOR(3 downto 0);
               dout  : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal load  : STD_LOGIC := '0';
    signal pin   : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal dout  : STD_LOGIC_VECTOR(3 downto 0);

begin
    u4: PIPO port map (clk => clk, reset => reset, load => load, pin => pin, dout => dout);

    process
    begin
        clk <= not clk;
        wait for 5 ns;
    end process;

    process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        load <= '1';
        pin <= "1011";
        wait for 10 ns;

        load <= '0';
        wait for 40 ns;

        wait;
    end process;
end test;
