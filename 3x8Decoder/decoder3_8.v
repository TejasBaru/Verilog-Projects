// Q1. Write a RTL coe for 3:8 decoder using Behavioral abstraction and to
// verify the same
//

module decoder3_8 (Y, A,en);
       output reg [7:0] Y;
       input [2:0] A;
       input en;

       always@ (*) begin
	       if(en)
	       begin
		       case (A)
			       3'b000 : Y = 8'd0;
			       3'b001 : Y = 8'd1;
			       3'b010 : Y = 8'd2;
			       3'b011 : Y = 8'd3;
			       3'b100 : Y = 8'd4;
			       3'b101 : Y = 8'd5;
			       3'b110 : Y = 8'd6;
			       3'b111 : Y = 8'd7;
			       default : Y = 8'd0;
		       endcase
 
	       end
	       else begin
		       Y = 8'dz;
	       end


       end


endmodule
