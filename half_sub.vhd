entity halfsub is 
port (a,b : in bit;
      d,bout : out bit);
end halfsub;

architecture dataflow of halfsub is
begin

d <= a xor b;
bout <= (not a) and b;
end dataflow;

entity hs_testb is 
end hs_testb;

architecture abcd of hs_testb is
component halfsub
port (a,b : in bit ; d,bout : out bit);
end component;

signal a,b,d,bout:bit;
begin 
I1 : halfsub port map (a,b,d,bout);
process 
begin
 
a <= '0' ; b <= '0' ; wait for 2 ns;
a <= '0' ; b <= '1' ; wait for 2 ns;
a <= '1' ; b <= '0' ; wait for 2 ns;
a <= '1' ; b <= '1' ; wait for 2 ns; 
end process ; end abcd;
