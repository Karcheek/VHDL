entity demux_4x1 is
port(i : in bit;
     s : in bit_vector(1 downto 0);
     y : out bit_vector(3 downto 0));
end demux_4x1;

architecture demux of demux_4x1 is
begin 
y(0) <= i and not s(0) and not s(1);
y(1) <= i and not s(0) and s(1);
y(2) <= i and s(0) and not s(1);
y(3) <= i and s(0) and s(1);
end demux;

entity demux_test is
end demux_test;

architecture abc of demux_test is
component demux_4x1
port(i: in bit;
     s: in bit_vector(1 downto 0);
     y: out bit_vector(3 downto 0));
end component;

signal I : bit;
signal S : bit_vector(1 downto 0);
signal Y : bit_vector(3 downto 0);

begin 
A1 : demux_4x1 port map(I,S,Y);
process
begin
I <= '1' ; S <= "00" ; wait for 3 ns; 
I <= '1' ; S <= "01" ; wait for 3 ns; 
I <= '1' ; S <= "10" ; wait for 3 ns; 
I <= '1' ; S <= "11" ; wait for 3 ns; 
end process;
end abc; 
  
