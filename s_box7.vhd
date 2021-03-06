library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity s_box7 is
	port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
end s_box7;


architecture behavior of s_box7 is

	type sbox is array(0 to 3,0 to 15) of integer range 0 to 15;
	constant box: sbox:= 
		((4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1),
		(13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6),
		(1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2),
		(6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12));

	begin
	
		process(data_in) is

			variable column: integer range 0 to 15; -- this variable holds bits 4 to 1 of the input in decimal representation.
			variable row: integer range 0 to 3;	-- this variable holds bits first and last bit of the input in decimal representation.
			variable tmp: std_logic_vector(0 to 1); --this variable holds the first and last bit of the input that represents the row.
	
			variable data_out_decimal: integer range 0 to 15; --this variable contains the output data in decimal representation.
	
			begin
	
				column:=to_integer(unsigned(data_in(1 to 4))); -- converting from std_logic_vector to integer.
				tmp:=data_in(0)&data_in(5);
				row:=to_integer(unsigned(tmp)); -- converting from std_logic_vector to integer.
				data_out_decimal:=box(row,column);
	
				data_out<=std_logic_vector(to_unsigned(data_out_decimal,data_out'length)); -- converting from integer to std_logic_vector.
	
		end process;

end behavior;