DESIGN:
module HS (input a, b, output diff, bor);
  assign diff = a ^ b;
  assign bor = ~a & b;
endmodule



TESTBENCH:
module HS_tb;
  reg a,b;
  wire diff,bor;
  HS hs_tb(.a(a),
           .b(b),
           .diff(diff),
           .bor(bor)
          );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0,HS_tb);
    $monitor("t=%0t a=%b b=%b | diff=%b bor=%b",$time,a,b,diff,bor);
    a=0;b=0; #10;
        a=0;b=1; #10;
        a=1;b=0; #10;
        a=1;b=1; #10;
    $finish;
  end
    endmodule