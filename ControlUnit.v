module ControlUnit (Type, Instruction, ALUstatus ,MRW,RegRW,ALUop,PCsrc,WB,ALUsrc); //Imm masking built in to datapath "type"

input [1:0]Type;
input [31:0]Instruction;
input [3:0]ALUstatus;
reg MRWr, RegRWr, PCsrcr,WBr, ALUsrcr;
reg [2:0] ALUopr;

output MRW, RegRW, PCsrc, WB, ALUsrc;
output [2:0] ALUop;

assign MRW = MRWr;
assign RegRW = RegRWr;
assign PCsrc = PCsrcr;
assign WB = WBr;
assign ALUsrc = ALUsrcr;
assign ALUop = ALUopr;



initial begin
{MRWr, PCsrcr, ALUsrcr} = 0;
ALUopr = 3'b000;
RegRWr = 1;
WBr = 1;
end

always@(*)begin
case(Type)
0: //R
begin
MRWr = 0;
RegRWr = 1;
PCsrcr = 0;
WBr = 1;
ALUsrcr = 0;
ALUopr = 3'b000;
end
1:	//I
begin
MRWr = 0;
RegRWr = 1;
PCsrcr = 0;
WBr = 1;
ALUsrcr = 1;
ALUopr = 3'b000;
end
2:	//S
begin
MRWr = 1;
RegRWr = 0;
PCsrcr = 0;
WBr = 0;
ALUsrcr = 1;
ALUopr = 3'b000;
end
3:	//B
begin
MRWr = 0;
ALUsrcr = 1;
RegRWr = 0;
if (ALUstatus[3] == 1)
begin
PCsrcr = 1;
end
else
PCsrcr = 0;
end
endcase
end
endmodule