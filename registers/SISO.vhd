library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SISO is
    Port ( clk   : in STD_LOGIC;
           reset : in STD_LOGIC;
           din   : in STD_LOGIC;
           dout  : out STD_LOGIC);
end SISO;

architecture Behavioral of SISO is
    signal shift_reg : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process (clk, reset)
    begin
        if reset = '1' then
            shift_reg <= (others => '0');
        elsif rising_edge(clk) then
            shift_reg(3) <= din;
            shift_reg(2 downto 0) <= shift_reg(3 downto 1);
        end if;
    end process;

    dout <= shift_reg(0);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SISO_tb is
end SISO_tb;

architecture test of SISO_tb is
    component SISO
        Port ( clk   : in STD_LOGIC;
               reset : in STD_LOGIC;
               din   : in STD_LOGIC;
               dout  : out STD_LOGIC);
    end component;

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal din   : STD_LOGIC := '0';
    signal dout  : STD_LOGIC;

begin
    u1: SISO port map (clk=>clk, reset=>reset, din=>din, dout=>dout);

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
        
        din <= '1'; wait for 10 ns;
        din <= '0'; wait for 10 ns;
        din <= '1'; wait for 10 ns;
        din <= '1'; wait for 10 ns;
        din <= '0'; wait for 10 ns;

        wait;
    end process;
end test;
