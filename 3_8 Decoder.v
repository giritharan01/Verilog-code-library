DESIGN:
module decoder3_8 (
  input [2:0] A,
  output reg [7:0] Y
);

  always @(*) begin
    case (A)
      3'b000: Y = 8'b00000001;
      3'b001: Y = 8'b00000010;
      3'b010: Y = 8'b00000100;
      3'b011: Y = 8'b00001000;
      3'b100: Y = 8'b00010000;
      3'b101: Y = 8'b00100000;
      3'b110: Y = 8'b01000000;
      3'b111: Y = 8'b10000000;
    endcase
  end

endmodule




TESTBENCH:
module decoder3_8_tb;

  reg [2:0] A;
  wire [7:0] Y;

  decoder3_8 uut (
    .A(A),
    .Y(Y)
  );

  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, decoder3_8_tb);

    $monitor("t=%0t A=%b | Y=%b", $time, A, Y);

    // Correct input sequence
    A = 3'b000; #10;
    A = 3'b001; #10;
    A = 3'b010; #10;
    A = 3'b011; #10;
    A = 3'b100; #10;
    A = 3'b101; #10;
    A = 3'b110; #10;
    A = 3'b111; #10;

    $finish;
  end

endmodule