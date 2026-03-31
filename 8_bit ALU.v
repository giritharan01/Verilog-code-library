DESIGN:
module alu (
    input [7:0] A, B,
    input [2:0] sel,
    output reg [7:0] Y,
    output zero
);

// ALU Operations
always @(*) begin
    case(sel)
        3'b000: Y = A + B;       // ADD
        3'b001: Y = A - B;       // SUB
        3'b010: Y = A & B;       // AND
        3'b011: Y = A | B;       // OR
        3'b100: Y = A ^ B;       // XOR
        3'b101: Y = ~A;          // NOT
        3'b110: Y = A << 1;      // SHIFT LEFT
        3'b111: Y = A >> 1;      // SHIFT RIGHT
        default: Y = 8'b00000000;
    endcase
end
assign zero = (Y == 8'b00000000);

endmodule
___________________________________________

TESTBENCH:

`timescale 1ns/1ps

module alu_tb;

// Inputs
reg [7:0] A, B;
reg [2:0] sel;

// Outputs
wire [7:0] Y;
wire zero;

// Instantiate ALU (Make sure your module name is 'alu')
alu uut (
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y),
    .zero(zero)
);

// Stimulus
initial begin
    A = 8'd10;
    B = 8'd5;

    sel = 3'b000; #20;  // ADD
    sel = 3'b001; #20;  // SUB
    sel = 3'b010; #20;  // AND
    sel = 3'b011; #20;  // OR
    sel = 3'b100; #20;  // XOR
    sel = 3'b101; #20;  // NOT
    sel = 3'b110; #20;  // SHIFT LEFT
    sel = 3'b111; #20;  // SHIFT RIGHT

    $stop;
end
endmodule

