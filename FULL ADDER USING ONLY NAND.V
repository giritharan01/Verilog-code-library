DESIGN:
module FULL ADDER USING NAND (input a,b,c,output sum,carry);
  wire w1,w2,w3,w4,w5,w6,w7;
  nand(w1,a,b);
  nand(w2,a,w1);
  nand(w3,b,w1);
  nand(w4,w3,w2);
  nand(w5,w4,c);
  nand(w6,w5,w4);
  nand(w7,w5,c);
  nand(sum,w7,w6);
  nand(carry,w5,w1);
endmodule

TESTBENCH:
module  FULL ADDER USING NAND_tb;
  reg a_tb,b_tb,c_tb;
  wire sum_tb,carry_tb;
  FULL ADDER USING NAND uut(.a(a_tb),
         .b(b_tb),
         .c(c_tb),
         .sum(sum_tb),
         .carry(carry_tb)
          );
  initial 
    begin
      $dumpfile("dump_info.vcd");
      $dumpvars(0, FULL ADDER USING NAND_tb);
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