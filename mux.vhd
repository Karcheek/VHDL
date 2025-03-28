entity mux_4x1 is
port(i:in bit_vector(3 downto 0);
     s:in bit_vector(1 downto 0);
     y:out bit);
end mux_4x1;

architecture mux of mux_4x1 is
begin
y <= (i(0) and (not s(0)) and (not s(1))) or (i(1) and s(0) and (not s(1))) or (i(2) and (not s(0)) and s(1)) or (i(3) and s(0) and  s(1));
end mux;

entity mux_test is 
end mux_test;

architecture mux_4 of mux_test is
component mux_4x1
port(i:in bit_vector(3 downto 0);
     s:in bit_vector(1 downto 0);
     y:out bit);
end component;

signal I : bit_vector(3 downto 0);
signal S : bit_vector(1 downto 0);
signal Y : bit;

begin 
A1 : mux_4x1 port map(I,S,Y);
process
begin
I <= "1010" ; S <= "00" ; wait for 3 ns; 
I <= "1010" ; S <= "01" ; wait for 3 ns; 
I <= "1010" ; S <= "10" ; wait for 3 ns; 
I <= "1010" ; S <= "11" ; wait for 3 ns; 
end process;
end mux_4;
