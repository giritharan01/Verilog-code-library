DESIGN:

module excess3_to_bcd (
    input  [3:0] ex3,
    output [3:0] bcd
);

assign bcd = ex3 - 4'd3;

endmodule
_______________________________
TESTBENCH:
module tb_excess3_to_bcd;

reg  [3:0] ex3;
wire [3:0] bcd;

excess3_to_bcd uut (.ex3(ex3), .bcd(bcd));

initial begin

    ex3 = 4'd3;  #10;  // BCD 0
    ex3 = 4'd4;  #10;  // BCD 1
    ex3 = 4'd8;  #10;  // BCD 5
    ex3 = 4'd12; #10;  // BCD 9

    $finish;
end

endmodule