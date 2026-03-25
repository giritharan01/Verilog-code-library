DESIGN:
module demux (
  input I,
  input [1:0] S,
  output reg y0, y1, y2, y3
);

  always @(*) begin
    y0 = 0; y1 = 0; y2 = 0; y3 = 0;

    case (S)
      2'b00: y0 = I;
      2'b01: y1 = I;
      2'b10: y2 = I;
      2'b11: y3 = I;
    endcase
  end
endmodule

TESTBENCH:
module demux_tb;
 reg I;
reg [1:0] S;
  wire y0,y1,y2,y3;
  demux uut(.I(I),
            .S(S),
            .y0(y0),
            .y1(y1),
            .y2(y2),
            .y3(y3)
           );
           initial begin
     $dumpfile("dump_info.vcd");
    $dumpvars(0, demux_tb);
             I=1;
             S= 2'b00; #10;
            S= 2'b01; #10;
              S=2'b10; #10;
              S=2'b11; #10;
             I=0;
             S= 2'b00; #10;
             S= 2'b01; #10;
              S=2'b10; #10;
              S=2'b11; #10;
             $finish;
           end
            endmodule