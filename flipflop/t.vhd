library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tff is
    port (
        clk   : in std_logic;
        T     : in std_logic;
        reset : in std_logic;
        Q     : out std_logic;
        Qbar  : out std_logic
    );
end tff;

architecture behavior of tff is
    signal temp : std_logic := '0';
begin
    process (clk, reset)
    begin
        if reset = '1' then
            temp <= '0';
        elsif rising_edge(clk) then
            if T = '1' then
                temp <= not temp;
            end if;
        end if;
    end process;

    Q    <= temp;
    Qbar <= not temp;
end behavior;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tff_tb is
end tff_tb;

architecture tb of tff_tb is
    component tff
        port (
            clk   : in std_logic;
            T     : in std_logic;
            reset : in std_logic;
            Q     : out std_logic;
            Qbar  : out std_logic
        );
    end component;

    signal clk, T, reset: std_logic := '0';
    signal Q, Qbar: std_logic;
begin
    u3: tff port map(clk => clk, T => T, reset => reset, Q => Q, Qbar => Qbar);

    process
    begin
        clk <= not clk;
        wait for 5 ns;
    end process;

    process
    begin
        reset <= '1'; wait for 20 ns;
        reset <= '0'; wait for 20 ns;

        T <= '0'; wait for 20 ns;
        T <= '1'; wait for 20 ns;
        T <= '0'; wait for 20 ns;
        T <= '1'; wait for 20 ns;

        wait;
    end process;
end tb;
