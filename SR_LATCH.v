DESIGN:
module sr_latch(input S,R,EN, output reg Q);
  always@(*)
    begin
if(EN)
begin
      if(S==0 && R==1)
        Q=0;
     else if(S==1 && R==0)
        Q=1;
      else if(S==0 && R==0)
        Q=Q;
      else
        Q=1'bx;
    end
endmodule
-----------------------------------------------------
TESTBENCH:
module sr_latch_tb;
 reg S,R,EN;
  wire Q;
  sr_latch sr(.S(S),
               .EN(EN),
                 .R(R),
                .Q(Q)
                );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, sr_latch_tb);
    $monitor("time=%0t S=%b R=%b Q=%b", $time,S,R,Q);
   EN=0; S=0;R=0; #10;
    S=0;R=1; #10;
    S=1;R=0; #10;
    S=0;R=0; #10;
    S=1;R=1; #10;
EN=1; S=0;R=0; #10;
    S=0;R=1; #10;
    S=1;R=0; #10;
    S=0;R=0; #10;
    S=1;R=1; #10;

    $finish;
  end
endmodule