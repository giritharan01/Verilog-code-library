DESIGN:
module mux8_1 (
  input [7:0] I,
  input [2:0] S,
  input E,
  output reg y
);
  always @(*) begin
    if (E == 0)
      y = 0;
    else begin
      case (S)
        3'b000: y = I[0];
        3'b001: y = I[1];
        3'b010: y = I[2];
        3'b011: y = I[3];
        3'b100: y = I[4];
        3'b101: y = I[5];
        3'b110: y = I[6];
        3'b111: y = I[7];
      endcase
    end
  end
endmodule


TESTBENCH:
module mux8_1_tb;
  reg [7:0] I;
  reg [2:0] S;
  reg E;
  wire y;
  mux8_1 uut (
    .I(I),
    .S(S),
    .E(E),
    .y(y)
  );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, mux8_1_tb);
    // Enable OFF
    E = 0;
    I = 8'b01010101;
    S = 3'b000; #10;
    S = 3'b001; #10;
    S = 3'b010; #10;
    S = 3'b011; #10;
    S = 3'b100; #10;
    S = 3'b101; #10;
    S = 3'b110; #10;
    S = 3'b111; #10;

    // Enable ON
    E = 1;
    I = 8'b01010101;

    S = 3'b000; #10;
    S = 3'b001; #10;
    S = 3'b010; #10;
    S = 3'b011; #10;
    S = 3'b100; #10;
    S = 3'b101; #10;
    S = 3'b110; #10;
    S = 3'b111; #10;

    I = 8'b11110000;
    S = 3'b000; #10;
    S = 3'b001; #10;
    S = 3'b010; #10;
    S = 3'b011; #10;
    S = 3'b100; #10;
    S = 3'b101; #10;
    S = 3'b110; #10;
    S = 3'b111; #10;
    $finish;
  end
endmodule