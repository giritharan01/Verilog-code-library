DESIGN:
module encoder(input I0,I1,I2,I3, output y0,y1);
  assign y0=I1|I3;
  assign y1=I2|I3;
endmodule

TESTBENCH:
module encoder_tb;
  reg I0,I1,I2,I3;
  wire y0,y1;
  encoder uut(.I0(I0),
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
  