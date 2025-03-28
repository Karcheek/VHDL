entity full_sub is
port (a,b,bin : in bit ;
      d,bout : out bit);
end full_sub;

architecture abc of full_sub is
begin
d <= a xor b xor bin;
bout <= ((not a) and b) or not(a xor b);
end abc;

entity fs_testb is
end fs_testb;

architecture abc of fs_testb is

signal a,b,bin : bit;
signal d,bout : bit;

component full_sub 
port (a,b,bin : in bit ; d,bout : out bit);

end component;

begin 
I1 : full_sub port map(a,b,bin,d,bout);

process 
begin 
a <= '0' ; b <= '0' ; bin <= '0' ; wait for 2ns;
a <= '0' ; b <= '0' ; bin <= '1' ; wait for 2ns;
a <= '0' ; b <= '1' ; bin <= '0' ; wait for 2ns;
a <= '0' ; b <= '1' ; bin <= '1' ; wait for 2ns;
a <= '1' ; b <= '0' ; bin <= '0' ; wait for 2ns;
a <= '1' ; b <= '0' ; bin <= '1' ; wait for 2ns;
a <= '1' ; b <= '1' ; bin <= '0' ; wait for 2ns;
a <= '1' ; b <= '1' ; bin <= '1' ; wait for 2ns;
end process;
end abc;
 