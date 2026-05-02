DESIGN:
module upcounter_4bit (input rst,clk,output reg [3:0]count);
  always@(posedge clk)
    begin
      if(!rst)
        count<=0;
      else
        count<=count+1;
    end
endmodule
---------------------------------------------------------------------------------
TESTBENCH:
module upcounter_4bit_tb;
  reg rst,clk;
  wire [3:0]count;
  upcounter_4bit uut(.rst(rst),
                          .clk(clk),
                          .count(count)
                         );
  always #5 clk=~clk;
  initial begin
    $dumpfile("dumpvars.vcd");
    $dumpvars(0,upcounter_4bit_tb);
    $monitor("time=%0t clk=%b rst=%b count=%0d",$time,clk,rst,count);
             clk=0; rst=0;
             #10; rst=1;
             #10;rst=0;
             #10; rst=1;
             #200; $finish;
             end
             endmodule