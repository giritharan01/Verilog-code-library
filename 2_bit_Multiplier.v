DESIGN:
module multiplier_2bit (
    input  [1:0] A, B,
    output [3:0] P
);

assign P[0] = A[0] & B[0];

assign P[1] = (A[1] & B[0]) ^ (A[0] & B[1]);

assign P[2] = (A[1] & B[1]) ^ ((A[1] & B[0]) & (A[0] & B[1]));

assign P[3] = (A[1] & B[1]) & ((A[1] & B[0]) & (A[0] & B[1]));

endmodule
--------------------------------------------------------
TESTBENCH:
module tb_multiplier_2bit;

reg  [1:0] A, B;
wire [3:0] P;

multiplier_2bit uut (
    .A(A),
    .B(B),
    .P(P)
);

initial begin
    $monitor("Time=%0t | A=%b B=%b -> P=%b (%d)", $time, A, B, P, P);

    // Test all combinations
    A = 2'b00; B = 2'b00; #10;
    A = 2'b00; B = 2'b01; #10;
    A = 2'b00; B = 2'b10; #10;
    A = 2'b00; B = 2'b11; #10;

    A = 2'b01; B = 2'b00; #10;
    A = 2'b01; B = 2'b01; #10;
    A = 2'b01; B = 2'b10; #10;
    A = 2'b01; B = 2'b11; #10;

    A = 2'b10; B = 2'b00; #10;
    A = 2'b10; B = 2'b01; #10;
    A = 2'b10; B = 2'b10; #10;
    A = 2'b10; B = 2'b11; #10;

    A = 2'b11; B = 2'b00; #10;
    A = 2'b11; B = 2'b01; #10;
    A = 2'b11; B = 2'b10; #10;
    A = 2'b11; B = 2'b11; #10;

    $finish;
end

endmodule