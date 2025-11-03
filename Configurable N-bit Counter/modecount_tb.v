`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:55:15 11/01/2025
// Design Name:   modecount
// Module Name:   /home/tejasbaru/Verilog/Mode Counter/modecounter/modecount_tb.v
// Project Name:  modecounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: modecount
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module tb_modecount;
    parameter N = 4;

    reg clk, rst, en;
    reg [1:0] mode;
    wire [N-1:0] count;

    // Instantiate DUT
    modecount #(N) dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .mode(mode),
        .count(count)
    );

    // Localparams for readability
    localparam [1:0]
        UP   = 2'b00,
        DOWN = 2'b01,
        ROTL = 2'b10,
        ROTR = 2'b11;

    // Clock generation
    always #5 clk = ~clk;  // 10 ns period

    // Task for reset
    task reset_dut;
        begin
            $display("\n[Resetting DUT]");
            rst = 1; en = 0;
            @(posedge clk);
            rst = 0;
        end
    endtask

    // Task for stimulus
    task stimulus(input [1:0] mode_sel, input integer cycles);
        begin
            mode = mode_sel;
            en = 1;
            case (mode_sel)
                UP:   $display("\nMode = UP (%0d cycles)", cycles);
                DOWN: $display("\nMode = DOWN (%0d cycles)", cycles);
                ROTL: $display("\nMode = ROTATE LEFT (%0d cycles)", cycles);
                ROTR: $display("\nMode = ROTATE RIGHT (%0d cycles)", cycles);
            endcase
            repeat(cycles) @(posedge clk);
            en = 0;
        end
    endtask

    // Main sequence
    initial begin
        // Dump for GTKWave or ModelSim
        $dumpfile("modecount_tb.vcd");
        $dumpvars(0, tb_modecount);

        // Initialize
        clk = 0; rst = 0; en = 0; mode = UP;

        // Apply reset
        reset_dut();

        // Start monitoring
        $monitor("Time=%0t | clk=%b rst=%b en=%b mode=%b | count=%b",
                 $time, clk, rst, en, mode, count);

        // Run for each mode
        stimulus(UP,   5);
        stimulus(DOWN, 4);
        stimulus(ROTL, 3);
        stimulus(ROTR, 6);

        $display("\nSimulation Complete.");
        $finish;
    end
endmodule


