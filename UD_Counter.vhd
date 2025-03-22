library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity up_down_counter is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        up_down : in  STD_LOGIC;
        count   : out STD_LOGIC_VECTOR (3 downto 0)
    );
end up_down_counter;

architecture Behavioral of up_down_counter is
    signal temp_count : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
    process (clk, reset)
    begin
        if reset = '1' then
            temp_count <= "0000";
        elsif rising_edge(clk) then
            if up_down = '1' then
                temp_count <= temp_count + 1;
            else
                temp_count <= temp_count - 1;
            end if;
        end if;
    end process;
    count <= temp_count;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_up_down_counter is
end tb_up_down_counter;

architecture testbench of tb_up_down_counter is
    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal up_down : STD_LOGIC := '1';
    signal count   : STD_LOGIC_VECTOR (3 downto 0);

    component up_down_counter
        Port (
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            up_down : in  STD_LOGIC;
            count   : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
begin
    UUT: up_down_counter port map (clk => clk, reset=>reset, up_down=>up_down, count=>count);

    process
    begin
    clk <= not clk;
    wait for 5 ns;
    end process;

    process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        up_down <= '1';
        wait for 100 ns;
        up_down <= '0';
        wait for 100 ns;
        wait;
    end process;
end testbench;