DESIGN:

module binary_to_gray (
    input  [3:0] b,
    output [3:0] g
);

assign g[3] = b[3];                 // MSB same
assign g[2] = b[3] ^ b[2];
assign g[1] = b[2] ^ b[1];
assign g[0] = b[1] ^ b[0];

endmodule
_____________________________________________
module binary_to_gray (
    input  [3:0] b,
    output [3:0] g
);

assign g = b ^ (b >> 1);
endmodule
_______________________________________________
TESTBENCH:

module tb;
reg  [3:0] b;
wire [3:0] g;
binary_to_gray uut (.b(b), .g(g));
initial begin
    $monitor("Binary = %b -> Gray = %b", b, g);
    b = 4'b0000; #10;
    b = 4'b0001; #10;
    b = 4'b0010; #10;
    b = 4'b0101; #10;
    b = 4'b1011; #10;
    b = 4'b1111; #10;

    $finish;
end
endmodule