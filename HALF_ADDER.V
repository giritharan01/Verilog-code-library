DESIGN:
module HA(input a,b, output c_1,c_2);
  xor(c_1,a,b);
  and(c_2,a,b);
endmodule


TESTBENCH:
module HA_tb;
  reg a_tb,b_tb;
  wire c_11,c_22;
  HA uut(.a(a_tb),
         .b(b_tb),
         .c_1(c_11),
         .c_2(c_22)
          );
  initial 
    begin
      $dumpfile("dump_info.vcd");
      $dumpvars(0,HA_tb);
      $monitor("a_tb=%b b_tb=%b | c11_tb=%b  c22_tb=%b",a_tb,b_tb,c_11,c_22);
      a_tb=0;b_tb=0; #10;
      a_tb=0;b_tb=1; #10;
      a_tb=1;b_tb=0; #10;
      a_tb=1;b_tb=1; #10;
$finish;
    end
endmodule