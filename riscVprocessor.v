module riscVprocessor(clk,reset,FinalOut);
input clk;
input reset;
output[31:0] FinalOut;

wire MRW, RegRW, PCsrc, WB, ALUsrc;
wire [2:0]ALUop;
wire [3:0] ALUstatus;
wire [1:0]Type;
wire [31:0] Instruction;



Datapath DP(clk,reset,ALUsrc,ALUop,PCsrc,RegRW,MRW,WB,FinalOut,ALUstatus,Type,Instruction);

ControlUnit CU(Type, Instruction, ALUstatus,MRW,RegRW,ALUop,PCsrc,WB,ALUsrc);


endmodule
