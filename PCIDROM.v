module ProgramCounter(PCsrc,clk,reset,PC,immIn);
input clk,reset,PCsrc;
input [31:0]immIn;
output [7:0]PC;

reg [7:0]ProgCount;


initial begin
ProgCount<=0;
end


always @ (posedge clk || reset)
begin 
if (~reset && ~PCsrc) begin
ProgCount = ProgCount+4;
end
if (~reset && PCsrc) begin
ProgCount = ProgCount + immIn[7:0];
end
if (reset) begin
ProgCount = 0;
end

end
assign PC = ProgCount;

endmodule
 
module InstDecoder(InstIn,rd,rs1,rs2,type);
input [31:0]InstIn;
output reg [4:0]rd,rs1,rs2;
output [1:0]type;

wire [6:0]Opcode;
assign Opcode = InstIn [6:0];

reg [1:0]instType;
assign type = instType;

always@(InstIn)
begin case(Opcode)
7'b0110011:
begin
instType = 2'b00; //R
rs2 = InstIn[24:20];
rs1 = InstIn[19:15];
rd = InstIn[11:7];
end
7'b0010011:
begin
instType = 2'b01; //I
rs1 = InstIn[19:15];
rd = InstIn[11:7];
rs2 = 5'b00000;
end
7'b0100011:
begin
instType = 2'b10; //S
rs2 = InstIn[24:20];
rs1 = InstIn[19:15];
rd = 5'b00000;
end
7'b1100011:
begin
instType = 2'b11; //B
rs2 = InstIn[24:20];
rs1 = InstIn[19:15];
rd = 5'b00000;
end
default: instType = 2'b00;
endcase
end

endmodule

module ROM(Dout,InstNum);
input [7:0]InstNum;
output [31:0]Dout;

reg [31:0]ROMout;

always @(*) begin
	case (InstNum)
	'h00: ROMout = 'b00000000000000000000000000000000;   //Allow time to initialize
	'h04: ROMout = 'b00000001000000001000000010010011;                                    
	'h08: ROMout = 'b00000000010000001000000100010011;
	'h0c: ROMout = 'b00000000000100010000000110110011;
	'h10: ROMout = 'b00000000000100010000000100110011;
	'h14: ROMout = 'b00000000001100001010100000100011;
	'h18: ROMout = 'b00000000001000011000100001100011;
	'h1c: ROMout = 'b00000000000000000000000000000000;
	'h20: ROMout = 'b00000000000000000000000000000000;
	'h24: ROMout = 'b00000000000000000000000000000000;
	'h28: ROMout = 'b00000000000000000000000000000000;
	'h2c: ROMout = 'b00000000000000000000000000000000;
	default: ROMout = 32'b0;
	endcase
end

assign Dout = ROMout;
endmodule