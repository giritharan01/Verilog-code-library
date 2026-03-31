DESIGN:

module bcd_to_excess3 (
    input  [3:0] bcd,
    output [3:0] ex3
);

assign ex3 = bcd + 4'd3;

endmodule

__________________________________
TESTBENCH:

module tb_bcd_to_excess3;

reg  [3:0] bcd;
wire [3:0] ex3;

bcd_to_excess3 uut (.bcd(bcd), .ex3(ex3));

initial begin
    $monitor("BCD = %b (%0d) -> Excess-3 = %b (%0d)", bcd, bcd, ex3, ex3);

    bcd = 4'd0; #10;
    bcd = 4'd1; #10;
    bcd = 4'd5; #10;
    bcd = 4'd9; #10;

    $finish;
end

endmodule