// Write a RTL Code for 1 bit Full Adder using Dataflow abstraction



module q1(
                output sum,
	        output cout,
	        input a,
	        input b, 
	        input cin);

  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);


endmodule
