// Write  artl code for 2:4 decoder using Dataflow abstraction
// Y0 = EN & D1' & D0' ; Y1 = EN & D1' & D0 ; Y2 =  EN & D1 & D0' ; Y3 = EN & D1 & D0



module decoder2to4(
                   input [1:0] D,
		   input en,
	           output [3:0] Y);


		   assign Y[0] = en & (~D[1]) & (~D[0]);
		   assign Y[1] = en & (~D[1]) & D[0];
		   assign Y[2] = en & D[1] & (~D[0]);
		   assign Y[3] = en & D[1] & D[0];

		   endmodule
