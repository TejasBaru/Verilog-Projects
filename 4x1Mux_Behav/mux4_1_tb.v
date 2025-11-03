

module mux4_1_tb();

   //Step1 : Write down the variables required for testbench
   reg [3:0] data_in;
   reg [1:0] sel_in;
   wire y;
   
								
   //Step2 : Instantiate the Design 
    mux4_1 dut(
       .data_in(data_in),
       .sel_in(sel_in),
       .y(y)
 );   

   //Step3 : Declare a task to initialize inputs of DUT to 0 

   task initial_c;
	   begin 
	   data_in = 4'b0000;
	   sel_in = 2'b00;
	   #10;
	   $display($time, "inputs:--- data_in=%b , sel_in=%b , output:--- y=%b ", data_in,sel_in,y);
   end
   endtask

     //Step4 : Declare  tasks with arguments for driving stimulus to DUT 
      task stimuli(input [3:0] d, input [1:0] sel);
	   begin
		   data_in = d;
		   sel_in = sel;
		   #10;
		   $display($time, "inputs:-- data_in=%b , sel_in=%b , outputs:--- y=%b", data_in,sel_in,y);

	   end
   endtask

   //Step5 : Call the tasks from procedural process 

   initial
   begin
	   $display("-----4:1 MUX using Behavioral abstraction-----");
	   $dumpfile("dump.vcd");
	   $dumpvars(0,mux4_1_tb);

	   initial_c;

	   stimuli(4'b0101 , 2'b00); #5;
	   stimuli(4'b0101 , 2'b01); #5;
	   stimuli(4'b0101 , 2'b10); #5;
	   stimuli(4'b0101 , 2'b11); #5;
	   
	   #5;
	   stimuli(4'b1010 , 2'b00); #5;
	   stimuli(4'b1010 , 2'b01); #5;
	   stimuli(4'b1010 , 2'b10); #5;
	   stimuli(4'b1010 , 2'b11); #5;
	   #5;
	      
   

   //Step6 : Use $monitor task to display inputs and outputs
   $monitor($time,"inputs:--- data_in=%b , sel_in=%b , output:--- y=%b", data_in,sel_in,y);

   //Step7 : Use $finish task to terminate the simulation at 100ns
    $finish;

   end

   
endmodule

