DESGIN:
module even_parity (
    input  [3:0] data,
    output parity
);

assign parity = data[3] ^ data[2] ^ data[1] ^ data[0];

endmodule
__________________________________________________________________

TESTBENCH:
module tb_even_parity;

reg  [3:0] data;
wire parity;

even_parity uut (.data(data), .parity(parity));

initial begin
    $monitor("Time=%0t | Data=%b | Parity=%b", $time, data, parity);

    data = 4'b0000; #10; // 0 ones → parity = 0
    data = 4'b0001; #10; // 1 one  → parity = 1
    data = 4'b0011; #10; // 2 ones → parity = 0
    data = 4'b0101; #10; // 2 ones → parity = 0
    data = 4'b0111; #10; // 3 ones → parity = 1
    data = 4'b1111; #10; // 4 ones → parity = 0

    $finish;
end

endmodule