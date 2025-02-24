library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff is
    port (
        clk   : in std_logic;
        D     : in std_logic;
        reset : in std_logic;
        Q     : out std_logic;
        Qbar  : out std_logic
    );
end dff;

architecture behavior of dff is
begin
    process (clk, reset)
    begin
        if reset = '1' then
            Q <= '0';
            Qbar <= '1';
        elsif rising_edge(clk) then
            Q <= D;
            Qbar <= not D;
        end if;
    end process;


end behavior;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_tb is
end dff_tb;

architecture tb of dff_tb is
    component dff
        port (
            clk   : in std_logic;
            D     : in std_logic;
            reset : in std_logic;
            Q     : out std_logic;
            Qbar  : out std_logic
        );
    end component;

    signal clk, D, reset: std_logic := '0';
    signal Q, Qbar: std_logic;
begin
    UUT: dff port map(clk => clk, D => D, reset => reset, Q => Q, Qbar => Qbar);

    process
    begin
        clk <= not clk;
        wait for 5 ns;
    end process;

    process
    begin
        reset <= '1'; wait for 20 ns;
        reset <= '0'; wait for 20 ns;

        D <= '0'; wait for 20 ns;
        D <= '1'; wait for 20 ns;
        D <= '0'; wait for 20 ns;
        D <= '1'; wait for 20 ns;

        wait;
    end process;
end tb;
