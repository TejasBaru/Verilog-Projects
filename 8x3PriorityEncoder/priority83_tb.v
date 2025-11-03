// Q2. Write a TB to verify 8:3 priority encoder

module pe_83_tb();
       wire [2:0] Y;
       wire valid;
       reg [7:0] D;

       pe_83 dut (
	       .Y(Y),
	       .valid(valid),
	       .D(D)
       );

       task initial_c;
	       begin
		       D = 8'd0;
		       #5;
		       $display($time,"input:--- D=%b, outputs:--- valid=%b , Y=%b", D, valid, Y);
	       end
       endtask

       task stimuli (input [7:0] d);
	       begin
		       D = d;
		       #5;
	       end
       endtask

       initial 
       begin
	       $display("----- 8:3 Priority Encoder-----");
			 $monitor($time, "inputs:--- D=%b , outputs:--- valid=%b , Y=%b ", D,valid,Y);
	       $dumpfile("dump.vcd");
	       $dumpvars(0, pe_83_tb);

	       initial_c;

	       // No active input
	       stimuli(8'd0);
			 #5;

	       // Sungle active input
	       stimuli(8'b00000001); #5;
			 stimuli(8'b00000010); #5;
	       stimuli(8'b00000100); #5;
	       stimuli(8'b00001000); #5;
	       stimuli(8'b00010000); #5;
	       stimuli(8'b00100000); #5;
	       stimuli(8'b01000000); #5;
	       stimuli(8'b10000000); #5;

	       // Multiple active inputs
	       stimuli(8'b10101010); #5;
	       stimuli(8'b01010101); #5;
	       stimuli(8'b00110011); #5;
	       stimuli(8'b11001100); #5;
	       stimuli(8'b00010001); #5;


	       
	       $finish;
       end


endmodule

