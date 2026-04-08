DESIGN:
module D_latch(input D,EN, output reg Q);
   always @(*)
begin
    if (EN)
        Q = D;
    else
        Q = Q; 
end
endmodule
------------------------------------------------------
TESTBENCH:
module D_latch_tb;
 reg D,EN;
  wire Q;
  D_latch DFF(.D(D),
            .EN(EN),
            .Q(Q)
                );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, D_latch_tb);
    EN=0; D=0; #10;
    EN=0; D=1; #10;
    EN=1; D=0; #10;
    EN=1; D=1; #10;
    $finish;
  end
endmodule