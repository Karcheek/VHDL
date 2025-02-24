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


entity muxstruc is
port 
(
i: in bit_vector(3 downto 0);
s: in bit_vector(1 downto 0);
y: out bit
);
end muxstruc;

architecture structural of muxstruc is

component andgate 
port
(
a,b,c: in bit;
y: out bit
);
end component;

component orgate 
port
(
a,b,c,d: in bit;
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

signal in1,in2,in3,in4,nots0,nots1: bit;

begin

s0: notgate port map
(
a=>s(0),
y=>nots0
);

s1: notgate port map
(
a=>s(1),
y=>nots1
);

i1: andgate port map
(
a=>i(0),
b=>nots1,
c=>nots0,
y=>in1
);

i2: andgate port map
(
a=>i(1),
b=>nots1,
c=>s(0),
y=>in2
);

i3: andgate port map
(
a=>i(2),
b=>s(1),
c=>nots0,
y=>in3
);

i4: andgate port map
(
a=>i(3),
b=>s(1),
c=>s(0),
y=>in4
);

o1: orgate port map
(
a=>in1,
b=>in2,
c=>in3,
d=>in4,
y=>y
);

end structural;

entity muxstruc_tb is
end muxstruc_tb;

architecture abc of muxstruc_tb is
component muxstruc
port 
(
i: in bit_vector(3 downto 0);
s: in bit_vector(1 downto 0);
y: out bit
);
end component;

signal a : bit_vector(3 downto 0);
signal sel: bit_vector(1 downto 0);
signal f: bit;

begin

t2: muxstruc 
port map
(
i=>a,
s=>sel,
y=>f
);

process 
begin

a<="1010";

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
