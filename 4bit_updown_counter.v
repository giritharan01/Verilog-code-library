Design:
module updown_counter(input clk,rst,updown,output reg [3:0]count);
  always@(posedge clk)
    begin
    if(!rst)
      count<=0;
  else if(!updown)
    count<=count-1;
  else
    count<=count+1;
  end
endmodule
---------------------------------------
Testbench:
module updown_counter_tb;

reg clk, rst, updown;
wire [3:0] count;

updown_counter uut (
    .clk(clk),
    .rst(rst),
    .updown(updown),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dumpvars.vcd");
    $dumpvars(0, updown_counter_tb);
    $monitor("time=%0t | clk=%b | rst=%b | updown=%b | count=%0d",
              $time, clk, rst, updown, count);
    clk = 0;
    rst = 0;
    updown = 1;
    // Release reset → start counting UP
    #10 rst = 1;
    // Count UP for some time
    #50;
    // Change direction → DOWN
    updown = 0;
    #50;
    // Change direction → UP again
    updown = 1;
    #50;
    // Apply reset again
    rst = 0;
    #10 rst = 1;
    #50 $finish;
end

endmodule