`timescale 1ns / 1ps

module Tonomat_tb;

    // Inputs
    reg RON1;
    reg RON5;
    reg RON10;
    reg CLK;
    reg RESET;

    // Outputs
    wire PRODUS;
    wire R1;
    wire R5;

    // Instantiate the Unit Under Test (UUT)
    Tonomat uut (
        .RON1(RON1),
        .RON5(RON5),
        .RON10(RON10),
        .CLK(CLK),
        .RESET(RESET),
        .PRODUS(PRODUS),
        .R1(R1),
        .R5(R5)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        RESET = 0;
        RON1 = 0;
        RON5 = 0;
        RON10 = 0;

        // Apply RESET signal
        @(posedge CLK);
        RESET = 1;
        @(posedge CLK);
        RESET = 0;

        // Test Case 1: RON1
        @(posedge CLK); RON1 = 1;
        @(posedge CLK); RON1 = 0;

        // Test Case 2: RON5
        repeat(2) @(posedge CLK); RON5 = 1;
        @(posedge CLK); RON5 = 0;

        // Test Case 3: RON10
        repeat(2) @(posedge CLK); RON10 = 1;
        @(posedge CLK); RON10 = 0;

        // Test Case 4: Sequence RON1 x3
        repeat(2) @(posedge CLK); RON1 = 1;
        @(posedge CLK); RON1 = 0;
        repeat(2) @(posedge CLK); RON1 = 1;
        @(posedge CLK); RON1 = 0;
        repeat(2) @(posedge CLK); RON1 = 1;
        @(posedge CLK); RON1 = 0;

        // Test Case 5: RON1 + RON5
        repeat(2) @(posedge CLK); RON1 = 1;
        @(posedge CLK); RON1 = 0;
        repeat(2) @(posedge CLK); RON5 = 1;
        @(posedge CLK); RON5 = 0;

        // End of simulation
        repeat(10) @(posedge CLK);
        $finish;
    end

endmodule
