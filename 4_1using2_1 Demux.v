DESIGN:

module mux2_1 (
    input a,
    input b,
    input s,
    output y
);
    assign y = s ? b : a;
endmodule

module mux4_1_using2 (
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output Y
);

    wire w1, w2;

    // First stage
    mux2_1 m1 (
        .a(I0),
        .b(I1),
        .s(S0),
        .y(w1)
    );

    mux2_1 m2 (
        .a(I2),
        .b(I3),
        .s(S0),
        .y(w2)
    );

    // Second stage
    mux2_1 m3 (
        .a(w1),
        .b(w2),
        .s(S1),
        .y(Y)
    );

endmodule


TESTBENCH:
`timescale 1ns/1ps

module tb_mux4_1_using2;

    reg I0, I1, I2, I3;
    reg S0, S1;
    wire Y;

    // DUT (Device Under Test)
    mux4_1_using2 uut (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .S0(S0),
        .S1(S1),
        .Y(Y)
    );

    initial begin
        // Monitor values
        $monitor("S1=%b S0=%b | I0=%b I1=%b I2=%b I3=%b | Y=%b",
                  S1, S0, I0, I1, I2, I3, Y);

        // Apply inputs
        I0 = 0; I1 = 1; I2 = 0; I3 = 1;

        S1 = 0; S0 = 0; #10; // Y = I0
        S1 = 0; S0 = 1; #10; // Y = I1
        S1 = 1; S0 = 0; #10; // Y = I2
        S1 = 1; S0 = 1; #10; // Y = I3

        // Change inputs
        I0 = 1; I1 = 0; I2 = 1; I3 = 0;

        S1 = 0; S0 = 0; #10;
        S1 = 0; S0 = 1; #10;
        S1 = 1; S0 = 0; #10;
        S1 = 1; S0 = 1; #10;

        $finish;
    end

endmodule