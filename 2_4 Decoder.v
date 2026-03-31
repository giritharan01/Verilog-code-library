DESIGN:
module decoder2_4_case (
  input [1:0] A,
  output reg [3:0] Y
);

  always @(*) begin
    case (A)
      2'b00: Y = 4'b0001;
      2'b01: Y = 4'b0010;
      2'b10: Y = 4'b0100;
      2'b11: Y = 4'b1000;
    endcase
  end

endmodule




TESTBENCH:
module decoder2_4_tb;

  reg [1:0] A;
  wire [3:0] Y;

  decoder2_4_case uut (
    .A(A),
    .Y(Y)
  );

  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, decoder2_4_tb);

    $monitor("t=%0t A=%b | Y=%b", $time, A, Y);

    // Apply all input combinations
    A = 2'b00; #10;
    A = 2'b01; #10;
    A = 2'b10; #10;
    A = 2'b11; #10;
    $finish;
  end
endmodule