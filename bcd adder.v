DESIGN:
module bcd_adder(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire [4:0] temp;   
    wire [3:0] S;
    wire C;

    // Step 1: Binary addition
    assign temp = A + B + Cin;
    assign S = temp[3:0]; 
    assign C = temp[4];   
    // Step 2: Correction using  equation
    wire correction;
    assign correction = C | (S[3] & S[2]) | (S[3] & S[1]);
    assign {Cout, Sum} = correction ? (temp + 5'd6) : temp;
endmodule

TESTBENCH:
module bcd_adder_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    bcd_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    initial begin
        $monitor("Time=%0t | A=%d B=%d Cin=%b | Sum=%d Cout=%b",
                  $time, A, B, Cin, Sum, Cout);
        A=4'd2; B=4'd3; Cin=0; #10; // 5
        A=4'd5; B=4'd4; Cin=0; #10; // 9
        A=4'd7; B=4'd5; Cin=0; #10; // 12 → correction
        A=4'd9; B=4'd9; Cin=0; #10; // 18 → correction
        A=4'd4; B=4'd6; Cin=1; #10; // 11 → correction
        $finish;
    end
endmodule