// Q5. Write testbench for 4x1 mux using decoder and tristate buffer



module mux_41_tb();

       wire Y;
       reg [3:0] I;
       reg [1:0] sel;
       reg en;

       mux_41 dut(
       .I(I),
       .sel(sel),
       .en(en),
       .Y(Y)
);
       initial
       begin
	       $dumpfile("dump.vcd");
	       $dumpvars;
	       $monitor( $time,"inputs:-- I=%b , sel=%b , en=%b , outputs:-- Y=%b", I,sel,en,Y);
	       //case 1: en=0, output must be Z
	       en = 0 ; I = 4'b1010 ; sel = 2'b00;
	       #10;
	       en = 1 ; I = 4'b1010 ; sel = 2'b00; //op = I0
	       #10;
	       sel = 2'b01; // op = I1. input remains same
	       #10;
	       sel = 2'b10;
	       #10;
	       sel = 2'b11;
	       #10;
	       I = 4'b0101 ; sel = 2'b10;
	       #10;
	       I = 4'b0110 ; sel = 2'b11;
	       #10
	       I = 4'b0000 ; sel = 2'b01;
	       #10;
	       $finish;
       end


endmodule




