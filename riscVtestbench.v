`timescale 1ns / 1ps 

module riscVtestbench();

reg clk, reset;

wire [31:0] Output;

riscVprocessor l(clk,reset,Output);

initial begin
clk = 1;
reset = 1;
#100;
reset = 0;
end
always begin 
#20 clk = ~clk;
end

initial begin
#400;
$stop;
end



endmodule