

module full_adder( a, b, cin,sum, carry);


   //Step1 : Write down the directions for the ports

   
   input a, b, cin ;  
   output sum, carry;	

   //Step2 : Declare the internal wires    
   // Since this full adder is implemented using half adders which would
   // require us to use internal wires
   wire s1, c1,c2;
   //Step3 : Instantiate the Half-Adders using name-based port mapping	
   half_adder u1( a, b,s1, c1);
   half_adder u2( s1, cin,sum, c2);   
 
   //Step4 : Instantiate the OR gate
   or u3(carry, c1, c2);

endmodule

