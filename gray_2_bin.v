DESIGN:

module gray_to_binary (
    input  [3:0] g,
    output [3:0] b
);

assign b[3] = g[3];
assign b[2] = b[3] ^ g[2];
assign b[1] = b[2] ^ g[1];
assign b[0] = b[1] ^ g[0];

endmodule
-------------------------------------------------
module gray_to_binary (
    input  [3:0] g,
    output reg [3:0] b
);

integer i;

always @(*) begin
    b[3] = g[3];
    for(i = 2; i >= 0; i = i - 1)
        b[i] = b[i+1] ^ g[i];
end

endmodule
___________________________________________
TESTBENCH:

module tb;

reg  [3:0] g;
wire [3:0] b;

gray_to_binary uut (.g(g), .b(b));

initial begin
    $monitor("Gray = %b -> Binary = %b", g, b);

    g = 4'b0000; #10;
    g = 4'b0001; #10;
    g = 4'b0011; #10;
    g = 4'b0110; #10;
    g = 4'b1110; #10;

    $finish;
end

endmodule