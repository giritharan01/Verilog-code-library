Design:
module modn_counter #(
    parameter N = 10,
    parameter WIDTH = 4
)(
    input clk, rst,
    output reg [WIDTH-1:0] count
);
  always@(posedge clk)
    begin
      if(!rst)
      count<=0;
      else if(count==N-1)
    count<=0;
  else
    count<=count+1;
    end
endmodule
--------------------------------------------------------------
Testbench:
module modn_counter_tb;
parameter N = 10;
parameter WIDTH = 4;
reg clk, rst;
wire [WIDTH-1:0] count;
// ✅ Pass parameters + correct instantiation
modn_counter #(.N(N), .WIDTH(WIDTH)) uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);
// Clock generation
always #5 clk = ~clk;
initial begin
    $monitor("time=%0t | clk=%b | rst=%b | count=%0d",
              $time, clk, rst, count);
    clk = 0;
    rst = 0;
    #10 rst = 1;
    #100 $finish;
end
endmodule