DESIGN:
module mux (
  input I0, I1, I2, I3,
  input E, S0, S1,
  output reg y
);
  always @(*) begin
    if (E == 0)
      y = 0;
    else begin
      case ({S1, S0})
        2'b00: y = I0;
        2'b01: y = I1;
        2'b10: y = I2;
        2'b11: y = I3;
      endcase
    end
  end
endmodule


TESTBENCH:
module mux_tb;
  reg I0,I1,I2,I3,E,S0,S1;
  wire y;
  mux uut(.I0(I0),
          .I1(I1),
          .I2(I2),
          .I3(I3),
          .S0(S0),
          .S1(S1),
          .E(E),
          .y(y)
         );
  initial begin 
    $dumpfile("dump_info.vcd");
    $dumpvars(0,mux_tb);
    E=0; I0=0; I1=1; I2=0; I3=1;
  S1=0; S0=0; #10;
S1=0; S0=1; #10;
S1=1; S0=0; #10;
S1=1; S0=1; #10;
   E=1;  I0=0; I1=1; I2=0; I3=1;
    S1=0; S0=0; #10;
S1=0; S0=1; #10;
S1=1; S0=0; #10;
S1=1; S0=1; #10;
    E=1; I0=1; I1=0; I2=1; I3=0;
  S1=0; S0=0; #10;
S1=0; S0=1; #10;
S1=1; S0=0; #10;
S1=1; S0=1; #10;
    $finish;
  end
endmodule
