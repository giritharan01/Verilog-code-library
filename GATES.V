DESIGN
//GATE LEVEL MODELLING
module Gates(
  input a,b,
  output y1,y2,y3,y4,y5,y6,y7,y8);
  and g1(y1,a,b);
  or g2(y2,a,b);
  not g3(y3,a);
  not g4(y4,b);
  nand g5(y5,a,b);
  nor g6(y6,a,b);
  xor g7(y7,a,b);
  xnor g8(y8,a,b);
endmodule

//behavioral modelling
module Gates(
    input a, b,
    output reg and_out, or_out, xor_out
);
always@(*)
begin
and_out=a&b;
or_out=a|b;
xor_out=a^b;
end
endmodule
//

TESTBENCH

`timescale 1ns / 1ps
module Gates_tb;
reg a_tb, b_tb;
wire and_o, or_o, xor_o;
// DUT instantiation
Gates gate_tb (
    .a(a_tb),
    .b(b_tb),
    .and_out(and_o),
    .or_out(or_o),
    .xor_out(xor_o)
);

initial
begin
    $monitor("a=%b b=%b | AND=%b OR=%b XOR=%b",
              a_tb, b_tb, and_o, or_o, xor_o);

    a_tb=0; b_tb=0; #10;
    a_tb=0; b_tb=1; #10;
    a_tb=1; b_tb=0; #10;
    a_tb=1; b_tb=1; #10;
    $stop;
end
endmodule