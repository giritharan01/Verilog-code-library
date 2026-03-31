DESIGN:
module multiplier_4bit (
    input  [3:0] A, B,
    output [7:0] P
);

assign P = A * B;

endmodule
___________________________________

TESTBENCH:

module tb_multiplier;

reg  [3:0] A, B;
wire [7:0] P;

multiplier_4bit uut (.A(A), .B(B), .P(P));

initial begin
  $dumpfile("dumpinfo.vcd");
  $dumpvars(0,tb_multiplier);
    $monitor("A=%d B=%d -> Product=%d (%b)", A, B, P, P);

    A = 4'd2; B = 4'd3; #10;
    A = 4'd5; B = 4'd4; #10;
    A = 4'd7; B = 4'd6; #10;
    A = 4'd9; B = 4'd3; #10;

    $finish;
end

endmodule