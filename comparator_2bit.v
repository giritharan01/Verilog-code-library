DESIGN:
module comp_2bit (
    input A1, A0,
    input B1, B0,
    output A_gt_B, A_eq_B, A_lt_B
);
assign A_gt_B = (A1 & ~B1) | ((~(A1 ^ B1)) & A0 & ~B0);

assign A_lt_B = (~A1 & B1) | ((~(A1 ^ B1)) & ~A0 & B0);

assign A_eq_B = (~(A1 ^ B1)) & (~(A0 ^ B0));

endmodule

TESTBENCH:
`timescale 1ns/1ps

module comp_2bit_tb;

  reg A1, A0, B1, B0;
  wire A_gt_B, A_eq_B, A_lt_B;

  // DUT (Device Under Test)
  comp_2bit uut (
    .A1(A1),
    .A0(A0),
    .B1(B1),
    .B0(B0),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, comp_2bit_tb);

    $monitor("A=%b%b B=%b%b | GT=%b EQ=%b LT=%b",
              A1, A0, B1, B0, A_gt_B, A_eq_B, A_lt_B);

 
    A1=0; A0=0; B1=0; B0=0; #10;
    A1=0; A0=0; B1=0; B0=1; #10;
    A1=0; A0=0; B1=1; B0=0; #10;
    A1=0; A0=0; B1=1; B0=1; #10;

    A1=0; A0=1; B1=0; B0=0; #10;
    A1=0; A0=1; B1=0; B0=1; #10;
    A1=0; A0=1; B1=1; B0=0; #10;
    A1=0; A0=1; B1=1; B0=1; #10;

    A1=1; A0=0; B1=0; B0=0; #10;
    A1=1; A0=0; B1=0; B0=1; #10;
    A1=1; A0=0; B1=1; B0=0; #10;
    A1=1; A0=0; B1=1; B0=1; #10;

    A1=1; A0=1; B1=0; B0=0; #10;
    A1=1; A0=1; B1=0; B0=1; #10;
    A1=1; A0=1; B1=1; B0=0; #10;
    A1=1; A0=1; B1=1; B0=1; #10;

    $finish;
  end

endmodule