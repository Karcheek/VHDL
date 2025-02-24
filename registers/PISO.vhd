library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO is
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           load  : in  STD_LOGIC;
           pin   : in  STD_LOGIC_VECTOR(3 downto 0);
           dout  : out STD_LOGIC);
end PISO;

architecture Behavioral of PISO is
    signal shift_reg : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process (clk, reset)
    begin
        if reset = '1' then
            shift_reg <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                shift_reg <= pin;
            else
                shift_reg(2 downto 0) <= shift_reg(3 downto 1);
                shift_reg(3) <= 'X';
            end if;
        end if;
    end process;

    dout <= shift_reg(0);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO_tb is
end PISO_tb;

architecture test of PISO_tb is
    component PISO
        Port ( clk   : in  STD_LOGIC;
               reset : in  STD_LOGIC;
               load  : in  STD_LOGIC;
               pin   : in  STD_LOGIC_VECTOR(3 downto 0);
               dout  : out STD_LOGIC);
    end component;

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal load  : STD_LOGIC := '0';
    signal pin   : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal dout  : STD_LOGIC;

begin
    u3: PISO port map (clk => clk, reset => reset, load => load, pin => pin, dout => dout);

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
