DESIGN:
`timescale 1ns / 1ps
module cla(input [3:0] a,b,
input c_in,
output [3:0] sum,
output c_out
);
wire [3:0] P,G;
wire [4:0] c;

assign c[0]=c_in;

assign P=a^b;
assign G=a&b; 

assign sum[0]=P[0]^c[0];
assign sum[1]=P[1]^c[1];
assign sum[2]=P[2]^c[2];
assign sum[3]=P[3]^c[3];

assign c[1]=G[0]|(P[0]&c[0]);
assign c[2]=G[1]|(P[1]&G[0])|(P[1]&P[0]&c[0]);
assign c[3]=G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&c[0]);
assign c[4]=G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&c[0]);

assign c_out=c[4];

endmodule

TESTBENCH:
module cla_tb;
reg [3:0] a,b;
reg c_in;
wire [3:0] sum;
wire c_out;
cla uut (
    .a(a),
    .b(b),
    .c_in(c_in),
    .sum(sum),
    .c_out(c_out)
);
 initial begin
        $monitor("Time=%0t | a=%b b=%b c_in=%b -> sum=%b c_out=%b",
                  $time, a, b, c_in, sum, c_out);

        a=4'b0000; b=4'b0000; c_in=0;  // 0 + 0
        #10;
        a=4'b0001; b=4'b0010; c_in=0;  // 1 + 2
        #10;
        a=4'b0101; b=4'b0011; c_in=0;  // 5 + 3
        #10;
        a=4'b1111; b=4'b0001; c_in=0;  // 15 + 1 (overflow)
        #10;
        a=4'b1010; b=4'b0101; c_in=1;  // with carry input
        #10;
        a=4'b1111; b=4'b1111; c_in=1;  // max case
        #10;
        $finish;
    end
endmodule
