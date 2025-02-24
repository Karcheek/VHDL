entity decodestruc is
port 
(
s: in bit_vector(1 downto 0);
y: out bit_vector(3 downto 0)
);
end decodestruc;

architecture structural of decodestruc is

component andgate 
port
(
a,b: in bit;
y: out bit
);
end component;

component notgate 
port
(
a: in bit;
y: out bit
);
end component;

signal nots0,nots1: bit;

begin

si0: notgate port map
(
a=>s(0),
y=>nots0
);

si1: notgate port map
(
a=>s(1),
y=>nots1
);

ii1: andgate port map
(
a=>nots0,
b=>nots1,
y=>y(0)
);


ii2: andgate port map
(
a=>s(0),
b=>nots1,
y=>y(1)
);

ii3: andgate port map
(
a=>nots0,
b=>s(1),
y=>y(2)
);

ii4: andgate port map
(
a=>s(0),
b=>s(1),
y=>y(3)
);

end structural;

entity decodestruc_tb is
end decodestruc_tb;

architecture abc of decodestruc_tb is
component decodestruc
port 
(
s: in bit_vector(1 downto 0);
y: out bit_vector(3 downto 0)
);
end component;


signal inp: bit_vector(1 downto 0);
signal f: bit_vector(3 downto 0);

begin

t2: decodestruc 
port map
(
s=>inp,
y=>f
);

process 
begin

inp<="00";
wait for 10 ns;

inp<="10";
wait for 10 ns;

inp<="01";
wait for 10 ns;

inp<="11";

wait;
end process;
end abc;
