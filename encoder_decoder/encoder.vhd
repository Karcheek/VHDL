entity encode is
port(A: in bit_vector(7 downto 0); Y:out bit_vector(2 downto 0));
end encode;

architecture abc of encode is
begin
Y(0)<=A(4) or A(5)or A(6) or A(7);
Y(1)<=A(2) or A(3)or A(6) or A(7);
Y(2)<=A(1) or A(5)or A(3) or A(7);
end abc;

entity encodetest is
end encodetest;

architecture xyz of encodetest is
signal A: bit_vector(7 downto 0); 
signal Y:bit_vector(2 downto 0);

component encode 
port (A: in bit_vector(7 downto 0); Y:out bit_vector(2 downto 0));
end component;

begin 
I1: encode port map(A,Y);

process
begin
A<="00000001"; wait for 3 ns;
A<="00000010"; wait for 3 ns;
A<="00000100"; wait for 3 ns;
A<="00001000"; wait for 3 ns;
A<="00010000"; wait for 3 ns;
A<="00100000"; wait for 3 ns;
A<="01000000"; wait for 3 ns;
A<="10000000"; wait for 3 ns;


end process;
end xyz;
