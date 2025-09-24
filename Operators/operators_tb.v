// Q1. Testbench to practice all operators

`timescale 1ns/1ps
module operator_practice_tb;

  reg [3:0] a, b;
  reg signed [3:0] sa, sb;

  wire [4:0] sum, diff;
  wire [7:0] prod;
  wire [3:0] quot, rem;
  wire gt, lt, ge, le;
  wire eq, neq, ceq, cneq;
  wire land, lor, lnot;
  wire [3:0] band, bor, bxor, bnot, bxnor;
  wire [3:0] lshift, rshift;
  wire signed [3:0] arshift, alshift;
  wire red_and, red_or, red_xor, nred_and, nred_or, nred_xnor;
  wire [3:0] ternary;
  wire [7:0] concat;
  wire [2:0] replicate;

  // DUT
  operator_practice uut (
    .a(a), .b(b), .sa(sa), .sb(sb),
    .sum(sum), .diff(diff), .prod(prod), .quot(quot), .rem(rem),
    .gt(gt), .lt(lt), .ge(ge), .le(le),
    .eq(eq), .neq(neq), .ceq(ceq), .cneq(cneq),
    .land(land), .lor(lor), .lnot(lnot),
    .band(band), .bor(bor), .bxor(bxor), .bnot(bnot), .bxnor(bxnor),
    .lshift(lshift), .rshift(rshift),
    .arshift(arshift), .alshift(alshift),
    .red_and(red_and), .red_or(red_or), .red_xor(red_xor),
    .nred_and(nred_and), .nred_or(nred_or), .nred_xnor(nred_xnor),
    .ternary(ternary), .concat(concat), .replicate(replicate)
  );

  initial begin
    $dumpfile("operators.vcd");
    $dumpvars(0, operator_practice_tb);

    $display("=== Operator Practice Testbench Started ===");

    // Test values
    a  = 4'b1010;  // 10
    b  = 4'b0110;  // 6
    sa = -3;
    sb = 2;

    #100;

    $display("=== Operator Practice Testbench Completed ===");
    $finish;
  end

endmodule
