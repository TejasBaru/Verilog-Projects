// Write RTL code for 4 bit RCA using1 bit RCA



module rca_4(sum,carry,a,b,cin);
        
       output [3:0] sum;
       output carry;
       input [3:0] a;
       input [3:0] b;
       input cin;

       wire c1,c2,c3;

      rca_1 u1 (.sum(sum[0]), .carry(c1) , .a(a[0]), .b(b[0]) , .cin(cin));
      rca_1 u2 (.sum(sum[1]), .carry(c2) , .a(a[1]), .b(b[1]) , .cin(c1));
      rca_1 u3 (.sum(sum[2]), .carry(c3) , .a(a[2]), .b(b[2]) , .cin(c2));
      rca_1 u4 (.sum(sum[3]), .carry(carry) , .a(a[3]), .b(b[3]) , .cin(c3));

endmodule
