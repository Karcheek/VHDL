entity full_add is 
port (a,b,cin : in bit;
      sum,carry : out bit);
end full_add;

architecture dataflow of full_add is 
begin 

sum <= a xor b xor cin;
carry <= ((a xor b) and cin) or (a and b);

end dataflow;

entity fa_testb is
end fa_testb;

architecture abc of fa_testb is

signal a,b,c : bit;
signal sum,carry : bit;

component full_add 
port (a,b,cin : in bit ; sum,carry : out bit);

end component;

begin 
I1 : full_add port map(a,b,c,sum,carry);

process 
begin 
a <= '0' ; b <= '0' ; c <= '0' ; wait for 2ns;
a <= '0' ; b <= '0' ; c <= '1' ; wait for 2ns;
a <= '0' ; b <= '1' ; c <= '0' ; wait for 2ns;
a <= '0' ; b <= '1' ; c <= '1' ; wait for 2ns;
a <= '1' ; b <= '0' ; c <= '0' ; wait for 2ns;
a <= '1' ; b <= '0' ; c <= '1' ; wait for 2ns;
a <= '1' ; b <= '1' ; c <= '0' ; wait for 2ns;
a <= '1' ; b <= '1' ; c <= '1' ; wait for 2ns;
end process;
end abc;
