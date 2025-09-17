// Q4 Write a RTL code for 4:1 mux using 2:1 mux



module mux_41(Y,I,sel);

       output Y;
       input [1:0] sel;
       input [3:0] I;

       wire M0, M1;

       mux_21 u1(.Y(M0), .I(I[1:0]), .sel(sel[0]));
       mux_21 u2(.Y(M1), .I(I[3:2]), .sel(sel[0]));
       mux_21 u3(.Y(Y), .I({M1,M0}), .sel(sel[1]));

endmodule
