Design:
module moore_state(
  input clk,
  input rst,
  output reg [2:0] light
);
  parameter s0=0,s1=1,s2=2;
  parameter red=3'b100,yellow=3'b010,green=3'b001;
  reg [1:0] state;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= s0;
      light <= red;
    end 
    else begin
      case(state)
        s0: begin
          light <= yellow; state <= s1;
        end
        s1: begin
          light <= green; state <= s2;
        end
        s2: begin
          light <= red; state <= s0;
        end
        default: begin
          light <= red; state <= s0;
        end
      endcase
    end
  end
endmodule
--------------------------------------------------------------------
Testbench:
module tb_moore_state;
  reg clk;
  reg rst;
  wire [2:0] light;
  moore_state uut (
    .clk(clk),
    .rst(rst),
    .light(light)
  );
  always #5 clk = ~clk;
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_moore_state);
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #100 $finish;  
  end
  initial begin
    $monitor("Time=%0t | Light=%b", $time, light);
  end
endmodule