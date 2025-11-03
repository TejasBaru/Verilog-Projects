
module mux4_1(data_in,
	      sel_in,
	      y);

   //Step1 : Define the port directions with proper size & datatypes 
   input [3:0] data_in;
   input [1:0] sel_in;
   output reg y;

   //Step2 : Write the MUX behaviour as a parallel logic using "case" 
   always@ (*) begin
	   case (sel_in)
		   2'b00 : y = data_in[0];
		   2'b01 : y = data_in[1];
		   2'b10 : y = data_in[2];
		   2'b11 : y = data_in[3];
		   default: y = 1'bz;
	   endcase
   end


endmodule
		
