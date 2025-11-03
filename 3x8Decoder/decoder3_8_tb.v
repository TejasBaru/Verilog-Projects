// Q1. Write a testbench to verify 3:8 decoder


module decoder3_8_tb();
       wire [7:0] Y;
       reg [2:0] A;
       reg en;

       decoder3_8 dut (
	       .Y(Y),
	       .A(A),
	       .en(en)
       );

       task initial_c;
	   begin 
	   A = 3'b000;
	   en = 1'b0;
	   #5;
	   $display($time, "inputs:--- A=%b , en=%b , output:--- Y=%b ", A,en,Y);
   end
   endtask

   task stimuli(input [2:0] a, input enable);
	   begin
		   A = a;
		   en = enable;
		   #5;
		   $display($time, "inputs:-- A=%b , en=%b , output:--- Y=%b", A,en,Y);
	   end
   endtask

   initial 
   begin
	   $display("----- 3:8 Decoder using Behavioral abstraction-----");
	   $dumpfile("dump.vcd");
	   $dumpvars(0,decoder3_8_tb);

	   initial_c;

	   // Cases when en = 0
	   stimuli(3'b000 , 1'b0); #5;
	   stimuli(3'b001 , 1'b0); #5;
	   stimuli(3'b111 , 1'b0); #5;
		#5;
	   //Cases when en = 1
	   stimuli(3'b000 , 1'b1); #5;
	   stimuli(3'b001 , 1'b1); #5;
	   stimuli(3'b010 , 1'b1); #5;
	   stimuli(3'b011 , 1'b1); #5;
	   stimuli(3'b100 , 1'b1); #5;
	   stimuli(3'b101 , 1'b1); #5;
	   stimuli(3'b110 , 1'b1); #5;
	   stimuli(3'b111 , 1'b1); #5;
	   

	   $monitor($time,"inputs:--- A=%b , en=%b , outputs:--- Y=%b", A,en,Y);

	   $finish;

   end


endmodule
