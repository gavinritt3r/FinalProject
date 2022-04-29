module RegisterFile32Bits(DataIn,DataA,DataB,RdAddress1,RdAddress2,WrtAddress,clk,Reset,Wenable);
input[31:0]DataIn;
input clk,Reset,Wenable;
input [4:0]RdAddress1,RdAddress2,WrtAddress;
output [31:0]DataA,DataB;


wire [31:0] Load;
wire [31:0] Dout0;
wire [31:0] Dout1;
wire [31:0] Dout2;
wire [31:0] Dout3;
wire [31:0] Dout4;
wire [31:0] Dout5;
wire [31:0] Dout6;
wire [31:0] Dout7;
wire [31:0] Dout8;
wire [31:0] Dout9;
wire [31:0] Dout10;
wire [31:0] Dout11;
wire [31:0] Dout12;
wire [31:0] Dout13;
wire [31:0] Dout14;
wire [31:0] Dout15;
wire [31:0] Dout16;
wire [31:0] Dout17;
wire [31:0] Dout18;
wire [31:0] Dout19;
wire [31:0] Dout20;
wire [31:0] Dout21;
wire [31:0] Dout22;
wire [31:0] Dout23;
wire [31:0] Dout24;
wire [31:0] Dout25;
wire [31:0] Dout26;
wire [31:0] Dout27;
wire [31:0] Dout28;
wire [31:0] Dout29;
wire [31:0] Dout30;
wire [31:0] Dout31;

Fiveto32Decoder u00 (WrtAddress,Wenable,Load);


Register32bit uu0 (DataIn, Dout0, Load[0], Reset, clk);
Register32bit uu1 (DataIn, Dout1, Load[1], Reset, clk);
Register32bit uu2 (DataIn, Dout2, Load[2], Reset, clk);
Register32bit uu3 (DataIn, Dout3, Load[3], Reset, clk);
Register32bit uu4 (DataIn, Dout4, Load[4], Reset, clk);
Register32bit uu5 (DataIn, Dout5, Load[5], Reset, clk);
Register32bit uu6 (DataIn, Dout6, Load[6], Reset, clk);
Register32bit uu7 (DataIn, Dout7, Load[7], Reset, clk);
Register32bit uu8 (DataIn, Dout8, Load[8], Reset, clk);
Register32bit uu9 (DataIn, Dout9, Load[9], Reset, clk);
Register32bit uu10 (DataIn, Dout10, Load[10], Reset, clk);
Register32bit uu11 (DataIn, Dout11, Load[11], Reset, clk);
Register32bit uu12 (DataIn, Dout12, Load[12], Reset, clk);
Register32bit uu13 (DataIn, Dout13, Load[13], Reset, clk);
Register32bit uu14 (DataIn, Dout14, Load[14], Reset, clk);
Register32bit uu15 (DataIn, Dout15, Load[15], Reset, clk);
Register32bit uu16 (DataIn, Dout16, Load[16], Reset, clk);
Register32bit uu17 (DataIn, Dout17, Load[17], Reset, clk);
Register32bit uu18 (DataIn, Dout18, Load[18], Reset, clk);
Register32bit uu19 (DataIn, Dout19, Load[19], Reset, clk);
Register32bit uu20 (DataIn, Dout20, Load[20], Reset, clk);
Register32bit uu21 (DataIn, Dout21, Load[21], Reset, clk);
Register32bit uu22 (DataIn, Dout22, Load[22], Reset, clk);
Register32bit uu23 (DataIn, Dout23, Load[23], Reset, clk);
Register32bit uu24 (DataIn, Dout24, Load[24], Reset, clk);
Register32bit uu25 (DataIn, Dout25, Load[25], Reset, clk);
Register32bit uu26 (DataIn, Dout26, Load[26], Reset, clk);
Register32bit uu27 (DataIn, Dout27, Load[27], Reset, clk);
Register32bit uu28 (DataIn, Dout28, Load[28], Reset, clk);
Register32bit uu29 (DataIn, Dout29, Load[29], Reset, clk);
Register32bit uu30 (DataIn, Dout30, Load[30], Reset, clk);
Register32bit uu31 (DataIn, Dout31, Load[31], Reset, clk);

Mux32to1 um1(Dout0,Dout1,Dout2,Dout3,Dout4,Dout5,Dout6,Dout7,Dout8,Dout9,Dout10,Dout11,Dout12,Dout13,Dout14,Dout15,Dout16,Dout17,Dout18,Dout19,Dout20,Dout21,Dout22,Dout23,Dout24,Dout25,Dout26,Dout27,Dout28,Dout29,Dout30,Dout31,RdAddress1, DataA);

Mux32to1 um2(Dout0,Dout1,Dout2,Dout3,Dout4,Dout5,Dout6,Dout7,Dout8,Dout9,Dout10,Dout11,Dout12,Dout13,Dout14,Dout15,Dout16,Dout17,Dout18,Dout19,Dout20,Dout21,Dout22,Dout23,Dout24,Dout25,Dout26,Dout27,Dout28,Dout29,Dout30,Dout31,RdAddress2, DataB);
endmodule 




module Mux32to1 (Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7,Reg8,Reg9,Reg10,Reg11,Reg12,Reg13,Reg14,Reg15,Reg16,Reg17,Reg18,Reg19,Reg20,Reg21,Reg22,Reg23,Reg24,Reg25,Reg26,Reg27,Reg28,Reg29,Reg30,Reg31, Select, Regout);
input [31:0]Reg0, Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7,Reg8,Reg9,Reg10,Reg11,Reg12,Reg13,Reg14,Reg15,Reg16;
input [31:0]Reg17,Reg18,Reg19,Reg20,Reg21,Reg22,Reg23,Reg24,Reg25,Reg26,Reg27,Reg28,Reg29,Reg30,Reg31;
input [4:0]Select;
output reg [31:0] Regout;

always@(*)
case(Select)
5'h0: Regout <= Reg0;
5'h1: Regout <= Reg1;
5'h2: Regout <= Reg2;
5'h3: Regout <= Reg3;
5'h4: Regout <= Reg4;
5'h5: Regout <= Reg5;
5'h6: Regout <= Reg6;
5'h7: Regout <= Reg7;
5'h8: Regout <= Reg8;
5'h9: Regout <= Reg9;
5'hA: Regout <= Reg10;
5'hB: Regout <= Reg11;
5'hC: Regout <= Reg12;
5'hD: Regout <= Reg13;
5'hE: Regout <= Reg14;
5'hF: Regout <= Reg15;
5'h10: Regout <= Reg16;
5'h11: Regout <= Reg17;
5'h12: Regout <= Reg18;
5'h13: Regout <= Reg19;
5'h14: Regout <= Reg20;
5'h15: Regout <= Reg21;
5'h16: Regout <= Reg22;
5'h17: Regout <= Reg23;
5'h18: Regout <= Reg24;
5'h19: Regout <= Reg25;
5'h1A: Regout <= Reg26;
5'h1B: Regout <= Reg27;
5'h1C: Regout <= Reg28;
5'h1D: Regout <= Reg29;
5'h1E: Regout <= Reg30;
5'h1F: Regout <= Reg31;
default Regout <= 32'b0;
endcase
endmodule

module Fiveto32Decoder(Select, Wenable, Load_Out);
input [4:0] Select;
input Wenable;
output reg [31:0] Load_Out;


always@(*)
if (Wenable == 1)
case(Select)
5'h0 : Load_Out = 32'h00000001;
5'h1 : Load_Out = 32'h00000002;
5'h2 : Load_Out = 32'h00000004;
5'h3 : Load_Out = 32'h00000008;
5'h4 : Load_Out = 32'h00000010;
5'h5 : Load_Out = 32'h00000020;
5'h6 : Load_Out = 32'h00000040;
5'h7 : Load_Out = 32'h00000080;
5'h8 : Load_Out = 32'h00000100;
5'h9 : Load_Out = 32'h00000200;
5'hA : Load_Out = 32'h00000400;
5'hB : Load_Out = 32'h00000800;
5'hC : Load_Out = 32'h000001000;
5'hD : Load_Out = 32'h000002000;
5'hE : Load_Out = 32'h000004000;
5'hF : Load_Out = 32'h000008000;
5'h10 : Load_Out = 32'h00010000;
5'h11 : Load_Out = 32'h00020000;
5'h12 : Load_Out = 32'h00040000;
5'h13 : Load_Out = 32'h00080000;
5'h14 : Load_Out = 32'h00100000;
5'h15 : Load_Out = 32'h00200000;
5'h16 : Load_Out = 32'h00400000;
5'h17 : Load_Out = 32'h00800000;
5'h18 : Load_Out = 32'h01000000;
5'h19 : Load_Out = 32'h02000000;
5'h1A : Load_Out = 32'h04000000;
5'h1B : Load_Out = 32'h08000000;
5'h1C : Load_Out = 32'h10000000;
5'h1D : Load_Out = 32'h20000000;
5'h1E : Load_Out = 32'h40000000;
5'h1F : Load_Out = 32'h80000000;
default: Load_Out = 32'h00000000;
endcase
else
Load_Out = 32'h00000000;
endmodule
