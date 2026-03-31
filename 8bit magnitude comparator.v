DESIGN:
module magnitude_comparator_8bit (
    input  [7:0] A, B,
    output A_gt_B,
    output A_lt_B,
    output A_eq_B
);

// Equality
assign A_eq_B = (A == B);

// Greater than
assign A_gt_B = (A > B);

// Less than
assign A_lt_B = (A < B);

endmodule


TESTBENCH:
module tb_magnitude_comparator_8bit;

reg  [7:0] A, B;
wire A_gt_B, A_lt_B, A_eq_B;

magnitude_comparator_8bit uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_lt_B(A_lt_B),
    .A_eq_B(A_eq_B)
);

initial begin
    $monitor("Time=%0t | A=%b B=%b | > %b < %b = %b",
              $time, A, B, A_gt_B, A_lt_B, A_eq_B);

    A = 8'b00000000; B = 8'b00000000; #10;
    A = 8'b00010101; B = 8'b00000111; #10;
    A = 8'b00000010; B = 8'b00001100; #10;
    A = 8'b11110000; B = 8'b11101111; #10;
    A = 8'b10101010; B = 8'b10101010; #10;

    $finish;
end

endmodule