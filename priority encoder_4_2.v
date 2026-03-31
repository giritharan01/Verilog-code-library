DESIGN:
module priority_encoder (
    input I0, I1, I2, I3,
    output reg y0, y1
);
always @(*) begin
    if (I3) begin
        y1 = 1;
        y0 = 1;
    end
    else if (I2) begin
        y1 = 1;
        y0 = 0;
    end
    else if (I1) begin
        y1 = 0;
        y0 = 1;
    end
    else if (I0) begin
        y1 = 0;
        y0 = 0;
    end
    else begin
        y1 = 0;
        y0 = 0;
    end
end
endmodule

TESTBENCH:
module encoder_tb;
  reg I0,I1,I2,I3;
  wire y0,y1;
 priority_encoder uut(.I0(I0),
                 .I1(I1),
                 .I2(I2),
                 .I3(I3),
                 .y0(y0),
                 .y1(y1)
                );
  initial
    begin
     $dumpfile("dump_info.vcd");
    $dumpvars(0, encoder_tb);
      I0=1;I1=0;I2=0;I3=0; #10;
      I0=0;I1=1;I2=0;I3=0; #10;
      I0=0;I1=0;I2=1;I3=0; #10;
      I0=0;I1=0;I2=0;I3=1; #10;
      $finish;
    end
endmodule
  