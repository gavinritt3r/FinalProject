module Datapath (clk,reset,ALUsrc,ALUop,PCsrc,RegRW,MRW,WB,Out,ALUstatus,typeout,Instruction);
output reg [31:0] Out;
output wire[31:0] Instruction;
input ALUsrc,RegRW,MRW,PCsrc,WB,clk,reset;
input [2:0] ALUop;
output [3:0]ALUstatus;
output [1:0]typeout;

wire [1:0]type;

assign typeout = type;

wire [7:0]PC;
wire [3:0]ALUstatus;
wire [31:0]RFoutA,RFoutB;
wire [4:0] rd, rs1, rs2;
wire [31:0] IMM,RFMuxOut,ALUout,RAMout,RAMMuxOut;

ProgramCounter ProgCounter(PCsrc,clk,reset,PC,IMM);   //Branch functionality built in to PC

ROM rom(Instruction,PC);  //Basic ROM

InstDecoder ID(Instruction,rd,rs1,rs2,type);      //type 0=R, 1=I, 2=S, 3=B

immgen IMMGEN(type,Instruction,IMM);           //Inst type, in, out

RegisterFile32Bits Regfile(RAMMuxOut,RFoutA,RFoutB,rs1,rs2,rd,clk,reset,RegRW);   //Din, D1,D2,addr1,addr2,writeaddr     0= Read only, 1 = Write

mux32bit2to1 ALUinMux(RFoutB, IMM, ALUsrc, RFMuxOut);

ALU AlU(RFoutA,RFMuxOut,1'b0,ALUop,ALUout,ALUstatus[3],ALUstatus[2], ALUstatus[1], ALUstatus[0]); //Is zero is ALUflags[3]

Ram256x32 Ram(ALUout, RFoutB, RAMout, MRW,clk);

mux32bit2to1 FinalMux(RAMout, ALUout, WB,RAMMuxOut);

always@(*) begin
Out = RAMMuxOut;
end




endmodule




