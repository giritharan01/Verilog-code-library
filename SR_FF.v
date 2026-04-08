DESIGN:
module SR_FF(input S,R,clk, output reg Q);
  always @(posedge clk)
begin
  
  if(S==0 && R==1)
    Q<=0;
  else if(S==1 && R==0)
    Q<=1;
  else if(S==1 && R==1)
    Q<=1'bx;
  
end

endmodule
---------------------------------------------------------
TESTBENCH:
module SR_FF_tb;
reg S, R, clk;
wire Q;
SR_FF dut (.S(S),
           .R(R),
           .clk(clk),
           .Q(Q)
          );
always #5 clk = ~clk;
initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, SR_FF_tb);
    clk = 0; S = 0; R = 0;
    #10 S=0; R=1;   // reset
    #10 S=1; R=0;   // set
    #10 S=0; R=0;   // hold
    #10 S=1; R=1;   // invalid
    #20 $finish;
end

endmodule