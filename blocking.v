`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 21:23:52
// Design Name: 
// Module Name: blocking
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module example();
integer a,b,c;
integer A,B,C;
initial begin
a=10; b=20 ;c=15;
A=10; B=20 ; C=15;
end
initial begin
a<=#5 b+c;
b<=#5 a+5;
c<=#5 a-b;
end

initial begin
A = #5 B+C;
B = #5 A+5;
C = #5 A-B;
end

initial begin
$monitor($time," a=%d b=%d c=%d | A=%d B=%d C=%d",a,b,c,A,B,C);
end
endmodule


