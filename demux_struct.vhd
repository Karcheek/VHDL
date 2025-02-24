entity andgate is
port
(
a,b,c: in bit;
y: out bit
);
end andgate;

architecture dataflow of andgate is
begin
y <= a and b and c;
end dataflow;

entity orgate is
port
(
a,b,c,d: in bit;
y: out bit
);
end orgate;

architecture dataflow of orgate is
begin
y <= a or b or c or d;
end dataflow;

entity notgate is
port
(
a: in bit;
y: out bit
);
end notgate;

architecture dataflow of notgate is
begin
y <= not a;
end dataflow;


entity demuxstruc is
port 
(
i: in bit;
s: in bit_vector(1 downto 0);
y: out bit_vector(3 downto 0)
);
end demuxstruc;

architecture structural of demuxstruc is

component andgate 
port
(
a,b,c: in bit;
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
a=>i,
b=>nots1,
c=>nots0,
y=>y(0)
);

ii2: andgate port map
(
a=>i,
b=>nots1,
c=>s(0),
y=>y(1)
);

ii3: andgate port map
(
a=>i,
b=>s(1),
c=>nots0,
y=>y(2)
);

ii4: andgate port map
(
a=>i,
b=>s(1),
c=>s(0),
y=>y(3)
);

end structural;

entity demuxstruc_tb is
end demuxstruc_tb;

architecture abc of demuxstruc_tb is
component demuxstruc
port 
(
i: in bit;
s: in bit_vector(1 downto 0);
y: out bit_vector(3 downto 0)
);
end component;

signal a : bit;
signal sel: bit_vector(1 downto 0);
signal f: bit_vector(3 downto 0);

begin

t2: demuxstruc 
port map
(
i=>a,
s=>sel,
y=>f
);

process 
begin

a<='1';

sel<="00";
wait for 10ns;

sel<="01";
wait for 10ns;

sel<="10";
wait for 10ns;

sel<="11";

wait;
end process;
end abc;
