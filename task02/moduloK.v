
module ModuloCounter #(parameter k = 16) (
    input clk,           // Takt-Signal
    input reset,         // Reset-Signal
    output reg [31:0] count  // Zählerausgang
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;  // Reset: Zähler auf 0 setzen
        end else begin
            if (count == k-1) begin
                count <= 0;  // Wenn der Zähler k-1 erreicht, auf 0 zurücksetzen
            end else begin
                count <= count + 1;  // Zähler inkrementieren
            end
        end
    end
endmodule
