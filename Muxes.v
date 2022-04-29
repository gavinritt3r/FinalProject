module mux32bit2to1( in1, in2, sel, out);
input [31:0]in1, in2;
input sel;
output reg [31:0]out;

always @(in1 or in2 or sel)
begin

if(sel) 
out = in2;
else
out = in1;
end

endmodule


