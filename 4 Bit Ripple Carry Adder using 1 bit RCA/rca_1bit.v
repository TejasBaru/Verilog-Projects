// Write a RTL code for 4 bit ripple carry adder using 1 bit 1 ripple carry
// adder


module rca_1(sum, carry, a, b, cin);
       output sum, carry;
       input a, b, cin;

       assign sum = a ^ b ^ cin;
       assign carry = (a & b) | cin & (a ^ b);

endmodule
