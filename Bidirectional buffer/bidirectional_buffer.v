// Q6. Write a RTL code for bidirectional buffer and verify the same
//
//
module bidir_buff( control, a,b);

        input control;
	inout a,b;

	bufif1 b1(b, a, control);
	bufif0 b2(a, b, control);

endmodule
