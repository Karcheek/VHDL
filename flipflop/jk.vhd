entity JK_FF is
    port (
        J     : in bit;
        K     : in bit;
        clk   : in bit;
        rst_n : in bit;
        Q     : out bit;
        Qn    : out bit
    );
end entity JK_FF;

architecture Behavioral of JK_FF is
    signal state : bit := '0';
begin
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            state <= '0';  
        elsif clk'event and clk = '0' then  
            case (J & K) is
                when "00" => state <= state;  
                when "01" => state <= '0';    
                when "10" => state <= '1';    
                when "11" => state <= not state;  
                when others => state <= '0';  
            end case;
        end if;
    end process;

    Q  <= state;
    Qn <= not state;
end Behavioral;

entity jkff_tb is
end jkff_tb;

architecture tb of jkff_tb is

component JK_FF
    port (
        J     : in bit;
        K     : in bit;
        clk   : in bit;
        rst_n : in bit;
        Q     : out bit;
        Qn    : out bit
    );
end component;

signal J,K,rst_n,Q,Qn: bit;
signal clk: bit := '0';

begin

u1: JK_FF port map 
(
J=>J,
K=>K,
clk=>clk,
rst_n=>rst_n,
Q=>Q,
Qn=>Qn
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
      
        J <= '0'; K <= '0'; 
        wait for 10 ns;

        J <= '0'; K <= '1'; 
        wait for 10 ns;

        J <= '1'; K <= '0'; 
        wait for 10 ns;

        J <= '1'; K <= '1'; 
        wait for 10 ns;

      
        rst_n <= '0';  
        wait for 10 ns;
        rst_n <= '1';  

        
        wait;
    end process;
end tb;









