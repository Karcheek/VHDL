entity halfadder is 
port (a,b : in bit;
      sum,cout : out bit);
end halfadder;

architecture dataflow of halfadder is
begin

sum <= a xor b;
cout <= a and b;
end dataflow;
