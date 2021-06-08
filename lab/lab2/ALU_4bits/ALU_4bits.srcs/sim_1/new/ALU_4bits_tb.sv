`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/18 11:48:16
// Design Name: 
// Module Name: ALU_4bits_tb
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


module ALU_4bits_tb(

    );
    logic [3 : 0] A;
    logic [3 : 0] B;
    logic [3 : 0] aluop;
    logic [7 : 0] alures;
    logic ZF;
    logic OF;
    alu DUT(.A(A), .B(B),.aluop(aluop),.alures(alures),.ZF(ZF),.OF(OF));
    logic [7:0]expectedy;
    logic expectedzf;
    logic expectedof;
    logic [21:0]y[52:0];
    initial begin
    $readmemb("test.txt",y);
    for(int i=0;i<53;i=i+1)begin
    {A,B,aluop,expectedy,expectedzf,expectedof}=y[i][21:0];#10;
    if(expectedy!=alures||expectedzf!=ZF||expectedof!=OF)
        $display($time,"wrong in test %d",i);
    end
    end
//    $monitor("At time %t: A = %b, B = %b,aluop=%b, alures = %b,ZF=%b,OF=%b", 
//    $time, A,B,aluop,alures,ZF,OF);
endmodule
