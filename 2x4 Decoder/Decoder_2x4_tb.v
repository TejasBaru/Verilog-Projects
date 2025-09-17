// Write testbench for 2:4 decoder



module decoder2to4_tb();
     
    reg [1:0] D;
    reg en; 
    wire[3:0] Y;
    integer i ;

     decoder2to4 dut(
	     .D(D),
	     .en(en),
	     .Y(Y)
     );
     initial
     begin
	     $display(" Starting Simulation");
	     en = 1;
	     $monitor($time , "inputs:-- D=%b , en =%b , outputs:-- Y=%b", D,en,Y);

	     for(i=0 ; i<4 ; i = i+1)
	     begin
		     D = i;
		     #15 ;
		     		     
	     end

	     en = 0 ;
	     #15 ;
	     $finish;
     
     end
  



endmodule
