module Register32bit (Din, Dout, Load, Reset, clk);
input [31:0] Din;
output reg [31:0] Dout;
input Load, Reset, clk;

initial begin 
Dout = 0;
end

always@(posedge clk or posedge Reset) begin
if (Reset == 1)
Dout = 0;
else if (Load == 1)
Dout <= Din;
else
Dout <= Dout;
end

endmodule


