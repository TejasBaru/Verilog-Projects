// Q5. Write code rtl code for 4x1 Mux using decoder and tristate buffers


module decoder2to4(
                   input [1:0] A,
		   input en,
	           output [3:0] Y);


		   assign Y[0] = en & (~A[1]) & (~A[0]);
		   assign Y[1] = en & (~A[1]) & A[0];
		   assign Y[2] = en & A[1] & (~A[0]);
		   assign Y[3] = en & A[1] & A[0];

endmodule
