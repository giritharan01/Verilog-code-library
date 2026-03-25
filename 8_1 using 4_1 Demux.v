DESIGN:
module demux1_4 (
  input I,
  input S1, S0,
  output Y0, Y1, Y2, Y3
);

  assign Y0 = I & ~S1 & ~S0;
  assign Y1 = I & ~S1 &  S0;
  assign Y2 = I &  S1 & ~S0;
  assign Y3 = I &  S1 &  S0;

endmodule

module demux1_8 (
  input I,
  input S2, S1, S0,
  output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);

  wire w1, w2;

  assign w1 = I & ~S2;
  assign w2 = I &  S2;


  demux1_4 D1 (.I(w1), .S1(S1), .S0(S0), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3));
  demux1_4 D2 (.I(w2), .S1(S1), .S0(S0), .Y0(Y4), .Y1(Y5), .Y2(Y6), .Y3(Y7));

endmodule




TESTBENCH:
module demux1_8_tb;

  reg I;
  reg [2:0] S;
  wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

  demux1_8 uut (
    .I(I),
    .S2(S[2]),
    .S1(S[1]),
    .S0(S[0]),
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3),
    .Y4(Y4),
    .Y5(Y5),
    .Y6(Y6),
    .Y7(Y7)
  );

  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, demux1_8_tb);

    $monitor("t=%0t I=%b S=%b | Y=%b%b%b%b%b%b%b%b",
              $time, I, S, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0);

    I = 1;

    S = 3'b000; #10; // Y0
    S = 3'b001; #10; // Y1
    S = 3'b010; #10; // Y2
    S = 3'b011; #10; // Y3
    S = 3'b100; #10; // Y4
    S = 3'b101; #10; // Y5
    S = 3'b110; #10; // Y6
    S = 3'b111; #10; // Y7


    I = 0;

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