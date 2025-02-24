entity andgate is
port( a,b:in bit; y:out bit);
end andgate;

architecture abc of andgate is
begin
y<= a and b;
end abc;

entity notgate is
port(a:in bit; y:out bit);
end notgate;



architecture wxy of notgate is
begin
y<= not a;
end wxy;


entity orgate is
port(a,b:in bit; y:out bit);
end orgate;

architecture  dec of orgate is
begin

y<= a or b;
end dec;
