DESIGN:
module FS (input a, b,c, output diff, bor);
assign diff=a^b^c;
  assign bor  = (~a & b) | (~(a ^ b) & c);
endmodule



TESTBENCH:
module FS_tb;
  reg a,b,c;
  wire diff,bor;
  FS fs_tb(.a(a),
           .b(b),
           .c(c),
           .diff(diff),
           .bor(bor)
          );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0,FS_tb);
    $monitor("t=%0t a=%b b=%b c=%b | diff=%b bor=%b",$time,a,b,c,diff,bor);
    a=0;b=0;c=0; #10;
    a=0;b=0;c=1; #10;
    a=0;b=1;c=0; #10;
    a=0;b=1;c=1; #10;
    a=1;b=0;c=0; #10;
    a=1;b=0;c=1; #10;
    a=1;b=1;c=0; #10;
    a=1;b=1;c=1; #10;
    $finish;
  end
    endmodule