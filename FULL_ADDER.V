DESIGN
DATAFLOW MODELLING:

module FA(input a,b,c ,output  sum,carry);
  assign sum=a^b^c;
  assign carry=(a&b)|((a^b)&c);
endmodule

GATE LEVEL MODELLING:
module FA(input a,b,c ,output  sum,carry);
  wire w1,w2,w3;
  xor G1(w2,a,b);
  and G2(sum,w2,c);
and G3(w1,a,b);
and G4(w3,w2,c);
or  G5(carry, w1, w3);
endmodule


TESTBENCH:
module FA_tb;
  reg a_tb,b_tb,c_tb;
  wire sum_tb,carry_tb;
  FA uut(.a(a_tb),
         .b(b_tb),
         .c(c_tb),
         .sum(sum_tb),
         .carry(carry_tb)
          );
  initial 
    begin
      $dumpfile("dump_info.vcd");
      $dumpvars(0,FA_tb);
      $monitor("t=%0t a_tb=%b b_tb=%b c_tb=%b | sum_tb=%b  carry_tb=%b",$time,a_tb,b_tb,c_tb,sum_tb,carry_tb);
      a_tb=0;b_tb=0;c_tb=0; #10;
      a_tb=0;b_tb=0;c_tb=1; #10;
        a_tb=0;b_tb=1;c_tb=0; #10;
        a_tb=0;b_tb=1;c_tb=1; #10;
        a_tb=1;b_tb=0;c_tb=0; #10;
        a_tb=1;b_tb=0;c_tb=1; #10;
        a_tb=1;b_tb=1;c_tb=0; #10;
        a_tb=1;b_tb=1;c_tb=1; #10;
      $finish;
    end
endmodule