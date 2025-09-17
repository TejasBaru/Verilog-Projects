

// Q5. Write RTL code for 4x1 Mux using Decoder and tristate buffers



module mux_41(Y,I,sel,en);

        output Y;
	input [3:0] I;
	input [1:0] sel;
	input en;

	wire [3:0] d;

	decoder2to4 u1 ( .A(sel) , .en(en) , .Y(d) );

	buffers_tristate t0 ( .Y(Y), .A(I[0]), .en(d[0]) );
	buffers_tristate t1 ( .Y(Y), .A(I[1]), .en(d[1]) );
   buffers_tristate t2 ( .Y(Y), .A(I[2]), .en(d[2]) );
	buffers_tristate t3 ( .Y(Y), .A(I[3]), .en(d[3]) );

	




endmodule
