DESIGN:
module comparator(input a,b, output A_gt_B,A_eq_B,A_lt_B);
  assign A_gt_B=a&~b;
  assign A_eq_B=(~a&~b)|(a&b);
  assign A_lt_B=~a&b;
endmodule


TESTBENCH:
module comparator_tb;
  reg a,b;
  wire A_gt_B,A_eq_B,A_lt_B;
  comparator uut(.a(a),
                           .b(b),
                           .A_gt_B(A_gt_B),
                           .A_eq_B(A_eq_B),
                           .A_lt_B(A_lt_B)
                          );
  initial begin 
    $dumpfile("dump_vars.vcd");
    $dumpvars(0,comparator_tb);
     a=0;b=0; #10;
     a=0;b=1; #10;
     a=1;b=0; #10;
     a=1;b=1; #10;
    $finish;
  end
endmodule