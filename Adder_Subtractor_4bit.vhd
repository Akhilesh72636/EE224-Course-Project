library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Adder_Subtractor_4bit  is
  port (A0, A1, A2, A3, B0, B1, B2, B3, M: in std_logic; S0, S1, S2, S3, Cout: out std_logic);
end entity Adder_Subtractor_4bit;

architecture Struct of Adder_Subtractor_4bit is
	signal  B0f, B1f, B2f, B3f, Cout0, Cout1, Cout2, Cout3: std_logic;

Component Full_Adder_1bit  is
	port (Ain, Bin, Cin: in std_logic; Sum, Cout: out std_logic);
end Component Full_Adder_1bit;

begin
  -- component instances
  XOR0: XOR_2 port map(A => M, B => B0, Y => B0f);
  XOR1: XOR_2 port map(A => M, B => B1, Y => B1f);
  XOR2: XOR_2 port map(A => M, B => B2, Y => B2f);
  XOR3: XOR_2 port map(A => M, B => B3, Y => B3f);
  Full_Adder_1bit_0: Full_Adder_1bit port map(Ain => A0, Bin => B0f, Cin => M,     Sum => S0, Cout => Cout0);
  Full_Adder_1bit_1: Full_Adder_1bit port map(Ain => A1, Bin => B1f, Cin => Cout0, Sum => S1, Cout => Cout1);
  Full_Adder_1bit_2: Full_Adder_1bit port map(Ain => A2, Bin => B2f, Cin => Cout1, Sum => S2, Cout => Cout2);
  Full_Adder_1bit_3: Full_Adder_1bit port map(Ain => A3, Bin => B3f, Cin => Cout2, Sum => S3, Cout => Cout);
end Struct;