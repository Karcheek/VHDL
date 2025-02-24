library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FF is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           rst_n: in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qn : out STD_LOGIC);
end SR_FF;

architecture Behavioral of SR_FF is
    signal Q_int : STD_LOGIC := '0';  
begin
    process(clk,rst_n)
    begin
            if rst_n = '0' then
            Q_int  <= '0';
        elsif falling_edge(clk) then
         
            if (S = '1' and R = '1') then
                Q_int <= 'X';  
            elsif (S = '1' and R = '0') then
                Q_int <= '1'; 
            elsif (S = '0' and R = '1') then
                Q_int <= '0';  
            end if;
        end if;
    end process;

   
    Q <= Q_int;
    Qn <= not Q_int;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity srff_tb is
end srff_tb;

architecture tb of srff_tb is
   
    component SR_FF
        port (
            S     : in STD_LOGIC;
            R     : in STD_LOGIC;
            clk   : in STD_LOGIC;
            rst_n : in STD_LOGIC;
            Q     : out STD_LOGIC;
            Qn    : out STD_LOGIC
        );
    end component;

   
    signal S, R, rst_n, Q, Qn : STD_LOGIC;
    signal clk : STD_LOGIC := '0';

begin

    u2: SR_FF port map (
        S => S,
        R => R,
        clk => clk,
        rst_n => rst_n,
        Q => Q,
        Qn => Qn
    );

process
    begin
        clk <= not clk;
        wait for 5 ns;
    end process;

 
process
    begin
      
        rst_n <= '0';  
        wait for 10 ns;
        rst_n <= '1';  
  
        S <= '0'; R <= '0'; 
        wait for 10 ns;

        S <= '1'; R <= '0'; 
        wait for 10 ns;

        S <= '0'; R <= '1'; 
        wait for 10 ns;

        S <= '1'; R <= '1'; 
        wait for 10 ns;

        rst_n <= '0';  
        wait for 10 ns;

        wait;
    end process;

end tb;





