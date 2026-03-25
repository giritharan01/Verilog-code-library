DESIGN:
module mux4_1 (
  input I0,I1,I2,I3,
  input S1,S0,
  output Y
);
  assign Y = (I0 & ~S1 & ~S0) |
             (I1 & ~S1 &  S0) |
             (I2 &  S1 & ~S0) |
             (I3 &  S1 &  S0);
endmodule


module mux8_1_struct (
  input I0,I1,I2,I3,I4,I5,I6,I7,
  input S2,S1,S0,
  output Y
);
  wire w1, w2;
  mux4_1 M1 (.I0(I0), .I1(I1), .I2(I2), .I3(I3),
             .S1(S1), .S0(S0), .Y(w1));
  mux4_1 M2 (.I0(I4), .I1(I5), .I2(I6), .I3(I7),
             .S1(S1), .S0(S0), .Y(w2));
  assign Y = (~S2 & w1) | (S2 & w2);
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

    $monitor("t=%0t E=%b S=%b I=%b | y=%b",
              $time, E, S, I, y);


    // 1. Enable OFF
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


    // 2. Enable ON
    E = 1;
    I = 8'b01010101;

    S = 3'b000; #10; // I0
    S = 3'b001; #10; // I1
    S = 3'b010; #10; // I2
    S = 3'b011; #10; // I3
    S = 3'b100; #10; // I4
    S = 3'b101; #10; // I5
    S = 3'b110; #10; // I6
    S = 3'b111; #10; // I7

    // 3. Change input pattern
 
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