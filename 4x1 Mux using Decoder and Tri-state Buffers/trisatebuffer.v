// Q5. Write RTL code for 4:1 mux using decoder and tri-state buffers



module buffers_tristate( Y,A,en);

       output Y;
       input A;
       input en;

       assign Y = en ? A : 1'bz;

endmodule
