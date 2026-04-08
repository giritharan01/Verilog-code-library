DESIGN:
module JK_FF(input J,K,clk, output reg Q);
  always @(posedge clk)
begin
  
  if(J==0 && K==1)
    Q<=0;
  else if(J==1 && K==0)
    Q<=1;
  else if(J==1 && K==1)
    Q<=~Q;
  
end
endmodule
---------------------------------------------------------
TESTBENCH:
module JK_FF_tb;
reg J, K, clk;
wire Q;
  JK_FF dut (.J(J),
             .K(K),
           .clk(clk),
           .Q(Q)
          );
always #5 clk = ~clk;
initial begin
    $dumpfile("dump_info.vcd");
  $dumpvars(0, JK_FF_tb);
    clk = 0; J = 0; K = 0;
    #10 J=0; K=1;   // reset
    #10 J=1; K=0;   // set
    #10 J=0; K=0;   // hold
    #10 J=1; K=1;   // TOGGLE
    #20 $finish;
end

endmodule