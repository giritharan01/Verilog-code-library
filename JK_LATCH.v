DESIGN:
module JK_latch(input J,K, output reg Q);
  always@(*)
    begin
if(EN)
begin
      if(J==0 && K==1)
        Q=0;
      else if(J==1 && K==0)
        Q=1;
      else if(J==0 && K==0)
        Q=Q;
      else if(J==1 &&K==1)
        Q=~Q;
    end
endmodule
-------------------------------------------------------------
TESTBENCH:
module JK_latch_tb;
 reg J,K,EN;
  wire Q;
  JK_latch JK(.J(J),
              .K(K),
              .EN(EN),
                .Q(Q)
                );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, JK_latch_tb);
    $monitor("time=%0t S=%b R=%b EN=%b Q=%b", $time,J,K,EN,Q);
   EN=0; J=0;K=0; #10;
    J=0;K=1; #10;
    J=1;K=0; #10;
    J=0;K=0; #10;
    J=1;K=1; #10;
 EN=1; J=0;K=0; #10;
    J=0;K=1; #10;
    J=1;K=0; #10;
    J=0;K=0; #10;
    J=1;K=1; #10;

    $finish;
  end
endmodule