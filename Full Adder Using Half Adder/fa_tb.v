module fa_tb();
// Step1: for outputs : reg ; for inputs: wire
   wire sum , carry ;
   reg a,b,cin;

// Step2: DUT instantiation by name ( not to practice by position postion)
    
   full_adder dut(
       .a(a),
       .b(b),
       .cin(cin),
       .sum(sum),
       .carry(carry)
   );

// Step3: Generate stimulus for inputs

    initial
    begin
	     a = 0 ; b = 0 ; cin = 0;
	  #5 a = 1 ; b = 0 ; cin = 1;
	  #5 a = 0 ; b = 1 ; cin = 0;
	  #5 a = 1 ; b = 1 ; cin = 1;
	  #5 a = 0 ; b = 0 ; cin = 1;
	  #5 a = 1 ; b = 0 ; cin = 0;
	  #5 a = 1 ; b = 1 ; cin = 0;
	  #5 a = 0 ; b = 1 ; cin = 1;
	  #5 a = 0 ; b = 0 ; cin = 0;
	  #5 a = 1 ; b = 1 ; cin = 1;
	   $finish;
   end

//Step4: Monitoring  / Displaying inputs and outputs response
 
  initial
  begin
	  $monitor ( $time , " inputs:--- a=%d , b=%d , cin=%d outputs:--- sum=%d , carry=%d", a,b,cin,sum,carry);
	 
  end
//Step5: To view the waveform for analysis

  initial
  begin
	  $dumpfile("dump.vcd");
	  $dumpvars;
  end




endmodule
