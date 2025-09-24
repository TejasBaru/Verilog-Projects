module operator_practice(
  input  [3:0] a,
  input  [3:0] b,
  input  signed [3:0] sa,
  input  signed [3:0] sb,

  // Arithmetic
  output [4:0] sum,
  output [4:0] diff,
  output [7:0] prod,
  output [3:0] quot,
  output [3:0] rem,

  // Relational
  output gt, lt, ge, le,

  // Equality
  output eq, neq, ceq, cneq,

  // Logical
  output land, lor, lnot,

  // Bitwise
  output [3:0] band, bor, bxor, bnot, bxnor,

  // Shifts
  output [3:0] lshift, rshift,
  output signed [3:0] arshift, alshift,

  // Reductions
  output red_and, red_or, red_xor, nred_and, nred_or, nred_xnor,

  // Conditional
  output [3:0] ternary,

  // Concatenation/Replication
  output [7:0] concat,
  output [2:0] replicate
);

  // Arithmetic
  assign sum  = a + b;
  assign diff = a - b;
  assign prod = a * b;
  assign quot = a / b;
  assign rem  = a % b;

  // Relational
  assign gt = (a > b);
  assign lt = (a < b);
  assign ge = (a >= b);
  assign le = (a <= b);

  // Equality
  assign eq   = (a == b);
  assign neq  = (a != b);
  assign ceq  = (a === b);
  assign cneq = (a !== b);

  // Logical
  assign land = (a && b);
  assign lor  = (a || b);
  assign lnot = !a;

  // Bitwise
  assign band = a & b;
  assign bor  = a | b;
  assign bxor = a ^ b;
  assign bnot = ~a;
  assign bxnor = a ^~ b;

  // Shifts
  assign lshift  = a << 1;
  assign rshift  = b >> 1;
  assign arshift = sa >>> 1;
  assign alshift = sb <<< 1;

  // Reduction
  assign red_and   = &a;
  assign red_or    = |a;
  assign red_xor   = ^a;
  assign nred_and  = ~&a;
  assign nred_or   = ~|a;
  assign nred_xnor = ~^a;

  // Conditional
  assign ternary = (a > b) ? a : b;

  // Concatenation/Replication
  assign concat    = {a, b};
  assign replicate = {3{b[1]}};

endmodule
