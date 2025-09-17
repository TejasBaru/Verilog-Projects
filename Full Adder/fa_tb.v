// Write testbench for 1 bit full adder to verufy





module q1_tb();
  
   wire sum , cout;
   reg a, b, cin;
  
   q1 dut (
	   .a(a),
	   .b(b),
	   .cin(cin),
	   .sum(sum),
	   .cout(cout)
           );

	   initial
	   begin
		   a = 0 ; b = 0 ; cin = 0;
		   #5 a = 1 ; b = 1 ; cin = 1;
		   #5 a = 0 ; b = 0 ; cin = 1;
		   #5 a = 1 ; b = 1 ; cin = 0;
		   #5 a = 0 ; b = 1 ; cin = 0;
		   #5 a = 1 ; b = 0 ; cin = 1;
		   #5 a = 0 ; b = 1 ; cin = 1;
		   #5 a = 1 ; b = 0 ; cin = 0;
	   end

	   initial 
	   begin
		   $monitor ( $time, " inputs:--- a=%d , b=%d , cin=%d outputs:--- sum=%d , cout=%d", a,b,cin,sum,cout);
		   $finish;
	   end

	   initial 
	   begin
		   $dumpfile("dump.vcd");
		   $dumpvars;
	   end


                



endmodule
