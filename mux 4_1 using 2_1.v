DESIGN:
module mux_2_1 (
  input I0,I1,S,output y
);
  assign y=(~S&I0)|(S&I1);
endmodule

module mux_4_1 (
  input I0,I1,I2,I3,S0,S1,E,output y
);
  wire w1,w2,w3;
  mux_2_1 mux1(.I0(I0),
                 .I1(I1),
                 .S(S0),
                 .y(w1)
                );
  mux_2_1 mux2(.I0(I0),
               .I1(I1),
               .S(S0),
               .y(w2)
              );
  mux_2_1 mux3(.I0(w1),
                .I1(w2),
                .S(S1),
                .y(w3)
              );
                 assign y = E & w3;
               endmodule


TESTBENCH:
module mux_4_1_tb;
  reg I0,I1,I2,I3,E,S0,S1;
  wire y;
mux_4_1 uut(.I0(I0),
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
    $dumpvars(0,mux_4_1_tb);
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
