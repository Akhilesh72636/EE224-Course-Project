-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(8 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
   Component Adder_Subtractor_4bit  is
		port (A0, A1, A2, A3, B0, B1, B2, B3, M: in std_logic; S0, S1, S2, S3, Cout: out std_logic);
	end Component Adder_Subtractor_4bit;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Adder_Subtractor_4bit 
			port map (
					-- order of inputs A3 A2 A1 A0 B3 B2 B1 B0 M
					A3 => input_vector(8),
					A2 => input_vector(7),
					A1 => input_vector(6),
					A0 => input_vector(5),
					B3 => input_vector(4),
					B2 => input_vector(3),
					B1 => input_vector(2),
					B0 => input_vector(1),
					M => input_vector(0),
               -- order of output S3 S2 S1 S0
					Cout => output_vector(4),
					S3 => output_vector(3),
					S2 => output_vector(2),
					S1 => output_vector(1),
					S0 => output_vector(0));
end DutWrap;