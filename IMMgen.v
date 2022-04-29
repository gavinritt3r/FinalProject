module immgen (type,in,out);
input [1:0]type;
input [31:0]in;
output reg [31:0]out;


always@(*)
begin case(type)
2'b01:
begin
out[31:12] = 0;
out[11:0] = in[31:20];
end
2'b10:
begin
out[31:12] = 0;
out[11:5] = in[31:25];
out[4:0] = in[11:7];
end
2'b11:
begin
out[31:12] = 0;
out [11] = in[7];
out [10:5] = in[30:25];
out [12] = in[31];
out [0] = 0;
out [4:1] = in [11:8];
end
default: out = {20'b00000000000000000000,in[31:20]};
endcase
end

endmodule