module add_testbed;
   reg  [31:0] x [31:0];
   wire [31:0] z;
   
   add f(z, x[6], x[7]);
   
   initial begin
      x[6] = 32'b00000000000000000000000000000001;
      x[7] = 32'h0000000A;
   end
   
   initial #20 $finish;
   
   always @(z) begin
      $display("%2t", $time);
      #1 x[5] = z;
   end
   
   always @(x[5]) begin
      $write("%2t  x[6]=%2d, x[7]=%2d", $time, x[6], x[7]);
      $display(" -> add(x[5], x[6], x[7]) -> x[5]=%2d", x[5]);
      #1 x[7] = x[5];
   end
   
endmodule
