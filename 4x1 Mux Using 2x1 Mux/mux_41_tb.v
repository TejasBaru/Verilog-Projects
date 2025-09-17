// Q4 Write a testbench for 4:1 mux using 2:1 mux



module mux_41_tb();

          reg[3:0] I;
	  reg[1:0] sel;
	  wire Y;

	   mux_41 dut (
	         .Y(Y),
	         .I(I),
	         .sel(sel)
	 );
         initial
			begin
			
			  $monitor ($time, " inputs:-- I=%b , sel=%b , outputs:--Y=%b ", I,sel,Y);
 // Test I0
    I = 4'b0001;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    // Test I1
    I = 4'b0010;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    // Test I2
    I = 4'b0100;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    // Test I3
    I = 4'b1000;
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;
   
     $finish;
	  
	  end

endmodule
