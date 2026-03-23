DESIGN:
module HS (input a, b, output diff, bor);
  assign diff=a^b;
  assign bor=(~a)&b;
endmodule
    
module FS_hs1(input a,b,c,output diff,bor);
      wire w1,w2,w3;
      HS hs1(.a(a),
         .b(b),
             .diff(w1),
             .bor(w2)
            );
      HS hs2(.a(w1),
             .b(c),
             .diff(diff),
             .bor(w3)
            );
      assign bor=w2|w3;
    endmodule


TESTBENCH:
module FS_HS_tb;
  reg a,b,c;
  wire diff,bor;
  FS_HS fs_tb(.a(a),
           .b(b),
           .c(c),
           .diff(diff),
           .bor(bor)
          );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0,FS_HS_tb);
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