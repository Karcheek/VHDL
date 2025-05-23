entity decode is
port(A,B: in bit; Y: out bit_vector(3 downto 0));
end decode;

architecture abc of decode is
begin
y(0)<= (not A) and (not B);
y(1)<= (not A) and (B);
y(2)<= ( A) and (not B);
y(3)<= (A) and (B);

end abc;

entity testb_decode is
end testb_decode;

architecture wyx of testb_decode is
signal A,B: bit;
signal Y: bit_vector(3 downto 0);

component decode
port (A,B: in bit; Y: out bit_vector(3 downto 0));
end component;
begin
I2: decode port map(A,B,Y);

process
begin
A<='0';B<='0'; wait for 5 ns;
A<='0';B<='1'; wait for 5 ns;
A<='1';B<='0'; wait for 5 ns;
A<='1';B<='1'; wait for 5 ns;
end process;
end wyx;
