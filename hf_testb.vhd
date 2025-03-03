entity hf_testb is 
end hf_testb;

architecture abcd of hf_testb is
component halfadder
port (a,b : in bit ; sum,cout : out bit);
end component;

signal a,b,sum,cout:bit;
begin 
I1 : halfadder port map (a,b,sum,cout);
process 
begin
 
a <= '0' ; b <= '0' ; wait for 2 ns;
a <= '0' ; b <= '1' ; wait for 2 ns;
a <= '1' ; b <= '0' ; wait for 2 ns;
a <= '1' ; b <= '1' ; wait for 2 ns; end process ; end abcd;