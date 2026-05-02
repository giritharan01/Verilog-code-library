Design:
module johnson_counter(input clk,rst,
                    output reg [3:0] count);
  always@(posedge clk)
    begin
    if(!rst)
      count<=4'b0000;
  else 
    count={~count[0],count[3:1]};
    end
endmodule
---------------------------------------------
Testbench:
module johnson_counter_tb;
  reg clk,rst;
  wire [3:0] count;
  johnson_counter uut(.clk(clk),
                   .rst(rst),
                   .count(count)
                  );
  always #5 clk=~clk;
  initial begin
     $dumpfile("dumpvars.vcd");
    $dumpvars(0, johnson_counter_tb);
    clk=0; rst=0;
    #10; rst=1;
    #100; $finish;
  end
endmodule