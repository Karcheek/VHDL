library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fulladder_forrc is
Port ( a : in STD_LOGIC;
b : in STD_LOGIC;
c : in STD_LOGIC;
sum : out STD_LOGIC;
carry : out STD_LOGIC);
end fulladder_forrc;
architecture dataflow of fulladder_forrc is
begin
sum<= a xor b xor c;
carry<= ((a xor b) and c) or (a and b);
end dataflow;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity rcadder is
Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
B : in STD_LOGIC_VECTOR(3 downto 0);
Cin : in STD_LOGIC;
Sum : out STD_LOGIC_VECTOR(3 downto 0);
Cout : out STD_LOGIC);
end rcadder;
architecture Structural of rcadder is
component fulladder_forrc
Port ( a : in STD_LOGIC;
b : in STD_LOGIC;
c : in STD_LOGIC;
sum : out STD_LOGIC;
carry : out STD_LOGIC);
end component;
signal C : STD_LOGIC_VECTOR(3 downto 0);
begin
RC0: fulladder_forrc port map ( a=>A(0), b=>B(0),c => Cin, sum =>sum(0),carry => C(0));
RC1: fulladder_forrc port map ( a=>A(1), b=>B(1),c=> C(0), sum=> sum(1) , carry=>C(1));
RC2: fulladder_forrc port map ( a=>A(2), b=>B(2),c => C(1), sum=> sum(2) , carry=>C(2));
RC3: fulladder_forrc port map ( a=>A(3), b=>B(3),c => C(2), sum=> sum(3) , carry=>Cout);
end Structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tbrcadder1 is
end tbrcadder1 ;
architecture abd of tbrcadder1 is
signal A : STD_LOGIC_VECTOR(3 downto 0);
signal B : STD_LOGIC_VECTOR(3 downto 0);
signal Cin : STD_LOGIC;
signal Sum : STD_LOGIC_VECTOR(3 downto 0);
signal Cout : STD_LOGIC;
component rcadder
Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
B : in STD_LOGIC_VECTOR(3 downto 0);
Cin : in STD_LOGIC;
Sum : out STD_LOGIC_VECTOR(3 downto 0);
Cout : out STD_LOGIC);
end component;
begin
IT: rcadder
Port map ( A => A, B => B, Cin => Cin,
Sum => Sum, Cout => Cout);
process
begin
A <= "0001"; B <= "0011"; Cin <= '0';
wait for 10 ns;
A <= "1010"; B <= "0101"; Cin <= '0';
wait for 10 ns;
end process;
end abd;


