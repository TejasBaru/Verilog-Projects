// Q1. Testbench to practice all operators



// operator_practice_tb.v
`timescale 1ns/1ps
module operator_practice_tb;

  // Instantiate DUT (Design Under Test)
  operator_practice uut();

  initial begin
    // Create waveform dump
    $dumpfile("operator_practice.vcd");
    $dumpvars(0, operator_practice_tb);

    // Simulation banner
    $display("=== Operator Practice Testbench Started ===");

    // Wait for DUT to finish
    #100;

    $display("=== Operator Practice Testbench Completed ===");
    $finish;
  end

endmodule

