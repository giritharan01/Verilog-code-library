DESIGN:
module mux(input I0, I1, E, S, output reg Y);
  always @(*) begin
    if (E == 0)
      Y = 0;
    else begin
      if (S == 0)
        Y = I0;
      else
        Y = I1;
    end
  end
endmodule


TESTBENCH:
module mux_tb;
  reg I0,I1,E,S;
  wire y;
  mux uut(.I0(I0),
          .I1(I1),
          .S(S),
          .E(E),
          .y(y)
         );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0,mux_tb);
    $monitor("t=%0t I0=%b I1=%b S=%b E=%b | y=%b", $time,I0,I1,S,E,y);
    I0=0; I1=1;

    E=0; S=0; #10;
    E=1; S=0; #10;
    E=1; S=1; #10;

    I0=1; I1=0;
    E=0; S=1; #10;

    E=1; S=0; #10;
    E=1; S=1; #10;
$finish;
  end 
  endmodule