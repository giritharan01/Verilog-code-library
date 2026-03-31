DESIGN:
module bin_to_bcd_shift3 (
    input [3:0] bin,
    output reg [7:0] bcd   // [7:4] tens, [3:0] ones
);

integer i;
reg [7:0] temp;

always @(*) begin
    temp = 8'd0;
    temp[3:0] = bin;   // load binary

    for (i = 0; i < 4; i = i + 1) begin
        
        // add-3 if >4
        if (temp[7:4] > 4)
            temp[7:4] = temp[7:4] + 3;

        if (temp[3:0] > 4)
            temp[3:0] = temp[3:0] + 3;

        // shift left
        temp = temp << 1;
    end

    bcd = temp;
end

endmodule

TESTBENCH:
`timescale 1ns/1ps

module tb;

reg  [3:0] bin;
wire [7:0] bcd;

// Instantiate your module
bin_to_bcd_shift3 uut (
    .bin(bin),
    .bcd(bcd)
);

initial begin
    // Apply few test values

    bin = 4'd0;  #10;
    bin = 4'd5;  #10;
    bin = 4'd9;  #10;
    bin = 4'd10; #10;
    bin = 4'd15; #10;

    $finish;
end

endmodule