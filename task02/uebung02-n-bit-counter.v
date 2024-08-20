module counter (Clock, Reset_n, Q);

  parameter n = 4;

  input Clock, Reset_n;
  output [n-1:0] Q;
  reg [n-1:0] Q;

  always @(posedge Clock or negedge Reset_n)
  begin
    if (!Reset_n)
      Q <= 1'd0;
    else
      Q <= Q + 1'b1;
  end
endmodule
