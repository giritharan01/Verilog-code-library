DESIGN:
module priority_encoder_8to3 (
    input  [7:0] D,
    output reg [2:0] Y
);

always @(*) begin
    valid = 1'b1;  // default
    casex (D)
        8'b1xxx_xxxx: Y = 3'b111;
        8'b01xx_xxxx: Y = 3'b110;
        8'b001x_xxxx: Y = 3'b101;
        8'b0001_xxxx: Y = 3'b100;
        8'b0000_1xxx: Y = 3'b011;
        8'b0000_01xx: Y = 3'b010;
        8'b0000_001x: Y = 3'b001;
        8'b0000_0001: Y = 3'b000;
        default: begin
            Y = 3'b000;
            valid = 1'b0; // no input active
end
    endcase
end
endmodule

---------------------------------------------------------

(8:3 Priority Encoder (Full Version)
✔ With valid output
✔ Using casez))

module priority_encoder_8to3 (
    input  [7:0] D,
    output reg [2:0] Y,
    output reg valid
);

always @(*) begin
    valid = 1'b1;  // default

    casez (D)
        8'b1???????: Y = 3'b111; // D7
        8'b01??????: Y = 3'b110; // D6
        8'b001?????: Y = 3'b101; // D5
        8'b0001????: Y = 3'b100; // D4
        8'b00001???: Y = 3'b011; // D3
        8'b000001??: Y = 3'b010; // D2
        8'b0000001?: Y = 3'b001; // D1
        8'b00000001: Y = 3'b000; // D0
        default: begin
            Y = 3'b000;
            valid = 1'b0; // no input active
        end
    endcase
end

endmodule

---------------------------------------------------------

TESTBENCH:
`timescale 1ns/1ps

module tb_priority_encoder_8to3;

    reg  [7:0] D;
    wire [2:0] Y;

    priority_encoder_8to3 uut (
        .D(D),
        .Y(Y)
    );

    initial begin
        D = 8'b00000000; #10;
        D = 8'b00000001; #10;
        D = 8'b00000010; #10;
        D = 8'b00000100; #10;
        D = 8'b00001000; #10;
        D = 8'b00010000; #10;
        D = 8'b00100000; #10;
        D = 8'b01000000; #10;
        D = 8'b10000000; #10;

        D = 8'b10101010; #10;
        D = 8'b01110000; #10;
        D = 8'b00011100; #10;

        $finish;
    end

endmodule