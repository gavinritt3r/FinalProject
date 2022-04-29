module ALU(A,B,cin,Select,Output,isNegative,isZero, Overflow, CarryOut);
	input [31:0] A,B;
	input [2:0] Select;
	input cin;
	output reg [31:0] Output;
	output wire CarryOut;
	output wire isNegative;
	output wire isZero;
	output wire Overflow;
	
	
	assign isZero = (A==B)? 1'b1: 1'b0;  //Z
	assign isNegative = Output[31]; //N
	assign Overflow = (~A[31]&~B[31]&Output[31])|(A[31]&B[31]&~Output[31]); //V
	assign CarryOut = A[31]+B[31]; 
	
	
	always @(*)
	begin
        case(Select)
        3'b000: // Addition
		  Output = A + B;
        3'b001: //  Logical and 
        Output = A & B;
        3'b010: //  Logical or
        Output = A | B;
        3'b011: //  Logical xor 
        Output = A ^ B;
        3'b100: //  Logical nor
        Output = ~(A | B);
		  3'b101: // Logical shift left
        Output = A << B[4:0];
        3'b110: // Logical shift right
        Output = A >> B[4:0];
        default: Output = A+B;
        endcase
    end
endmodule




