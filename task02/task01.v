module Fibonacci (
    input [31:0] n,    // Input: The Fibonacci index
    output reg [31:0] fib   // Output: The Fibonacci number
);

    reg [31:0] fib_prev1; // Variable to hold fib(n-1)
    reg [31:0] fib_prev2; // Variable to hold fib(n-2)
    integer i;

    always @(*) begin
        if (n == 0) begin
            fib = 1;
        end else if (n == 1) begin
            fib = 1;
        end else begin
            fib_prev1 = 1;
            fib_prev2 = 1;
            for (i = 2; i <= n; i = i + 1) begin
                fib = fib_prev1 + fib_prev2;
                fib_prev2 = fib_prev1;
                fib_prev1 = fib;
            end
        end
    end

endmodule
