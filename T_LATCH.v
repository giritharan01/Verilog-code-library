DESIGN:
module T_latch(input T, EN, output reg Q);

initial Q = 0;

always @(*)
begin
    if (EN && T)
        Q = ~Q;   // toggle
end

endmodule
-----------------------------------------------
TESTBENCH:
module T_latch_tb;
 reg T,EN;
  wire Q;
  T_latch TFF(.T(T),
            .EN(EN),
            .Q(Q)
                );
  initial begin
    $dumpfile("dump_info.vcd");
    $dumpvars(0, T_latch_tb);
    EN=0; T=0; #10;
    EN=0; T=1; #10;
    EN=1; T=0; #10;
    EN=1; T=1; #10;
    $finish;
  end
endmodule