DESGIN:

module parity_checker (
    input  [3:0] data,
    input  parity_bit,
    output error
);

assign error = data[3] ^ data[2] ^ data[1] ^ data[0] ^ parity_bit;

endmodule

_________________________________
TESTBENCH:

module tb_parity_checker;

reg  [3:0] data;
reg  parity_bit;
wire error;

parity_checker uut (.data(data), .parity_bit(parity_bit), .error(error));

initial begin
    $monitor("Time=%0t | Data=%b | Parity=%b | Error=%b", 
              $time, data, parity_bit, error);

    // ✅ Correct cases (no error → error=0)
    data = 4'b0000; parity_bit = 0; #10; // even parity correct
    data = 4'b0011; parity_bit = 0; #10; // even parity correct
    data = 4'b0101; parity_bit = 0; #10; // even parity correct

    // ❌ Error cases (error=1)
    data = 4'b0001; parity_bit = 0; #10; // wrong parity
    data = 4'b0011; parity_bit = 1; #10; // wrong parity
    data = 4'b1111; parity_bit = 1; #10; // wrong parity

    $finish;
end

endmodule