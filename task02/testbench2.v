`timescale 1ns/1ps

module testbench();
    reg clk;
    reg reset;
    wire [31:0] count;

    // Instanzierung des Modulo-k-Zählers mit k=16
    ModuloCounter #(16) counter_instance (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Taktgenerator
    always #5 clk = ~clk;  // Takt mit einer Periode von 10 Zeiteinheiten

    initial begin
        // Wellenform-Dump-Dateien erstellen
        $dumpfile("modulo_counter.vcd");
        $dumpvars(0, testbench);

        // Initialisierung
        clk = 0;
        reset = 1;

        // Reset deaktivieren
        #10 reset = 0;

        // Einige Taktzyklen abwarten
        #100;

        // Reset aktivieren und wieder deaktivieren
        #10 reset = 1;
        #10 reset = 0;

        // Weitere Taktzyklen abwarten
        #50;

        // Simulation beenden
        $finish;
    end
endmodule
