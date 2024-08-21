`timescale 1ns/1ps

module testbench();
    reg [31:0] n;
    wire [31:0] fib;

    // Instanzierung des Fibonacci-Moduls
    Fibonacci fibonacci_instance (
        .n(n),
        .fib(fib)
    );

    initial begin
        // Wellenform-Dump-Dateien erstellen
        $dumpfile("waves.vcd");
        $dumpvars(0, testbench);

        // Testfall 1: fib(0)
        n = 0;
        #10;
        $display("fib(%d) = %d", n, fib);

        // Testfall 2: fib(1)
        n = 1;
        #10;
        $display("fib(%d) = %d", n, fib);

        // Testfall 3: fib(2)
        n = 2;
        #10;
        $display("fib(%d) = %d", n, fib);

        // Testfall 4: fib(10)
        n = 10;
        #10;
        $display("fib(%d) = %d", n, fib);

        // Testfall 5: fib(15)
        n = 15;
        #10;
        $display("fib(%d) = %d", n, fib);

        // Testfall 6: fib(20)
        n = 20;
        #10;
        $display("fib(%d) = %d", n, fib);

        // Beenden der Simulation
        $finish;
    end
endmodule
