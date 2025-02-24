entity encstruc is
port(A: in bit_vector(3 downto 0);
     Y: out bit_vector(1 downto 0));
end encstruc;

architecture structural of encstruc is

component orgate
port( a,b:in bit; y: out bit);
end component;

begin
s1: orgate port map(a=>A(3),b=>A(2),y=>Y(0));
s2: orgate port map(a=>A(1),b=>A(3),y=>Y(1));

end structural;


entity testb_encode is
end testb_encode;

architecture abc of testb_encode is
component encstruc
port(A: in bit_vector(3 downto 0);
     Y: out bit_vector(1 downto 0));

end component;

signal inp1: bit_vector(3 downto 0);
signal f1: bit_vector(1 downto 0);


begin

t2: encstruc 
port map
(
A=>inp1,
Y=>f1
);

process 
begin

inp1<="0001";
wait for 10 ns;

inp1<="0010";
wait for 10 ns;

inp1<="0100";
wait for 10 ns;

inp1<="1000";

wait;
end process;
end abc;
