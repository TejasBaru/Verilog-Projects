// Q4 Write a RTL code for 4:1 mux using 2:1 mux and verify the same
//



module mux_21( Y, I , sel);

       output Y;
       input [1:0] I;
       input sel;

       // using continuous assignment

       assign Y = ( sel == 1'b0 )? I[0] :
	       I[1] ;

endmodule
