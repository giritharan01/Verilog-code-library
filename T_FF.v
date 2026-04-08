DESIGN:
module T_FF(input T,clk, output reg Q);
    initial Q = 0;
  always @(posedge clk)
begin
  if(T==1)
    Q<=(~Q);
end
endmodule
----------------------------------------
TESTBENCH:
module T_FF_tb;
reg T, clk;
wire Q;
  T_FF dut (.T(T),
           .clk(clk),
           .Q(Q)
          );
always #5 clk = ~clk;
initial begin
    $dumpfile("dump_info.vcd");
  $dumpvars(0, T_FF_tb);
    clk = 0; T = 0;
    #10 T = 1;   // toggle
    #10 T = 1;   // toggle again
    #10 T = 0;   // hold
    #10 T = 1;   // toggle

    #20 $finish;
end

endmodule