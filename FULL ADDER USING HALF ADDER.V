DESIGN
module HA (input a, b, output sum, carry);
  assign sum = a ^ b;
  assign carry = a & b;
endmodule


module FA (
    input a, b, cin,
    output sum, cout
);
  wire s1, c1, c2;
  HA HA1 (.a(a),  .b(b),   .sum(s1),  .carry(c1));
  HA HA2 (.a(s1), .b(cin), .sum(sum), .carry(c2));
  assign cout = c1 | c2;
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
      $dumpvars(0,a_tb,b_tb,c_tb,sum_tb,carry_tb);
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