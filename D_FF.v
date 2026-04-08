DESIGN:
module D_FF(input D,clk, output reg Q);
  always @(posedge clk)
begin
Q<=D;
  
end
endmodule
--------------------------------------
TESTBENCH:
module D_FF_tb;
reg D, clk;
wire Q;
  D_FF dut (.D(D),
           .clk(clk),
           .Q(Q)
          );
always #5 clk = ~clk;
initial begin
    $dumpfile("dump_info.vcd");
  $dumpvars(0, D_FF_tb);
    clk = 0; D = 0; 
   #10; D=1;
  #10; D=0;
  $finish;
end

endmodule