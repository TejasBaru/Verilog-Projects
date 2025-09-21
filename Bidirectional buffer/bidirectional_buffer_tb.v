// Q6. Write testbench to verify the bidirectional buffer 


module bidir_buff_tb();

      wire a,b;
      reg control;
      reg tempa, tempb;

      bidir_buff dut(
	      .control(control),
	      .a(a),
	      .b(b)
      );

      assign b = (control == 0) ? tempb : 1'bz;
      assign a = (control == 1) ? tempa : 1'bz;

      initial 
      begin
	      {tempa,tempb,control} = 0;
	      $monitor($time, "input control=%b , inout: a=%b , b=%b " , control,a,b);
	      $dumpfile("dump.vcd");
	      $dumpvars;
	      #300;
	      $finish;
      end

      always #10 tempa = ~tempa;
      always #10 tempb = ~tempb;
      always #50 control = ~control;

      
endmodule
