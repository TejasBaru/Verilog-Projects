// Write a testbench code for 4bit RCA using 1bit RCA



module rca_4_tb();

   reg [3:0] a,b;
   reg cin;
   wire [3:0] sum;
   wire carry;


       rca_4 dut(
              .a(a),
	      .b(b),
	      .cin(cin),
              .sum(sum),
	      .carry(carry));

	     initial
	     begin
		     $dumpfile("dump.vcd");
		     $dumpvars;
		     $monitor( $time, "inputs: a=%b , b=%b , cin=%b , outputs:-- sum=%b , carry=%b", a,b,cin,sum,carry);

		     a = 4'b0000;; b = 4'b0000 ; cin = 0;
		     #10  a = 4'b1111 ; b = 4'b1111 ; cin = 1;
		     #10  a = 4'b0001 ; b = 4'b0001 ; cin = 0;
		     #10  a = 4'b0110 ; b = 4'b0110 ; cin = 1;
		     #10  a = 4'b0010 ; b = 4'b0010 ; cin = 0;
		     #10  a = 4'b0101 ; b = 4'b0101 ; cin = 1;
		     #10  a = 4'b0011 ; b = 4'b0011 ; cin = 0;
		     #10  a = 4'b0100 ; b = 4'b0100 ; cin = 1;
		     #10  a = 4'b0000 ; b = 4'b0000 ; cin = 0;
			  #10  a = 4'b1111 ; b = 4'b0001 ; cin = 1;
$finish;
		     #10;
		     
		    
	     end

endmodule
