// Q1. RTL Code to practice all operators


// operator_practice.v
module operator_practice;

  reg [3:0] a, b;
  reg signed [3:0] sa, sb;

  initial begin
    // Initialize
    a  = 4'b1010;   // 10
    b  = 4'b0110;   // 6
    sa = -3;        // signed example
    sb = 2;

    // Arithmetic Operators
    $display("Arithmetic Operators:");
    $display("a+b=%d, a-b=%d, a*b=%d, a/b=%d, a%%b=%d", a+b, a-b, a*b, a/b, a%b);

    // Relational Operators
    $display("\nRelational Operators:");
    $display("a>b=%b, a<b=%b, a>=b=%b, a<=b=%b", (a>b), (a<b), (a>=b), (a<=b));

    // Equality Operators
    $display("\nEquality Operators:");
    $display("a==b=%b, a!=b=%b, a===b=%b, a!==b=%b", (a==b), (a!=b), (a===b), (a!==b));

    // Logical Operators
    $display("\nLogical Operators:");
    $display("(a&&b)=%b, (a||b)=%b, !a=%b", (a&&b), (a||b), !a);

    // Bitwise Operators
    $display("\nBitwise Operators:");
    $display("a&b=%b, a|b=%b, a^b=%b, ~a=%b, a^~b=%b", (a&b), (a|b), (a^b), ~a, (a^~b));

    // Shift Operators
    $display("\nShift Operators:");
    $display("a<<1=%b, b>>1=%b, sa>>>1=%b, sb<<<1=%b", (a<<1), (b>>1), (sa>>>1), (sb<<<1));

    // Reduction Operators
    $display("\nReduction Operators:");
    $display("&a=%b, |a=%b, ^a=%b, ~&a=%b, ~|a=%b, ~^a=%b", &a, |a, ^a, ~&a, ~|a, ~^a);

    // Conditional Operator
    $display("\nConditional (Ternary) Operator:");
    $display("(a>b)?a:b = %d", (a>b)?a:b);

    // Concatenation and Replication
    $display("\nConcatenation & Replication:");
    $display("{a,b} = %b", {a,b});
    $display("{3{b[1]}} = %b", {3{b[1]}});

    $finish;
  end

endmodule

